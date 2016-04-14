package com.anzhi.web.serviceImpl;
import java.util.List;
import java.util.ArrayList;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.anzhi.web.pojo.AnzhiRecommend;
import com.anzhi.web.dao.IAnzhiRecommendDao;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.service.IAnzhiRecommendService;
import com.anzhi.web.util.QueryList;
@Service
public class AnzhiRecommendServiceImpl extends ActionDb  implements IAnzhiRecommendService {
	@Autowired
	private IAnzhiRecommendDao anzhirecommendDao;
	public boolean addAnzhiRecommend(AnzhiRecommend anzhirecommend){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhirecommendDao.addAnzhiRecommend(anzhirecommend));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean addBatchAnzhiRecommend(List<AnzhiRecommend> list){
		return anzhirecommendDao.addBatchAnzhiRecommend(list);
	}

	public boolean delAnzhiRecommend(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhirecommendDao.delAnzhiRecommend(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiRecommend(String ids){
		return anzhirecommendDao.delBatchAnzhiRecommend(ids);
	}

	public boolean updateAnzhiRecommend(AnzhiRecommend anzhirecommend){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhirecommendDao.updateAnzhiRecommend(anzhirecommend));
		this.excuteUpdate(pojoList);
		return true;
	}

	public QueryList<AnzhiRecommend> findAnzhiRecommendAll(int size,int pageNum,String condition){
		return anzhirecommendDao.findAnzhiRecommendAll(size,pageNum,condition);
	}

	public boolean addAnzhiRecommend(AnzhiRecommend anzhirecommend,
			String recommendPost, String recommendPosition, String vote,
			String[] b,int memberId) {
		List<Pojo> pojoList=new ArrayList<Pojo>();
		for(int i=0;i<b.length;i++){
			AnzhiRecommend azrecommend =new AnzhiRecommend();
			azrecommend.setNovelId(Integer.parseInt(b[i]));
			azrecommend.setAddMemberId(memberId);
			azrecommend.setState(0);
			azrecommend.setAddTime(this.getNowTime());
			azrecommend.setRecommendPost(recommendPost);
			azrecommend.setRecommendPosition(recommendPosition);
			azrecommend.setVote(vote);
			pojoList.add(anzhirecommendDao.addAnzhiRecommend(azrecommend));
		}
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean updateAnzhiRecommend(AnzhiRecommend anzhirecommend,
			String recommendPost, String recommendPosition, String vote,
			String[] b, int memberId,int id) {
		List<Pojo> pojoList=new ArrayList<Pojo>();
		for(int i=0;i<b.length;i++){
			AnzhiRecommend azrecommend =new AnzhiRecommend();
			azrecommend.setNovelId(Integer.parseInt(b[i]));
			azrecommend.setAddMemberId(memberId);
			azrecommend.setState(0);
			azrecommend.setAddTime(this.getNowTime());
			azrecommend.setRecommendPost(recommendPost);
			azrecommend.setRecommendPosition(recommendPosition);
			azrecommend.setVote(vote);
			azrecommend.setId(id);
			pojoList.add(anzhirecommendDao.updateAnzhiRecommend(azrecommend));
		}
		if(recommendPosition.equals("121")){//如果是大神推荐作家的作品
			pojoList.add(anzhirecommendDao.updateAnzhiRecommend("121"));
		}
		this.excuteUpdate(pojoList);
		return true;
	}


}