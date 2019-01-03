package com.infinova.device.sync;

import org.springframework.stereotype.Service;

import com.infinova.venus.message.AbstractEvent;
import com.infinova.venus.message.AbstractNotifyEvent;
import com.infinova.venus.pojo.LogEvent;

/**
 * 内部事件下发所用：
 * 通知前端订阅者
 * @author wh011
 *
 */
@Service
public class SyncResourceNotifyEvent extends AbstractEvent<LogEvent>{

	@Override
	public String getEventPath() {
		// TODO Auto-generated method stub
		return "event.sync.resource";
	}

}


