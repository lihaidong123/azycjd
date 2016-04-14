package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import java.sql.Timestamp;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiPicture;
import com.anzhi.web.dao.IAnzhiPictureDao;
import java.util.Date;
@Repository
public class AnzhiPictureDaoImpl extends ActionDb implements IAnzhiPictureDao {
	public Pojo addAnzhiPicture(AnzhiPicture anzhipicture){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_picture values(?,?,?,?,?,?)");
		pojo.setObj(new Object[]{
			anzhipicture.getPictureName(),
			anzhipicture.getPictureUrl(),
			anzhipicture.getPictureVote(),
			anzhipicture.getPictureType(),
			anzhipicture.getState(),
			anzhipicture.getAddTime()
		});
		return pojo;
	}

	public boolean addBatchAnzhiPicture(List<AnzhiPicture> list){
		return this.excuteBatchUpdate("insert into anzhi_picture values(?,?,?,?,?,?)",list);
	}

	public Pojo delAnzhiPicture(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_picture where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiPicture(String ids){
		return this.excuteBatchUpdate("delete from anzhi_picture where id=?",ids);
	}

	public Pojo updateAnzhiPicture(AnzhiPicture anzhipicture){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_picture set picture_name=?,picture_url=?,picture_vote=?,picture_type=?,state=?,add_time=? where id=?");
		pojo.setObj(new Object[]{
			anzhipicture.getPictureName(),
			anzhipicture.getPictureUrl(),
			anzhipicture.getPictureVote(),
			anzhipicture.getPictureType(),
			anzhipicture.getState(),
			anzhipicture.getAddTime()
		,	anzhipicture.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiPicture> findAnzhiPictureAll(int size,int pageNum,String condition){
		return this.excuteQuery(new AnzhiPicture(),"anzhi_picture",size,pageNum,condition);
	}

	public Pojo updateAnzhiPicture(int pictureType) {
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_picture set state=0 where picture_type=?");
		pojo.setObj(new Object[]{
			pictureType
		});
		return pojo;
	}


}