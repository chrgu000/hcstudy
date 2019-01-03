package com.infinova.device.sync;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.infinova.venus.pojo.LogEvent;
import com.infinova.venus.service.VEventService;
import com.infinova.common.utils.StringUtil;
import com.infinova.device.cache.DeviceModelCache;
import com.infinova.device.event.DeviceAddEvent;
import com.infinova.device.pojo.DeviceModel;
import com.infinova.device.service.DeviceService;
import com.infinova.device.service.DeviceServiceImpl;
import com.infinova.protocol.message.aps.ChannelParamMsg;
import com.infinova.security.service.OrganizationService;
import com.infinova.security.service.UserService;
import com.infinova.system.cache.DeviceInfoCache;
import com.infinova.system.cache.info.DeviceInfo;
import com.infinova.system.communication.GetChannelInfoQueue;
import com.infinova.system.enums.DeviceProtocol;
import com.infinova.system.enums.DeviceType;
import com.infinova.system.enums.ResourceType;
import com.infinova.system.enums.ServerType;
import com.infinova.system.pojo.Device;
import com.infinova.system.pojo.OrgNode;
import com.infinova.system.pojo.ResourceZonning;
import com.infinova.system.pojo.User;
import com.infinova.system.service.ResourceZonningService;
import com.infinova.system.vo.AlarmDeviceConfig;
import com.infinova.system.vo.Resource;
import com.infinova.system.vo.ResourceZonningPK;
/**
 * 数据同步，子系统实现类
 * @author huangch
 * Since:JDK 8
 * Date:2018年12月21日下午3:44:28
 * @Copyright2018,huangch@szinfinova.com All Rights Reserved
 */
@Service("syncResourceImpl")
public class SyncResourceImpl {
	private static Logger logger = LogManager.getLogger(SyncResourceImpl.class);
	@javax.annotation.Resource
    private ResourceZonningService service;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private DeviceService deviceService;
	@Autowired
	private OrganizationService organizationService;
	@Autowired
	private ResourceZonningService resourceZonningService;
	@Autowired
	private VEventService eventService;
	
	@Autowired
	private DeviceModelCache deviceModelCache;
	@Autowired
	private DeviceInfoCache deviceInfoCache;
	
