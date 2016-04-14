package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import java.sql.Timestamp;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiBookreview;
import com.anzhi.web.dao.IAnzhiBookreviewDao;
import java.util.Date;
@Repository
public class AnzhiBookreviewDaoImpl extends ActionDb implements IAnzhiBookreviewDao {
	public Pojo addAnzhiBookreview(AnzhiBookreview anzhibookreview){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_bookreview values(?,?,?,?,?,?,?,?,?,?,?)");
		pojo.setObj(new Object[]{
			anzhibookreview.getNovelId(),
			anzhibookreview.getMemberId(),
			anzhibookreview.getBookreviewTitle(),
			anzhibookreview.getBookreviewContent(),
			anzhibookreview.getBookreviewClicknum(),
			anzhibookreview.getBookreviewReplynum(),
			anzhibookreview.getBookreviewReplyaddTime(),
			anzhibookreview.getIsTop(),
			anzhibookreview.getIsMarrow(),
			anzhibookreview.getIsReward(),
			anzhibookreview.getVote()
		});
		return pojo;
	}

	public boolean addBatchAnzhiBookreview(List<AnzhiBookreview> list){
		return this.excuteBatchUpdate("insert into anzhi_bookreview values(?,?,?,?,?,?,?,?,?,?,?)",list);
	}

	public Pojo delAnzhiBookreview(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_bookreview where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiBookreview(String ids){
		return this.excuteBatchUpdate("delete from anzhi_bookreview where id=?",ids);
	}

	public Pojo updateAnzhiBookreview(AnzhiBookreview anzhibookreview){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_bookreview set novel_id=?,member_id=?,bookreview_title=?,bookreview_content=?,bookreview_clicknum=?,bookreview_replynum=?,bookreview_replyadd_time=?,is_top=?,is_marrow=?,is_reward=?,vote=? where id=?");
		pojo.setObj(new Object[]{
			anzhibookreview.getNovelId(),
			anzhibookreview.getMemberId(),
			anzhibookreview.getBookreviewTitle(),
			anzhibookreview.getBookreviewContent(),
			anzhibookreview.getBookreviewClicknum(),
			anzhibookreview.getBookreviewReplynum(),
			anzhibookreview.getBookreviewReplyaddTime(),
			anzhibookreview.getIsTop(),
			anzhibookreview.getIsMarrow(),
			anzhibookreview.getIsReward(),
			anzhibookreview.getVote()
		,	anzhibookreview.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiBookreview> findAnzhiBookreviewAll(int size,int pageNum,String condition){
		return this.excuteQuery(new AnzhiBookreview(),"anzhi_bookreview",size,pageNum,condition);
	}


}