package com.anzhi.web.service;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.pojo.AnzhiPicture;
public interface IAnzhiPictureService {
	public boolean addAnzhiPicture(AnzhiPicture anzhipicture);
	public boolean addBatchAnzhiPicture(List<AnzhiPicture> list);
	public boolean delAnzhiPicture(int id);
	public boolean delBatchAnzhiPicture(String ids);
	public boolean updateAnzhiPicture(AnzhiPicture anzhipicture);
	public QueryList<AnzhiPicture> findAnzhiPictureAll(int size,int pageNum,String condition);

}