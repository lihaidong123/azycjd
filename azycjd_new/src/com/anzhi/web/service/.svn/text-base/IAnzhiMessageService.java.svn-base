package com.anzhi.web.service;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.anzhi.web.util.QueryList;
import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.pojo.AnzhiMessage;
public interface IAnzhiMessageService {
	public boolean addAnzhiMessage(AnzhiMessage anzhimessage);
	public String addAnzhiMessage(AnzhiMessage anzhimessage,HttpServletRequest request,AnzhiMember am,String answer);
	public boolean addBatchAnzhiMessage(List<AnzhiMessage> list);
	public boolean delAnzhiMessage(int id);
	public boolean delBatchAnzhiMessage(String ids);
	public boolean updateAnzhiMessage(AnzhiMessage anzhimessage);
	public QueryList<AnzhiMessage> findAnzhiMessageAll(int size,int pageNum,String condition);
	public void loadNoReadMessage(HttpServletRequest request,AnzhiMember am);
}