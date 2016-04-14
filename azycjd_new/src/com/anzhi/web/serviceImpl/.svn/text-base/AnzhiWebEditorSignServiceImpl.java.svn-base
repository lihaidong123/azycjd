package com.anzhi.web.serviceImpl;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.ArrayList;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.anzhi.web.pojo.AnzhiWebEditor;
import com.anzhi.web.pojo.AnzhiWebEditorSign;
import com.anzhi.web.dao.IAnzhiWebEditorSignDao;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.service.IAnzhiWebEditorSignService;
import com.anzhi.web.util.QueryList;
@Service
public class AnzhiWebEditorSignServiceImpl extends ActionDb  implements IAnzhiWebEditorSignService {
	@Autowired
	private IAnzhiWebEditorSignDao anzhiwebeditorsignDao;
	public boolean addAnzhiWebEditorSign(AnzhiWebEditorSign anzhiwebeditorsign){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiwebeditorsignDao.addAnzhiWebEditorSign(anzhiwebeditorsign));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean addBatchAnzhiWebEditorSign(List<AnzhiWebEditorSign> list){
		return anzhiwebeditorsignDao.addBatchAnzhiWebEditorSign(list);
	}

	public boolean delAnzhiWebEditorSign(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiwebeditorsignDao.delAnzhiWebEditorSign(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiWebEditorSign(String ids){
		return anzhiwebeditorsignDao.delBatchAnzhiWebEditorSign(ids);
	}

	public boolean updateAnzhiWebEditorSign(AnzhiWebEditorSign anzhiwebeditorsign){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiwebeditorsignDao.updateAnzhiWebEditorSign(anzhiwebeditorsign));
		this.excuteUpdate(pojoList);
		return true;
	}

	public QueryList<AnzhiWebEditorSign> findAnzhiWebEditorSignAll(int size,int pageNum,String condition){
		return anzhiwebeditorsignDao.findAnzhiWebEditorSignAll(size,pageNum,condition);
	}

	public String qiandao(AnzhiWebEditor anzhiWebEditor,
			HttpServletRequest request) {
		int num=this.getIntBySqlDb("select count(*) from anzhi_web_editor_sign where editor_id="+anzhiWebEditor.getId()+" and add_time between '"+this.getDateType(0)+"' and '"+this.getDateType(1)+"'");
		if(num!=0){
			return "您今天已经签到了！";
		}
		List<Pojo> pojoList=new ArrayList<Pojo>();
		AnzhiWebEditorSign anzhiwebeditorsign=new AnzhiWebEditorSign();
		anzhiwebeditorsign.setAddTime(getNowTime());
		anzhiwebeditorsign.setEditorId(anzhiWebEditor.getId());
		anzhiwebeditorsign.setSignVote("");
		anzhiwebeditorsign.setState(1);
		pojoList.add(anzhiwebeditorsignDao.addAnzhiWebEditorSign(anzhiwebeditorsign));
		
		request.getSession().removeAttribute("nosign");
		//获得积分
		int n=this.getIntBySqlDb("select count(*) from anzhi_web_editor_sign where editor_id="+anzhiWebEditor.getId()+" and add_time between '"+this.getDateStr(new Timestamp(new Date().getTime()),-5,false)+"' and '"+this.getDateType(0)+"'");
		int score=1;
		if(n==5){
			score=2;
		}
		anzhiWebEditor.setEditorScore(anzhiWebEditor.getEditorScore()+score);
		pojoList.add(this.updateTableField("anzhi_web_editor", anzhiWebEditor.getId(), "editor_score", anzhiWebEditor.getEditorScore()+""));
		this.excuteUpdate(pojoList);
		request.getSession().setAttribute("loginWebEditorUser", anzhiWebEditor);
		
		//查询该用户本月的签到
		QueryList<AnzhiWebEditorSign> ls=anzhiwebeditorsignDao.findAnzhiWebEditorSignAll(500, 1, " and editor_id="+anzhiWebEditor.getId()+" and add_time between '"+this.getDateType(4)+"' and '"+this.getDateType(5)+"'");
		String dateInfo="";
		for(AnzhiWebEditorSign aw:ls.getList()){
			dateInfo+="'"+new SimpleDateFormat("yyyy-MM-dd").format(aw.getAddTime())+"',";
		}
		dateInfo=dateInfo.equals("")?"":dateInfo.substring(0,dateInfo.length()-1);
		request.getSession().setAttribute("signDay", dateInfo);
		return "签到成功！";
	}


}