package com.union.base.util;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.http.HttpEntity;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;


public class LoginUtil {
	
	public static String SESSIONID = "";
	
	/**
	 * 获取
	 * @return
	 */
	public static String getSessionId(){
		//System.out.println("#########################"+LoginUtil.SESSIONID);
		if(!"".equals(LoginUtil.SESSIONID)){
			return SESSIONID;
		}
		// 创建默认的httpClient实例 
		CloseableHttpClient httpclient = HttpClients.createDefault();
		// 创建httppost  
		HttpPost httppost = new HttpPost("http://10.128.5.189:7001/hrmis/j_unieap_security_check.do");//
		//  创建参数队列 
		List formparams = new ArrayList();
		//BasicNameValuePair键值对好像是用来存放post请求的参数 前面一个键后面一个值ֵ
		formparams.add(new BasicNameValuePair("j_username", "chenkang"));//        
		        
		formparams.add(new BasicNameValuePair("j_password", "1"));
		
		//formparams.add(new data("1234","5678"));
		
		String sessionid = "";
		UrlEncodedFormEntity uefEntity;
		try {
			uefEntity = new UrlEncodedFormEntity(formparams, "UTF-8");
			// post请求 设置编码格式
			httppost.setEntity(uefEntity);
			
			CloseableHttpResponse response = httpclient.execute(httppost);
			
			String header = response.getFirstHeader("Set-Cookie").getValue();
			//��hearder��ȡ��sessionid
			sessionid = header.substring(header.indexOf("JSESSIONID="),header.length());
			
			LoginUtil.SESSIONID = sessionid.substring(0, sessionid.indexOf(";"));
			
			System.out.println(sessionid+"_______response"+response.getFirstHeader("Set-Cookie").getValue());
							
			response.close();
			
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			// 
			try {
				httpclient.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return SESSIONID;
	}
			
	/**
	 * 查询处理参数
	 * @param condition  查询
	 * @param pageNumber 1
	 * @param pageSize   10
	 * @return
	 * 
	 */
	public static String handleParms(String parm,String list,String condition,int pageNumber,int pageSize){
		
		//处理参数
		JSONObject object = JSONObject.fromObject(parm);
		JSONObject ac01Store_List = object.getJSONObject("body")
				  .getJSONObject("dataStores")
				  .getJSONObject(list); //做为参数
		ac01Store_List.put("condition", condition);//放入查询参数
		ac01Store_List.put("pageNumber", pageNumber);//第几页   1
		ac01Store_List.put("pageSize", pageSize);//每页多少   10
		System.out.println("-------------");
		System.out.println("他的处理"+parm);
		System.out.println("我的处理"+object.toString());
		return object.toString();
	}
	
	/**
	 * 转成extjs的grid
	 * obj.body.dataStores.ac01Store_List.rowSet.primary
	 * obj.body.dataStores.ac01Store_List.recordCount
	 * @param rsContent
	 * @return
	 */
	public static JSONObject dealExtGrid(String listName,String rsContent){
		JSONObject json = new JSONObject();
		rsContent = rsContent.replaceAll("null", "\"\"");
		JSONObject object = JSONObject.fromObject(rsContent);
		
		JSONObject ac01Store_List = object.getJSONObject("body")
										  .getJSONObject("dataStores")
										  .getJSONObject(listName);
		JSONArray arry = JSONArray.fromObject(ac01Store_List.getJSONObject("rowSet").get("primary"));
		json.put("totalCount", ac01Store_List.get("recordCount"));
		json.put("topics", arry);
		System.out.println("转成extjs json___:"+json);
		return json;
	}
	
	
	/**
	 * 方法 保存
	 * http://10.128.5.189:7001/hrmis/ria_pojo.do?method=action
	 * @return
	 * @throws Exception
	 */
	public static String getJbxxJson(String parm) throws Exception{

		String result = "";
		// 创建默认的httpClient实例.  
		CloseableHttpClient httpclient = HttpClients.createDefault();
		// 创建httppost 
		HttpPost httppost = new HttpPost("http://10.128.5.189:7001/hrmis/ria_pojo.do?method=action");
		// 创建参数队列  
		List formparams = new ArrayList();
		//按要求的json参数
		StringEntity strentity = new StringEntity(parm,"utf-8");
		
		//uefEntity.setContentEncoding(contentEncoding);
		try {
			httppost.setEntity(strentity);
			//uefEntity = new URLEncoder("","");
			System.out.println("executing request " + httppost.getURI());
			//模拟原始的ajax请求  LoginUtil.getSessionId() 为去sessionid
			httppost.setHeader("Cookie",LoginUtil.getSessionId());
			httppost.setHeader("Content-Type","multipart/form-data");
			httppost.setHeader("X-Requested-With","XMLHttpRequest");
			httppost.setHeader("ajaxRequest","true");
		
			//httpost = new HttpPost(url2); httppost.setHeader(new BasicHeader("Cookie","jsessionid=66DF7E3E8B3602A1153D8721D537D163"));
			CloseableHttpResponse response = httpclient.execute(httppost);
			try {
				HttpEntity entity = response.getEntity();
				if (entity != null) {
					result = EntityUtils.toString(entity, "UTF-8");
					//表示session失效，连接超时
					if(result.indexOf("THE-NODE-OF-SESSION-TIMEOUT")!=-1){
						LoginUtil.SESSIONID = "";
						getSessionId();
						throw new CustomError("提交失败，会话已失效。系统已自动连接，请重新提交之前的操作！");
					}
					System.out.println("-----------------结果开始-------------------");
					System.out.println("Response content: " + result);
					System.out.println("--------------------------------------");
				}
			} finally {
				response.close();
			}
		
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			// 关闭连接,释放资源  
			try {
				httpclient.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	
		return result;
	}
	
}
