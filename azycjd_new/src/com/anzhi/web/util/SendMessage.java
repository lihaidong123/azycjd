package com.anzhi.web.util;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
public class SendMessage {
	private static final String addr = "http://api.sms.cn/mtutf8/";
	private static final String userId = "azycjd";

	/*
	 * 如uid是：test，登录密码是：123123  
	 * 加密后：则加密串为  md5(123123test)=b9887c5ebb23ebb294acab183ecf0769
	 * 
	 * 可用在线生成地址：http://www.sms.cn/password
	 */

	private static final String pwd = "d862469d9a7d7732ed33bfc061dd05d9";

	private static final String encode = "utf8";

	public static String send(String msgContent, String mobile) throws Exception {

		// 组建请求
		String straddr = addr + "?uid=" + userId + "&pwd=" + pwd + "&mobile="
				+ mobile + "&encode=" + encode + "&content="
				+ URLEncoder.encode(msgContent, "UTF-8");

		StringBuffer sb = new StringBuffer(straddr);
		System.out.println("URL:" + sb);

		// 发送请求
		URL url = new URL(sb.toString());
		HttpURLConnection connection = (HttpURLConnection) url.openConnection();
		connection.setRequestMethod("POST");
		BufferedReader in = new BufferedReader(new InputStreamReader(url
				.openStream()));

		// 返回结果
		String inputline = in.readLine();
		System.out.println("Response:" + inputline);
		return inputline;
	}
}
