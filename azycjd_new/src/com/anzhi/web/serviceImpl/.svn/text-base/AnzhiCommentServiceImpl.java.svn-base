package com.anzhi.web.serviceImpl;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anzhi.web.dao.IAnzhiCommentDao;
import com.anzhi.web.dao.IAnzhiExperienceRecordDao;
import com.anzhi.web.dao.IAnzhiHandleDao;
import com.anzhi.web.dao.IAnzhiNovelDao;
import com.anzhi.web.pojo.AnzhiComment;
import com.anzhi.web.pojo.AnzhiExperienceRecord;
import com.anzhi.web.pojo.AnzhiHandle;
import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.pojo.AnzhiNovel;
import com.anzhi.web.service.IAnzhiCommentService;
import com.anzhi.web.service.IAnzhiNovelService;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.util.QueryList;
@Service
public class AnzhiCommentServiceImpl extends ActionDb  implements IAnzhiCommentService {
	@Autowired
	private IAnzhiCommentDao anzhicommentDao;
	@Autowired
	private IAnzhiNovelDao anzhinovelDao;
	@Autowired
	private IAnzhiExperienceRecordDao anzhiexperiencerecordDao;
	@Autowired
	private IAnzhiNovelService anzhinovelService;
	@Autowired
	private IAnzhiHandleDao anzhihandleDao;
	public boolean addAnzhiComment(AnzhiComment anzhicomment){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhicommentDao.addAnzhiComment(anzhicomment));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean addBatchAnzhiComment(List<AnzhiComment> list){
		return anzhicommentDao.addBatchAnzhiComment(list);
	}

	public boolean delAnzhiComment(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhicommentDao.delAnzhiComment(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiComment(String ids){
		return anzhicommentDao.delBatchAnzhiComment(ids);
	}

	public boolean updateAnzhiComment(AnzhiComment anzhicomment){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhicommentDao.updateAnzhiComment(anzhicomment));
		this.excuteUpdate(pojoList);
		return true;
	}

	public QueryList<AnzhiComment> findAnzhiCommentAll(int size,int pageNum,String condition){
		return anzhicommentDao.findAnzhiCommentAll(size,pageNum,condition);
	}

	public QueryList<AnzhiComment> findAnzhiCommentAll(int size, int pageNum,String condition, String orderField) {
		return anzhicommentDao.findAnzhiCommentAll(size, pageNum, condition, orderField);
	}

	public void findAnzhiCommentAllIndex(HttpServletRequest request) {
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		if(this.checkParam(request, "novelId")){
			//先查询小说
			QueryList<AnzhiNovel> ls=anzhinovelDao.findAnzhiNovelAll(1, 1, " and id="+this.getInt(request, "novelId"), "id");
			if(ls.getList().size()!=0){
				request.setAttribute("pojo", ls.getList().get(0));
				
				QueryList<AnzhiComment> list = anzhicommentDao.findAnzhiCommentAll(size, pageNum, " and state!=2 and comment_type=0 and comment_fatherid=0 and table_id="+this.getInt(request, "novelId"));
				for(AnzhiComment p:list.getList()){
					//查询该评论下的前5条回复
					QueryList<AnzhiComment> replyList=anzhicommentDao.findAnzhiCommentAll(5, 1, " and state!=2 and comment_fatherid="+p.getId());
					p.setReplyNum(replyList.getTotal());
					p.setReplyList(replyList);
					p.setDianZanNum(this.getIntBySqlDb("select count(*) from anzhi_comment_praise where comment_id="+p.getId()+" and novel_id="+this.getInt(request, "novelId")));
				}
				request.setAttribute("anzhicommentList", list);
			}
		}
	}

	public QueryList<AnzhiComment> findAnzhiCommentAll(int size, int pageNum,String condition, int loginid) {
		QueryList<AnzhiComment> list=anzhicommentDao.findAnzhiCommentAll(size, pageNum, " and comment_fatherid=0 and member_id="+loginid);
		this.getCommnetName(list.getList());
		return list;
	}
	/**
	 * 查询评论的名称
	 * 
	 */
	public void getCommnetName(List<AnzhiComment> list){
		for(AnzhiComment ac:list){
			if(ac.getCommentType().equals(0)){//查询小说名称
				ac.setCommentName(this.getStringBySqlDb("select novel_title from anzhi_novel where id="+ac.getTableId()));
				ac.setCommentNum(this.getIntBySqlDb("select count(*) from anzhi_comment where comment_type=0 and table_id="+ac.getTableId()+" and comment_fatherid="+ac.getId()));
			}else if(ac.getCommentType().equals(1)){//查询章节
				ac.setCommentName(this.getStringBySqlDb("select chapter_title from anzhi_chapter where id="+ac.getTableId()));
				ac.setCommentNum(this.getIntBySqlDb("select count(*) from anzhi_comment where comment_type=1 and table_id="+ac.getTableId()+" and comment_fatherid="+ac.getId() ));
			}else if(ac.getCommentType().equals(2)){
				ac.setCommentName("系统悬赏评论");
			}
		}
	}

	public QueryList<AnzhiComment> findAnzhiCommentreplyAll(int size,int pageNum, String condition, int loginid) {
		QueryList<AnzhiComment> list=anzhicommentDao.findAnzhiCommentAll(size, pageNum, " and comment_fatherid <> 0 and member_id="+loginid);
		this.getCommnetName(list.getList());
		this.getCommnetreplyName(list.getList());
		return list;
	}
	
	/**
	 * 查询父级评论的名称和发布人
	 * 
	 */
	public void getCommnetreplyName(List<AnzhiComment> list){
		for(AnzhiComment ac:list){
			ac.setCommentfathertitle(this.getStringBySqlDb(" select comment_title from anzhi_comment where id="+ac.getCommentFatherid()));
			ac.setCommentfathername(this.getStringBySqlDb(" select member_nick from anzhi_comment_view where id="+ac.getCommentFatherid()));
		}
	}

	/**
	 * 发表书评
	 * 每天第一条书评增加5个经验值
	 */
	public boolean addAnzhiComment(HttpServletRequest request,
			AnzhiComment anzhicomment, AnzhiMember am) {
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhicommentDao.addAnzhiComment(anzhicomment));
		
		//修改小说的评论数
		this.updateTableFieldAppend("anzhi_novel", anzhicomment.getTableId(), "total_comment_num", 1);
		
		//查找当前用户今天有没有完成评论任务
		int n=this.getIntBySqlDb("select count(*) from anzhi_experience_record where member_id="+am.getId()+" and experience_type=6 and add_time between '"+this.getDateType(0)+"' and '"+this.getDateType(1)+"'");
		if(n==0){
			//如果没有记录，则添加。同时增加用户的经验
			AnzhiExperienceRecord anzhiexperiencerecord=new AnzhiExperienceRecord();
			anzhiexperiencerecord.setAddTime(this.getNowTime());
			anzhiexperiencerecord.setExperienceNum(5);
			anzhiexperiencerecord.setExperienceType(6);
			anzhiexperiencerecord.setMemberId(am.getId());
			anzhiexperiencerecord.setState(0);
			anzhiexperiencerecord.setVote("当日完成第一条评论，增加5个经验");
			pojoList.add(anzhiexperiencerecordDao.addAnzhiExperienceRecord(anzhiexperiencerecord));
			
			//修改该用户的经验  先查找 后修改
			
			this.updateTableFieldAppend("anzhi_member", am.getId(), "member_experience", 5);	
			int jingyan=this.getIntBySqlDb("select member_experience from anzhi_member where id="+am.getId());
			am.setMemberExperience(jingyan);
			request.getSession().setAttribute("loginUsers", am);
		}
		this.excuteUpdate(pojoList);
		
		
		//查询小说的基本数据，重新生成小说html界面
		anzhinovelService.createNovel(request.getRealPath("//"), anzhicomment.getTableId());
		return true;
	}
	
