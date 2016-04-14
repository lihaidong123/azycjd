package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import java.sql.Timestamp;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiDiscounted;
import com.anzhi.web.dao.IAnzhiDiscountedDao;
import java.util.Date;
@Repository
public class AnzhiDiscountedDaoImpl extends ActionDb implements IAnzhiDiscountedDao {
	public Pojo addAnzhiDiscounted(AnzhiDiscounted anzhidiscounted){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_discounted values(?,?,?,?,?,?,?,?)");
		pojo.setObj(new Object[]{
			anzhidiscounted.getNovelId(),
			anzhidiscounted.getDiscountedType(),
			anzhidiscounted.getDiscountedEndDate(),
			anzhidiscounted.getDiscountedRebate(),
			anzhidiscounted.getVote(),
			anzhidiscounted.getState(),
			anzhidiscounted.getAddTime(),
			anzhidiscounted.getAddMemberId()
		});
		return pojo;
	}

	public boolean addBatchAnzhiDiscounted(List<AnzhiDiscounted> list){
		return this.excuteBatchUpdate("insert into anzhi_discounted values(?,?,?,?,?,?,?,?)",list);
	}

	public Pojo delAnzhiDiscounted(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_discounted where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiDiscounted(String ids){
		return this.excuteBatchUpdate("delete from anzhi_discounted where id=?",ids);
	}

	public Pojo updateAnzhiDiscounted(AnzhiDiscounted anzhidiscounted){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_discounted set novel_id=?,discounted_type=?,discounted_end_date=?,discounted_rebate=?,vote=?,state=?,add_time=?,add_member_id=? where id=?");
		pojo.setObj(new Object[]{
			anzhidiscounted.getNovelId(),
			anzhidiscounted.getDiscountedType(),
			anzhidiscounted.getDiscountedEndDate(),
			anzhidiscounted.getDiscountedRebate(),
			anzhidiscounted.getVote(),
			anzhidiscounted.getState(),
			anzhidiscounted.getAddTime(),
			anzhidiscounted.getAddMemberId()
		,	anzhidiscounted.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiDiscounted> findAnzhiDiscountedAll(int size,int pageNum,String condition){
		return this.excuteQuery(new AnzhiDiscounted(),"anzhi_discounted_view",size,pageNum,condition);
	}


}