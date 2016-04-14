package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import java.sql.Timestamp;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.dao.IAnzhiMemberDao;
import java.util.Date;
@Repository
public class AnzhiMemberDaoImpl extends ActionDb implements IAnzhiMemberDao {
	public Pojo addAnzhiMember(AnzhiMember anzhimember){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_member values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		pojo.setObj(new Object[]{
			anzhimember.getMemberNo(),
			anzhimember.getMenberPassword(),
			anzhimember.getMemberNick(),
			anzhimember.getMemberHeadImg(),
			anzhimember.getMemberQq(),
			anzhimember.getMemberSex(),
			anzhimember.getMemberAddress(),
			anzhimember.getAddTime(),
			anzhimember.getMemberBirthday(),
			anzhimember.getMemberEmail(),
			anzhimember.getVote(),
			anzhimember.getIsAccptMessage(),
			anzhimember.getBookshelfPublic(),
			anzhimember.getMemberRealName(),
			anzhimember.getMemberCode(),
			anzhimember.getMemberTel(),
			anzhimember.getMemberExperience(),
			anzhimember.getMemberType(),
			anzhimember.getMemberMoney(),
			anzhimember.getState(),
			anzhimember.getIsAddComment(),
			anzhimember.getIsNoLogin(),
			anzhimember.getReadMoney()
		});
		return pojo;
	}

	public boolean addBatchAnzhiMember(List<AnzhiMember> list){
		return this.excuteBatchUpdate("insert into anzhi_member values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",list);
	}

	public Pojo delAnzhiMember(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_member where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiMember(String ids){
		return this.excuteBatchUpdate("delete from anzhi_member where id=?",ids);
	}

	public Pojo updateAnzhiMember(AnzhiMember anzhimember){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_member set member_no=?,menber_password=?,member_nick=?,member_head_img=?,member_qq=?,member_sex=?,member_address=?,add_time=?,member_birthday=?,member_email=?,vote=?,is_accpt_message=?,bookshelf_public=?,member_real_name=?,member_code=?,member_tel=?,member_experience=?,state=?,is_add_comment=?,is_no_login=?,member_type=? where id=?");
		pojo.setObj(new Object[]{
			anzhimember.getMemberNo(),
			anzhimember.getMenberPassword(),
			anzhimember.getMemberNick(),
			anzhimember.getMemberHeadImg(),
			anzhimember.getMemberQq(),
			anzhimember.getMemberSex(),
			anzhimember.getMemberAddress(),
			anzhimember.getAddTime(),
			anzhimember.getMemberBirthday(),
			anzhimember.getMemberEmail(),
			anzhimember.getVote(),
			anzhimember.getIsAccptMessage(),
			anzhimember.getBookshelfPublic(),
			anzhimember.getMemberRealName(),
			anzhimember.getMemberCode(),
			anzhimember.getMemberTel(),
			anzhimember.getMemberExperience(),
			anzhimember.getState(),
			anzhimember.getIsAddComment(),
			anzhimember.getIsNoLogin(),
			anzhimember.getMemberType()
		,	anzhimember.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiMember> findAnzhiMemberAll(int size,int pageNum,String condition){
		return this.excuteQuery(new AnzhiMember(),"anzhi_member",size,pageNum,condition);
	}


}