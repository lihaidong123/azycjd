package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import java.sql.Timestamp;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiWebEditorGoods;
import com.anzhi.web.dao.IAnzhiWebEditorGoodsDao;
import java.util.Date;
@Repository
public class AnzhiWebEditorGoodsDaoImpl extends ActionDb implements IAnzhiWebEditorGoodsDao {
	public Pojo addAnzhiWebEditorGoods(AnzhiWebEditorGoods anzhiwebeditorgoods){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_web_editor_goods values(?,?,?,?,?,?,?)");
		pojo.setObj(new Object[]{
			anzhiwebeditorgoods.getGoodsName(),
			anzhiwebeditorgoods.getGoodsImg(),
			anzhiwebeditorgoods.getGoodsScore(),
			anzhiwebeditorgoods.getGoodsVote(),
			anzhiwebeditorgoods.getGoodsType(),
			anzhiwebeditorgoods.getState(),
			anzhiwebeditorgoods.getAddTime()
		});
		return pojo;
	}

	public boolean addBatchAnzhiWebEditorGoods(List<AnzhiWebEditorGoods> list){
		return this.excuteBatchUpdate("insert into anzhi_web_editor_goods values(?,?,?,?,?,?,?)",list);
	}

	public Pojo delAnzhiWebEditorGoods(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_web_editor_goods where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiWebEditorGoods(String ids){
		return this.excuteBatchUpdate("delete from anzhi_web_editor_goods where id=?",ids);
	}

	public Pojo updateAnzhiWebEditorGoods(AnzhiWebEditorGoods anzhiwebeditorgoods){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_web_editor_goods set goods_name=?,goods_img=?,goods_score=?,goods_vote=?,goods_type=?,state=?,add_time=? where id=?");
		pojo.setObj(new Object[]{
			anzhiwebeditorgoods.getGoodsName(),
			anzhiwebeditorgoods.getGoodsImg(),
			anzhiwebeditorgoods.getGoodsScore(),
			anzhiwebeditorgoods.getGoodsVote(),
			anzhiwebeditorgoods.getGoodsType(),
			anzhiwebeditorgoods.getState(),
			anzhiwebeditorgoods.getAddTime()
		,	anzhiwebeditorgoods.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiWebEditorGoods> findAnzhiWebEditorGoodsAll(int size,int pageNum,String condition){
		return this.excuteQuery(new AnzhiWebEditorGoods(),"anzhi_web_editor_goods",size,pageNum,condition);
	}


}