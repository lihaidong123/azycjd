package com.anzhi.web.serviceImpl;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anzhi.web.dao.IAnzhiNewsDao;
import com.anzhi.web.pojo.AnzhiNews;
import com.anzhi.web.service.IAnzhiNewsService;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.util.QueryList;
@Service
public class AnzhiNewsServiceImpl extends ActionDb  implements IAnzhiNewsService {
	@Autowired
	private IAnzhiNewsDao anzhinewsDao;
	public boolean addAnzhiNews(AnzhiNews anzhinews){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhinewsDao.addAnzhiNews(anzhinews));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean addBatchAnzhiNews(List<AnzhiNews> list){
		return anzhinewsDao.addBatchAnzhiNews(list);
	}

	public boolean delAnzhiNews(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhinewsDao.delAnzhiNews(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiNews(String ids){
		return anzhinewsDao.delBatchAnzhiNews(ids);
	}

	public boolean updateAnzhiNews(AnzhiNews anzhinews){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhinewsDao.updateAnzhiNews(anzhinews));
		this.excuteUpdate(pojoList);
		return true;
	}

	public QueryList<AnzhiNews> findAnzhiNewsAll(int size,int pageNum,String condition){
		return anzhinewsDao.findAnzhiNewsAll(size,pageNum,condition);
	}

	public void addCreateNewsHtml(String path) {
		QueryList<AnzhiNews> list = anzhinewsDao.findAnzhiNewsAll(5000, 1, " and (news_type=0 or news_type=3) and state=0");
		String content="<%@ page language=\"java\" import=\"java.util.*\" pageEncoding=\"UTF-8\"%>\r\n<table width=\"100%\" border=\"0\">\r\n";
		try {
			for(int i=0;i<list.getList().size();i++){
				File model=new File(path+"//model//news_model.jsp");
				FileInputStream fis=new FileInputStream(model);
				AnzhiNews an=list.getList().get(i);
				byte[] b=new byte[fis.available()];
				fis.read(b);
				String modelString=new String(b,"utf-8");
				modelString=modelString.replaceAll("anzhi_news_html.title", an.getNewsTitle());
				modelString=modelString.replaceAll("anzhi_news_html.time", an.getAddTime()+"");
				modelString=modelString.replaceAll("anzhi_news_html.content", java.util.regex.Matcher.quoteReplacement(an.getNewsContent()));
				File html=new File(path+"//news_html//anzhi_news_"+(an.getId())+".jsp");
				if(i<4){
					content+="\t<tr>\r\n";
					content+="\t\t<td width=\"78%\" class=\"news_title_css\" id=\"news_html/anzhi_news_"+(an.getId())+".jsp\">"+an.getNewsTitle()+"</td>\r\n";
					content+="\t\t<td width=\"22%\" align=\"right\">"+an.getAddTime()+"</td>\r\n";
					content+="\t<tr>\r\n";
				}
				//创建java文件
				if (!html.exists()) { 
					try {
						html.createNewFile();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} 
				} 
				FileOutputStream fo=new FileOutputStream(html,false);
				fo.write(modelString.getBytes("utf-8"));
			}
			content+="</table>";
			FileOutputStream fo=new FileOutputStream(new File(path+"//news_html//news.jsp"),false);
			fo.write(content.getBytes("utf-8"));
			fo.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//List<Pojo> pojoList=new ArrayList<Pojo>();
		//pojoList.add(anzhinewsDao.updateAnzhiNews());
		//this.excuteUpdate(pojoList);
	}


}