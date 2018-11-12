package com.demo.mapper;

import com.demo.entity.polyline;
import com.demo.entity.t_user;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * Created by wh011 on 2018/7/11.
 */
@Mapper
public interface StudentMapper {

    @Select("SELECT * FROM t_user")
    List<t_user> findAll();

    @Insert("INSERT into polyline(longitude,latitude,user,time,bz) VALUES (#{longitude},#{latitude},#{user},now(),#{bz})")
    void addPolyline(polyline polyline);
}