	public void eventDeviceAdd(String deviceId) throws Exception{
		Device device = deviceService.get(deviceId);
		// 设备类型为alarmDevice设备只归acs管理，设备厂家为infinova的设备acs和aps都需要管理，旧海康设备acs和aps都需要管理
		if (null != device && device.getDeviceType().equals(DeviceType.ALARMDEVICE.getDes())) {
			device.setClassifyType(ServerType.ACS.getDes());
			if(device.getProtocol().equals("COM")){
				AlarmDeviceConfig adc = JSONObject.parseObject(device.getAlarmDeviceConfig(), AlarmDeviceConfig.class);
				if(null != adc && !StringUtil.isNullOrEmpty(adc.getSerialNum())){
					device.setPort(Integer.valueOf(adc.getSerialNum()));
					device.setDeviceIp(generateIp());
				}
			}
		} else if (null != device && (null == device.getManufacturer() || !device.getManufacturer().equals("infinova"))) {
			device.setClassifyType("other");
		}
		String pro = "";
		if (null != device) {
			pro = device.getProtocol();
			if (null != pro && pro.equals("InfinovaNew")) {
				device.setProtocol("Infinova");
			}else if(null != pro && (pro.equals("GB28181") || pro.equals("GB28181_Ex"))){
				device.setConnProtocol("UDP");
			}
		}
		DeviceModel model = deviceModelCache.get(device.getModelId());
		if (model != null) {
			device.setModel(model.getDeviceModel());
			device.setDeviceType(model.getDeviceType());
			device.setManufacturer(model.getManufacturer());
			if( device.getChannels()!=null && device.getChannels().size()>0){
				device.setInputChannel(device.getChannels().size());
			}else{
				if (device.getInputChannel() != null && device.getInputChannel() > 0 && device.getInputChannel() < 1000) {
					device.setInputChannel(device.getInputChannel());
				} else {
					device.setInputChannel(model.getMaxInputChannels());
				}
			}
			device.setOutputChannel(model.getMaxOutputChannels());
			device.setSwitchInNum(model.getMaxAlarmInputNum());
			device.setSwitchOutNum(model.getMaxAlarmOutputNum());
			device.setClassifyType(model.getClassifyType());
		}

		/*String id = super.add(device);
		super.dao.getCurrentSession().flush();
		device.setDeviceId(id);*/
		addResource(device);
		device.setEnableGetChannel(searchChannel(device));

		// 发送设备新增事件
		DeviceAddEvent event = new DeviceAddEvent();
		event.setMsg(device);
		eventService.pubEvent(event);
		;
	} 
	private void addResource(Device device) {
		ResourceZonning resource = new ResourceZonning();
		resource.setOrgId(device.getOrgId());
		resource.setResId(device.getDeviceId());
		resource.setResName(device.getDeviceName());
		resource.setResType(ResourceType.DEVICE.getDescription());
		resource.setIp(device.getDeviceIp());
		resource.setSubType(device.getDeviceType());
		try {
			resourceZonningService.add(resource);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
	}
	
	private String generateIp(){
    	String ip = "";
    	for(int i = 0; i < 4; i++ ){
    		if(i != 3)ip = ip + (int) Math.round(Math.random() * 255 + 0)+".";
    		else ip = ip + (int) Math.round(Math.random() * 255 + 0);
    	}
    	return ip;
    }
	
	/**
	 * 判断是否需要搜索通道
	 * 
	 * @param device
	 * @return
	 */
	private boolean searchChannel(Device device) {
		if (device != null) {
			if ((device.getDeviceType() != null && device.getDeviceType().equals(DeviceType.PLATFORM.getDes()))
					|| (device.getDeviceType() != null && device.getDeviceType().equals(DeviceType.TGPLATFORM.getDes()))
					|| (device.getProtocol() != null && (device.getProtocol().equals(DeviceProtocol.GB28181.getDes())
							|| device.getProtocol().equals(DeviceProtocol.GB28181_Ex.getDes()) || device.getProtocol().equals(DeviceProtocol.March18.getDes())))) {
				return true;
			}
		}
		return false;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * 设备新增
	 * @author huangch  Date:2018年12月24日上午11:09:00
	 * @param logEvent
	 * @throws Exception
	 */
	@SyncAnnotation("event.device.add")
	public void eventDeviceAdd(LogEvent logEvent) throws Exception{
		DeviceInfo res =JSON.parseObject(logEvent.getMessage(), DeviceInfo.class);
		deviceService.del(res.getPojoInfo().getDeviceId());
	} 
	
	/**
	 * 删除设备
	 * @author huangch  Date:2018年12月24日上午11:09:00
	 * @param logEvent
	 * @throws Exception
	 */
	@SyncAnnotation("event.device.del")
	public void eventDeviceDel(LogEvent logEvent) throws Exception{
		DeviceInfo res =JSON.parseObject(logEvent.getMessage(), DeviceInfo.class);
		deviceService.del(res.getPojoInfo().getDeviceId());
	} 
	
	/**
	 * 用户新新增
	 * @author huangch  Date:2018年12月24日上午9:11:03
	 * @param logEvent  path:event.user.add  message: user
	 * @throws Exception
	 */
	@SyncAnnotation("event.user.add")
	public void eventUserAdd(LogEvent logEvent) throws Exception{
		User res =JSON.parseObject(logEvent.getMessage(), User.class);
		userService.add(res);
	} 
	
	
	/**
	 * 子系统 资源名称修改事件
	 * @author huangch  Date:2018年12月21日下午2:50:15
	 * @param event
	 * @throws Exception 
	 */
	@SyncAnnotation("event.resourceName.update")
	public void eventResourceNameUpdate(LogEvent logEvent) throws Exception{
		Resource res =JSON.parseObject(logEvent.getMessage(), Resource.class);
		service.updateResourceNameByClient(res);
	} 
	/**
	 * 子系统 资源删除
	 * @author huangch  Date:2018年12月21日下午4:42:51
	 * @param logEvent
	 * @throws Exception
	 */
	@SyncAnnotation("event.resourcezonning.del")
	public void eventResourcezonningDel(LogEvent logEvent) throws Exception{
		ResourceZonning res =JSON.parseObject(logEvent.getMessage(), ResourceZonning.class);
		ResourceZonningPK resourceZonningPk = new ResourceZonningPK();
		resourceZonningPk.setResId(res.getResId());
		resourceZonningPk.setOrgId(res.getPseudo());
		service.del(resourceZonningPk);
	} 
	/**
	 * 子系统 资源新增
	 * @author huangch  Date:2018年12月21日下午4:46:11
	 * @param logEvent
	 * @throws Exception
	 */
	@SyncAnnotation("event.resourcezonning.add")
	public void eventResourcezonningAdd(LogEvent logEvent) throws Exception{
		ResourceZonning res =JSON.parseObject(logEvent.getMessage(), ResourceZonning.class);
		service.add(res);
	} 
	
	
	
	
}
