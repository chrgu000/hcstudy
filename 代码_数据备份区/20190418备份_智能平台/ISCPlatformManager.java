package com.infinova.communication.manager;

import java.util.Collection;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.infinova.communication.callback.EventPlatStatusNotify;
import com.infinova.communication.platform.ISCPlatform;
import com.infinova.communication.platform.ThirdPlatform;
import com.infinova.communication.vo.PlatformInfo;

/**
 * 图片任务调度服务集群管理
 * @author huangch
 * Since:JDK 8
 * Date:2019年4月3日上午10:31:46
 * @Copyright2019,huangch@szinfinova.com All Rights Reserved
 */
@Service
public class ISCPlatformManager extends PlatformManager{

	private static Logger logger = LoggerFactory.getLogger(ISCPlatformManager.class);
    private Map<String,ISCPlatform> platformMap = new ConcurrentHashMap<String,ISCPlatform>();
    @Autowired
    private EventPlatStatusNotify eventPlatStatusNotify;
    
	@Override
	public void heartBeat() {
		synchronized(platformMap){
            try {
                Collection<ISCPlatform> collection = platformMap.values();
                for(ISCPlatform c : collection){
                    c.heartBeat();
                }
            } catch (Exception e) {
                logger.error(e.getLocalizedMessage(), e);
            }
        }
	}

	@Override
	public ThirdPlatform createPlatform(PlatformInfo platformInfo) {
		ISCPlatform platform = new ISCPlatform();
		platform.setPlatformInfo(platformInfo);
		platformMap.put(platformInfo.getPlatformId(), platform);
		return platform;
	}

	@Override
	public void removePlatform(String platformId) {
		if (!platformMap.containsKey(platformId)) {
            logger.warn("not found serverId: " + platformId);
            return;
        }
        platformMap.remove(platformId);
	}

	@Override
	public void updatePlatform(PlatformInfo platformInfo) throws Exception {
		if (!platformMap.containsKey(platformInfo.getPlatformId())) {
            logger.warn("not found serverId: " + platformInfo.getPlatformId());
            return;
        }
		ISCPlatform platform = (ISCPlatform)platformMap.get(platformInfo.getPlatformId());
		platform.setPlatformInfo(platformInfo);
	}
	
	/**
     * @param ip
     * @param port
     * @param serverId
     * @param flag 是否强制更新
     */
    public void logonPlatform(String ip,String port,String serverId,boolean flag){
    	if(platformMap.keySet().contains(serverId) ){
    		if(flag){
	    		//如果已经有此平台，删除重加
	    		removePlatform(serverId);
    		}else{
    			return;
    		}
    	}
    	PlatformInfo platformInfo = new PlatformInfo(ip, port,serverId);	        
    	ISCPlatform platform = (ISCPlatform)createPlatform(platformInfo);
    	platform.registerPlatStatusNotify(eventPlatStatusNotify);
    }
    /**
     * 2.4添加ISS集群
     * @author huangch  Date:2019年4月15日下午4:33:46
     */
    public void addCluster(){
    	
    }
}
