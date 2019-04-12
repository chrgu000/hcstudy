package com.infinova.security.controller;

import io.jsonwebtoken.Claims;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.session.SessionInformation;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.infinova.common.beans.res.AjaxExceptionResult;
import com.infinova.common.beans.res.AjaxMessageResult;
import com.infinova.common.beans.res.AjaxWebSecurityExceptionResult;
import com.infinova.common.enums.ReturnCodeType;
import com.infinova.common.exception.WebSecurityException;
import com.infinova.common.http.DescAnnotaion;
import com.infinova.common.http.log.HttpReqAnnotaion;
import com.infinova.common.module.controller.BaseController;
import com.infinova.common.utils.GuidUtil;
import com.infinova.security.jwt.JwtUtil;
import com.infinova.security.service.CertProtocolService;
import com.infinova.security.service.UserService;
import com.infinova.system.common.locale.LocaleMessage;
import com.infinova.system.pojo.User;
import com.infinova.system.vo.UserDetailsInfo;
import com.infinova.venus.common.utils.HttpUtil;

@RequestMapping("/main")
@Controller
public class SecurityLoginController extends BaseController{
  
	public static final Logger logger = LogManager.getLogger(SecurityLoginController.class);
	
	/**
	 * 最大允许会话错误 参数Key
	 */
	public static final String MAX_SESSION_EXCEED_PARAM = "max_session";
	
