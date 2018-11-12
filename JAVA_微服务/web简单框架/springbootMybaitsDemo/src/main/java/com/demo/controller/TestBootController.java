package com.demo.controller;

import com.demo.entity.User;
import com.demo.entity.polyline;
import com.demo.mapper.StudentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

/**
 *  RestController  rest 接口
 *  Controller 普通的
 */
@RestController
//@EnableAutoConfiguration
//@RequestMapping("/testboot")
public class TestBootController {


    @Autowired
    StudentMapper studentMapper;


    @RequestMapping("getuser")
    public User getUser() {
        User user = new User();
        user.setName("test");
        return user;
    }
    @RequestMapping("addPolyline")
    public String addPolyline(polyline p) {
        /*polyline p = new polyline();
        p.setLatitude("1");
        p.setLongitude("2");
        p.setBz("3");
        p.setUser("1");*/
        studentMapper.addPolyline(p);
        return "ok!";
    }
    @RequestMapping("/hello")
    public String hello(){
        System.out.println("==========");
        System.out.println(studentMapper.findAll().get(0).getUser_name());;
        return "hello";
    }

    @RequestMapping("/setsession")
    public String session(HttpSession session){
        //设置session
        session.setAttribute("website","www.phpsong.com");
        //获取session
        String website=session.getAttribute("website").toString();
        System.out.println("sessionid: " + session.getId());
        return website;
    }
}
