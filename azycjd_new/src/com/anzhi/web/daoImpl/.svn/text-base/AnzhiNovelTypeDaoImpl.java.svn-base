package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import java.sql.Timestamp;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiNovelType;
import com.anzhi.web.dao.IAnzhiNovelTypeDao;
import java.util.Date;
@Repository
public class AnzhiNovelTypeDaoImpl extends ActionDb implements IAnzhiNovelTypeDao {
	public Pojo addAnzhiNovelType(AnzhiNovelType anzhinoveltype){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_novel_type values(?,?,?,?)");
		pojo.setObj(new Object[]{
			anzhinoveltype.getNovelId(),
			anzhinoveltype.getBigType(),
			anzhinoveltype.getSmallType(),
			anzhinoveltype.getAddTime()
		});
		return pojo;
	}

	public boolean addBatchAnzhiNovelType(List<AnzhiNovelType> list){
		return this.excuteBatchUpdate("insert into anzhi_novel_type values(?,?,?,?)",list);
	}

	public Pojo delAnzhiNovelType(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_novel_type where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiNovelType(String ids){
		return this.excuteBatchUpdate("delete from anzhi_novel_type where id=?",ids);
	}

	public Pojo updateAnzhiNovelType(AnzhiNovelType anzhinoveltype){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_novel_type set novel_id=?,big_type=?,small_type=?,add_time=? where id=?");
		pojo.setObj(new Object[]{
			anzhinoveltype.getNovelId(),
			anzhinoveltype.getBigType(),
			anzhinoveltype.getSmallType(),
			anzhinoveltype.getAddTime()
		,	anzhinoveltype.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiNovelType> findAnzhiNovelTypeAll(int size,int pageNum,String condition){
		return this.excuteQuery(new AnzhiNovelType(),"anzhi_novel_type",size,pageNum,condition);
	}

	public Pojo delAnzhiNovelTypeByNovelId(int novelId) {
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_novel_type where novel_id=?");
		pojo.setObj(new Object[]{novelId});
		return pojo;
	}


}