package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiWebEditorGoodsChange;
import com.anzhi.web.dao.IAnzhiWebEditorGoodsChangeDao;
@Repository
public class AnzhiWebEditorGoodsChangeDaoImpl extends ActionDb implements IAnzhiWebEditorGoodsChangeDao {
	public Pojo addAnzhiWebEditorGoodsChange(AnzhiWebEditorGoodsChange anzhiwebeditorgoodschange){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_web_editor_goods_change values(?,?,?,?,?)");
		pojo.setObj(new Object[]{
			anzhiwebeditorgoodschange.getEditorId(),
			anzhiwebeditorgoodschange.getGoodsId(),
			anzhiwebeditorgoodschange.getChangeVote(),
			anzhiwebeditorgoodschange.getState(),
			anzhiwebeditorgoodschange.getAddTime()
		});
		return pojo;
	}

	public boolean addBatchAnzhiWebEditorGoodsChange(List<AnzhiWebEditorGoodsChange> list){
		return this.excuteBatchUpdate("insert into anzhi_web_editor_goods_change values(?,?,?,?,?)",list);
	}

	public Pojo delAnzhiWebEditorGoodsChange(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_web_editor_goods_change where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiWebEditorGoodsChange(String ids){
		return this.excuteBatchUpdate("delete from anzhi_web_editor_goods_change where id=?",ids);
	}

	public Pojo updateAnzhiWebEditorGoodsChange(AnzhiWebEditorGoodsChange anzhiwebeditorgoodschange){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_web_editor_goods_change set editor_id=?,goods_id=?,change_vote=?,state=?,add_time=? where id=?");
		pojo.setObj(new Object[]{
			anzhiwebeditorgoodschange.getEditorId(),
			anzhiwebeditorgoodschange.getGoodsId(),
			anzhiwebeditorgoodschange.getChangeVote(),
			anzhiwebeditorgoodschange.getState(),
			anzhiwebeditorgoodschange.getAddTime()
		,	anzhiwebeditorgoodschange.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiWebEditorGoodsChange> findAnzhiWebEditorGoodsChangeAll(int size,int pageNum,String condition){
		QueryList<AnzhiWebEditorGoodsChange> ls=this.excuteQuery(new AnzhiWebEditorGoodsChange(),"anzhi_web_editor_goods_change_view",size,pageNum,condition);
		getWebEditorFather(ls);
		return ls;
	}


}