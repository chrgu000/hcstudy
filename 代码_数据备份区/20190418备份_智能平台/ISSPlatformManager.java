package com.infinova.communication.manager;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.concurrent.ConcurrentHashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.infinova.common.http.HttpUtil;
import com.infinova.communication.callback.EventPlatStatusNotify;
import com.infinova.communication.platform.ISSPlatform;
import com.infinova.communication.platform.ThirdPlatform;
import com.infinova.communication.vo.PlatformInfo;
import com.infinova.deploy.dao.TDConfigDao;
import com.infinova.system.SystemConstant;
import com.infinova.system.cache.CameraInfoCache;
import com.infinova.system.cache.ServerInfoCache;
import com.infinova.system.cache.info.CameraInfo;
import com.infinova.system.cache.info.ServerInfo;
import com.infinova.system.enums.AnalyseType;
import com.infinova.system.enums.ServerType;
import com.infinova.system.pojo.Server;
import com.infinova.system.pojo.SystemConfig;
import com.infinova.system.service.SystemConfigService;

/**
 * 图片调度服务
 * @author huangch
 * Since:JDK 8
 * Date:2019年4月3日上午10:41:24
 * @Copyright2019,huangch@szinfinova.com All Rights Reserved
 */
@Service
public class ISSPlatformManager extends PlatformManager{

	private static Logger logger = LoggerFactory.getLogger(ISSPlatformManager.class);
    private Map<String,ISSPlatform> platformMap = new ConcurrentHashMap<String,ISSPlatform>();
    @Autowired
    private EventPlatStatusNotify eventPlatStatusNotify;
    @Autowired
    private TDConfigDao tdConfigDao;//获取mq相关信息
	@Override
	public void heartBeat() {
		synchronized(platformMap){
            try {
                Collection<ISSPlatform> collection = platformMap.values();
                for(ISSPlatform c : collection){
                    c.heartBeat();
                }
            } catch (Exception e) {
                logger.error(e.getLocalizedMessage(), e);
            }
        }
	}

	@Override
	public ThirdPlatform createPlatform(PlatformInfo platformInfo) {
		ISSPlatform platform = new ISSPlatform();
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
		ISSPlatform platform = (ISSPlatform)platformMap.get(platformInfo.getPlatformId());
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
    	ISSPlatform platform = (ISSPlatform)createPlatform(platformInfo);
    	platform.registerPlatStatusNotify(eventPlatStatusNotify);
    }
    
    @Autowired
    private CameraInfoCache cameraInfoCache;
    @Autowired
    private ServerInfoCache serverInfoCache;
    @Autowired
    private SystemConfigService systemConfigService;
    