	//评论回复跳转
	public void commentAction(HttpServletRequest request) {
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		if(this.checkParam(request, "commentId")&&this.checkParam(request, "novelId")){
			//先查询小说
			QueryList<AnzhiNovel> ls=anzhinovelDao.findAnzhiNovelAll(1, 1, " and id="+this.getInt(request, "novelId"), "id");
			if(ls.getList().size()!=0){
				request.setAttribute("pojo", ls.getList().get(0));
				
				//查询评论基本信息
				QueryList<AnzhiComment> commlist = anzhicommentDao.findAnzhiCommentAll(1, 1, " and id="+this.getInt(request, "commentId"));
				if(commlist.getList().size()!=0){
					request.setAttribute("commentPojo", commlist.getList().get(0));
					
					QueryList<AnzhiComment> list = anzhicommentDao.findAnzhiCommentAll(size, pageNum, " and comment_type=0 and comment_fatherid="+this.getInt(request, "commentId"));
					request.setAttribute("anzhicommentList", list);
				}
			}
		}
	}

	public void delAnzhiCommentAdmin(int id, int tableId, String path,int types) {
		if(types==0){
			int state=this.getIntBySqlDb("select state from anzhi_comment where id="+id);
			//删除
			this.updateTableFieldVoid("anzhi_comment", id, "state", 2);
			//备份评论
			List<Pojo> pojoList=new ArrayList<Pojo>();
			AnzhiHandle h=new AnzhiHandle();
			h.setAddMemberId(0);
			h.setTableId(id);//保存评论id
			h.setHandleResult(state);//保存当前评论的state
			h.setHandleType(12);
			h.setHandleVote("评论删除备份");
			h.setState(0);
			h.setAddTime(getNowTime());
			pojoList.add(anzhihandleDao.addAnzhiHandle(h));
			this.excuteUpdate(pojoList);
			
		}else if(types==1){
			//恢复
			int state=this.getIntBySqlDb("select handle_result from anzhi_handle where table_id="+id+" and handle_type=12");
			this.updateTableFieldVoid("anzhi_comment", id, "state", state);
		}
		anzhinovelService.createNovel(path, tableId);//重新生成小说
	}

	
	public void pinglunguanli(HttpServletRequest request,String condition) {
		int size=request.getParameter("size")!=null&&request.getParameter("size")!=""?Integer.parseInt(request.getParameter("size")):10;
		int pageNum=this.getPageNum(request);
		
		condition+=" and state!=2 and comment_fatherid=0 ";
		if(this.checkParam(request, "begTime")&&this.checkParam(request, "endTime")){
			condition+=" and add_time between '"+request.getParameter("begTime")+"' and '"+request.getParameter("endTime")+"'";
		}
		QueryList<AnzhiComment> list = anzhicommentDao.findAnzhiCommentAll(size, pageNum, condition);
		for(AnzhiComment p:list.getList()){
			//查询该评论下的前5条回复
			QueryList<AnzhiComment> replyList=anzhicommentDao.findAnzhiCommentAll(5, 1, " and state!=2 and comment_fatherid="+p.getId());
			p.setReplyNum(replyList.getTotal());
			p.setReplyList(replyList);
			p.setDianZanNum(this.getIntBySqlDb("select count(*) from anzhi_comment_praise where comment_id="+p.getId()+" and novel_id="+p.getTableId()));
		}
		request.setAttribute("anzhicommentList", list);
	}

}