	 @Autowired
	 private CertProtocolService certProtocolService;
	 @Autowired
	 private LocaleMessage localeMessage;
	 @Autowired
	 private SessionRegistry sessionRegistry;
	 @Autowired
	 private UserService userService;
	/**
	 * 获取证书原文
	 * @param req
	 * @return
	 * @throws IOException
	 */
	@HttpReqAnnotaion
	@ResponseBody
	@RequestMapping(value = "/getOriginal", method = {RequestMethod.GET})
	@DescAnnotaion(name = "msg.dblog.security.main.getOriginal", returnTypes = { String.class })
	public AjaxMessageResult<Object> getOriginal(HttpServletRequest req) throws IOException {
		AjaxMessageResult<Object> data = new AjaxMessageResult<Object>();	
		String randNum = certProtocolService.generateRandomNum();
		data.setMsg(randNum);
		// 设置认证原文到session，用于程序向的验证。
		req.getSession().setAttribute("original_data", randNum);
		return data;
	}
	/**
	 * 验证证书
	 * @param req
	 * @return
	 * @throws IOException
	 */
	@HttpReqAnnotaion
	@ResponseBody
	@RequestMapping(value = "/certLogin", method = {RequestMethod.GET, RequestMethod.POST})
	@DescAnnotaion(name = "msg.dblog.security.main.certLogin", returnTypes = { String.class })
	public AjaxMessageResult<Object> certLogin(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		return login(req,resp);
	}
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
		try 
		{	
		
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			Object principal = null;
			if (authentication != null) {
				principal = authentication.getPrincipal();
			}//System.out.println(Base64.decode(req.getHeader("Authorization")));
			if (principal != null) {
				if (principal instanceof UserDetails) {
					UserDetailsInfo userInfo = (UserDetailsInfo)principal;
					String token = JwtUtil.createUserJWT(GuidUtil.randomGuid(), userInfo, 12*60*60*1000);// 将token存cookie中
					/*Cookie newCookie = new Cookie("token", token);
					newCookie.setPath("/CMS");
			        newCookie.setMaxAge(-1);
			        newCookie.setHttpOnly(true);
					resp.addCookie(newCookie);*/
					data.setMsg(userInfo);
					loginSSO(req,userInfo.getUsername(),userInfo.getPassword());
					logger.info(userInfo.getLoginIp()+";"+userInfo.getUsername());
				} else {
					//data = new AjaxInvalidUserNamePasswordResult();
				}
			} else {
				//data = new AjaxInvalidUserNamePasswordResult();
			}
		} catch (Exception e) {
			return new AjaxExceptionResult(e);
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
				WebSecurityException.SESSION_TIMEOUT_ERR_CODE, 
				localeMessage.getResourceBundle4ReturnCodeType().getString(WebSecurityException.SESSION_TIMEOUT_ERR_CODE));
		
		
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
	 * 产生认证原文
	 */
	private String generateRandomNum() {
		/**************************
		 * 第二步 服务端产生认证原文 *
		 **************************/
		String num = "1234567890abcdefghijklmnopqrstopqrstuvwxyz";
		int size = 10;
		char[] charArray = num.toCharArray();
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < size; i++) {
			sb.append(charArray[((int) (Math.random() * 10000) % charArray.length)]);
		}
		return sb.toString();
	}
	/**
	 * *************************************************************************
	 * 							支持单点登录 sso-server改造                                             
	 * *************************************************************************
	 */
	
	/**
	 * 根据token 返回userinfo
	 * @param token == jwt
	 * @param req
	 * @return
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping(value = "/verifyToken", method = {RequestMethod.GET, RequestMethod.POST})
	public AjaxMessageResult<Object> verifyToken(String token,HttpServletRequest req) throws IOException {
		AjaxMessageResult<Object> data = new AjaxMessageResult<Object>();	
		try {
			Claims c = JwtUtil.parseJWT(token);
			return new AjaxMessageResult<Object>(c);
		} catch (Exception e){
			data.setCode("-1");
			data.setDesc("Invalid Token");
			return data;
		}
	}
	/**
	 * sso-server
	 * 统一认证服务sso
	 * http://127.0.0.1:8080/CMS/main/sso.do?url=http://10.22.2.29:8081/ISAS/main/initLogin.do?page=webclient.html
	 * @author huangch  Date:2018-10-29下午12:52:47
	 * @throws Exception 
	 */
	@RequestMapping(value = "/sso", method = RequestMethod.GET)
    public void sso(HttpServletRequest req, HttpServletResponse response)throws Exception{
		String goBack = req.getParameter("url");
		String jtoken = req.getParameter("token");// 用于 子系统跨域请求基础平台的token，等于sessionid
		Authentication auth = SecurityContextHolder.getContext().getAuthentication(); 
		Object principal = null;
		if (auth != null) {
			principal = auth.getPrincipal();
		}
		if (principal != null) {
			if (principal instanceof UserDetails) {
				//基础平台已登录！！
				UserDetailsInfo userInfo = (UserDetailsInfo)principal;
				/**
				 * 基础平台已登录：
				 * 取出 userInfo里的信息，重定向回去验证
				 * http://10.22.2.29:8080/CMS/main/initLogin.do?username=?&....
				 */
				saveloginRecord(goBack,req,jtoken);	
				sessionRegistry.registerNewSession(jtoken, principal);
				String token = JwtUtil.createUserJWT(GuidUtil.randomGuid(), userInfo, 10*60*1000); //登录子系统的
				logger.debug("sso login : "+goBack+"&username="+userInfo.getUsername()+"&token="+token);
				response.sendRedirect(goBack+"&username="+userInfo.getUsername()+"&token="+token);
			}else{
				logger.debug("sso no login : "+goBack);
				/**
				 * 基础平台未登录：
				 * 1、带上url中的参数，跳转到登录界面
				 * http://127.0.0.1:8080/login.html?url=http://10.22.2.29:8081/CMS/main/initLogin.do?page=webclient.html
				 * 2、前端登录成功后，跳转：
				 * window.location='/CMS/main/sso.do?url=http://10.22.2.29:8081/CMS/main/initLogin.do?page=webclient.html'
				 */
				String homePage = req.getParameter("homePage");
				if(null==homePage||"".equals(homePage)){
					response.sendRedirect("/login.html?url="+goBack);
				}else{
					if("?".indexOf(homePage) > -1){
						homePage = homePage + "&sid="+req.getSession().getId();
					}else{
						homePage = homePage + "?sid="+req.getSession().getId();
					}
					response.sendRedirect(homePage);
				}
				
			}
		}
    }
	/**
	 * sso-server
	 * 同一登出   ： 当前会话登录过的其他系统记录
	 * @author huangch  Date:2018-10-31下午5:57:23
	 * @param req
	 * @return
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping(value = "/ssoLoginRecord", method = {RequestMethod.GET, RequestMethod.POST})
	public AjaxMessageResult<Object> loginRecord(HttpServletRequest req) throws IOException {
		AjaxMessageResult<Object> data = new AjaxMessageResult<Object>();	
		try {
			//清除其他session
			HashSet<String> jtokens = (HashSet) req.getSession().getAttribute("jtokens");
			if( jtokens!=null ){
				for(String s : jtokens){
					sessionRegistry.removeSessionInformation(s);
				}
			}
			logoutSSO(req);
			Set set = (Set) req.getSession().getAttribute("loginRecord");
			req.getSession().invalidate();
			return new AjaxMessageResult<Object>(set);
		} catch (Exception e){
			return data;
		}
	}
    /**
     * 保存通过同一会话，登录过其他系统的ip记录
     * @author huangch  Date:2018-10-31下午5:39:47
     * @param goBack
     * @param req
     */
    public void saveloginRecord(String goBack,HttpServletRequest req,String jtoken){
    	String str = "";
		if( goBack.substring(8).indexOf("/") > 0 ){
			str = goBack.substring(0,8+goBack.substring(8).indexOf("/"));
		}else{
			str = goBack;
		}				
		HashSet set = (HashSet) req.getSession().getAttribute("loginRecord");
		if( set == null ){
			set = new HashSet();
		}
		set.add(str);
		HashSet jtokens = (HashSet) req.getSession().getAttribute("jtokens");
		if( jtokens == null ){
			jtokens = new HashSet();
		}
		logger.debug("sso login : other system jtoken : "+jtoken);//保存其他的token
		jtokens.add(jtoken);
		req.getSession().setAttribute("loginRecord", set);
		req.getSession().setAttribute("jtokens", jtokens);
    }
    
	/**
	 **********************************************
	 ******************客户端登录DEMO***************
	 **********************************************
	 */
    @Value("${sso_server_login}")
	public String sso_server_login = ""; //统一认证地址
	@Value("${clientInit}")
	public String clientInit = "";       //登录成功后，客户端回调方法
	@Value("${serverLogout}")
	public String serverLogout = "";     //登出请求
	@Value("${verifyToken}")
	public String verifyToken = "";   //验证token地址
	@Value("${sso}")
	public boolean sso = false;             //单点登录开关    基础平台作为认证中心，一定要填false
    
    @Autowired
    private AuthenticationManager authenticationManager;
    
    /**
     * sso-client
     * 未登录请求，用于页面重定向到 统一认证页面 CMS/main/SSOLogin.do?page=index.html
     * @author huangch  Date:2018-10-29上午10:46:45
     * @throws IOException
     */
    @RequestMapping(value = "/SSOLogin", method = RequestMethod.GET)
    public void SSOLogin(HttpServletRequest req, HttpServletResponse response) throws IOException {
    	String basePath = req.getScheme() + "://" + req.getServerName() + ":" 
    					+ req.getServerPort()  + "/";
    	if(sso){
    		//认证成功后，重定向到业务系统方法，如http://10.22.2.29:8081/CMS/main/initLogin.do
        	String backUrl = basePath+ clientInit;
        	//带上参数  例：page=1&parm=2
        	String backparm = req.getQueryString();
        	//sso_server 基础平台认证地址
        	String goUrl = sso_server_login;
        	//重定向到基础平台进行认证  格式： http://基础平登录地址?url=成功登录后业务系统地址
        	response.sendRedirect(goUrl + "?url=" + backUrl +"?" +backparm+"&homePage="+basePath+"loginLocal.html?"+backparm);//
    	}else{
    		//验证下是否真的未登录
    		SessionInformation info2 = sessionRegistry.getSessionInformation(req.getSession().getId());
    		if(info2!=null){
    			UserDetailsInfo userInfo = (UserDetailsInfo) info2.getPrincipal();
		        UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userInfo,null, userInfo.getAuthorities());
		        SecurityContextHolder.getContext().setAuthentication(authentication);
    			String gotoPage = req.getParameter("page");
    			response.sendRedirect("/login.html?page="+gotoPage+"&userInfo=ajax");
    		}else{
    			response.sendRedirect("/loginLocal.html");
    		}
    		
    	}
    	
    }
    
    
    /**
     * [基础平台-认证中心]
     * 新增方法：登录界面不用基础平台的，用子系统的登录界面时
     * 逆向登录  先登录子系统，后登录基础平台
     * @author huangch  Date:2019年2月21日上午10:38:45
     * @param req
     * @param response
     * @throws IOException
     */
    @RequestMapping(value = "/initLogin", method = RequestMethod.GET)
    public void initLogin(HttpServletRequest req, HttpServletResponse response) throws Exception {
    	//地址http://10.22.2.29:8081
    	String basePath = req.getScheme() + "://" + req.getServerName() + ":" + req.getServerPort()  + "/";
    	String username = req.getParameter("username");//用户名
    	String JWTToken = req.getParameter("token");   // JWT-token 存放的是 userInfo信息，业务系统可根据该token去实现自己的会话登录成功标志
    	String gotoPage = req.getParameter("page");    //参数：返回页面webclient.html/index.html/...
    	String jtoken = "";
    	/**
    	 * 2.第三方业务系统，处理自己的会话登录成功标志
    	 */
    	
        
    	UsernamePasswordAuthenticationToken token = null;
    	if( !JwtUtil.verifyJWT(JWTToken) ){ //验证token不为空  非jwt加密时
    		User user = userService.getByUserName(username);
    		String str = JwtUtil.createJWT(GuidUtil.randomGuid(), user.getPassword(), 60*1000);
    		token = new UsernamePasswordAuthenticationToken(user.getUserName(),str.replaceAll("_", ",,")+"_jwt");
    		jtoken = JWTToken;
    		req.getSession().setAttribute("ssoToken", JWTToken);//统一认证平台的token
    	}else{
    		jtoken = (String) JwtUtil.parseJWT(JWTToken).get("token");
    		token = new UsernamePasswordAuthenticationToken(username, JWTToken.replaceAll("_", ",,")+"_jwt");    			
    	}
    	Authentication authentication = authenticationManager.authenticate(token);
        SecurityContextHolder.getContext().setAuthentication(authentication);
    	//2.1 用户名+JWT密码形式 处理自己的会话登录成功标志
    	/**/
        Object principal = null;
        UserDetailsInfo userInfo = null;
        if (authentication != null) {
			principal = authentication.getPrincipal();
			if (principal instanceof UserDetails) {
				userInfo = (UserDetailsInfo)principal;
				try {//下次可以凭jtoken直接获取请求
					sessionRegistry.registerNewSession(jtoken, principal);
					saveloginRecord(gotoPage,req,jtoken);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			} else {
				//登录失败，原因通常为基础平台与业务系统数据不一致！
			}
		}
        /**
		 * 3. 处理url，并重定向到指定页面
		 */
        req.getSession().setAttribute("logout", "");
        logger.debug("sso login sucess : "+basePath+"login.html?page="+gotoPage+"&userInfo="+JSON.toJSONString(userInfo));
    	response.sendRedirect(basePath+"login.html?page="+gotoPage+"&userInfo=ajax");//+JSON.toJSONString(userInfo));
    }
    /**
     * [基础平台-认证中心]url 传参限制
     * @author huangch  Date:2019年3月4日下午5:13:31
     * @param req
     * @param response
     * @return
     * @throws IOException
     */
    @ResponseBody
    @RequestMapping(value = "/getUserInfo", method = RequestMethod.GET)
    public AjaxMessageResult<Object> getUserInfo(HttpServletRequest req, HttpServletResponse response) throws IOException {
    	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Object principal = null;
		if (authentication != null) {
			principal = authentication.getPrincipal();
		}
		if (principal != null) {
			if (principal instanceof UserDetails) {
				UserDetailsInfo userInfo = (UserDetailsInfo)principal;
				return new AjaxMessageResult<Object>(userInfo);
			}
		}
		return new AjaxMessageResult<Object>("error");

    }
    /**
     * [基础平台-认证中心]新增方法：登录界面不用基础平台的，用子系统的登录界面时
     * 逆向
     * @author huangch  Date:2019年2月25日上午9:45:06
     * @param req
     * @param response
     * @throws IOException
     */
    @RequestMapping(value = "/SSOLogout", method = RequestMethod.GET)
    public void SSOLogout(HttpServletRequest req, HttpServletResponse response) throws IOException {
    	String basePath = req.getScheme() + "://" + req.getServerName() + ":" + req.getServerPort()  + "/";
    	String gotoPage = req.getParameter("page");
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication(); 
		Object principal = null;
		if (auth != null) {
			principal = auth.getPrincipal();
		}
		if (principal != null) {
			if (principal instanceof UserDetails) {
				logger.debug("SSOLogout 已登录 sucess : "+basePath+"login.html?page="+gotoPage+"&iframe=logout");
		    	response.sendRedirect(basePath+"login.html?page="+gotoPage+"&iframe=logout");
			}else{
				logger.debug("SSOLogout 未登录 sucess : "+gotoPage);
		    	response.sendRedirect(gotoPage);
			}
		}
    }
    /**
     * [基础平台-认证中心]静默登录
     * @author huangch  Date:2019年3月22日上午10:30:33
     */
    @ResponseBody
    @RequestMapping(value = "/sidLogin", method = {RequestMethod.GET, RequestMethod.POST})
	public AjaxMessageResult<Object> sidLogin(HttpServletRequest req) throws Exception{
		AjaxMessageResult<Object> data = new AjaxMessageResult<Object>();
		String JWTToken = req.getParameter("jwttoken");
		String sid = req.getParameter("sid");
		String clientToken = req.getParameter("token");
		String username = req.getParameter("username");//用户名
		String code = req.getParameter("code");//子系统的编码  注销使用   存于map   token-codeList   然后分别注销
		if(StringUtils.isNotBlank(username)){
			User user = userService.getByUserName(username);
    		String str = JwtUtil.createJWT(GuidUtil.randomGuid(), user.getPassword(), 60*1000);
    		UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(user.getUserName(),str.replaceAll("_", ",,")+"_jwt");
    		Authentication authentication = authenticationManager.authenticate(token);
            SecurityContextHolder.getContext().setAuthentication(authentication);
            Object principal = null;
            UserDetailsInfo userInfo = null;
            if (authentication != null) {
    			principal = authentication.getPrincipal();
    			if (principal instanceof UserDetails) {
    				if(StringUtils.isNotEmpty(sid)){
    					sessionRegistry.registerNewSession(sid, principal);
    				} 
    				if(StringUtils.isNotEmpty(clientToken)){
    					sessionRegistry.registerNewSession(clientToken, principal);
    				}
    				saveloginRecord("127.0.0.1",req,clientToken);
    		   	   	data.setMsg(sid);
    			}else{
    				data.setCode("-1");
    				data.setDesc("错误的用户名和密码");
    			}
            }
	   	}else{
	   		//无效的令牌
	   		 data.setDesc("不存在该用户");
	   		 data.setCode("-1");
	   	}
		return data;
		
	}
    
    /**
     * [集成平台-认证中心]请求认证中心单点登出
     * @author huangch  Date:2019年3月20日上午9:06:43
     * @param req
     */
    public void logoutSSO(HttpServletRequest req){
    	if(sso){
    		String token = (String) req.getSession().getAttribute("ssoToken");//统一认证平台的token
    		if(StringUtils.isNotEmpty(token)){
    			HttpUtil.doGet(serverLogout+"?token="+token);
    		}
    	}
    }
    /**
     * [集成平台-认证中心]静默登录 激活认证中心后台会话
     * @author huangch  Date:2019年3月20日上午10:44:04
     */
    public void loginSSO(HttpServletRequest req,String username,String pwd){
    	String ref = req.getHeader("Referer");
    	if(StringUtils.isNotEmpty(ref)){
    		int i = ref.indexOf("sid=");
        	String sid = "";
        	if(i > -1){
        		sid = (ref.substring(i+4));
            	String str = HttpUtil.doGet(verifyToken.replace("verifyToken", "sidLogin")+"?sid="+sid+"&username="+username+"&code=v2200");
            	JSONObject object = JSONObject.parseObject(str);
            	if( object !=null ){
            		if("0".equals(object.get("code"))){
            			req.getSession().setAttribute("ssoToken", object.get("msg"));//保存静默登录的认证中心token，退出时还要用
            		}
            	}
        	}
    	}
    }
    /**
     * [集成平台-认证中心]支持认证中心免登陆 ajax请求
     * 验证token是否登录
     * @author huangch  Date:2019年3月20日上午10:40:31
     */
    public boolean verifyTokenSSO(String token){
    	if(sso){
    		String str =HttpUtil.doGet(verifyToken+"?token="+token);
        	JSONObject object = JSONObject.parseObject(str);
        	if( object !=null ){
        		if("0".equals(object.get("code"))){
        			String username = (String) ((JSONObject)object.get("msg")).get("username");
    				try {
    					User user = userService.getByUserName(username);
    					String jwtPwd = JwtUtil.createJWT(GuidUtil.randomGuid(), user.getPassword(), 60*1000);
    	        		UsernamePasswordAuthenticationToken uptoken = new UsernamePasswordAuthenticationToken(user.getUserName(),jwtPwd.replaceAll("_", ",,")+"_jwt");
    	        		Authentication authentication = authenticationManager.authenticate(uptoken);
    	        		SecurityContextHolder.getContext().setAuthentication(authentication);
    	        		sessionRegistry.registerNewSession(token, authentication.getPrincipal());//保存凭证，下次免验证
    				} catch (Exception e) {
    					logger.debug("verifyTokenSSO authentication error："+verifyToken+","+token+"--"+e.getMessage());
    					return false;
    				}
    				logger.debug("verifyTokenSSO is ok :"+token);
        			return true;
        		}
        	}
        	logger.debug("verifyTokenSSO token error :"+sso+""+token);
    	}
    	return false;
    }
    
}
