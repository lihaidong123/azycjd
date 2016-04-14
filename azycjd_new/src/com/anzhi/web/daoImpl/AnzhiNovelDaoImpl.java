package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import java.sql.Timestamp;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiNovel;
import com.anzhi.web.pojo.AnzhiNovelMultiJoinNovel;
import com.anzhi.web.dao.IAnzhiNovelDao;
import java.util.Date;
@Repository
public class AnzhiNovelDaoImpl extends ActionDb implements IAnzhiNovelDao {
	public Pojo addAnzhiNovel(AnzhiNovel anzhinovel){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_novel values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		pojo.setObj(new Object[]{
			anzhinovel.getNovelTitle(),
			anzhinovel.getNovelSummary(),
			anzhinovel.getAuthorId(),
			anzhinovel.getState(),
			anzhinovel.getAddTime(),
			anzhinovel.getUpdateTime(),
			anzhinovel.getNovelType(),
			anzhinovel.getVote(),
			novelImg(anzhinovel.getNovelImg()),
			anzhinovel.getNovelLabel(),
			anzhinovel.getAuthorizationLevel(),
			anzhinovel.getCategories(),
			anzhinovel.getLeadingRole(),
			anzhinovel.getSupportingRole(),
			anzhinovel.getHtmlState(),
			anzhinovel.getClickNum(),
			anzhinovel.getMyEditor(),
			anzhinovel.getPostedWay(),
			anzhinovel.getEnName(),
			anzhinovel.getReadNum(),
			anzhinovel.getIsSigned(),
			anzhinovel.getIsJinbi(),
			anzhinovel.getIsWangwen(),
			anzhinovel.getTotalRecommand(),
			anzhinovel.getTotalCharNum(),
			anzhinovel.getTotalSaveNum(),
			anzhinovel.getTotalDingyueNum(),
			anzhinovel.getTotalShangNum(),
			anzhinovel.getTotalCommentNum()
		});
		return pojo;
	}

	public boolean addBatchAnzhiNovel(List<AnzhiNovel> list){
		return this.excuteBatchUpdate("insert into anzhi_novel values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",list);
	}

	public Pojo delAnzhiNovel(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_novel where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiNovel(String ids){
		return this.excuteBatchUpdate("delete from anzhi_novel where id=?",ids);
	}

	public Pojo updateAnzhiNovel(AnzhiNovel anzhinovel){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_novel set novel_title=?,novel_summary=?,novel_type=?,vote=?,novel_img=?,novel_label=?,authorization_level=?,categories=?,leading_role=?,supporting_role=?,my_editor=?,posted_way=?,en_name=?,is_jinbi=?,is_wangwen=?,is_signed=? where id=?");
		pojo.setObj(new Object[]{
			anzhinovel.getNovelTitle(),
			anzhinovel.getNovelSummary(),
			anzhinovel.getNovelType(),
			anzhinovel.getVote(),
			novelImg(anzhinovel.getNovelImg()),
			anzhinovel.getNovelLabel(),
			anzhinovel.getAuthorizationLevel(),
			anzhinovel.getCategories(),
			anzhinovel.getLeadingRole(),
			anzhinovel.getSupportingRole(),
			anzhinovel.getMyEditor(),
			anzhinovel.getPostedWay(),
			anzhinovel.getEnName(),
			anzhinovel.getIsJinbi(),
			anzhinovel.getIsWangwen(),
			anzhinovel.getIsSigned(),
			anzhinovel.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiNovel> findAnzhiNovelAll(int size,int pageNum,String condition,String orderField){
		return this.excuteQuery(new AnzhiNovel(),"anzhi_novel_view",size,pageNum,condition,orderField);
	}

	public QueryList<AnzhiNovel> findAnzhiNovelAll(int size, int pageNum,
			String condition, String orderField, String recommandPosition) {
		if(condition==null){
			condition="";
		}
		condition+=" and recommend_position='"+recommandPosition+"'";
		return this.excuteQuery(new AnzhiNovel(),"anzhi_novel_recommand_view",size,pageNum,condition,orderField);
	}
	
	public QueryList<AnzhiNovel> findAnzhiNovelPaiHangBang(int size,
			int pageNum, String condition,String tabName) {
		return this.excuteQuery(new AnzhiNovel(),tabName,size,pageNum,condition,"num");
	}

	public QueryList<AnzhiNovel> findAnzhiNovelYouHui(int size, int pageNum,String condition) {
		return this.excuteQuery(new AnzhiNovel(),"anzhi_novel_discounted_view",size,pageNum,condition,"discounted_id");
	}

	public QueryList<AnzhiNovelMultiJoinNovel> findAnzhiNovelMultiJoinNovelAll(
			int size, int pageNum, String condition, String orderField) {
		return this.excuteQuery(new AnzhiNovelMultiJoinNovel(),"anzhi_novel_multi_join_novel",size,pageNum,condition,orderField);
	}

	public QueryList<AnzhiNovel> shuku(int size, int pageNum, String condition,
			String orderField) {
		return this.shuku(new AnzhiNovel(), "anzhi_novel_view", size, pageNum, condition, orderField);
	}

	
	public String novelImg(String novelImg){
		String[] arr=novelImg.split("UploadImages");
		if(arr.length==2){
			novelImg=projectName+"/UploadImages"+arr[1];
		}
		return novelImg;
	}

	public QueryList<AnzhiNovel> findAnzhiNovelThirdRecommand(int size,
			int pageNum, String condition) {
		return this.excuteQuery(new AnzhiNovel(),"anzhi_third_recommand_view",size,pageNum,condition);
	}

}