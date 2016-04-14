package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import java.sql.Timestamp;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiNews;
import com.anzhi.web.dao.IAnzhiNewsDao;
import java.util.Date;
@Repository
public class AnzhiNewsDaoImpl extends ActionDb implements IAnzhiNewsDao {
	public Pojo addAnzhiNews(AnzhiNews anzhinews){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_news values(?,?,?,?,?,?,?,?,?)");
		pojo.setObj(new Object[]{
			anzhinews.getNewsAuthor(),
			anzhinews.getNewsTitle(),
			anzhinews.getNewsContent(),
			anzhinews.getNewsType(),
			anzhinews.getNewsState(),
			anzhinews.getNewsClicknum(),
			anzhinews.getAddTime(),
			anzhinews.getVote(),
			0
		});
		return pojo;
	}

	public boolean addBatchAnzhiNews(List<AnzhiNews> list){
		return this.excuteBatchUpdate("insert into anzhi_news values(?,?,?,?,?,?,?,?)",list);
	}

	public Pojo delAnzhiNews(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_news where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiNews(String ids){
		return this.excuteBatchUpdate("delete from anzhi_news where id=?",ids);
	}

	public Pojo updateAnzhiNews(AnzhiNews anzhinews){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_news set news_author=?,news_title=?,news_content=?,news_type=?,news_state=?,news_clicknum=?,add_time=?,vote=? where id=?");
		pojo.setObj(new Object[]{
			anzhinews.getNewsAuthor(),
			anzhinews.getNewsTitle(),
			anzhinews.getNewsContent(),
			anzhinews.getNewsType(),
			anzhinews.getNewsState(),
			anzhinews.getNewsClicknum(),
			anzhinews.getAddTime(),
			anzhinews.getVote()
		,	anzhinews.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiNews> findAnzhiNewsAll(int size,int pageNum,String condition){
		return this.excuteQuery(new AnzhiNews(),"anzhi_news",size,pageNum,condition);
	}

	public Pojo updateAnzhiNews() {
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_news set state=1 where state=0 and news_type=0");
		pojo.setObj(new Object[]{
			
		});
		return pojo;
	}


}