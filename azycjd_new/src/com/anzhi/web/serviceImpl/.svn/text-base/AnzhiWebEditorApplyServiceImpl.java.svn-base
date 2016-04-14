package com.anzhi.web.serviceImpl;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anzhi.web.dao.IAnzhiMessageDao;
import com.anzhi.web.dao.IAnzhiWebEditorApplyDao;
import com.anzhi.web.dao.IAnzhiWebEditorMessageDao;
import com.anzhi.web.pojo.AnzhiMessage;
import com.anzhi.web.pojo.AnzhiWebEditorApply;
import com.anzhi.web.pojo.AnzhiWebEditorMessage;
import com.anzhi.web.service.IAnzhiWebEditorApplyService;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.util.QueryList;
@Service
public class AnzhiWebEditorApplyServiceImpl extends ActionDb  implements IAnzhiWebEditorApplyService {
	@Autowired
	private IAnzhiWebEditorApplyDao anzhiwebeditorapplyDao;
	@Autowired
	private IAnzhiMessageDao anzhimessageDao;
	@Autowired
	private IAnzhiWebEditorMessageDao anzhiwebeditormessageDao;
	public boolean addAnzhiWebEditorApply(AnzhiWebEditorApply anzhiwebeditorapply){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiwebeditorapplyDao.addAnzhiWebEditorApply(anzhiwebeditorapply));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean addBatchAnzhiWebEditorApply(List<AnzhiWebEditorApply> list){
		return anzhiwebeditorapplyDao.addBatchAnzhiWebEditorApply(list);
	}

	public boolean delAnzhiWebEditorApply(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiwebeditorapplyDao.delAnzhiWebEditorApply(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiWebEditorApply(String ids){
		return anzhiwebeditorapplyDao.delBatchAnzhiWebEditorApply(ids);
	}

	public boolean updateAnzhiWebEditorApply(AnzhiWebEditorApply anzhiwebeditorapply){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiwebeditorapplyDao.updateAnzhiWebEditorApply(anzhiwebeditorapply));
		this.excuteUpdate(pojoList);
		return true;
	}

	public QueryList<AnzhiWebEditorApply> findAnzhiWebEditorApplyAll(int size,int pageNum,String condition){
		return anzhiwebeditorapplyDao.findAnzhiWebEditorApplyAll(size,pageNum,condition);
	}

	public String updateApply(HttpServletRequest request) {
		QueryList<AnzhiWebEditorMessage> ls=anzhiwebeditormessageDao.findAnzhiWebEditorMessageAll(1, 1, " and editor_id=0 and state=1");
		if(ls.getList().size()==0){
			return "您还没有设置预留短信信息呢";
		}
		List<Pojo> pojoList=new ArrayList<Pojo>();
		AnzhiWebEditorMessage ae=ls.getList().get(0);
		AnzhiMessage  anzhimessage=new AnzhiMessage();
		anzhimessage.setAddTime(getNowTime());
		anzhimessage.setMemberIdReceive(this.getIntBySqlDb("select member_id from anzhi_web_editor_apply where id="+this.getInt(request, "id")));
		anzhimessage.setMemberIdSend(0);
		anzhimessage.setMessageTitle("您申请网编审核通过了");
		anzhimessage.setMessageContent(ae.getMessContent());
		anzhimessage.setMessageType(1);
		anzhimessage.setMessageRead(0);
		anzhimessage.setVote("");
		pojoList.add(anzhimessageDao.addAnzhiMessage(anzhimessage));
		this.excuteUpdate(pojoList);
		this.updateTableFieldVoid("anzhi_web_editor_apply", this.getInt(request, "id"), "state", 1);
		return "审核通过";
	}


}