package com.anzhi.web.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.dom4j.Element;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anzhi.web.controller.XmlParent;
import com.anzhi.web.dao.IAnzhiChapterDao;
import com.anzhi.web.dao.IAnzhiNovelDao;
import com.anzhi.web.pojo.AnzhiChapter;
import com.anzhi.web.pojo.AnzhiFenJuan;
import com.anzhi.web.pojo.AnzhiNovel;
import com.anzhi.web.service.IAnzhiFenJuanService;
import com.anzhi.web.service.IXmlService;
import com.anzhi.web.util.QueryList;
@Service
public class XmlServiceImpl extends XmlParent implements IXmlService {
	@Autowired
	private IAnzhiNovelDao anzhinovelDao;
	@Autowired
	private IAnzhiFenJuanService anzhifenjuanService;
	@Autowired
	private IAnzhiChapterDao anzhichapterDao;
	
	public Element ersansiwu_novelList(HttpServletRequest request) {
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):5;
		int pageNum=this.getPageNum(request);
		String conditon="";
		QueryList<AnzhiNovel> ls=getNovelList(size,pageNum,conditon,3);
		List<AnzhiNovel> novelList=ls.getList();
		Element data=this.addElement("data", null);
		data.add(this.addElement("webName", "安之原创基地",false));
		data.add(this.addElement("webSite", "http://www.azycjd.com/",false));
		data.add(this.addElement("totalnum", ls.getTotal(),false));
		for(int i=0;i<novelList.size();i++){
			Element item=this.addElement("item", null);
			item.addAttribute("id", (i+1)+"");
			item.add(this.addElement("book_id", novelList.get(i).getId(),false));
			item.add(this.addElement("word", novelList.get(i).getTotalCharNum(),false));
			item.add(this.addElement("over", novelList.get(i).getState().equals(3)?1:0,false));
			item.add(this.addElement("title", novelList.get(i).getNovelTitle()));
			item.add(this.addElement("author", novelList.get(i).getAuthorWriterName()));
			item.add(this.addElement("vip", novelFree(novelList.get(i).getId()),false));
			item.add(this.addElement("type", novelList.get(i).getNovelType()));
			item.add(this.addElement("tag", novelList.get(i).getNovelLabel()));
			item.add(this.addElement("downlink", "",false));
			item.add(this.addElement("comment", novelList.get(i).getVote()));
			item.add(this.addElement("imageLink", "http://www.azycjd.com/"+novelList.get(i).getNovelImg(),false));
			item.add(this.addElement("viewLink", "http://www.azycjd.com/novel/"+novelList.get(i).getId()+".jsp",false));
			item.add(this.addElement("readLink", "http://www.azycjd.com/novel/"+novelList.get(i).getId()+"/index.jsp",false));
			item.add(this.addElement("m_readLink", "http://www.azycjd.com/mobile/mChapterMenu.do?novelId="+novelList.get(i).getId(),false));
			item.add(this.addElement("chapter", "http://www.azycjd.com/anzhisystem/ersansiwu_fenjuan.do?pid=1003&&apikey=7c5be9b193faf147a337eaa34469bd28&&book_id="+novelList.get(i).getId(),false));
			int lastId=this.getIntBySqlDb("select top 1 id from anzhi_chapter_report where novel_id="+novelList.get(i).getId()+" order by id desc");
			item.add(this.addElement("latest_chapter", this.getIntBySqlDb("select top 1 chapter_title from anzhi_chapter_report where novel_id="+novelList.get(i).getId()+" order by id desc")));
			item.add(this.addElement("latest_chapter_id",lastId ,false));
			item.add(this.addElement("latest_url", "http://www.azycjd.com/novel/"+lastId+".jsp",false));
			item.add(this.addElement("m_latest_url", "http://www.azycjd.com/mobile/mChapterMenu.do?novelId="+lastId,false));
			item.add(this.addElement("latest_date", getShiJianCuo(novelList.get(i).getUpdateTime()),false));
			data.add(item);
		}
		return data;
	}

	public int getPageNum(HttpServletRequest request){
		int pageNum=this.getInt(request, "pageNum");
		if(pageNum<1){
			pageNum=1;
		}
		return pageNum;
	}
	
	public int getInt(HttpServletRequest request,String param){
		if(request.getParameter(param)!=null&&!request.getParameter(param).equals("")){
			try {
				int n= Integer.parseInt(request.getParameter(param));
				if(n<0){
					return -1;
				}
				return n;
			} catch (NumberFormatException e) {
				return -1;
			}
		}
		return -1;
	}
	
	/**
	 * 查询小说
	 * @param request
	 * @param response
	 * @param myCondition 自定义条件
	 * @return
	 */
	public QueryList<AnzhiNovel> getNovelList(int size,int pageNum,String condition,int thirdType){
		QueryList<AnzhiNovel> list = anzhinovelDao.findAnzhiNovelThirdRecommand(size, pageNum, " and third_type="+thirdType);
		list=this.novelTypeChange(list);
		return list;
	}
	
	/**
	 * 查询单个小说
	 * @param request
	 * @param response
	 * @param myCondition 自定义条件
	 * @return
	 */
	public AnzhiNovel getNovelById(String condition){
		QueryList<AnzhiNovel> list = anzhinovelDao.findAnzhiNovelAll(1, 1, condition,"id");
		list=this.novelTypeChange(list);
		return list.getList().size()==0?null:list.getList().get(0);
	}
	
	/**
	 * 查询分卷
	 * @param request
	 * @param response
	 * @param myCondition 自定义条件
	 * @return
	 */
	public QueryList<AnzhiFenJuan> getFenJUan(HttpServletRequest request,int size,int pageNum,String condition){
		QueryList<AnzhiFenJuan> list = anzhifenjuanService.findAnzhiFenJuanAll(size, pageNum, condition,request);
		return list;
	}
	
	/**
	 * 查询具体章节内容
	 * @param request
	 * @param response
	 * @param myCondition 自定义条件
	 * @return
	 */
	public AnzhiChapter getChapterById(String condition){
		QueryList<AnzhiChapter> ls=anzhichapterDao.findAnzhiChapterAll(1, 1, condition);
		return ls.getList().size()==0?null:ls.getList().get(0);
	}
	
	/**
	 * 查询章节列表
	 * @param request
	 * @param response
	 * @param myCondition 自定义条件
	 * @return
	 */
	public QueryList<AnzhiChapter> getChapterList(String condition,int size,int pageNum){
		QueryList<AnzhiChapter> ls=anzhichapterDao.findAnzhiChapterAll(1, 1, condition);
		return ls;
	}

	public Element changdu_novelByBookId(HttpServletRequest request,String xmlfileName) {
		//获得一部小说
		AnzhiNovel novel=getNovelById(" and id="+this.getInt(request, "bookid"));
		Element bookinfo=this.addElement("data", null);
		if(novel!=null){
			bookinfo.add(this.addElement("bookid", novel.getId()));
			bookinfo.add(this.addElement("bookname", novel.getNovelTitle()));
			bookinfo.add(this.addElement("authorname", novel.getAuthorWriterName()));
			bookinfo.add(this.addElement("zzjs", novel.getVote()));
			bookinfo.add(this.addElement("cname", novelTypeChange(novel.getNovelType(),xmlfileName)));
			bookinfo.add(this.addElement("writestatus", novel.getState().equals(3)?1:0));
			bookinfo.add(this.addElement("keywords", novel.getNovelLabel()));
			bookinfo.add(this.addElement("bookpic","http://www.azycjd.com/"+novel.getNovelImg()));
			bookinfo.add(this.addElement("createtime", novel.getAddTime()));
			bookinfo.add(this.addElement("bksize", novel.getTotalCharNum()));
			bookinfo.add(this.addElement("weekvisit", this.getIntBySqlDb("select count(*) from anzhi_novel_multifunction where novel_id="+novel.getId()+" and action_type=0 and add_time between '"+this.getDateType(2)+"' and '"+this.getDateType(3)+"'")));
			bookinfo.add(this.addElement("monthvisit", this.getIntBySqlDb("select count(*) from anzhi_novel_multifunction where novel_id="+novel.getId()+" and action_type=0 and add_time between '"+this.getDateType(4)+"' and '"+this.getDateType(5)+"'")));
			bookinfo.add(this.addElement("allvisit", novel.getClickNum()));
			bookinfo.add(this.addElement("license", novelFree(novel.getId())));
		}
		return bookinfo;
	}
	
	/**
	 * 设置小说信息
	 * @param novel
	 * @param Product
	 */
	private void setProject(Element Product,HttpServletRequest request) {
		AnzhiNovel novel=getNovelById(" and id="+this.getInt(request, "ProductID"));
		Product.add(this.addElement("Title", novel.getNovelTitle()));
		Product.add(this.addElement("ProductFrom", "http://www.azycjd.com/novel/"+novel.getId()+".jsp",false));
		Product.add(this.addElement("InterfaceURI", "http://www.azycjd.com/anzhisystem/aiyuedu_novelByBookId.do?pid=1005&&apikey=4f687f0f1e49d73ede71cf873c294879&&ProductID="+novel.getId(),false));
		Element CoverImages=this.addElement("CoverImages", null);
		CoverImages.add(this.addElement("FrontCover", "http://www.azycjd.com/"+novel.getNovelImg(),false));
		Product.add(CoverImages);
		Product.add(this.addElement("ProductID", novel.getId()));
		Product.add(this.addElement("ProductWords", novel.getTotalCharNum()));
		Product.add(this.addElement("Summary", novel.getVote()));
		Product.add(this.addElement("Continued",novel.getState().equals(3)?"NO":"YES",false));
		Product.add(this.addElement("ProductPublicationDate", novel.getAddTime(),false));
		Product.add(this.addElement("ProductLastUpdated", novel.getUpdateTime(),false));
		Element ContentTags=this.addElement("ContentTags", null);
		if(novel.getNovelLabel()!=null){
			String[] arr=novel.getNovelLabel().split(",");
			for(int i=0;i<arr.length;i++){
				ContentTags.add(this.addElement("ContentTag", arr[i]));
			}
		}
		Product.add(ContentTags);
		
		Element Contributors=this.addElement("ContentTags", null);
		Element Author=this.addElement("Author", null);
		Author.add(this.addElement("name", novel.getAuthorWriterName()));
		Author.add(this.addElement("email", this.getStringBySqlDb("select member_email from anzhi_member where id="+novel.getAuthorId()),false));
		Author.add(this.addElement("AuthorID", novel.getAuthorId(),false));
		Contributors.add(Author);
		Product.add(Contributors);
	}
	
	/**
	 * 设置分卷
	 * @param request
	 * @param size
	 * @param pageNum
	 * @param condition
	 * @param Product
	 */
	private void setFenJuan(HttpServletRequest request, int size, int pageNum,
			String condition, Element Product,boolean con) {
		Element Volumes=this.addElement("Volumes", null);
		//获得分卷
		QueryList<AnzhiFenJuan> list = getFenJUan(request,size, pageNum, condition);
		for(int i=0;i<list.getList().size();i++){
			AnzhiFenJuan fen=list.getList().get(i);
			Element Volume=this.addElement("Volume", null);
			Volume.add(this.addElement("VolumeTitle", fen.getJuanName()));
			Volume.add(this.addElement("VolumeID", fen.getId()));
			Volume.add(this.addElement("VolumeSortOrder", (i+1)));
			Element Chapters=this.addElement("Chapters", null);
			List<AnzhiChapter> ls=new ArrayList<AnzhiChapter>();
			if(con){
				ls=fen.getLs();
			}else{
				ls=getChapterList(" and id="+this.getInt(request, "ChapterID"),size, pageNum).getList();
			}
			if(ls!=null){
				for(int j=0;j<ls.size();j++){
					AnzhiChapter ac=ls.get(j);
					Element Chapter=this.addElement("Chapter", null);
					Chapter.add(this.addElement("ChapterTitle", ac.getChapterTitle()));
					Chapter.add(this.addElement("ChapterID", ac.getId()));
					Chapter.add(this.addElement("ChapterSortOrder", (j+1)));
					Chapter.add(this.addElement("ChapterWords", ac.getChapterCharNum()));
					Chapter.add(this.addElement("ChapterPublicationDate", ac.getAddTime()));
					Chapter.add(this.addElement("ChapterLastUpdated", ac.getLastUpdateTime()));
					if(!con){
						Chapter.add(this.addElement("ChapterContent", ac.getChapterContent()));
					}
					Chapters.add(Chapter);
				}
			}
			Volume.add(Chapters);
			Volumes.add(Volume);
		}
		Product.add(Volumes);
	}

	public Element aiyuedu_novelByBookId(HttpServletRequest request) {
		Element Product=this.addElement("Product", null);
		setProject(Product,request);
		return Product;
	}

	public Element aiyuedu_fenjuan(HttpServletRequest request) {
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):pub_size;
		int pageNum=this.getPageNum(request);
		String condition=" and novel_id="+this.getInt(request, "ProductID");

		Element Product=this.addElement("Product", null);
		setProject(Product,request);
		setFenJuan(request, size, pageNum, condition, Product,true);
		return Product;
	}

	public Element aiyuedu_chapterById(HttpServletRequest request) {
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):pub_size;
		int pageNum=this.getPageNum(request);
		String condition=" and id="+this.getInt(request, "ChapterID");
		
		Element Product=this.addElement("Product", null);
		setProject(Product,request);
		setFenJuan(request, size, pageNum, " and id="+this.getIntBySqlDb("select fen_juan_id from anzhi_chapter where id="+this.getInt(request, "ChapterID")), Product,false);
		return Product;
	}
}
