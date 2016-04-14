package com.anzhi.web.daoImpl;
import java.util.List;
import org.springframework.stereotype.Repository;
import java.sql.Timestamp;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiMessage;
import com.anzhi.web.dao.IAnzhiMessageDao;
import java.util.Date;
@Repository
public class AnzhiMessageDaoImpl extends ActionDb implements IAnzhiMessageDao {
	public Pojo addAnzhiMessage(AnzhiMessage anzhimessage){
		Pojo pojo=new Pojo();
		pojo.setSql("insert into anzhi_message values(?,?,?,?,?,?,?,?)");
		pojo.setObj(new Object[]{
			anzhimessage.getMemberIdReceive(),
			anzhimessage.getMemberIdSend(),
			anzhimessage.getMessageTitle(),
			anzhimessage.getMessageContent(),
			anzhimessage.getMessageType(),
			anzhimessage.getMessageRead(),
			anzhimessage.getAddTime(),
			anzhimessage.getVote()
		});
		return pojo;
	}

	public boolean addBatchAnzhiMessage(List<AnzhiMessage> list){
		return this.excuteBatchUpdate("insert into anzhi_message values(?,?,?,?,?,?,?,?)",list);
	}

	public Pojo delAnzhiMessage(int id){
		Pojo pojo=new Pojo();
		pojo.setSql("delete from anzhi_message where id=?");
		pojo.setObj(new Object[]{id});
		return pojo;
	}

	public boolean delBatchAnzhiMessage(String ids){
		return this.excuteBatchUpdate("delete from anzhi_message where id=?",ids);
	}

	public Pojo updateAnzhiMessage(AnzhiMessage anzhimessage){
		Pojo pojo=new Pojo();
		pojo.setSql("update anzhi_message set member_id_receive=?,member_id_send=?,message_title=?,message_content=?,message_type=?,message_read=?,add_time=?,vote=? where id=?");
		pojo.setObj(new Object[]{
			anzhimessage.getMemberIdReceive(),
			anzhimessage.getMemberIdSend(),
			anzhimessage.getMessageTitle(),
			anzhimessage.getMessageContent(),
			anzhimessage.getMessageType(),
			anzhimessage.getMessageRead(),
			anzhimessage.getAddTime(),
			anzhimessage.getVote()
		,	anzhimessage.getId()
		});
		return pojo;
	}

	public QueryList<AnzhiMessage> findAnzhiMessageAll(int size,int pageNum,String condition){
		return this.excuteQuery(new AnzhiMessage(),"anzhi_message_view",size,pageNum,condition);
	}


}