    /**
     * 添加分析资源
     * IMS -> ISS
     * @author huangch  Date:2019年4月8日上午10:08:25
     */
    public void addAnalyzeRes(String serverId,String resId){
    	ISSPlatform platform = (ISSPlatform)platformMap.get(serverId);
    	
		CameraInfo cameraInfo = cameraInfoCache.get(resId);
		String smtId = cameraInfo.getSmtId();
		Map result = new HashMap();
		List list = new ArrayList();
		Map res = new HashMap();
		Map structParam = new HashMap();
		Map smtInfo = new HashMap();

		structParam.put("analyseType", "7");
		
		if (smtId != null) {
			ServerInfo smt = serverInfoCache.get(smtId);
			if (smt != null) {
				Server smtSer = smt.getPojoInfo();
				smtInfo.put("server", smtSer.getServerIp());
				smtInfo.put("port", smtSer.getPort());
				smtInfo.put("netType", "");//LAN:表示局域网，WAN：表示公网，为空表示局域网
			}
		}
		res.put("resId", resId);
		res.put("structParam", structParam);
		res.put("smtInfo", smtInfo);
		list.add(res);
		result.put("resource", list);
		result.put("issId", serverId);
		//发送请求
		logger.debug("http://"+platform.getPlatformInfo().getIp()+":"+platform.getPlatformInfo().getPort()+"/iss/addAnalyzeRes :"+System.getProperty("line.separator")+JSON.toJSONString(result));
		HttpUtil.doPost("http://"+platform.getPlatformInfo().getIp()+":"+platform.getPlatformInfo().getPort()+"/iss/addAnalyzeRes",JSON.toJSONString(result));
    }
    /**
     * 移除分析资源
     * IMS -> ISS
     * @author huangch  Date:2019年4月8日上午10:21:14
     */
    public void removeAnalyzeRes(String serverId,String resId){
    	ISSPlatform platform = (ISSPlatform)platformMap.get(serverId);
    	Map result = new HashMap();
    	List list = new ArrayList();
    	list.add(resId);
    	result.put("resId", list);
    	//发送请求
    	logger.debug("http://"+platform.getPlatformInfo().getIp()+":"+platform.getPlatformInfo().getPort()+"/iss/removeAnalyzeRes : "+System.getProperty("line.separator")+JSON.toJSONString(list));
    	HttpUtil.doPost("http://"+platform.getPlatformInfo().getIp()+":"+platform.getPlatformInfo().getPort()+"/iss/removeAnalyzeRes",JSON.toJSONString(list));
    }
    /**
     * 设置ISS配置信息
     * IMS -> ISS
     * @author huangch  Date:2019年4月8日上午10:25:44
     * @param serverId
     * @throws Exception 
     */
    public void setConfig(String serverId) throws Exception{
    	ISSPlatform platform = (ISSPlatform)platformMap.get(serverId);
    	Map<String,String> mq = getMqInfo();
    	Map<String, String> result = new HashMap<String, String>();
    	result.put("issId", serverId);
    	result.put("iscIp", platform.getPlatformInfo().getIp());
    	result.put("iscPort", platform.getPlatformInfo().getPort());
    	result.put("mqIp", mq.get("mqIp"));
    	result.put("mqPort", mq.get("mqPort"));
    	Server tgi = getTgiServer();
    	result.put("tgiIp", tgi.getServerIp());
    	result.put("tgiPort", tgi.getPort()+"");
    	logger.debug("iss/setConfig : "+JSON.toJSONString(result));
    	HttpUtil.doPost("http://"+platform.getPlatformInfo().getIp()+":"+platform.getPlatformInfo().getPort()+"/iss/setConfig",JSON.toJSONString(result));
    }
    /**
     * 获取MQ信息
     * @author huangch  Date:2019年4月9日上午9:30:50
     * @return
     * @throws Exception
     */
    public Map<String,String> getMqInfo() throws Exception{
    	Map<String,String> mqInfo=new HashMap<String,String>();
    	/*SystemConfig systemConfig=systemConfigService.getSysConfigByName("rabbitmq");
    	if(systemConfig!=null){
			JSONObject num=JSON.parseObject(systemConfig.getValue());
			for(AnalyseType i:AnalyseType.values()){
				String data=num.getString(i.toString());
				if(data!=null){
					mqInfo.put(i.toString(), data);
				}
			}
    	}*/
    	mqInfo.put("mqIp", tdConfigDao.getValueByName("mqIp"));
    	mqInfo.put("mqPort", tdConfigDao.getValueByName("mqPort"));
    	mqInfo.put("username", tdConfigDao.getValueByName("mqUserName"));
    	mqInfo.put("password", tdConfigDao.getValueByName("mqPassword"));
    	return mqInfo;
    }
    /**
     * 获取TGI信息
     * 从服务器缓存信息里获取TGI
     * @author huangch  Date:2019年4月9日上午10:41:31
     * @return
     */
    public Server getTgiServer(){
    	Map<String, ServerInfo> map = serverInfoCache.getAll();
        for (Entry<String, ServerInfo> entry : map.entrySet()) {
        	ServerInfo serverInfo = entry.getValue();
            if(null != serverInfo){
                Server server = serverInfo.getPojoInfo();
                if(ServerType.TGI.getDes().equalsIgnoreCase(server.getServerType())){
                		return server;                	
                }
            }
        }
		return new Server();
    }
    public static void main(String[] args) {
    	String str = HttpUtil.doPost("http://127.0.0.1:8080/CMS/action/topology/resourcezonning/getByResourceType.do?token=F1F1B84B92EDDEBDE0A2A2756B2571C6", "id=device");
    	System.out.println(str);
    }
}
