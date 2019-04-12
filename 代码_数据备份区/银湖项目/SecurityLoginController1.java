package com.infinova.security.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.infinova.common.beans.res.AjaxExceptionResult;
import com.infinova.common.beans.res.AjaxMessageResult;
import com.infinova.common.beans.res.AjaxWebSecurityExceptionResult;
import com.infinova.common.enums.ReturnCodeType;
import com.infinova.common.exception.WebSecurityException;
import com.infinova.common.http.DescAnnotaion;
import com.infinova.common.http.log.HttpReqAnnotaion;
import com.infinova.common.module.controller.BaseController;
import com.infinova.system.task.LicenseExpridateCheckTask;
import com.infinova.system.vo.UserDetailsInfo;
import com.infinova.venus.common.utils.GuidUtil;
import com.infinova.venus.common.utils.JwtUtil;

@RequestMapping("/main")
@Controller
public class SecurityLoginController extends BaseController{

	public static final Logger logger = LogManager.getLogger(SecurityLoginController.class);
	
	/**
	 * 最大允许会话错误 参数Key
	 */
	public static final String MAX_SESSION_EXCEED_PARAM = "max_session";
	@Autowired
	private LicenseExpridateCheckTask licenseExpridateCheckTask;
	
	/**
	 * 登录入口和登录信息返回
	 * @param req
	 * @return
	 * @throws IOException
	 */
	@HttpReqAnnotaion
	@ResponseBody
	@RequestMapping(value = "/login", method = {RequestMethod.GET, RequestMethod.POST})
	@DescAnnotaion(name = "msg.dblog.security.main.login", returnTypes = { UserDetailsInfo.class })
	public AjaxMessageResult<Object> login(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		AjaxMessageResult<Object> data = new AjaxMessageResult<Object>();	
		HttpSession session = req.getSession(false);
		String sessionId = session.getId();
		try 
		{
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			Object principal = null;
			if (authentication != null) {
				principal = authentication.getPrincipal();
			}
			if (principal != null) {
				if (principal instanceof UserDetails) {
					UserDetailsInfo userInfo = (UserDetailsInfo)principal;
					logger.info(userInfo);
					Map<String,Object> claims = new HashMap<String,Object>();//创建payload的私有声明（根据特定的业务需要添加，如果要拿这个做验证，一般是需要和jwt的接收方提前沟通好验证方式的）
					claims.put("username", userInfo.getUsername());
					claims.put("password", userInfo.getPassword());
					Cookie newCookie = new Cookie("token", req.getSession().getId());
					newCookie.setPath("/CMS");//仅向CMS共享
			        newCookie.setMaxAge(-1);
			        newCookie.setHttpOnly(true);
					resp.addCookie(newCookie);
					data.setMsg(userInfo);
					logger.info(userInfo.getLoginIp());
				} else {
					//data = new AjaxInvalidUserNamePasswordResult();
				}
			} else {
				//data = new AjaxInvalidUserNamePasswordResult();
			}
		} catch (Exception e) {
			return new AjaxExceptionResult(e);
		}
		try {
				licenseExpridateCheckTask.licenseCheck(sessionId);	
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return data;
	}
	
	
	/**
	 * 登录失败信息返回
	 * @param req
	 * @return
	 * @throws IOException
	 */
	@HttpReqAnnotaion
	@ResponseBody
	@RequestMapping(value = "/sessionExpired", method = {RequestMethod.GET, RequestMethod.POST})
	@DescAnnotaion(name = "msg.security.main.sessionExpired", returnTypes = { UserDetailsInfo.class })
	public AjaxMessageResult<Object> sessionExpired(HttpServletRequest req) throws IOException {
		AjaxWebSecurityExceptionResult data = new AjaxWebSecurityExceptionResult(
				WebSecurityException.SESSION_TIMEOUT_ERR_CODE, WebSecurityException.SESSION_TIMEOUT_ERR_MSG);
		
		
		
		return data;
	}
	
	

	/**
	 * Digest登录入口页面和信息返回
	 * @param req
	 * @return
	 * @throws IOException
	 */
	@HttpReqAnnotaion
	@ResponseBody
	@RequestMapping(value = "/digestLogin", method = {RequestMethod.GET, RequestMethod.POST})
	@DescAnnotaion(name = "msg.dblog.security.main.digestLogin", returnTypes = { UserDetailsInfo.class })
	public AjaxMessageResult<Object> digestLogin(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		return login(req,resp);
	}
	
	/**
	 * 处理 Security 登出信息返回。
	 * @param req
	 * @return
	 * @throws IOException
	 */
	@HttpReqAnnotaion
	@ResponseBody
	@RequestMapping(value = "/logout", method = {RequestMethod.GET, RequestMethod.POST})
	@DescAnnotaion(name = "msg.dblog.security.main.logout")
	public AjaxMessageResult<Object> logout(HttpServletRequest req) throws IOException {
		//根据此信息返回code 此信息参数由CMS自己控制，所以直接读取
		String error = req.getParameter("error");
		AjaxMessageResult<Object> data = new AjaxMessageResult<Object>();	
		if (error != null) {
			data.setCode(String.valueOf(ReturnCodeType.SERVER_ERROR.getCode()));
		}
		return data;
	}
	
	/**
	 * 支持单点登录部分
	 * 1、改造：springmvc-servlet.xml
	 * <context:property-placeholder ignore-unresolvable="true" location="classpath:jdbc.properties" />
	 * 2、security.xml
	 * <security:intercept-url pattern="/main/SSOLogin.do*" access="permitAll" />
		<security:intercept-url pattern="/main/initLogin.do*" access="permitAll" />
		<security:intercept-url pattern="/main/SSOlogout.do*" access="permitAll" />
		3、jdbc配置
		sso_server_login =http://127.0.0.1:8080/CMS/main/sso.do
		sso_server_logout=http://127.0.0.1:8080/login.html?page=client&login=logout
		sso_client_init=ISAS/main/initLogin.do
	 */
	@Autowired
    private AuthenticationManager authenticationManager;
	@Value("${sso_server_login}")
	public String sso_server_login;         // 基础平台统一认证地址
	@Value("${sso_client_init}")
	public String clientInit;    //基础平台登录成功后，客户端回调方法
	@Value("${sso_server_logout}")
	public String serverLogout;  //基础平台登出请求
	@Value("${sso}")
	public boolean sso;
    /**
     * sso-client 登录请求
     * 用于页面重定向到 统一认证页面 CMS/main/SSOLogin.do?page=index.html
     * 如：http://10.22.2.29:8081/ISAS/main/SSOLogin.do?page=client
     * @author huangch  Date:2018-10-29上午10:46:45
     * @throws IOException
     */
    @RequestMapping(value = "/SSOLogin", method = RequestMethod.GET)
    public void SSOLogin(HttpServletRequest req, HttpServletResponse response) throws IOException {
    	String basePath = req.getScheme() + "://" + req.getServerName() + ":" 
				+ req.getServerPort()  + "/";
    	//带上参数  例：page=1&parm=2
		String backparm = req.getQueryString();
    	if(sso){
    		//回调方法：认证成功后，重定向到业务系统方法，如http://10.22.2.29:8081/CMS/main/initLogin.do
    		String backUrl = basePath+ clientInit;//"CMS/main/initLogin.do";
    		if(clientInit.indexOf("http")>-1){
    			backUrl = clientInit;//如果是全地址，就直接获取全地址
    		}
    		
        	if("logout".equals(req.getSession().getAttribute("logout"))){
        		//response.sendRedirect(serverLogout+"&url=" + backUrl +"?" +backparm);//返回基础平台登录界面
        		response.sendRedirect(serverLogout+"?page="+ req.getScheme() + "://" + req.getServerName() + ":" + req.getServerPort()+"/loginLocal.html?"+backparm);
        	}else{
    			//重定向到基础平台进行认证  格式： http://基础平登录地址?url=成功登录后业务系统地址    homePage是用哪一个登录页面
    			response.sendRedirect(sso_server_login + "?token="+req.getSession().getId()+"&url=" + backUrl +"?" +backparm+"&homePage="+basePath+"loginLocal.html?"+backparm);
        	}
    	}else{
    		response.sendRedirect(basePath+"loginLocal.html?"+backparm);
    	}
    	
		
    	
    }
    /**
     * 逆向单点登录，由子系统进行
     * 在结构化的登录界面登录成功后，跳到基础平台去设置基础平台的会话
     * @author huangch  Date:2019年2月21日上午10:27:00
     * @param req
     * @param response
     * @throws Exception
     */
    @RequestMapping(value = "/sso", method = RequestMethod.GET)
    public void sso(HttpServletRequest req, HttpServletResponse response)throws Exception{
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication(); 
    	String gotoPage = req.getParameter("page"); 
    	//String goBack = sso_server_login.replace("sso.do", "initLogin.do")+"?page="+ req.getScheme() + "://" + req.getServerName() + ":" + req.getServerPort()+"/"+gotoPage;
    	String goBack = sso_server_login.replace("sso/login", "sso/initLogin")+"?page="+ req.getScheme() + "://" + req.getServerName() + ":" + req.getServerPort()+"/"+gotoPage;
    	
    	if(sso){
    		Object principal = null;
    		if (auth != null) {
    			principal = auth.getPrincipal();
    		}
    		if (principal != null) {
    			if (principal instanceof UserDetails) {
    				//已登录！！
    				UserDetailsInfo userInfo = (UserDetailsInfo)principal;
    				Map<String,Object> claims = new HashMap<String,Object>();//创建payload的私有声明（根据特定的业务需要添加，如果要拿这个做验证，一般是需要和jwt的接收方提前沟通好验证方式的）
    				claims.put("username", userInfo.getUsername());
    				claims.put("password", userInfo.getPassword());
    				claims.put("token", req.getSession().getId());
    				String token = JwtUtil.createJWT(GuidUtil.randomGuid(), claims, 10*60*1000);
    				logger.debug("sso login : "+goBack+"&username="+userInfo.getUsername()+"&token="+token+"&"+req.getQueryString());
    				response.sendRedirect(goBack+"&username="+userInfo.getUsername()+"&token="+token+"&"+req.getQueryString());
    			}else{
    				
    			}
    		}
    	}else{
    		response.sendRedirect(req.getScheme() + "://" + req.getServerName() + ":" + req.getServerPort()+"/"+gotoPage);
    	}
		
    }
    
    /**
     * sso-client 登出请求 
     * ISAS/main/SSOlogout.do
     * 在页面点击登出的地方：topview.js appbasectrl.js 加window.location.href="ISAS/main/SSOlogout.do"
     * @throws IOException
     */
    @RequestMapping(value = "/SSOlogout", method = RequestMethod.GET)
    public void SSOlogout(final HttpServletRequest req, HttpServletResponse response) throws IOException {
    	String basePath = req.getScheme() + "://" + req.getServerName() + ":" 
				+ req.getServerPort()  + "/";
    	new Timer().schedule(new TimerTask(){ 
	    	public void run(){ 
	    		/**
	    		 * 在基础平台挂掉的情况下，自己也能实现退出！
	    		 * 加个延时是为了：防止自己抢先退出后，前端还未反应过来，又去基础平台自动登录！
	    		 */
	    		if(req.getSession() != null)
	    		req.getSession().invalidate();
	    	}
    	},500);//五百毫秒
    	logger.debug("sso logout : "+serverLogout);
    	response.sendRedirect(serverLogout);
    }
    /**
     * sso-client 成功后的回调方法
     * http://10.22.2.29:8081/ISAS/main/initLogin.do?page=webclient.html&username=admin&pwd_md5=21232F297A57A5A743894A0E4A801FC3
     * 统一认证登录成功，重定向到该方法，附带返回信息
     * @author huangch  Date:2018-10-29上午10:10:14
     * @throws IOException
     */
    @RequestMapping(value = "/initLogin", method = RequestMethod.GET)
    public void initLogin(HttpServletRequest req, HttpServletResponse response) throws IOException {
    	/**
    	 * 1.获取基础平台返回信息
    	 */
    	//地址http://10.22.2.29:8081  req.getScheme() + "://" + req.getServerName() + ":" + req.getServerPort()
    	String basePath = getWebUrl();
    	if("".equals(basePath)||null==basePath){
    		basePath = req.getScheme() + "://" + req.getServerName() + ":" + req.getServerPort();
    	}
    	String username = req.getParameter("username");//用户名
    	String JWTToken = req.getParameter("token");   // JWT-token 存放的是 userInfo信息，业务系统可根据该token去实现自己的会话登录成功标志
    	String gotoPage = req.getParameter("page");    //参数：返回页面webclient.html/index.html/...
    	/**
    	 * 2.第三方业务系统，处理自己的会话登录成功标志
    	 */
    	//2.1 用户名+JWT密码形式 处理自己的会话登录成功标志
    	UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(username, JWTToken.replaceAll("_", ",,")+"_jwt");    			
    	Authentication authentication = authenticationManager.authenticate(token);
        SecurityContextHolder.getContext().setAuthentication(authentication);
        Object principal = null;
        UserDetailsInfo userInfo = null;
        if (authentication != null) {
			principal = authentication.getPrincipal();
			if (principal instanceof UserDetails) {
				userInfo = (UserDetailsInfo)principal;
			} else {
				//登录失败，原因通常为基础平台与业务系统数据不一致！
			}
		}
        /**
		 * 3. 处理url，并重定向到指定页面
		 */
        //System.out.println(basePath+"login.html?page="+gotoPage+"&userInfo="+JSON.toJSONString(userInfo));
        //http://10.22.2.29:8081/login.html?page=webclient.html&userInfo={...}
        req.getSession().setAttribute("logout", "");
        logger.debug("sso login sucess : "+req.getHeader("host")+","+basePath+"/login.html?page="+gotoPage+"&userInfo="+JSON.toJSONString(userInfo));
    	response.sendRedirect(basePath+"/login.html?page="+gotoPage+"&userInfo="+JSON.toJSONString(userInfo));
        
    }
    public String getWebUrl() throws IOException{
    	Properties properties=new Properties();
		InputStream f=this.getClass().getClassLoader().getResourceAsStream(("jdbc.properties"));
		properties.load(f);
		f.close();
    	return properties.getProperty("sso_client_web");
    }
}
