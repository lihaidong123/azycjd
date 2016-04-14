package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import java.sql.Timestamp;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiNovelMultifunction;
import com.anzhi.web.dao.IAnzhiNovelMultifunctionDao;
import java.util.Date;
@Repository
public class AnzhiNovelMultifunctionDaoImpl extends ActionDb implements IAnzhiNovelMultifunctionDao {
	public Pojo addAnzhiNovelMultifunction(AnzhiNovelMultifunction anzhinovelmultifunction){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_novel_multifunction values(?,?,?,?,?,?)");
		pojo.setObj(new Object[]{
			anzhinovelmultifunction.getNovelId(),
			anzhinovelmultifunction.getMemberId(),
			anzhinovelmultifunction.getActionType(),
			anzhinovelmultifunction.getState(),
			anzhinovelmultifunction.getAddTime(),
			anzhinovelmultifunction.getVote()
		});
		return pojo;
	}

	public boolean addBatchAnzhiNovelMultifunction(List<AnzhiNovelMultifunction> list){
		return this.excuteBatchUpdate("insert into anzhi_novel_multifunction values(?,?,?,?,?)",list);
	}

	public Pojo delAnzhiNovelMultifunction(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_novel_multifunction where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiNovelMultifunction(String ids){
		return this.excuteBatchUpdate("delete from anzhi_novel_multifunction where id=?",ids);
	}

	public Pojo updateAnzhiNovelMultifunction(AnzhiNovelMultifunction anzhinovelmultifunction){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_novel_multifunction set novel_id=?,member_id=?,action_type=?,state=?,add_time=? where id=?");
		pojo.setObj(new Object[]{
			anzhinovelmultifunction.getNovelId(),
			anzhinovelmultifunction.getMemberId(),
			anzhinovelmultifunction.getActionType(),
			anzhinovelmultifunction.getState(),
			anzhinovelmultifunction.getAddTime(),
			anzhinovelmultifunction.getVote()
		,	anzhinovelmultifunction.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiNovelMultifunction> findAnzhiNovelMultifunctionAll(int size,int pageNum,String condition){
		return this.excuteQuery(new AnzhiNovelMultifunction(),"anzhi_tuijiannovels_view",size,pageNum,condition);
	}

	public Pojo delAnzhiNovelMultifunction(int novelId, int memberId,
			int actionType) {
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_novel_multifunction where novel_id=? and member_id=? and action_type=?");
		pojo.setObj(new Object[]{novelId,memberId,actionType});
		return pojo;
	}

	public Pojo updateAnzhiNovelMultifunction(int novelId, int actionType,
			int state, int newValue) {
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_novel_multifunction set state=? where novel_id=? and action_type=? and state=?");
		pojo.setObj(new Object[]{
			newValue,	
			novelId,
			actionType,
			state
		});
		return pojo;
	}


}