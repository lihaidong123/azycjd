package com.tadu.util;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.FileNotFoundException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import net.sf.json.JSONObject;

import com.anzhi.web.pojo.AnzhiChapter;
import com.anzhi.web.pojo.AnzhiNovel;

public class AddBook extends TaDuUtil{
	/**
	 * 定义请求参数
	 */
	//必须的参数
	String baseUrl="http://topenapi.tadu.com:8098/api/addBook";
	public AddBook(AnzhiNovel an,List<AnzhiChapter> chapterList) throws UnsupportedEncodingException{
		String result = null;
		try {
			try {
				//先删除整本书
				delNovelId(an.getId());
			} catch (Exception e) {
				
			}
			result = sendPost(an);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		if(result==null||result.equals("")){
			System.out.println("抱歉，没有在服务器获取结果,请检查参数是否有误。");
		}else{
			//{"code":0,"message":"success!","result":{"bookid":"1234560213"}}
			System.out.println(an.getNovelTitle()+"推送成功！");
			JSONObject obj=JSONObject.fromObject(result);
			if(obj.get("code")!=null){
				if(obj.get("code").toString().equals("0")){
					JSONObject ts=JSONObject.fromObject(obj.get("result"));
					String bookid=ts.getString("bookid");
					if(bookid!=null){
						AddChapter add=new AddChapter(bookid,chapterList,an.getId());
					}
				}
			}
		}
	}
	//向服务器要发送的POST请求
	protected String sendPost(AnzhiNovel an) throws FileNotFoundException{
		URL url = null;
		HttpURLConnection conn = null;
		String str = "";
		try {
			url = new URL(baseUrl);
			conn = (HttpURLConnection) url.openConnection();
			conn.setDoInput(true);
			conn.setDoOutput(true);
			conn.setUseCaches(false);
			conn.setRequestProperty("Content-Type", "text/plain");
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Charsert", "UTF-8");
			DataOutputStream dos = new DataOutputStream(conn.getOutputStream());
			StringBuffer buffer = new StringBuffer();
			//key
			String secret = key;
			//copyrightid + password
			String securityid = copyrightid+secret;
			String digest = new SHA1().getDigestOfString(securityid.getBytes());
			//密钥
			buffer.append("key="+digest);
			//CP书籍ID
			buffer.append("&cpid="+an.getId());
			//CP版权ID
			buffer.append("&copyrightid="+copyrightid);
			//封面图
			buffer.append("&coverimage=http://www.azycjd.com"+an.getNovelImg());
			//书籍名称
			buffer.append("&bookname="+URLEncoder.encode(an.getNovelTitle(), "UTF-8"));
			//作者名称
			buffer.append("&authorname="+URLEncoder.encode(an.getAuthorWriterName(), "UTF-8"));
			//书籍简介
			buffer.append("&intro="+URLEncoder.encode(an.getVote(), "UTF-8"));
			//建议分类ID
			buffer.append("&classid="+getNovelClassId(an.getNovelType()));
			//是否连载  1连载0全本
			buffer.append("&serial="+(an.getState().equals(3)?0:1));
			//是否收费  1收费0免费
			buffer.append("&isvip=1");
			//原站链接
			
//			System.out.println("POST:" + buffer.toString());
			dos.write(buffer.toString().getBytes());
			dos.flush();
			dos.close();
			BufferedReader bufferReader = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			String aa = "";
			while ((aa = bufferReader.readLine()) != null) {
				str += aa;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null)
				conn.disconnect();
		}
		return str;
	}
	
	//向服务器要发送的POST请求
	protected String delNovelId(int novelId) throws FileNotFoundException{
		URL url = null;
		HttpURLConnection conn = null;
		String str = "";
		try {
			url = new URL("http://topenapi.tadu.com:8098/api/deleteBook");
			conn = (HttpURLConnection) url.openConnection();
			conn.setDoInput(true);
			conn.setDoOutput(true);
			conn.setUseCaches(false);
			conn.setRequestProperty("Content-Type", "text/plain");
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Charsert", "UTF-8");
			DataOutputStream dos = new DataOutputStream(conn.getOutputStream());
			StringBuffer buffer = new StringBuffer();
			//key
			String secret = key;
			//copyrightid + password
			String securityid = copyrightid+secret;
			String digest = new SHA1().getDigestOfString(securityid.getBytes());
			//密钥
			buffer.append("key="+digest);
			//CP版权ID
			buffer.append("&copyrightid="+copyrightid);
			//CP书籍ID
			buffer.append("&cpid="+novelId);
			dos.write(buffer.toString().getBytes());
			dos.flush();
			dos.close();
			BufferedReader bufferReader = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			String aa = "";
			while ((aa = bufferReader.readLine()) != null) {
				str += aa;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null)
				conn.disconnect();
		}
		return str;
	}
	
	public int getNovelClassId(String novelType){
		String tadutype="3,社科科普;4,奇幻科幻;10,武侠仙侠;32,经管理财;81,现代都市;82,纪实传记;83,青春校园;84,历史风云;85,悬疑灵异;86,铁血军事;87,生活休闲;88,励志成功;89,童话寓言;90,外国名著;91,古典名著;92,职场商战;93,当代文学;102,影视娱乐;115,官场沉浮;121,教育教辅;138,两性伦理;139,言情小说;99,东方玄幻;103,现代都市;107,西方奇幻;108,历史架空;109,武侠仙侠;111,科幻末世;112,游戏竞技;113,军事战争;114,官场职场;128,灵异悬疑;135,同人小说;104,现代言情;105,青春校园;106,穿越重生;119,同人美文;129,古言架空;130,武侠仙侠;131,豪门总裁;132,婚恋情感;133,幻想异能;";
		String[] arr=tadutype.split(";");
		if(novelType==""){
			return 10;
		}
		String id=10+"";
		String[] nt=novelType.split("/");
		String[] nt3=null;
		if(nt.length!=0){
			String[] nt1=nt[0].split("@");
			if(nt1.length!=0){
				nt3=nt1[1].split(";");
			}
		}
		if(nt3!=null){
			for(int i=0;i<arr.length;i++){
				String[] tmp=arr[i].split(",");
				boolean con=true;
				for(int j=0;j<nt3.length;j++){
					if(nt3[j].equals(tmp[1])){
						id=tmp[0];
						con=false;
						break;
					}
				}
				if(!con){
					break;
				}
			}
		}
		
		return Integer.parseInt(id);
	}
}
