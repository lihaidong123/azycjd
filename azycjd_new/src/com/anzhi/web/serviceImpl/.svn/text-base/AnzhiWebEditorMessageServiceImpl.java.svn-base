package com.anzhi.web.serviceImpl;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anzhi.web.dao.IAnzhiMessageDao;
import com.anzhi.web.dao.IAnzhiWebEditorMessageDao;
import com.anzhi.web.pojo.AnzhiMessage;
import com.anzhi.web.pojo.AnzhiWebEditor;
import com.anzhi.web.pojo.AnzhiWebEditorMessage;
import com.anzhi.web.service.IAnzhiWebEditorMessageService;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.util.QueryList;
@Service
public class AnzhiWebEditorMessageServiceImpl extends ActionDb  implements IAnzhiWebEditorMessageService {
	@Autowired
	private IAnzhiWebEditorMessageDao anzhiwebeditormessageDao;
	@Autowired
	private IAnzhiMessageDao anzhimessageDao;
	public boolean addAnzhiWebEditorMessage(AnzhiWebEditorMessage anzhiwebeditormessage){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiwebeditormessageDao.addAnzhiWebEditorMessage(anzhiwebeditormessage));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean addBatchAnzhiWebEditorMessage(List<AnzhiWebEditorMessage> list){
		return anzhiwebeditormessageDao.addBatchAnzhiWebEditorMessage(list);
	}

	public boolean delAnzhiWebEditorMessage(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiwebeditormessageDao.delAnzhiWebEditorMessage(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiWebEditorMessage(String ids){
		return anzhiwebeditormessageDao.delBatchAnzhiWebEditorMessage(ids);
	}

	public boolean updateAnzhiWebEditorMessage(AnzhiWebEditorMessage anzhiwebeditormessage){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiwebeditormessageDao.updateAnzhiWebEditorMessage(anzhiwebeditormessage));
		this.excuteUpdate(pojoList);
		return true;
	}

	public QueryList<AnzhiWebEditorMessage> findAnzhiWebEditorMessageAll(int size,int pageNum,String condition){
		return anzhiwebeditormessageDao.findAnzhiWebEditorMessageAll(size,pageNum,condition);
	}

	public void setDefault(HttpServletRequest request) {
		int editorId=this.getInt(request, "editorId");
		int id=this.getInt(request, "id");
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiwebeditormessageDao.updateAnzhiWebEditorMessage(editorId));
		this.excuteUpdate(pojoList);
		this.updateTableFieldVoid("anzhi_web_editor_message", id, "state", 1);
	}

	public String cuigeng(HttpServletRequest request,AnzhiWebEditor aw) {
		int id=this.getInt(request, "id");
		QueryList<AnzhiWebEditorMessage> ls=anzhiwebeditormessageDao.findAnzhiWebEditorMessageAll(1, 1, " and editor_id="+aw.getId()+" and state=1");
		if(ls.getList().size()==0){
			return "您还没有设置默认的催更消息模板呢";
		}
		List<Pojo> pojoList=new ArrayList<Pojo>();
		
		AnzhiWebEditorMessage ae=ls.getList().get(0);
		AnzhiMessage anzhimessage=new AnzhiMessage();
		anzhimessage.setAddTime(getNowTime());
		anzhimessage.setMemberIdReceive(this.getIntBySqlDb("select author_id from anzhi_web_editor_author_view where id="+this.getInt(request, "id")));
		anzhimessage.setMemberIdSend(0);
		anzhimessage.setMessageTitle("网编对您催更了");
		anzhimessage.setMessageContent(ae.getMessContent());
		anzhimessage.setMessageType(1);
		anzhimessage.setMessageRead(0);
		anzhimessage.setVote("");
		pojoList.add(anzhimessageDao.addAnzhiMessage(anzhimessage));
		this.excuteUpdate(pojoList);
		return "催更成功";
	}


}