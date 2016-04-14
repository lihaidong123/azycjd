package com.anzhi.web.serviceImpl;
import java.util.List;
import java.util.ArrayList;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.anzhi.web.pojo.AnzhiWebEditor;
import com.anzhi.web.pojo.AnzhiWebEditorGoods;
import com.anzhi.web.pojo.AnzhiWebEditorGoodsChange;
import com.anzhi.web.dao.IAnzhiWebEditorGoodsChangeDao;
import com.anzhi.web.dao.IAnzhiWebEditorGoodsDao;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.service.IAnzhiWebEditorGoodsChangeService;
import com.anzhi.web.util.QueryList;
@Service
public class AnzhiWebEditorGoodsChangeServiceImpl extends ActionDb  implements IAnzhiWebEditorGoodsChangeService {
	@Autowired
	private IAnzhiWebEditorGoodsChangeDao anzhiwebeditorgoodschangeDao;
	@Autowired
	private IAnzhiWebEditorGoodsDao anzhiwebeditorgoodsDao;
	public boolean addAnzhiWebEditorGoodsChange(AnzhiWebEditorGoodsChange anzhiwebeditorgoodschange){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiwebeditorgoodschangeDao.addAnzhiWebEditorGoodsChange(anzhiwebeditorgoodschange));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean addBatchAnzhiWebEditorGoodsChange(List<AnzhiWebEditorGoodsChange> list){
		return anzhiwebeditorgoodschangeDao.addBatchAnzhiWebEditorGoodsChange(list);
	}

	public boolean delAnzhiWebEditorGoodsChange(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiwebeditorgoodschangeDao.delAnzhiWebEditorGoodsChange(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiWebEditorGoodsChange(String ids){
		return anzhiwebeditorgoodschangeDao.delBatchAnzhiWebEditorGoodsChange(ids);
	}

	public boolean updateAnzhiWebEditorGoodsChange(AnzhiWebEditorGoodsChange anzhiwebeditorgoodschange){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiwebeditorgoodschangeDao.updateAnzhiWebEditorGoodsChange(anzhiwebeditorgoodschange));
		this.excuteUpdate(pojoList);
		return true;
	}

	public QueryList<AnzhiWebEditorGoodsChange> findAnzhiWebEditorGoodsChangeAll(int size,int pageNum,String condition){
		return anzhiwebeditorgoodschangeDao.findAnzhiWebEditorGoodsChangeAll(size,pageNum,condition);
	}

	public String goodsChange(HttpServletRequest request) {
		if(request.getSession().getAttribute("loginWebEditorUser")==null){
			return "您还没有登录呢";
		}
		AnzhiWebEditor t=(AnzhiWebEditor)request.getSession().getAttribute("loginWebEditorUser");
		if(!this.checkParam(request, "goodsId")){
			return "参数请求错误！";
		}
		QueryList<AnzhiWebEditorGoods> ls=anzhiwebeditorgoodsDao.findAnzhiWebEditorGoodsAll(1, 1, " and id="+this.getInt(request, "goodsId"));
		if(ls.getList().size()==0){
			return "兑换礼品数据加载错误！";
		}
		double score=this.getDoubleBySqlDb("select editor_score from anzhi_web_editor where id="+t.getId());
		AnzhiWebEditorGoods wg=ls.getList().get(0);
		if(score<Double.parseDouble(wg.getGoodsScore())){
			return "您的积分不够！";
		}
		List<Pojo> pojoList=new ArrayList<Pojo>();
		AnzhiWebEditorGoodsChange anzhiwebeditorgoodschange=new AnzhiWebEditorGoodsChange();
		anzhiwebeditorgoodschange.setEditorId(t.getId());
		anzhiwebeditorgoodschange.setGoodsId(this.getInt(request, "goodsId"));
		anzhiwebeditorgoodschange.setChangeVote("兑换前积分:"+score+";兑换积分:"+wg.getGoodsScore()+";兑换后积分:"+(score-Double.parseDouble(wg.getGoodsScore())));
		anzhiwebeditorgoodschange.setState(0);
		anzhiwebeditorgoodschange.setAddTime(getNowTime());
		pojoList.add(anzhiwebeditorgoodschangeDao.addAnzhiWebEditorGoodsChange(anzhiwebeditorgoodschange));
		pojoList.add(this.updateTableField("anzhi_web_editor", t.getId(), "editor_score", (score-Double.parseDouble(wg.getGoodsScore()))+""));
		this.excuteUpdate(pojoList);
		
		t.setEditorScore(score-Double.parseDouble(wg.getGoodsScore()));
		request.getSession().setAttribute("loginWebEditorUser",t);
		return "兑换成功";
	}


}