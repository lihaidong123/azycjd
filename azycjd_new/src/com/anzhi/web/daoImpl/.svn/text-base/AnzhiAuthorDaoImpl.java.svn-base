package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import java.sql.Timestamp;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiAuthor;
import com.anzhi.web.pojo.AnzhiNovelMultiJoinAuthor;
import com.anzhi.web.dao.IAnzhiAuthorDao;
import java.util.Date;
@Repository
public class AnzhiAuthorDaoImpl extends ActionDb implements IAnzhiAuthorDao {
	public Pojo addAnzhiAuthor(AnzhiAuthor anzhiauthor){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_author values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		pojo.setObj(new Object[]{
			anzhiauthor.getMemberId(),
			anzhiauthor.getAuthorWriterName(),
			anzhiauthor.getAuthorTel(),
			anzhiauthor.getAuthorQq(),
			anzhiauthor.getAuthorImage(),
			anzhiauthor.getAuthorRealname(),
			anzhiauthor.getAuthorAddress(),
			anzhiauthor.getAuthorPost(),
			anzhiauthor.getAuthorEmail(),
			anzhiauthor.getAuthorMsn(),
			anzhiauthor.getAuthorCredenttype(),
			anzhiauthor.getAuthorCredentcode(),
			anzhiauthor.getAuthorInfo(),
			anzhiauthor.getAuthorState(),
			anzhiauthor.getAddTime(),
			anzhiauthor.getVote()
		});
		return pojo;
	}

	public boolean addBatchAnzhiAuthor(List<AnzhiAuthor> list){
		return this.excuteBatchUpdate("insert into anzhi_author values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",list);
	}

	public Pojo delAnzhiAuthor(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_author where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiAuthor(String ids){
		return this.excuteBatchUpdate("delete from anzhi_author where id=?",ids);
	}

	public Pojo updateAnzhiAuthor(AnzhiAuthor anzhiauthor){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_author set member_id=?,author_writer_name=?,author_tel=?,author_qq=?,author_image=?,author_realname=?,author_address=?,author_post=?,author_email=?,author_msn=?,author_credenttype=?,author_credentcode=?,author_info=?,author_state=?,add_time=?,vote=? where id=?");
		pojo.setObj(new Object[]{
			anzhiauthor.getMemberId(),
			anzhiauthor.getAuthorWriterName(),
			anzhiauthor.getAuthorTel(),
			anzhiauthor.getAuthorQq(),
			anzhiauthor.getAuthorImage(),
			anzhiauthor.getAuthorRealname(),
			anzhiauthor.getAuthorAddress(),
			anzhiauthor.getAuthorPost(),
			anzhiauthor.getAuthorEmail(),
			anzhiauthor.getAuthorMsn(),
			anzhiauthor.getAuthorCredenttype(),
			anzhiauthor.getAuthorCredentcode(),
			anzhiauthor.getAuthorInfo(),
			anzhiauthor.getAuthorState(),
			anzhiauthor.getAddTime(),
			anzhiauthor.getVote()
		,	anzhiauthor.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiAuthor> findAnzhiAuthorAll(int size,int pageNum,String condition){
		return this.excuteQuery(new AnzhiAuthor(),"anzhi_author",size,pageNum,condition);
	}

	public QueryList<AnzhiNovelMultiJoinAuthor> findAnzhiNovelMultiJoinAuthor(
			int size, int pageNum, String condition) {
		return this.excuteQuery(new AnzhiNovelMultiJoinAuthor(),"anzhi_novel_multi_join_author",size,pageNum,condition);
	}


}