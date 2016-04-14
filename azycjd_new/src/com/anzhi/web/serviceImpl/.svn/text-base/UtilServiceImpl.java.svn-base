package com.anzhi.web.serviceImpl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anzhi.web.dao.IAnzhiChapterDao;
import com.anzhi.web.dao.IAnzhiFenJuanDao;
import com.anzhi.web.dao.IAnzhiNovelDao;
import com.anzhi.web.dao.IAnzhiNovelMultifunctionDao;
import com.anzhi.web.dao.IUtilDao;
import com.anzhi.web.pojo.AnzhiChapter;
import com.anzhi.web.pojo.AnzhiComment;
import com.anzhi.web.pojo.AnzhiFenJuan;
import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.pojo.AnzhiNovel;
import com.anzhi.web.pojo.AnzhiNovelMultifunction;
import com.anzhi.web.service.IAnzhiNovelService;
import com.anzhi.web.service.IUtilService;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.FatherPojo;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.util.QueryList;
@Service
public class UtilServiceImpl<T> extends ActionDb implements IUtilService<T> {
	@Autowired
	private IUtilDao<T> utilDao;
	@Autowired
	private IAnzhiNovelDao anzhinovelDao;
	@Autowired
	private IAnzhiChapterDao anzhichapterDao;
	@Autowired
	private IAnzhiFenJuanDao anzhifenjuanDao;
	@Autowired
	private IAnzhiNovelService anzhinovelService;
	@Autowired
	private IAnzhiNovelMultifunctionDao anzhinovelmultifunctionDao;
	public List<T> getList(FatherPojo fatherPojo, String sql) {
		return utilDao.getList(fatherPojo, sql);
	}
	public boolean updateTableFields(String tableName, int id, String field,
			String value) {
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(utilDao.updateTableField(tableName, id, field, value));
		this.excuteUpdate(pojoList);
		return true;
	}
	public Object getObjectByField(String tableName, int id, String field) {
		return utilDao.getObjectByField(tableName, id, field);
	}
	public Object getObject(String sql) {
		return utilDao.getObject(sql);
	}
	/**
	 * 生成小说
	 * 
	 */
	public String createDataService(String path) {
		QueryList<AnzhiNovel> list=anzhinovelDao.findAnzhiNovelAll(5000, 1,null,"id");
		for(int i=0;i<list.getList().size();i++){
			//createNovel(path,list.getList().get(i).getId());
			anzhinovelService.createNovel(path, list.getList().get(i).getId());
			createNovelChapter(list.getList().get(i),path);
		}
		return "操作成功";
	}
	
	
	

	public String getNovelType(String oldChar){
		String types="";
		if(oldChar!=null&&!oldChar.equals("")){
			String[] arr=oldChar.split("/");
			for(String s:arr){
				if(!s.equals("")){
					String[] st=s.split("@");
					types+=st.length>0?st[0]+"/":"";
				}
			}
		}
		return types.equals("")?types:types.substring(0,types.length()-1);
	}
	
