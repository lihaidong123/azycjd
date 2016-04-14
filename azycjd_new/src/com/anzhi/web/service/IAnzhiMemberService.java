package com.anzhi.web.service;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.anzhi.web.util.QueryList;
import com.anzhi.web.pojo.AnzhiMember;
public interface IAnzhiMemberService {
	public boolean addAnzhiMember(AnzhiMember anzhimember);
	public AnzhiMember addAnzhiMember(AnzhiMember anzhimember,String thirdLoginPid,int type);
	public boolean addBatchAnzhiMember(List<AnzhiMember> list);
	public boolean delAnzhiMember(int id);
	public boolean delBatchAnzhiMember(String ids);
	public boolean updateAnzhiMember(AnzhiMember anzhimember,int types);
	public QueryList<AnzhiMember> findAnzhiMemberAll(int size,int pageNum,String condition);
	public String memberInfo(HttpServletRequest request,AnzhiMember am);
	public void everyDayTask(HttpServletRequest request,AnzhiMember t);
	public void addChongzhi(HttpServletRequest request, String anzhiTradeNo);
	public String piliangReadMoney(HttpServletRequest request);
	public void basicInfo(HttpServletRequest request,AnzhiMember am);
}