package cms.infinova.controller;

import java.lang.reflect.Field;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.persistence.Column;

import org.springframework.jdbc.core.RowMapper;
/**
 * 要求字段类里面一样
 * 用法：list = mainTemplate.query(sql,new ObjectMapper(User.class))
 * object = mainTemplate.queryForObject(sql,new ObjectMapper(User.class))
 * @author huangch
 * Since:JDK 7
 * Date:2018-11-16下午3:48:22
 * @Copyright2018,huangch@szinfinova.com All Rights Reserved
 */
public class ObjectMapper  implements RowMapper<Object>{

	private Class<?> cla;
	public ObjectMapper (Class<?> cla){
		this.cla = cla;
	}
	@Override
	public Object mapRow(ResultSet rs, int arg1) throws SQLException {
		Object object = null;
		try {
			object = cla.newInstance();
			Field[] fs =object.getClass().getDeclaredFields();
			for(Field field : fs){
				if( field!=null){
					String name = field.getName();
					String s = name.toLowerCase();//对应sql字段
					/**
					 * @Column(name = "LOG_ID")指定name，否则以字段名
					 */
					Column col = field.getAnnotation(javax.persistence.Column.class);
					if( col!=null ){
						s = col.name();
					}
					try{//直接忽略掉从结果集中找不到的column
						if( rs.getString(s) != null ){
							field.setAccessible(true);
							//System.out.println( s + " :" + rs.getString(s) );
							if( field.getType().equals(Date.class) ){//不严格的日期格式处理！
								field.set(object, new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(bulldParmStr(rs.getString(s))) );
							}else{//其他格式一律按字符串处理
								field.set(object, rs.getString(s));
							}
							
						}
					}catch(Exception e){}
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return object;
	}
	public String bulldParmStr(Object str){
		if(str instanceof Date){
			return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(str);
		}else if(str != null){
			return str.toString();
		}else{
			return "";
		}
	}
}
