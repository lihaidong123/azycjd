package com.anzhi.web.serviceImpl;
import java.util.List;
import java.util.ArrayList;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.pojo.AnzhiPicture;
import com.anzhi.web.dao.IAnzhiPictureDao;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.service.IAnzhiPictureService;
import com.anzhi.web.util.QueryList;
@Service
public class AnzhiPictureServiceImpl extends ActionDb  implements IAnzhiPictureService {
	@Autowired
	private IAnzhiPictureDao anzhipictureDao;
	public boolean addAnzhiPicture(AnzhiPicture anzhipicture){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		updateAnzhiPictureState(anzhipicture,pojoList);
		pojoList.add(anzhipictureDao.addAnzhiPicture(anzhipicture));
		this.excuteUpdate(pojoList);
		return true;
	}

	public void updateAnzhiPictureState(AnzhiPicture anzhipicture,List<Pojo> pojoList){
		if(anzhipicture.getState().equals(1)){
			pojoList.add(anzhipictureDao.updateAnzhiPicture(anzhipicture.getPictureType()));
		}
	}
	
	public boolean addBatchAnzhiPicture(List<AnzhiPicture> list){
		return anzhipictureDao.addBatchAnzhiPicture(list);
	}

	public boolean delAnzhiPicture(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhipictureDao.delAnzhiPicture(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiPicture(String ids){
		return anzhipictureDao.delBatchAnzhiPicture(ids);
	}

	public boolean updateAnzhiPicture(AnzhiPicture anzhipicture){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		updateAnzhiPictureState(anzhipicture,pojoList);
		pojoList.add(anzhipictureDao.updateAnzhiPicture(anzhipicture));
		this.excuteUpdate(pojoList);
		return true;
	}

	public QueryList<AnzhiPicture> findAnzhiPictureAll(int size,int pageNum,String condition){
		return anzhipictureDao.findAnzhiPictureAll(size,pageNum,condition);
	}


}