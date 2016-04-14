package com.anzhi.web.serviceImpl;
import java.util.List;
import java.util.ArrayList;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.anzhi.web.pojo.AnzhiChapter;
import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.pojo.AnzhiNovelMultifunction;
import com.anzhi.web.dao.IAnzhiChapterDao;
import com.anzhi.web.dao.IAnzhiNovelMultifunctionDao;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.service.IAnzhiNovelMultifunctionService;
import com.anzhi.web.util.QueryList;
@Service
public class AnzhiNovelMultifunctionServiceImpl extends ActionDb  implements IAnzhiNovelMultifunctionService {
	@Autowired
	private IAnzhiNovelMultifunctionDao anzhinovelmultifunctionDao;
	@Autowired
	private IAnzhiChapterDao anzhichapterDao;
	public boolean addAnzhiNovelMultifunction(AnzhiNovelMultifunction anzhinovelmultifunction){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhinovelmultifunctionDao.addAnzhiNovelMultifunction(anzhinovelmultifunction));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean addBatchAnzhiNovelMultifunction(List<AnzhiNovelMultifunction> list){
		return anzhinovelmultifunctionDao.addBatchAnzhiNovelMultifunction(list);
	}

	public boolean delAnzhiNovelMultifunction(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhinovelmultifunctionDao.delAnzhiNovelMultifunction(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiNovelMultifunction(String ids){
		return anzhinovelmultifunctionDao.delBatchAnzhiNovelMultifunction(ids);
	}

	public boolean updateAnzhiNovelMultifunction(AnzhiNovelMultifunction anzhinovelmultifunction){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhinovelmultifunctionDao.updateAnzhiNovelMultifunction(anzhinovelmultifunction));
		this.excuteUpdate(pojoList);
		return true;
	}

	public QueryList<AnzhiNovelMultifunction> findAnzhiNovelMultifunctionAll(int size,int pageNum,String condition,int type,int loginid){
		QueryList<AnzhiNovelMultifunction> list=anzhinovelmultifunctionDao.findAnzhiNovelMultifunctionAll(size, pageNum, condition);
		if(type==4){//查询点赞的小说
			list=anzhinovelmultifunctionDao.findAnzhiNovelMultifunctionAll(size,pageNum, " and action_type=4 and member_id="+loginid);
		}else if(type==3){//查询推荐作品
			list=anzhinovelmultifunctionDao.findAnzhiNovelMultifunctionAll(size,pageNum, " and action_type=3 and member_id="+loginid);
			this.getNewNovel(list.getList());
		}else if(type==2){//查询推荐票
			list=anzhinovelmultifunctionDao.findAnzhiNovelMultifunctionAll(size,pageNum, " and action_type=2 and member_id="+loginid);
		}else if(type==1){//查询小说收藏
			list=anzhinovelmultifunctionDao.findAnzhiNovelMultifunctionAll(size,pageNum, " and action_type=1 and member_id="+loginid);
			this.getNewNovel(list.getList());
		}else if(type==0){//查询小说点击
			list=anzhinovelmultifunctionDao.findAnzhiNovelMultifunctionAll(size,pageNum, " and action_type=0 and member_id="+loginid);
		}
		return list;
	}
	
	/**
	 * 查询所推荐的书的最新一章
	 * 
	 */
	public void getNewNovel(List<AnzhiNovelMultifunction> list){
		if(list!=null){
			for(AnzhiNovelMultifunction ac:list){
				QueryList<AnzhiChapter> clist=anzhichapterDao.findAnzhiChapterAll(1, 1, " and novel_id="+ac.getNovelId());
				if(clist.getList().size()!=0){
					ac.setNewNovelName(clist.getList().get(0).getChapterTitle());
					ac.setNewNovelchapterNum(clist.getList().get(0).getChapterCharNum());
				}else{
					ac.setNewNovelName("");
					ac.setNewNovelchapterNum(0);
				}
			}
		}
	}


	public boolean saveAnzhiNovelMultifunction(
			AnzhiNovelMultifunction anzhinovelmultifunction) {
		if(anzhinovelmultifunction.getActionType()!=null&&anzhinovelmultifunction.getNovelId()!=null){
			//修改小说的基本信息
			if(anzhinovelmultifunction.getActionType().equals(1)){
				this.updateTableFieldAppend("anzhi_novel", anzhinovelmultifunction.getNovelId(), "total_save_num", 1);
			}
			//添加anzhi_novel_multifunction记录
			anzhinovelmultifunction.setAddTime(getNowTime());
			anzhinovelmultifunction.setState(0);
			List<Pojo> pojoList=new ArrayList<Pojo>();
			pojoList.add(anzhinovelmultifunctionDao.addAnzhiNovelMultifunction(anzhinovelmultifunction));
			this.excuteUpdate(pojoList);
		}
		return false;
	}


	public QueryList<AnzhiNovelMultifunction> findAnzhiNovelMultifunctionAll(
			int size, int pageNum, String condition) {
		return anzhinovelmultifunctionDao.findAnzhiNovelMultifunctionAll(size, pageNum, condition);
	}

	public boolean delAnzhiNovelMultifunction(int novelId, int memberId,
			int actionType) {
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhinovelmultifunctionDao.delAnzhiNovelMultifunction(novelId, memberId, actionType));
		this.excuteUpdate(pojoList);
		return true;
	}

}