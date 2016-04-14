package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import java.sql.Timestamp;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiOtherContent;
import com.anzhi.web.dao.IAnzhiOtherContentDao;
import java.util.Date;
@Repository
public class AnzhiOtherContentDaoImpl extends ActionDb implements IAnzhiOtherContentDao {
	public Pojo addAnzhiOtherContent(AnzhiOtherContent anzhiothercontent){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_other_content values(?,?,?,?,?,?,?,?,?,?,?,?)");
		pojo.setObj(new Object[]{
			anzhiothercontent.getAbotus(),
			anzhiothercontent.getYonghuzhinan(),
			anzhiothercontent.getZuozhetougao(),
			anzhiothercontent.getChengpinyingcai(),
			anzhiothercontent.getLianxiwomen(),
			anzhiothercontent.getBianjizhuanqu(),
			anzhiothercontent.getBanquanweihu(),
			anzhiothercontent.getWangzhanqianyuefuli(),
			anzhiothercontent.getYuanchuangmaiduanfuli(),
			anzhiothercontent.getPingtaiqianyuefuli(),
			anzhiothercontent.getAnzhizuojiapeixun(),
			anzhiothercontent.getHuodongzhuanqu()
		});
		return pojo;
	}

	public boolean addBatchAnzhiOtherContent(List<AnzhiOtherContent> list){
		return this.excuteBatchUpdate("insert into anzhi_other_content values(?,?,?,?,?,?,?,?,?,?,?)",list);
	}

	public Pojo delAnzhiOtherContent(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_other_content where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiOtherContent(String ids){
		return this.excuteBatchUpdate("delete from anzhi_other_content where id=?",ids);
	}

	public Pojo updateAnzhiOtherContent(AnzhiOtherContent anzhiothercontent){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_other_content set abotus=?,yonghuzhinan=?,zuozhetougao=?,chengpinyingcai=?,lianxiwomen=?,bianjizhuanqu=?,banquanweihu=?,wangzhanqianyuefuli=?,yuanchuangmaiduanfuli=?,pingtaiqianyuefuli=?,anzhizuojiapeixun=?,huodongzhuanqu=? where id=?");
		pojo.setObj(new Object[]{
			anzhiothercontent.getAbotus(),
			anzhiothercontent.getYonghuzhinan(),
			anzhiothercontent.getZuozhetougao(),
			anzhiothercontent.getChengpinyingcai(),
			anzhiothercontent.getLianxiwomen(),
			anzhiothercontent.getBianjizhuanqu(),
			anzhiothercontent.getBanquanweihu(),
			anzhiothercontent.getWangzhanqianyuefuli(),
			anzhiothercontent.getYuanchuangmaiduanfuli(),
			anzhiothercontent.getPingtaiqianyuefuli(),
			anzhiothercontent.getAnzhizuojiapeixun(),
			anzhiothercontent.getHuodongzhuanqu(),
			anzhiothercontent.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiOtherContent> findAnzhiOtherContentAll(int size,int pageNum,String condition){
		return this.excuteQuery(new AnzhiOtherContent(),"anzhi_other_content",size,pageNum,condition);
	}


}