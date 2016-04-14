package com.anzhi.web.serviceImpl;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anzhi.web.dao.IAnzhiAuthorDao;
import com.anzhi.web.dao.IAnzhiMemberDao;
import com.anzhi.web.dao.IAnzhiMessageDao;
import com.anzhi.web.pojo.AnzhiAuthor;
import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.pojo.AnzhiMessage;
import com.anzhi.web.service.IAnzhiMessageService;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.util.QueryList;
@Service
public class AnzhiMessageServiceImpl extends ActionDb  implements IAnzhiMessageService {
	@Autowired
	private IAnzhiMessageDao anzhimessageDao;
	@Autowired
	private IAnzhiMemberDao anzhimemberDao;
	@Autowired
	private IAnzhiAuthorDao anzhiauthorDao;
	public boolean addAnzhiMessage(AnzhiMessage anzhimessage){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhimessageDao.addAnzhiMessage(anzhimessage));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean addBatchAnzhiMessage(List<AnzhiMessage> list){
		return anzhimessageDao.addBatchAnzhiMessage(list);
	}

	public boolean delAnzhiMessage(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhimessageDao.delAnzhiMessage(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiMessage(String ids){
		return anzhimessageDao.delBatchAnzhiMessage(ids);
	}

	public boolean updateAnzhiMessage(AnzhiMessage anzhimessage){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhimessageDao.updateAnzhiMessage(anzhimessage));
		this.excuteUpdate(pojoList);
		return true;
	}

	public QueryList<AnzhiMessage> findAnzhiMessageAll(int size,int pageNum,String condition){
		return anzhimessageDao.findAnzhiMessageAll(size,pageNum,condition);
	}

	public String addAnzhiMessage(AnzhiMessage anzhimessage,
			HttpServletRequest request, AnzhiMember am,String answer) {
		boolean isAdmin=false;
		if(answer.equals("yes")){
			if(this.checkParam(request, "isAdmin")){
				if(request.getParameter("isAdmin").equals("yes")){
					isAdmin=true;
				}
			}
			QueryList<AnzhiMember> ls=anzhimemberDao.findAnzhiMemberAll(10, 1, " and (member_no='"+request.getParameter("jieshouren")+"' or member_nick='"+request.getParameter("jieshouren")+"')");
			if(ls.getList().size()==0){
				QueryList<AnzhiAuthor> authorLisy=anzhiauthorDao.findAnzhiAuthorAll(1, 1, " and author_writer_name='"+request.getParameter("jieshouren")+"'");
				if(authorLisy.getList().size()==0){
					return "接收人账号或昵称不存在!";
				}
				int memberId=authorLisy.getList().get(0).getMemberId();
				ls=anzhimemberDao.findAnzhiMemberAll(1,1," and id="+memberId);
				if(ls.getList().size()==0){
					return "接收人账号或昵称不存在!";
				}
			}
			AnzhiMember jieShouMember=ls.getList().get(0);
			boolean isAccptMessage=false;
			if(jieShouMember.getIsAccptMessage().equals(1)){//仅接受好友
				int n=this.getIntBySqlDb("select count(*) from anzhi_friend where member_id="+jieShouMember.getId()+" and friend_member_id="+am.getId());
				isAccptMessage=n==0?false:true;
			}else if(jieShouMember.getIsAccptMessage().equals(2)){//接受所有人
				isAccptMessage=true;
			}
			
			if(!isAccptMessage&&!isAdmin){
				return "对不起，该用户设置了隐私权限，您不能给他发送消息!";
			}
			
			anzhimessage.setAddTime(this.getNowTime());
			anzhimessage.setMemberIdReceive(ls.getList().get(0).getId());
			anzhimessage.setMemberIdSend(am.getId());
			anzhimessage.setMessageRead(0);
			anzhimessage.setVote("");
			
			List<Pojo> pojoList=new ArrayList<Pojo>();
			pojoList.add(anzhimessageDao.addAnzhiMessage(anzhimessage));
			this.excuteUpdate(pojoList);
			return "yes";
		}else{
			return answer;
		}
		
		
	}

	public void loadNoReadMessage(HttpServletRequest request, AnzhiMember am) {
		String inf="";
		if(am!=null){
			String condition="";
			List<Integer> yetReadId=new ArrayList<Integer>();
			if(request.getSession().getAttribute("yetReadId")!=null&&request.getSession().getAttribute("noReadMessageInfo")==null){
				yetReadId=(List<Integer>)request.getSession().getAttribute("yetReadId");
				if(yetReadId.size()!=0){
					condition+=" and id not in (";
					for(Integer d:yetReadId){
						condition+=d+",";
					}
					condition=condition.substring(0,condition.length()-1);
					condition+=")";
				}
			}
			int duZheNum=this.getIntBySqlDb("select count(*) from anzhi_message where member_id_receive="+am.getId()+" and message_read=0 and message_type=1");
			int zuoJiaNum=this.getIntBySqlDb("select count(*) from anzhi_message where member_id_receive="+am.getId()+" and message_read=0 and message_type=2");
			int xitongNum=this.getIntBySqlDb("select count(*) from anzhi_message where member_id_receive="+am.getId()+" and message_read=0 and message_type=3 "+condition);
			/*inf+=duZheNum==0?"":"<p>您有"+duZheNum+"条读者消息未读</p>";	
			inf+=zuoJiaNum==0?"":"<p>您有"+zuoJiaNum+"条作家消息未读</p>";	*/
			inf+=xitongNum==0?"":"您有"+xitongNum+"条系统消息未读";
			
			
			
			if(xitongNum!=0){
				QueryList<AnzhiMessage> ls=anzhimessageDao.findAnzhiMessageAll(500, 1, " and member_id_receive="+am.getId()+" and message_read=0 and message_type=3 "+condition);
				for(AnzhiMessage aam:ls.getList()){
					if(!yetReadId.contains(aam.getId())){
						yetReadId.add(aam.getId());
					}
				}
				request.getSession().setAttribute("yetReadId",yetReadId);
			}
			
			if(duZheNum!=0){
				request.getSession().setAttribute("duZheNum",duZheNum);
			}else{
				request.getSession().removeAttribute("duZheNum");
			}
			if(zuoJiaNum!=0){
				request.getSession().setAttribute("zuoJiaNum",zuoJiaNum);
			}else{
				request.getSession().removeAttribute("zuoJiaNum");
			}
		}
		if(!inf.equals("")){
			request.getSession().setAttribute("noReadMessageInfo",inf);
		}
	}


}