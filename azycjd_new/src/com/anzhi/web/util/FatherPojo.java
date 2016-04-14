package com.anzhi.web.util;

import java.io.File;

public class FatherPojo{
	public String tomcatPath="D:\\apache-tomcat-7.0.67\\webapps\\ROOT\\";
	public String projectName="";
	//public String tomcatPath="D:\\2016-1-14\\.metadata\\.me_tcat\\webapps\\";
	public FatherPojo setValues(Object[] obj){
		return null;
	}

	public String repString(String content){
		if(content==null){
			return "";
		}
		for(int i=1;i<=36;i++){
			String old="\\[azycjd_"+i+"\\]";
			String news="<img src='./images/biaoqing/"+i+".gif' />";
			content=content.replaceAll(old, news);
		}
		return content;
	}
	
	public String setMemberHeadImgFather(String memberHeadImg){
		//http://qzapp.qlogo.cn/qzapp/101296266/49214151780AF9B6D2154D1624B4BC4E/100
		if(memberHeadImg!=null&&!memberHeadImg.equals("")){
			if(memberHeadImg.indexOf("UploadImages")!=-1){
				memberHeadImg=projectName+""+memberHeadImg;
			}else if(memberHeadImg.indexOf("http")!=-1){
				return memberHeadImg;
			}else{
				String path=tomcatPath+memberHeadImg;
				File f=new File(path);
				if(!f.exists()){ 
					memberHeadImg=projectName+"/images/defaultHead.png";
				}
			}
		}else{
			memberHeadImg=projectName+"/images/defaultHead.png";
		}
		return memberHeadImg;
	}
}