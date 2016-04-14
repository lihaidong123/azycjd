package com.anzhi.web.serviceImpl;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anzhi.web.dao.IAnzhiChapterDao;
import com.anzhi.web.dao.IAnzhiHandleDao;
import com.anzhi.web.dao.IAnzhiNovelDao;
import com.anzhi.web.dao.IAnzhiNovelMultifunctionDao;
import com.anzhi.web.dao.IAnzhiWebEditorDao;
import com.anzhi.web.pojo.AnzhiChapter;
import com.anzhi.web.pojo.AnzhiHandle;
import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.pojo.AnzhiNovel;
import com.anzhi.web.pojo.AnzhiNovelMultifunction;
import com.anzhi.web.pojo.AnzhiWebEditor;
import com.anzhi.web.service.IAnzhiHandleService;
import com.anzhi.web.service.IAnzhiNovelService;
import com.anzhi.web.service.IUtilService;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.util.QueryList;
@Service
public class AnzhiHandleServiceImpl extends ActionDb  implements IAnzhiHandleService {
	@Autowired
	private IAnzhiHandleDao anzhihandleDao;
	@Autowired
	private IAnzhiNovelDao anzhinovelDao;
	@Autowired
	private IAnzhiChapterDao anzhichapterDao;
	@Autowired
	private IUtilService utilService;
	@Autowired
	private IAnzhiNovelMultifunctionDao anzhinovelmultifunctionDao;
	@Autowired
	private IAnzhiWebEditorDao anzhiwebeditorDao;
	public boolean addAnzhiHandle(AnzhiHandle anzhihandle,AnzhiWebEditor aw,HttpServletRequest request){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		if(aw!=null){
			//说明是网编在审核
			anzhihandle.setHandleVote(anzhihandle.getHandleVote()+"[网编("+aw.getEditorName()+")审核!]");
			if(anzhihandle.getHandleType().equals(0)||anzhihandle.getHandleType().equals(1)){
				//每审核一章加1积分
				double score=this.getDoubleBySqlDb("select editor_score from anzhi_web_editor where id="+aw.getId());
				aw.setEditorScore(score+1);
				this.updateTableFieldAppend("anzhi_web_editor", aw.getId(), "editor_score", 1);
			}
		}
		pojoList.add(anzhihandleDao.addAnzhiHandle(anzhihandle));
		/**
		 * 0-举报处理 1-未通过章节审核 2-作者删文审核 3-作者删章节审核 4-作品签约处理 5-作家申请签约处理 6-自主上架申请处理 7-自主下架申请处理 8-福利申请处理 9-提现申请处理
		 */
		if(anzhihandle.getHandleType().equals(0)){
			//举报处理
			this.updateTableFieldVoid("anzhi_report", anzhihandle.getTableId(), "state", 1);
		}else if(anzhihandle.getHandleType().equals(1)){
			//此时anzhihandle.getTableId()获得的是anzhi_novel_multifunction的id  未通过章节审核
			int tableId=this.getIntBySqlDb("select novel_id from anzhi_novel_multifunction where id="+anzhihandle.getTableId());
			if(anzhihandle.getHandleResult().equals(1)){
				//未通过章节审核已通过，则需要重新生成小说的信息
				this.updateTableFieldVoid("anzhi_chapter", tableId, "state", 1);
			}else{
				this.updateTableFieldVoid("anzhi_chapter", tableId, "state", 0);
			}
			this.updateTableFieldVoid("anzhi_novel_multifunction", anzhihandle.getTableId(), "state", 1);
			pojoList.add(this.updateTableField("anzhi_novel_multifunction", anzhihandle.getTableId(), "vote", anzhihandle.getHandleVote()));
		}
		
		if(anzhihandle.getHandleResult().equals(1)){
			//处理结果是通过，则需要修改相应的表字段
			if(anzhihandle.getHandleType().equals(2)){
				int tableId=this.getIntBySqlDb("select novel_id from anzhi_novel_multifunction where id="+anzhihandle.getTableId());
				QueryList<AnzhiNovel> ls=anzhinovelDao.findAnzhiNovelAll(1, 1, " and id="+tableId, "id");
				AnzhiNovel an=ls.getList().get(0);
				String info="";
				info+="小说名称:"+an.getNovelTitle()+"   作者:"+an.getAuthorWriterName()+"   已审核删除。相关处理如下：";
				//添加一条删除记录备份说明
				AnzhiHandle ah=new AnzhiHandle();
				ah.setTableId(anzhihandle.getTableId());
				ah.setHandleType(10);
				ah.setHandleVote(info);
				ah.setHandleResult(1);
				ah.setState(2);
				ah.setAddTime(getNowTime());
				ah.setAddMemberId(anzhihandle.getAddMemberId());
				pojoList.add(anzhihandleDao.addAnzhiHandle(ah));
				this.delTableRow("anzhi_novel", tableId);
				this.updateTableFieldVoid("anzhi_novel_multifunction", anzhihandle.getTableId(), "state", 1);
			}else if(anzhihandle.getHandleType().equals(3)){
				int tableId=this.getIntBySqlDb("select novel_id from anzhi_novel_multifunction where id="+anzhihandle.getTableId());
				QueryList<AnzhiChapter> ls=anzhichapterDao.findAnzhiChapterAll(1, 1, " and id="+tableId);
				AnzhiChapter ac=ls.getList().get(0);
				String info="";
				info+="小说名称:"+ac.getNovelTitle()+"   章节名称:"+ac.getChapterTitle()+"   作者:"+ac.getAuthorWriterName()+"   已审核删除。相关处理如下：";
				//添加一条删除记录备份说明
				AnzhiHandle ah=new AnzhiHandle();
				ah.setTableId(anzhihandle.getTableId());
				ah.setHandleType(11);
				ah.setHandleVote(info);
				ah.setHandleResult(1);
				ah.setState(2);
				ah.setAddTime(getNowTime());
				ah.setAddMemberId(anzhihandle.getAddMemberId());
				pojoList.add(anzhihandleDao.addAnzhiHandle(ah));
				this.delTableRow("anzhi_chapter", tableId);
				this.updateTableFieldVoid("anzhi_novel_multifunction", anzhihandle.getTableId(), "state", 1);
			}else if(anzhihandle.getHandleType().equals(4)){
				//此时anzhihandle.getTableId()获得的是anzhi_novel_multifunction的id
				int tableId=this.getIntBySqlDb("select novel_id from anzhi_novel_multifunction where id="+anzhihandle.getTableId());
				//修改状态
				this.updateTableFieldVoid("anzhi_novel_multifunction", anzhihandle.getTableId(), "state", 1);
				//修改小说表的状态、以及签约状态
				this.updateTableFieldVoid("anzhi_novel", tableId, "state", 2);
				this.updateTableFieldVoid("anzhi_novel", tableId, "is_signed", 1);
				
				AnzhiNovelMultifunction anm=new AnzhiNovelMultifunction();
				anm.setActionType(21);
				anm.setAddTime(this.getNowTime());
				anm.setMemberId(0);
				anm.setNovelId(tableId);
				anm.setState(0);
				anm.setVote("签约成功");
				pojoList.add(anzhinovelmultifunctionDao.addAnzhiNovelMultifunction(anm));
				
				//查询一下，该小说是否有被网编报备
				int editorId=this.getIntBySqlDb("select editor_id from anzhi_web_editor_author where novel_id="+tableId);
				if(editorId!=0){
					//增加网编的积分
					pojoList.add(anzhiwebeditorDao.updateScore(editorId, 40));
				}
			}else if(anzhihandle.getHandleType().equals(5)){
				//此时anzhihandle.getTableId()获得的是anzhi_novel_multifunction的id
				int tableId=this.getIntBySqlDb("select novel_id from anzhi_novel_multifunction where id="+anzhihandle.getTableId());
				this.updateTableFieldVoid("anzhi_novel_multifunction", anzhihandle.getTableId(), "state", 1);
				this.updateTableFieldVoid("anzhi_author", tableId, "author_state", 2);
			}else if(anzhihandle.getHandleType().equals(6)){
				//此时anzhihandle.getTableId()获得的是anzhi_novel_multifunction的id
				int tableId=this.getIntBySqlDb("select novel_id from anzhi_novel_multifunction where id="+anzhihandle.getTableId());
				this.updateTableFieldVoid("anzhi_novel_multifunction", anzhihandle.getTableId(), "state", 1);
				this.updateTableFieldVoid("anzhi_novel", tableId, "state", 2);
				
				int n=this.getIntBySqlDb("select count(*) from anzhi_novel_multifunction where novel_id="+tableId+" and action_type=17");
				if(n==0){
					//添加一条平台上架 记录
					AnzhiNovelMultifunction anm=new AnzhiNovelMultifunction();
					anm.setActionType(17);
					anm.setAddTime(getNowTime());
					anm.setMemberId(0);
					anm.setNovelId(tableId);
					anm.setState(0);
					anm.setVote("平台上架记录");
					pojoList.add(anzhinovelmultifunctionDao.addAnzhiNovelMultifunction(anm));
					
					//平台上架成功，默认网站上架
					n=this.getIntBySqlDb("select count(*) from anzhi_novel_multifunction where novel_id="+tableId+" and action_type=16");
					if(n==0){
						//添加一条网站上架 记录
						AnzhiNovelMultifunction anma=new AnzhiNovelMultifunction();
						anma.setActionType(16);
						anma.setAddTime(getNowTime());
						anma.setMemberId(0);
						anma.setNovelId(tableId);
						anma.setState(0);
						anma.setVote("平台上架成功，默认网站上架");
						pojoList.add(anzhinovelmultifunctionDao.addAnzhiNovelMultifunction(anma));
					}
				}
			}else if(anzhihandle.getHandleType().equals(7)){
				//此时anzhihandle.getTableId()获得的是anzhi_novel_multifunction的id
				int tableId=this.getIntBySqlDb("select novel_id from anzhi_novel_multifunction where id="+anzhihandle.getTableId());
				this.updateTableFieldVoid("anzhi_novel_multifunction", anzhihandle.getTableId(), "state", 1);
				this.updateTableFieldVoid("anzhi_novel", tableId, "state", 2);
				
				//删除平台上架记录
				pojoList.add(anzhinovelmultifunctionDao.delAnzhiNovelMultifunction(tableId, 0, 17));
				
			}else if(anzhihandle.getHandleType().equals(8)){
				
			}else if(anzhihandle.getHandleType().equals(13)){
				//作品名称修改审核通过。
				//此时anzhihandle.getTableId()获得的是anzhi_novel_multifunction的id
				int tableId=this.getIntBySqlDb("select novel_id from anzhi_novel_multifunction where id="+anzhihandle.getTableId());
				String newNovelTitle=this.getStringBySqlDb("select vote from anzhi_novel_multifunction where id="+anzhihandle.getTableId());
				this.updateTableFieldVoid("anzhi_novel_multifunction", anzhihandle.getTableId(), "state", 1);
				pojoList.add(this.updateTableField("anzhi_novel", tableId, "novel_title", newNovelTitle));
			}
		}else{
			this.updateTableFieldVoid("anzhi_novel_multifunction", anzhihandle.getTableId(), "state", 1);
		}
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean addBatchAnzhiHandle(List<AnzhiHandle> list){
		return anzhihandleDao.addBatchAnzhiHandle(list);
	}

	public boolean delAnzhiHandle(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhihandleDao.delAnzhiHandle(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiHandle(String ids){
		return anzhihandleDao.delBatchAnzhiHandle(ids);
	}

	public boolean updateAnzhiHandle(AnzhiHandle anzhihandle){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhihandleDao.updateAnzhiHandle(anzhihandle));
		this.excuteUpdate(pojoList);
		return true;
	}

	public QueryList<AnzhiHandle> findAnzhiHandleAll(int size,int pageNum,String condition){
		return anzhihandleDao.findAnzhiHandleAll(size,pageNum,condition);
	}

	public String adminCheck(HttpServletRequest request, AnzhiMember am) {
		List<Pojo> pojoList=new ArrayList<Pojo>();
		int types=this.getInt(request, "types");
		AnzhiHandle h=new AnzhiHandle();
		h.setAddMemberId(am.getId());
		h.setTableId(this.getInt(request, "tableId"));
		h.setHandleResult(this.getInt(request, "state"));
		h.setHandleType(types);
		h.setHandleVote(request.getParameter("vote"));
		h.setState(0);
		h.setAddTime(getNowTime());
		pojoList.add(anzhihandleDao.addAnzhiHandle(h));
		this.excuteUpdate(pojoList);
		int states=this.getInt(request, "state")==1?1:3;
		if(types==13){
			this.updateTableFieldVoid("anzhi_web_editor_goods_change", this.getInt(request, "tableId"), "state", states);
		}else if(types==14){
			this.updateTableFieldVoid("anzhi_web_editor_fuli_apply", this.getInt(request, "tableId"), "state", states);
		}else if(types==15){
			this.updateTableFieldVoid("anzhi_web_editor_tuijian", this.getInt(request, "tableId"), "is_jiajing", states);
		}else if(types==16){
			this.updateTableFieldVoid("anzhi_web_editor_tuijian", this.getInt(request, "tableId"), "is_hot", states);
		}
		return "审核成功";
	}

}