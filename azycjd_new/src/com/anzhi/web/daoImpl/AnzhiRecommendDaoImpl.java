package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import java.sql.Timestamp;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiRecommend;
import com.anzhi.web.dao.IAnzhiRecommendDao;
import java.util.Date;
@Repository
public class AnzhiRecommendDaoImpl extends ActionDb implements IAnzhiRecommendDao {
	public Pojo addAnzhiRecommend(AnzhiRecommend anzhirecommend){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_recommend values(?,?,?,?,?,?,?)");
		pojo.setObj(new Object[]{
			anzhirecommend.getNovelId(),
			anzhirecommend.getRecommendPost(),
			anzhirecommend.getRecommendPosition(),
			anzhirecommend.getVote(),
			anzhirecommend.getState(),
			anzhirecommend.getAddMemberId(),
			anzhirecommend.getAddTime()
		});
		return pojo;
	}

	public boolean addBatchAnzhiRecommend(List<AnzhiRecommend> list){
		return this.excuteBatchUpdate("insert into anzhi_recommend values(?,?,?,?,?,?,?)",list);
	}

	public Pojo delAnzhiRecommend(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_recommend where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiRecommend(String ids){
		return this.excuteBatchUpdate("delete from anzhi_recommend where id=?",ids);
	}

	public Pojo updateAnzhiRecommend(AnzhiRecommend anzhirecommend){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_recommend set novel_id=?,recommend_post=?,recommend_position=?,vote=?,state=?,add_member_id=?,add_time=? where id=?");
		pojo.setObj(new Object[]{
			anzhirecommend.getNovelId(),
			anzhirecommend.getRecommendPost(),
			anzhirecommend.getRecommendPosition(),
			anzhirecommend.getVote(),
			anzhirecommend.getState(),
			anzhirecommend.getAddMemberId(),
			anzhirecommend.getAddTime()
		,	anzhirecommend.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiRecommend> findAnzhiRecommendAll(int size,int pageNum,String condition){
		return this.excuteQuery(new AnzhiRecommend(),"anzhi_recommend_view",size,pageNum,condition);
	}

	public Pojo updateAnzhiRecommend(String recommendPosition) {
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_recommend set state=1 where recommend_position=?");
		pojo.setObj(new Object[]{
			recommendPosition
		});
		return pojo;
	}


}