package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import java.sql.Timestamp;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiNovelReward;
import com.anzhi.web.dao.IAnzhiNovelRewardDao;
import java.util.Date;
@Repository
public class AnzhiNovelRewardDaoImpl extends ActionDb implements IAnzhiNovelRewardDao {
	public Pojo addAnzhiNovelReward(AnzhiNovelReward anzhinovelreward){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_novel_reward values(?,?,?,?,?,?,?,?,?)");
		pojo.setObj(new Object[]{
			anzhinovelreward.getNovelId(),
			anzhinovelreward.getChapterId(),
			anzhinovelreward.getMemberId(),
			anzhinovelreward.getRewardType(),
			anzhinovelreward.getRewardNum(),
			anzhinovelreward.getRewardAnzhiMoney(),
			anzhinovelreward.getState(),
			anzhinovelreward.getAddTime(),
			anzhinovelreward.getVote()
		});
		return pojo;
	}

	public boolean addBatchAnzhiNovelReward(List<AnzhiNovelReward> list){
		return this.excuteBatchUpdate("insert into anzhi_novel_reward values(?,?,?,?,?,?,?,?,?)",list);
	}

	public Pojo delAnzhiNovelReward(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_novel_reward where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiNovelReward(String ids){
		return this.excuteBatchUpdate("delete from anzhi_novel_reward where id=?",ids);
	}

	public Pojo updateAnzhiNovelReward(AnzhiNovelReward anzhinovelreward){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_novel_reward set novel_id=?,chapter_id=?,member_id=?,reward_type=?,reward_num=?,reward_anzhi_money=?,state=?,add_time=?,vote=? where id=?");
		pojo.setObj(new Object[]{
			anzhinovelreward.getNovelId(),
			anzhinovelreward.getChapterId(),
			anzhinovelreward.getMemberId(),
			anzhinovelreward.getRewardType(),
			anzhinovelreward.getRewardNum(),
			anzhinovelreward.getRewardAnzhiMoney(),
			anzhinovelreward.getState(),
			anzhinovelreward.getAddTime(),
			anzhinovelreward.getVote()
		,	anzhinovelreward.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiNovelReward> findAnzhiNovelRewardAll(int size,int pageNum,String condition){
		return this.excuteQuery(new AnzhiNovelReward(),"anzhi_novel_reward_view",size,pageNum,condition);
	}


}