package com.infinova.device.sync;

import java.lang.reflect.Method;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.infinova.common.event.BaseEventHandler;
import com.infinova.venus.pojo.LogEvent;
import com.infinova.device.event.DeviceDeleteEvent;
import com.infinova.system.cache.info.DeviceInfo;

/**
 * 资源同步统一handler处理入口
 * 
 * @author huangch
 * Since:JDK 8
 * Date:2018年12月21日下午2:10:11
 * @Copyright2018,huangch@szinfinova.com All Rights Reserved
 */
@Service
public class SyncResourceNotifyEventHandler extends BaseEventHandler<SyncResourceNotifyEvent>{
	
	@Autowired
	private SyncResourceImpl syncResourceImpl;
	
	
	@Override
	public void process(SyncResourceNotifyEvent event) throws Exception {
		System.out.println("------------------SyncResourceNotifyEvent------------------");
		// TODO Auto-generated method stub
		LogEvent logEvent = event.getMsg();
		logEvent.getMessage();  // 如：com.infinova.system.vo.Resource
		logEvent.getEventType();// 如：com.infinova.system.event.ResourceNameUpdateEvent
		logEvent.getListener(); //
		logEvent.getPath();     // event.x.x
		//任务下发
		Method[] methods = syncResourceImpl.getClass().getMethods();
	    for (Method method : methods) {
	    	SyncAnnotation subMAnno = method.getAnnotation(SyncAnnotation.class);
	    	if(subMAnno!=null){
	    		if(logEvent.getPath().equals(subMAnno.value())){
	    			System.out.println("######===="+subMAnno.value()+" , "+event.getMsg());
	    			method.invoke(syncResourceImpl, logEvent);
	    		}
	    	}	
	    }
	    System.out.println("------------------SyncResourceNotifyEvent end------------------");
	}
	@Override
	public void notify(LogEvent logNotify) throws Exception {
		 System.out.println("------------------SyncResourceNotifyEvent logNotify------------------");
		 SyncResourceNotifyEvent event = new SyncResourceNotifyEvent();
       	 event.setMsg(JSON.parseObject(logNotify.getMessage(),LogEvent.class));
   		 process(event);
	}
	/**
	 * 调用方法
	 * SyncResourceNotifyEvent event = new SyncResourceNotifyEvent();
	   event.setMsg(logEvent);
	   eventService.pubEvent(event);
	      或者存数据库
	    listener com.infinova.device.sync.SyncResourceNotifyEventHandler
	    path event.sync.resource
	    mac
	    EventType com.infinova.device.sync.SyncResourceNotifyEvent
	    Message   logEvent
	    
	    
	    {"path":"event.org.add","message":{"orgId":"8ad29bd267a23d6a0167de46b97b0140","orgCode":"0101","orgName":"TTTTT","orgRank":1,"parentId":"d25b409a88034c0185117d8e6fe1f9c6","extend":{"statistics":[{"resType":"camera","totalNum":0,"onlineNum":0,"offlineNum":0}]},"shareResource":false}}
	 */
	
}


