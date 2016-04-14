package com.tadu.util;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.FileNotFoundException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import net.sf.json.JSONObject;

import com.anzhi.web.pojo.AnzhiChapter;


public class AddChapter extends TaDuUtil{
	String baseUrl = "http://topenapi.tadu.com:8098/api/addChapter";
	public AddChapter(String bookId,List<AnzhiChapter> chapterList,int novelId) {
		for(int i=0;i<chapterList.size();i++){
			AnzhiChapter ac=chapterList.get(i);
			String result = null;
			try {
				try {
					//先删除
					delChapterId(ac.getId(),novelId);
				} catch (Exception e) {
					
				}
				result = sendPost(ac,(chapterList.size()-i),bookId);
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			}
			if (result == null || result.equals("")) {
				System.out.println("抱歉，没有在服务器获取结果,请检查参数是否有误。");
			} else {
				//{"code":0,"message":"success!"}
				JSONObject obj=JSONObject.fromObject(result);
				if(obj.get("code")!=null){
					if(obj.get("code").toString().equals("0")){
						JSONObject ts=JSONObject.fromObject(obj.get("result"));
						System.out.println("结果："+(chapterList.size()-i)+"\t" + ac.getChapterTitle()+"---推送成功");
					}
				}
				
			}
		}
	}

	// 向服务器要发送的POST请求
	protected String sendPost(AnzhiChapter ac,int i,String bookId) throws FileNotFoundException {
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
			String secret =key;
			//copyrightid + password
			String securityid = copyrightid+secret;
			String digest = new SHA1().getDigestOfString(securityid.getBytes());
			//密钥
			buffer.append("key="+digest);
			// ##CP书籍ID
			buffer.append("&bookid="+bookId);
			// ##CP版权ID
			buffer.append("&copyrightid="+copyrightid);
			// ##章节名称
			buffer.append("&title="+URLEncoder.encode(ac.getChapterTitle(), "UTF-8"));
			// ##章节内容
			buffer.append("&content="+URLEncoder.encode(ac.getChapterContent(), "UTF-8"));
			// ##章节序号
			buffer.append("&chapternum="+i);
			// ##是否收费 1收费0免费
			buffer.append("&isvip="+ac.getReadType());
			// ##CP章节ID
			buffer.append("&chapterid="+ac.getId());
			// ##更新状态 1为新增 2为修改
			buffer.append("&updatemode=1");

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
	protected String delChapterId(int chapterId,int novelId) throws FileNotFoundException{
		URL url = null;
		HttpURLConnection conn = null;
		String str = "";
		try {
			url = new URL("http://topenapi.tadu.com:8098/api/deletePart");
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
			buffer.append("&cpid="+novelId);
			//CP版权ID
			buffer.append("&copyrightid="+copyrightid);
			buffer.append("&chapterid="+chapterId);
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
}
