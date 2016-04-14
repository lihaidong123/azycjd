package com.anzhi.web.serviceImpl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import com.anzhi.web.service.ImportDataServie;
import com.anzhi.web.util.ImportData;
import com.anzhi.web.util.OverrideTimestamp;
import com.anzhi.web.util.Pojo;
@Service
public class ImportDataServieImpl extends ImportData implements ImportDataServie{

	public void importDataAll() {
		List<Object[]> userList=this.getDataUser("select * from T_UserMember order by id desc");
		List<Object[]> bookList=this.getData("select * from T_Books order by id desc");
		List<Object[]> bookNovelList=this.getData("select * from T_BookNovel where 1=2 order by id desc");
		List<Object[]> commentlList=this.getData("select * from T_Comment order by id desc");
		List<Object[]> buyNovellList=this.getData("select * from T_BuyNovelDetails order by id desc");
		List<Object[]> favoriteList=this.getData("select * from T_Favorite order by id desc");
		int authorNum=0;
		int chapterNum=0;
		System.out.println("数据填充完成！");
		List<Pojo> list=new ArrayList<Pojo>();
		for(int i=0;i<userList.size();i++){
			Object[] obj=userList.get(i);
			//添加用户
			System.out.println(i);
			int usrId=excuteUpdate("insert into anzhi_member values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",new Object[]{
				obj[2]==null?"":obj[2].toString(),
				obj[3]==null?"":obj[3].toString(),
				obj[6]==null?"":obj[6].toString(),
				obj[51]==null?"":obj[51].toString(),
				obj[40]==null?"":obj[40].toString(),
				obj[38]==null?"":obj[38].toString(),
				obj[46]==null?"":obj[46].toString(),
				timeStampFn(obj[14]),
				timeStampFn(obj[39]),
				obj[7]==null?"":obj[7].toString(),
				obj[48]==null?"":obj[48].toString(),
				1,
				1,
				obj[36]==null?"":obj[36].toString(),
				obj[37]==null?"":obj[37].toString(),
				obj[42]==null?"":obj[42].toString(),
				0,
				obj[4]==null?0:obj[4].toString().equals("1")?0:1,
				doubleValue(obj[20]),
				0,
				0,
				0,
				0
			});
			
			changeId(usrId,obj[0],favoriteList,2,"T_Favorite","AuthorID");//收藏作者
			changeId(usrId,obj[0],favoriteList,5,"T_Favorite","UID");//收藏者
			changeId(usrId,obj[0],commentlList,7,"T_Comment","uid");
			changeId(usrId,obj[0],buyNovellList,5,"T_BuyNovelDetails","uid");//购买
			
			//添加作者信息
			if(obj[4]!=null&&obj[4].toString().equals("2")){//说明是作者,添加作者信息
				Pojo p=new Pojo();
				p.setSql("insert into anzhi_author values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
				p.setObj(new Object[]{
						usrId,
						obj[35]==null?"":obj[35].toString(),
						obj[42]==null?"":obj[42].toString(),
						obj[40]==null?"":obj[40].toString(),
						obj[51]==null?"":obj[51].toString(),
						obj[36]==null?"":obj[36].toString(),
						obj[46]==null?"":obj[46].toString(),
						obj[45]==null?"":obj[45].toString(),
						obj[7]==null?"":obj[7].toString(),
						"",
						"身份证",
						obj[37]==null?"":obj[37].toString(),
						obj[48]==null?"":obj[48].toString(),	
						1,
						timeStampFn(obj[14]),
						obj[56]==null?"":obj[56].toString()
				});
				list.add(p);
				authorNum++;
			}

			//查找该用户写的小说
			List<Object[]> userBookList=getUserBookList(obj[0].toString(),bookList);
			for(int k=0;k<userBookList.size();k++){
				Object[] novelObj=userBookList.get(k);
				int postWay=0;
				try {
					postWay=(novelObj[32]==null?0:(Integer.parseInt(novelObj[32].toString())==2?0:1));
				} catch (NumberFormatException e) {
				}
				//获得小说id
				int novelId=this.excuteUpdate("insert into anzhi_novel values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", new Object[]{
					novelObj[2]==null?"":novelObj[2].toString(),
					novelObj[11]==null?"":novelObj[11].toString(),
					usrId,
					novelObj[26]==null?2:(novelObj[26].toString().equals("3")?3:2),
					timeStampFn(novelObj[20]),
					timeStampFn(novelObj[21]),
					"",/*小说类型*/
					novelObj[10]==null?"":novelObj[10].toString(),
					novelObj[13]==null?"":novelObj[13].toString(),
					getNovelLabel((novelObj[17]==null?"":novelObj[17].toString())+(novelObj[18]==null?"":novelObj[18].toString())+(novelObj[19]==null?"":novelObj[19].toString())),
					0,/*授权级别*/
					getNovelLabel((novelObj[17]==null?"":novelObj[17].toString())+(novelObj[18]==null?"":novelObj[18].toString())+(novelObj[19]==null?"":novelObj[19].toString())),
					"",
					"",
					0,/*是否上架*/
					intValue(novelObj[22]),/*点击数*/
					"",/*我的编辑*/
					postWay,/*发表方式*/
					"",/*英文名称*/
					intValue(novelObj[22]),/*阅读数*/
					intValue(novelObj[27]),/*是否签约*/
					0,/*撞金币大赛*/
					0,/*网文大赛*/
					0,/*总推荐票*/
					0,/*总字数*/
					intValue(novelObj[23]),/*总收藏数*/
					0,/*总订阅数*/
					0,/*总打赏数*/
					0,/*总评论数*/
				});
				
				//修改收藏记录
				changeId(novelId,novelObj[0],favoriteList,1,"T_Favorite","BookID");//收藏小说
				changeId(novelId,novelObj[0],commentlList,3,"T_Comment","bookid");
				
				//获得小说的分卷id
				int fenjuanId=this.excuteUpdate("insert into anzhi_fen_juan values(?,?,?,?)", new Object[]{
					novelId,
					"正文内容",
					"正文内容",
					new Timestamp(new Date().getTime())
				});
				
				//获得该小说的所有章节
				List<Object[]> chapterList=this.getBookNovelList(novelObj[0].toString(), bookNovelList);
				for(int j=0;j<chapterList.size();j++){
					Object[] chapterObj=chapterList.get(j);
					int chapterId=this.excuteUpdate("insert into anzhi_chapter values(?,?,?,?,?,?,?,?,?,?)", new Object[]{
						fenjuanId,
						chapterObj[5]==null?"":chapterObj[5].toString(),
						chapterObj[7]==null?"":chapterObj[7].toString(),
						"",
						1,
						timeStampFn(chapterObj[15]),
						new Timestamp(new Date().getTime()),
						intValue(chapterObj[14]),
						getVip(chapterObj[23]),
						""
					});
					changeId(chapterId,chapterObj[0],buyNovellList,2,"T_BuyNovelDetails","NovelID");
					changeId(chapterId,chapterObj[0],favoriteList,3,"T_Favorite","NovelID");//收藏章节
				}
			}
		}
		
		//导入书评
		for(int i=0;i<commentlList.size();i++){
			Object[] commentObj=commentlList.get(i);
			System.out.println("总："+commentlList.size()+",书评记录："+i);
			if((commentObj[5]==null?0:Integer.parseInt(commentObj[5].toString()))==-1){
				int commentId=this.excuteUpdate("insert into anzhi_comment values(?,?,?,?,?,?,?,?,?,?,?)", new Object[]{
					intValue(commentObj[7]),
					intValue(commentObj[3]),
					commentObj[9]==null?"":commentObj[9].toString(),
					commentObj[10]==null?"":commentObj[10].toString(),
					0,
					0,//fatherId
					0,
					timeStampFn(commentObj[6]),
					intValue(commentObj[11]),
					0,
					commentObj[4]==null?"":commentObj[4].toString()//vote--ip
				});
				List<Object[]> replyList=getCommentReply(commentObj[0],commentlList);
				for(int k=0;k<replyList.size();k++){
					Object[] replyObj=replyList.get(k);
					Pojo p=new Pojo();
					p.setSql("insert into anzhi_comment values(?,?,?,?,?,?,?,?,?,?,?)");
					p.setObj(new Object[]{
						intValue(replyObj[7]),
						intValue(replyObj[3]),
						replyObj[9]==null?"":replyObj[9].toString(),
						replyObj[10]==null?"":replyObj[10].toString(),
						0,
						commentId,//fatherId
						0,
						timeStampFn(replyObj[6]),
						intValue(replyObj[11]),
						0,
						replyObj[4]==null?"":replyObj[4].toString()//vote--ip
					});
					list.add(p);
					chapterNum++;
				}
			}
		}
		
		//导入章节购买记录
		for(int i=0;i<buyNovellList.size();i++){
			Object[] buyNovelObj=buyNovellList.get(i);
			System.out.println("总："+buyNovellList.size()+",章节购买记录："+i);
			Pojo p=new Pojo();
			p.setSql("insert into anzhi_chapter_subscribe values(?,?,?,?,?)");
			p.setObj(new Object[]{
				intValue(buyNovelObj[2]),
				intValue(buyNovelObj[5]),
				timeStampFn(buyNovelObj[6]),
				0,
				"原网站数据导入"
			});
			list.add(p);
			chapterNum++;
		}
		
		//导入收藏记录
		for(int i=0;i<favoriteList.size();i++){
			Object[] favoriteObj=favoriteList.get(i);
			System.out.println("总："+favoriteList.size()+",收藏记录："+i);
			Pojo p=new Pojo();
			p.setSql("insert into anzhi_novel_multifunction values(?,?,?,?,?,?)");
			int tid=0;
			int actionType=0;
			if(favoriteObj[4]!=null){
				if(favoriteObj[4].toString().trim().equals("1")){//书籍
					tid=intValue(favoriteObj[1]);
					actionType=1;
				}else if(favoriteObj[4].toString().trim().equals("2")){//章节
					tid=intValue(favoriteObj[3]);
					actionType=15;
				}else if(favoriteObj[4].toString().trim().equals("3")){//作者
					tid=intValue(favoriteObj[2]);
					actionType=14;
				}else{
					continue;
				}
			}else{
				continue;
			}
			p.setObj(new Object[]{
				tid,
				intValue(favoriteObj[5]),
				actionType,
				0,
				timeStampFn(favoriteObj[6]),
				"原网站数据导入"
			});
			list.add(p);
			chapterNum++;
		}
		
		System.out.println("作家记录："+authorNum);
		System.out.println("章节记录："+chapterNum);
		System.out.println("总共执行条"+list.size()+"记录");
		this.excuteUpdate(list);
	}
	
	public int intValue(Object obj){
		if(obj!=null){
			
			try {
				if((Boolean)obj==true){
					return 1;
				}
				if((Boolean)obj==false){
					return 0;
				}
			} catch (Exception e1) {
				
			}
			
			try {
				return Integer.parseInt(obj.toString());
			} catch (Exception e) {
				return 0;
			}
		}
		return 0;
	}
	
	public Timestamp timeStampFn(Object obj){
		if(obj!=null){
			try {
				return new OverrideTimestamp(0).getOverrideDate((Timestamp)obj);
			} catch (Exception e) {
				return new Timestamp(new Date().getTime());
			}
		}
		return new Timestamp(new Date().getTime());
	}
	
	public double doubleValue(Object obj){
		if(obj!=null){
			try {
				return Double.parseDouble(obj.toString());
			} catch (NumberFormatException e) {
				return 0;
			}
		}
		return 0;
	}
	
	public void changeId(int newId,Object oldId,List<Object[]> list,int index,String tabName,String fieldName){
		int replaceNum=0;
		for(int i=0;i<list.size();i++){
			Object[] obj=list.get(i);
			if(tabName.equals("T_Comment")&&oldId.equals("0AE5F9F7-B8B9-4283-B870-2FE54366E4BA")&&obj[0].toString().equals("28771")){
				System.out.println(obj[index].toString().trim()+"\t\t"+(oldId.toString().trim()));
			}
			if(obj[index]!=null&&oldId!=null){
				if(obj[index].toString().trim().equalsIgnoreCase(oldId.toString().trim())){
					obj[index]=newId;
					replaceNum++;
				}
			}
		}
		
	}
	
	//获得该评论下的回复
	public List<Object[]> getCommentReply(Object ids,List<Object[]> commentlList){
		List<Object[]> list=new ArrayList<Object[]>();
		for(int i=0;i<commentlList.size();i++){
			Object[] commentObj=commentlList.get(i);
			if((commentObj[5]==null?0:Integer.parseInt(commentObj[5].toString()))!=-1&&ids!=null){
				if(ids.toString().trim().equals(commentObj[5].toString().trim())){
					list.add(commentObj);
					commentlList.remove(commentObj);
					i--;
				}
			}
		}
		return list;
	}

	
	public int getVip(Object obj){
		try {
			if((Boolean)obj==true){
				return 1;
			}
			if((Boolean)obj==false){
				return 0;
			}
		} catch (Exception e1) {
			
		}
		if(obj==null){
			return 0;
		}
		try {
			return Integer.parseInt(obj.toString());
		} catch (Exception e) {
			return 0;
		}
	}
	
	public String getNovelLabel(String f){
		while(f.indexOf("请以全角逗号分割")!=-1){
			f=f.replace("请以全角逗号分割", "");
		}
		return f;
	}
	
	//根据用户id获得该作者的写的小说
	public List<Object[]> getUserBookList(String uid,List<Object[]> bookList){
		List<Object[]> tmp=new ArrayList<Object[]>();
		for(int i=0;i<bookList.size();i++){
			Object[] obj=bookList.get(i);	
			try {
				if(uid.trim().equalsIgnoreCase(obj[1].toString().trim())){
					tmp.add(obj);
					bookList.remove(obj);
					i--;
				}
			} catch (Exception e) {
				
			}
		}
		return tmp;
	}
	
	//根据小说id获得该小说下的章节
	public List<Object[]> getBookNovelList(String bookId,List<Object[]> bookNovelList){
		/*List<Object[]> tmp=new ArrayList<Object[]>();
		for(int i=0;i<bookNovelList.size();i++){
			Object[] obj=bookNovelList.get(i);	
			try {
				if(bookId.equalsIgnoreCase(obj[2].toString())){
					tmp.add(obj);
					bookNovelList.remove(obj);
					i--;
				}
			} catch (Exception e) {
				
			}
		}*/
		List<Object[]> tmp=this.getData("select * from T_BookNovel where BookId="+bookId+" order by Sort asc");
		return tmp;
	}
}
