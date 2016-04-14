package com.anzhi.web.service;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.pojo.AnzhiThirdLogin;
public interface IAnzhiThirdLoginService {
	public boolean addAnzhiThirdLogin(AnzhiThirdLogin anzhithirdlogin);
	public boolean addBatchAnzhiThirdLogin(List<AnzhiThirdLogin> list);
	public boolean delAnzhiThirdLogin(int id);
	public boolean delBatchAnzhiThirdLogin(String ids);
	public boolean updateAnzhiThirdLogin(AnzhiThirdLogin anzhithirdlogin);
	public QueryList<AnzhiThirdLogin> findAnzhiThirdLoginAll(int size,int pageNum,String condition);

}