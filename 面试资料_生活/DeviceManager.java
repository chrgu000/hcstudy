package com.inf.fvs.resource.jna;

import com.alibaba.fastjson.JSONObject;
import com.inf.fvs.common.category.EBoolean;
import com.inf.fvs.common.event.evolution.InternalEventDispatcher;
import com.inf.fvs.common.schedule.TaskScheduler;
import com.inf.fvs.common.util.Consts;
import com.inf.fvs.common.util.Strings;
import com.inf.fvs.resource.cache.CameraCache;
import com.inf.fvs.resource.cache.DeviceCache;
import com.inf.fvs.resource.entity.Camera;
import com.inf.fvs.resource.entity.Device;
import com.inf.fvs.resource.event.ResourceChangedEvent;
import com.inf.fvs.resource.event.entry.ResourceStatusChangedEntry;
import com.inf.fvs.resource.service.ICameraService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.TimeUnit;

/**
 * Author:zoudw
 * Since:JDK 7
 * Date:18-7-12
 * Description:manager device include device connect and disconnect
 *
 * @Copyright:2018, zoudw@szinfinova.com All Rights Reserved
 */
//@Service
public class DeviceManager {

    private InfCamLibrary infinovaCam = InfCamLibrary.INSTANCE;
    private static Logger logger = LoggerFactory.getLogger(DeviceManager.class);

    private ConcurrentHashMap<String, Long> deviceIdAndReturnId = new ConcurrentHashMap<>();

    private String username = "admin";
    private String password = "admin";
    @Autowired
    SnapDataByJna snapDataByJna;

    @Autowired
    ICameraService cameraService;

    @Autowired
    DeviceCache deviceCache;

    @Autowired
    private CameraCache cameraCache;

    @Autowired
    private InternalEventDispatcher eventDispatcher;

    @Autowired
    private TaskScheduler taskScheduler;


    /*
     * @author zoudw
     * @param []
     * @return void
     * @date 18-7-12
     * @description :get all device of not delete and  authorized
     */
    @PostConstruct
    public void initDevice() {

        taskScheduler.schedule(new Runnable() {
            @Override
            public void run() {
                try {
                    logger.info("start connect to camera .....");
                    List<Camera> cameraList = cameraService.getAll();
                    for (Camera camera : cameraList) {
                        openDevcie(camera);
                        Device value = deviceCache.get(camera.getDeviceId()).getValue();
                        value.setIsOnline(EBoolean.False.getValue());
                        eventDispatcher.dispatch(new ResourceChangedEvent(new ResourceStatusChangedEntry(value)));
                    }
                } catch (Exception e) {
                    logger.error("DeviceManager init failure:" + e.getLocalizedMessage(), e);
                }
            }
        },30, TimeUnit.SECONDS);


    }


    /*
     * @author zoudw
     * @param [camera]
     * @return long
     * @date 18-7-12
     * @description :connect camera
     */
    public long openDevcie(Camera camera) {

        try {
            logger.info("connect camera ip:{}",camera.getIp());
            if (deviceCache.containsKey(camera.getDeviceId())) {
                Device value = deviceCache.get(camera.getDeviceId()).getValue();
                if (!Strings.isNullOrEmpty(value.getUserName()))
                    username = value.getUserName();
                if (!Strings.isNullOrEmpty(value.getPassword()))
                    password = value.getPassword();
            }
            if( Strings.isNullOrEmpty(camera.getPort())){
                camera.setPort("90");
            }

            if( Strings.isNullOrEmpty(camera.getIp())){
                return -1;
            }
            long returnId = infinovaCam.INFNET_OpenDevice(camera.getIp(), Integer.parseInt(camera.getPort()), username, password, snapDataByJna, 0);
            if (!deviceIdAndReturnId.containsKey(returnId) && returnId >= 0) {
                deviceIdAndReturnId.put(camera.getCameraId(),returnId);
                logger.info("returnId:{} is put,and camera ip is:{}",returnId,camera.getIp());
            }

            cameraCache.get(camera.getCameraId()).getValue().setReturnId(returnId);
            logger.info("deviceIdAndReturnIdMap:{}",JSONObject.toJSONString(deviceIdAndReturnId.keys()));
            return returnId;
        } catch (NumberFormatException e) {
            logger.error("open Device error,device:{},error:{}",JSONObject.toJSONString(camera),e);
            return -1;
        }

    }

    /*
     * @author zoudw
     * @param [camera]
     * @return long
     * @date 18-7-12
     * @description :disconnect camera
     */
    public long closeDevice(Camera camera) {
        try {
            logger.info("disconnect camera id:{}",camera.getCameraId());
            Long aLong = deviceIdAndReturnId.get(camera.getCameraId());
            if(null != aLong){
                    deviceIdAndReturnId.remove(camera.getCameraId());
                    logger.info("returnId:{} is removed,  deviceIdAndReturnIdMap:{}",aLong,JSONObject.toJSONString(deviceIdAndReturnId.keys()));
                Device value = deviceCache.get(camera.getDeviceId()).getValue();
                value.setIsOnline(EBoolean.False.getValue());
                eventDispatcher.dispatch(new ResourceChangedEvent(new ResourceStatusChangedEntry(value)));
                    return infinovaCam.INFNET_CloseDevice(aLong);
                }

        } catch (Exception e) {
            logger.error("close Device error,device:{},error:{}",JSONObject.toJSONString(camera),e);
        }

        return -1;
    }

    /*
     * @author zoudw
     * @param [returnId]
     * @return com.inf.fvs.resource.entity.Camera
     * @date 18-7-12
     * @description :get Camera info according returnId
     */
    public Camera getCameraByReturnId(long returnId) {

            if (deviceIdAndReturnId.values().contains(returnId)) {
                Set<Map.Entry<String, Long>> entries = deviceIdAndReturnId.entrySet();
                for (Map.Entry entry:entries) {
                    if((long)entry.getValue() == returnId){
                        if(cameraCache.containsKey(entry.getKey().toString())){
                            return cameraCache.get(entry.getKey().toString()).getValue();
                        }
                    }
                }
            }
                logger.warn("deviceIdAndReturnId map not contain returnId:{} and returnIdMap:{}", returnId,JSONObject.toJSONString(deviceIdAndReturnId));
                return null;
    }

}
