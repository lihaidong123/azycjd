package com.anzhi.web.serviceImpl;
import java.util.List;
import java.util.ArrayList;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.pojo.AnzhiWebEditorGoods;
import com.anzhi.web.dao.IAnzhiWebEditorGoodsDao;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.service.IAnzhiWebEditorGoodsService;
import com.anzhi.web.util.QueryList;
@Service
public class AnzhiWebEditorGoodsServiceImpl extends ActionDb  implements IAnzhiWebEditorGoodsService {
	@Autowired
	private IAnzhiWebEditorGoodsDao anzhiwebeditorgoodsDao;
	public boolean addAnzhiWebEditorGoods(AnzhiWebEditorGoods anzhiwebeditorgoods){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiwebeditorgoodsDao.addAnzhiWebEditorGoods(anzhiwebeditorgoods));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean addBatchAnzhiWebEditorGoods(List<AnzhiWebEditorGoods> list){
		return anzhiwebeditorgoodsDao.addBatchAnzhiWebEditorGoods(list);
	}

	public boolean delAnzhiWebEditorGoods(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiwebeditorgoodsDao.delAnzhiWebEditorGoods(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiWebEditorGoods(String ids){
		return anzhiwebeditorgoodsDao.delBatchAnzhiWebEditorGoods(ids);
	}

	public boolean updateAnzhiWebEditorGoods(AnzhiWebEditorGoods anzhiwebeditorgoods){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiwebeditorgoodsDao.updateAnzhiWebEditorGoods(anzhiwebeditorgoods));
		this.excuteUpdate(pojoList);
		return true;
	}

	public QueryList<AnzhiWebEditorGoods> findAnzhiWebEditorGoodsAll(int size,int pageNum,String condition){
		return anzhiwebeditorgoodsDao.findAnzhiWebEditorGoodsAll(size,pageNum,condition);
	}


}