	/**
	 * 创建小说章节目录
	 * @param an
	 * @param path
	 * @return
	 */
	int chapterIndex=0;//记录章节顺序
	public String createNovelChapter(AnzhiNovel an,String path){
		
		//创建小说文件夹
		File novelFile=new File(path+"/novel/"+an.getId()+"/");
		if (!novelFile.exists()) { 
			try {
				novelFile.mkdirs();
			} catch (Exception e) {
				e.printStackTrace();
			} 
		} 
		
		//创建小说目录文件
		File novelChapter=new File(path+"/novel/"+an.getId()+"/index.jsp");
		if (!novelChapter.exists()) { 
			try {
				novelChapter.createNewFile();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
		}
		File model=new File(path+"//model//novel_chapter_model.jsp");
		FileInputStream fis;
		try {
			fis = new FileInputStream(model);
			byte[] b=new byte[fis.available()];
			fis.read(b);
			String modelString=new String(b,"utf-8");
			modelString=modelString.replaceAll("novel_pojo.id", an.getId()+"");
			modelString=modelString.replaceAll("novel_pojo.novelType", getNovelType(an.getNovelType()));
			modelString=modelString.replaceAll("novel_pojo.novelTitle", an.getNovelTitle());
			modelString=modelString.replaceAll("novel_pojo.gengxinshijian", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(an.getUpdateTime()));
			modelString=modelString.replaceAll("novel_pojo.zuozhe", an.getAuthorWriterName());
			chapterIndex=1;
			modelString=modelString.replaceAll("novel_pojo.zhangjieshu", this.getIntBySqlDb("select count(*) from anzhi_chapter_report where novel_id="+an.getId())+"");
			modelString=modelString.replaceAll("novel_pojo.content", getChapterData(path,an));
			if (!novelChapter.exists()) { 
				try {
					novelChapter.createNewFile();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} 
			} 
			FileOutputStream fo=new FileOutputStream(novelChapter,false);
			fo.write(modelString.getBytes("utf-8"));
			fo.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "";
	}
	
	/**
	 * 获得该小说的章节目录内容
	 * @param path
	 * @param an
	 * @return
	 */
	public String getChapterData(String path,AnzhiNovel an){
		//先查询该小说有多少分卷
		QueryList<AnzhiFenJuan> list= anzhifenjuanDao.findAnzhiFenJuanAll(500, 1, " and novel_id="+an.getId());
		String c="";
		for(int i=0;i<list.getList().size();i++){
			AnzhiFenJuan afj=list.getList().get(i);
			//查询立即发布的小说的
			QueryList<AnzhiChapter> lts=anzhichapterDao.findAnzhiChapterAll(5000, 1, " and state!=0 and fen_juan_id="+afj.getId());
			
			//需要付费的总字数
			int fenJuanTotalCharNum=this.getIntBySqlDb("select sum(chapter_char_num) from anzhi_chapter where read_type=1 and fen_juan_id="+afj.getId());
			//需要付费的总章节
			int fenJuanTotalChapterNum=this.getIntBySqlDb("select count(*) from anzhi_chapter where read_type=1 and fen_juan_id="+afj.getId());
			c+="<div class='fen_juan_items'>" +
					"<div class='fen_juan_name'>第"+(i+1)+"卷 "+afj.getJuanName()+"<span class='buyFenJuan'><a href='javascript:;' onclick=\"buyFenJuan('"+afj.getId()+"','"+lts.getTotal()+"','"+fenJuanTotalCharNum+"','"+fenJuanTotalChapterNum+"')\">整卷购买</a></span></div>";
					c+="<div class='chapter_div' id='chapter_div"+afj.getId()+"'>";
						c+=getChapterCotent(lts.getList(),path,an);
					c+="</div>";
			c+="</div>";
		}
		return c;
	}
	
	
	
	/**
	 * 根据查询章节集合，获得章节列表。同时创建章节阅读界面
	 * @return
	 */
	public String getChapterCotent(List<AnzhiChapter> list,String path,AnzhiNovel an){
		String content="";
		for(int i=list.size()-1;i>=0;i--){
			AnzhiChapter ac=list.get(i);
			String className="";
			if(ac.getReadType().equals(0)){
				className="free_chapter";
			}else{
				className="vip_chapter";
			}
			if(ac.getState().equals(2)){
				//content+="<div id='chapter"+ac.getId()+"' class='"+className+"' title=\"字数："+ac.getChapterCharNum()+";更新时间："+ac.getLastUpdateTime()+"\"><a href='javascript:;' id='"+ac.getChapterCharNum()+"@"+ac.getId()+"' target=\"_blank\">第"+(chapterIndex)+"章 "+ac.getChapterTitle()+"[<font style='color:red;'>未发布</font>]</a></div>";
			}else{
				content+="<div id='chapter"+ac.getId()+"' class='"+className+"' title=\"字数："+ac.getChapterCharNum()+";更新时间："+ac.getAddTime()+"\"><a href='javascript:;' id='"+ac.getChapterCharNum()+"@"+ac.getId()+"' onclick=\"readNovel('"+ac.getId()+"',this,'"+ac.getChapterCharNum()+"',"+chapterIndex+")\" target=\"_blank\">第"+(chapterIndex)+"章 "+ac.getChapterTitle()+"</a></div>";
			}
			/**
			 * 目前不需要，不管创建新章节  还是 修改新章节只需修改目录，以及创建本章节内容
			 */
			createNovelChapterReadJsp(path,an,ac);
			chapterIndex++;
		}
		return content;
	}
	
	/**
	 * 创建小说的章节阅读页面
	 * @param path
	 * @param an
	 * @param nextId
	 * @param upId
	 * @param ac
	 */
	public void createNovelChapterReadJsp(String path,AnzhiNovel an,AnzhiChapter ac){
		//创建章节阅读界面
		File model=new File(path+"//model//novel_read_model.jsp");
		FileInputStream fis;
		try {
			fis = new FileInputStream(model);
			byte[] b=new byte[fis.available()];
			fis.read(b);
			String modelString=new String(b,"utf-8");
			
			modelString=modelString.replaceAll("novel_pojo.id", an.getId()+"");
			modelString=modelString.replaceAll("novel_pojo.novelTitle", an.getNovelTitle());
			modelString=modelString.replaceAll("novel_chapter.chapterTitle", ac.getChapterTitle());
			modelString=modelString.replaceAll("novel_chapter.chapterName", an.getNovelTitle());
			modelString=modelString.replaceAll("novel_pojo.gengxinshijian", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(an.getUpdateTime()));
			modelString=modelString.replaceAll("novel_pojo.zuozhe", an.getAuthorWriterName());
			modelString=modelString.replaceAll("novel_chapter.id",ac.getId()+"");
			modelString=modelString.replaceAll("novel_chapter.nowNum",(chapterIndex)+"");
			modelString=modelString.replaceAll("novel_chapter.chapterContent",huanHang(ac.getChapterContent()));
			/*modelString=modelString.replaceAll("novel_chapter.chapter.menu",getChapterMenu(list,i,an.getId()));*/
			File novelChapter=new File(path+"/novel/"+an.getId()+"/"+ac.getId()+".jsp");
			if (!novelChapter.exists()) { 
				try {
					novelChapter.createNewFile();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} 
			} 
			FileOutputStream fo=new FileOutputStream(novelChapter,false);
			fo.write(modelString.getBytes("utf-8"));
			fo.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String huanHang(String content){
		if(content!=null){
			try {
				while(content.indexOf("\n")!=-1){
					content=content.replace("\n", "<p class='chapter_content_read_css'>");
				}
			} catch (Exception e) {
				
			}
		}
		return content;
	}
	
	/**
	 * 获得当前章节的前后5章目录
	 * @return
	 */
	public String getChapterMenu(List<AnzhiChapter> list,int i,int novelId){
		String menu="";
		int n=5;
		int t=-4;
		int beg=i+n;
		beg=list.size()>beg?beg:list.size();
		if(chapterIndex+t<1){
			t=(chapterIndex-1)*-1;
		}
		int end=i-n;
		end=end<0?0:end;
		
		for(int k=beg-1;k>=end;k--){
			AnzhiChapter ac=list.get(k);
			if(i==k){
				menu+="<div style=\"font-weight:bold;\" onclick=\"window.location.href='<%=request.getContextPath()%>/anzhichapter/read.do?chapterId="+ac.getId()+"'\">第"+(chapterIndex+t)+"章"+ac.getChapterTitle()+"</div>";
			}else{
				menu+="<div onclick=\"window.location.href='<%=request.getContextPath()%>/anzhichapter/read.do?chapterId="+ac.getId()+"'\">第"+(chapterIndex+t)+"章"+ac.getChapterTitle()+"</div>";
			}
			t++;
		}
		return menu;
	}
	public String delRecord(int tableId, int tabNameIndex, AnzhiMember am,
			int actionType,int stateValue,String vote) {
		String[] tabNameArr=new String[]{"anzhi_novel","anzhi_chapter","anzhi_author"};
		//先判断是否有数据了
		int n=this.getIntBySqlDb("select count(*) from anzhi_novel_multifunction where action_type="+actionType+" and novel_id="+tableId);
		if(n!=0){
			return "您已经提交该申请！";
		}
		//插入一条数据
		List<Pojo> pojoList=new ArrayList<Pojo>();
		AnzhiNovelMultifunction anm=new AnzhiNovelMultifunction();
		anm.setNovelId(tableId);//这里存储的是章节的id！
		anm.setMemberId(am.getId());//这里不跟memberId挂钩
		anm.setActionType(actionType);
		anm.setState(0);
		anm.setAddTime(getNowTime());
		anm.setVote(vote);
		pojoList.add(anzhinovelmultifunctionDao.addAnzhiNovelMultifunction(anm));
		this.excuteUpdate(pojoList);
		//修改原表的状态
		if(tabNameIndex==2){
			this.updateTableFieldVoid(tabNameArr[tabNameIndex], tableId, "author_state", stateValue);
		}else{
			this.updateTableFieldVoid(tabNameArr[tabNameIndex], tableId, "state", stateValue);
		}
		return "yes";
	}
	public boolean updateTableFields(String tableName, int id, String field,
			int value) {
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(this.updateTableField(tableName, id, field, value));
		this.excuteUpdate(pojoList);
		return true;
	}
	public void updateNovelTotalNum() {
		QueryList<AnzhiNovel> list=anzhinovelDao.findAnzhiNovelAll(5000, 1, null, "id");
		List<Pojo> pojoList=new ArrayList<Pojo>();
		for(int i=0;i<list.getList().size();i++){
			AnzhiNovel an=list.getList().get(i);
			int totalNum=this.getIntBySqlDb("select sum(chapter_char_num) from anzhi_chapter_report where novel_id="+an.getId());
			pojoList.add(this.updateTableField("anzhi_novel", an.getId(), "total_char_num", totalNum));
			int dingYueNum=this.getIntBySqlDb("select count(*) from anzhi_chapter_subscribe_report where novel_id="+an.getId());
			pojoList.add(this.updateTableField("anzhi_novel", an.getId(), "total_dingyue_num", dingYueNum));
			int soucangNum=this.getIntBySqlDb("select count(*) from anzhi_novel_multifunction where (action_type=1 or action_type=14 or action_type=15) and novel_id="+an.getId());
			pojoList.add(this.updateTableField("anzhi_novel", an.getId(), "total_save_num", soucangNum));
			int commentNum=this.getIntBySqlDb("select count(*) from anzhi_comment where table_id="+an.getId());
			pojoList.add(this.updateTableField("anzhi_novel", an.getId(), "total_comment_num", commentNum));
			
		}
		this.excuteUpdate(pojoList);
	}
	
	public void updateNovelImg() {
		QueryList<AnzhiNovel> list=anzhinovelDao.findAnzhiNovelAll(5000, 1, null, "id");
		List<Pojo> pojoList=new ArrayList<Pojo>();
		for(int i=0;i<list.getList().size();i++){
			AnzhiNovel an=list.getList().get(i);
			String img=an.getNovelImg();
			if(img!=null){
				if(img.indexOf("azycjd_new")!=-1&&img.indexOf("attached")!=-1){
					String[] arr=img.split("azycjd_new");
					if(arr.length==2){
						img=arr[1];
						this.updateTableFields("anzhi_novel", an.getId(), "novel_img", img);
					}
				}
			}
		}
		//this.excuteUpdate(pojoList);
	}
}
