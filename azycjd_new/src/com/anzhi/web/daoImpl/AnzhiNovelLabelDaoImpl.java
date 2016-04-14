package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import java.sql.Timestamp;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiNovelLabel;
import com.anzhi.web.dao.IAnzhiNovelLabelDao;
import java.util.Date;
@Repository
public class AnzhiNovelLabelDaoImpl extends ActionDb implements IAnzhiNovelLabelDao {
	public Pojo addAnzhiNovelLabel(AnzhiNovelLabel anzhinovellabel){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_novel_label values(?,?,?,?,?)");
		pojo.setObj(new Object[]{
			anzhinovellabel.getLabelName(),
			anzhinovellabel.getFatherId(),
			anzhinovellabel.getVote(),
			anzhinovellabel.getState(),
			anzhinovellabel.getAddTime()
		});
		return pojo;
	}

	public boolean addBatchAnzhiNovelLabel(List<AnzhiNovelLabel> list){
		return this.excuteBatchUpdate("insert into anzhi_novel_label values(?,?,?,?,?)",list);
	}

	public Pojo delAnzhiNovelLabel(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_novel_label where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiNovelLabel(String ids){
		return this.excuteBatchUpdate("delete from anzhi_novel_label where id=?",ids);
	}

	public Pojo updateAnzhiNovelLabel(AnzhiNovelLabel anzhinovellabel){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_novel_label set label_name=?,father_id=?,vote=?,state=?,add_time=? where id=?");
		pojo.setObj(new Object[]{
			anzhinovellabel.getLabelName(),
			anzhinovellabel.getFatherId(),
			anzhinovellabel.getVote(),
			anzhinovellabel.getState(),
			anzhinovellabel.getAddTime()
		,	anzhinovellabel.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiNovelLabel> findAnzhiNovelLabelAll(int size,int pageNum,String condition){
		return this.excuteQuery(new AnzhiNovelLabel(),"anzhi_novel_label",size,pageNum,condition);
	}


}