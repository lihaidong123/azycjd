package com.anzhi.web.serviceImpl;
import java.util.List;
import java.util.ArrayList;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.pojo.AnzhiConsume;
import com.anzhi.web.pojo.AuthorNovelConsume;
import com.anzhi.web.dao.IAnzhiConsumeDao;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.service.IAnzhiConsumeService;
import com.anzhi.web.util.QueryList;
@Service
public class AnzhiConsumeServiceImpl extends ActionDb  implements IAnzhiConsumeService {
	@Autowired
	private IAnzhiConsumeDao anzhiconsumeDao;
	public boolean addAnzhiConsume(AnzhiConsume anzhiconsume){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiconsumeDao.addAnzhiConsume(anzhiconsume));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean addBatchAnzhiConsume(List<AnzhiConsume> list){
		return anzhiconsumeDao.addBatchAnzhiConsume(list);
	}

	public boolean delAnzhiConsume(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiconsumeDao.delAnzhiConsume(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiConsume(String ids){
		return anzhiconsumeDao.delBatchAnzhiConsume(ids);
	}

	public boolean updateAnzhiConsume(AnzhiConsume anzhiconsume){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhiconsumeDao.updateAnzhiConsume(anzhiconsume));
		this.excuteUpdate(pojoList);
		return true;
	}

	public QueryList<AnzhiConsume> findAnzhiConsumeAll(int size,int pageNum,String condition,int loginid){
		QueryList<AnzhiConsume> list= anzhiconsumeDao.findAnzhiConsumeAll(size,pageNum," and member_id="+loginid);
		this.getConsumeName(list.getList());
		return list;
	}
	
	/**
	 * 查询消费的名称
	 * 
	 */
	public void getConsumeName(List<AnzhiConsume> list){
		for(AnzhiConsume ac:list){
			if(ac.getTableType().equals(0)){//查询小说名称
				ac.setConsumeName(ac.getNovelTitle());
			}else{//查询章节
				ac.setConsumeName(this.getStringBySqlDb("select chapter_title from anzhi_chapter where id="+ac.getTableType()));
			}
		}
	}

	public QueryList<AnzhiConsume> findAnzhiConsumeAll(int size, int pageNum,String condition) {
		QueryList<AnzhiConsume> list= anzhiconsumeDao.findAnzhiConsumeAll(size, pageNum, condition);
		getConsumeName(list.getList());
		return list;
	}

	public QueryList<AnzhiConsume> findAnzhiConsumeMyCome(int size,	int pageNum, String condition, int loginid) {
		QueryList<AnzhiConsume> list= anzhiconsumeDao.findAnzhiConsumeAll(size,pageNum," and member_id="+loginid+"");
		getConsumeMoney(list.getList(),loginid);
		return list;
	}
	/**
	 * 查询作者名下每本小说的总收入
	 * 
	 */
	public void getConsumeMoney(List<AnzhiConsume> list,int loginid){
		for(AnzhiConsume ac:list){
			ac.setNovelMoney(this.getIntBySqlDb("select sum(consume_anzhi_money) from anzhi_consumenovel_view where table_id="+ac.getTableId()+" and member_id="+loginid));
		}
	}
	/*按月查询小说的收入
	 * (non-Javadoc)
	 * @see com.anzhi.web.service.IAnzhiConsumeService#findAnzhiConsumeMyComeByMonth(int, int, java.lang.String, int, int)
	 */
	public List<AuthorNovelConsume> findAnzhiConsumeMyComeByMonth(int size,int pageNum, String condition, int memberid,int novelid) {
		return this.excuteQuery(new AuthorNovelConsume(), "select convert(varchar(7),consume_time,120) as a,sum(consume_anzhi_money) as money,sum(case when consume_type=0 then consume_anzhi_money end ) as dashang,sum(case when consume_type=1 then consume_anzhi_money end ) as vipread  FROM anzhi_consumenovel_view  where member_id="+memberid+" and table_id= "+novelid+" group by convert(varchar(7),consume_time,120) order by convert(varchar(7),consume_time,120) desc");
	}


}