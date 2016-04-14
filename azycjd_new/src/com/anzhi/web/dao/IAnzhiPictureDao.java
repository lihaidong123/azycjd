package com.anzhi.web.dao;
import java.util.List;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.pojo.AnzhiPicture;
public interface IAnzhiPictureDao {
	public Pojo addAnzhiPicture(AnzhiPicture anzhipicture);
	public boolean addBatchAnzhiPicture(List<AnzhiPicture> list);
	public Pojo delAnzhiPicture(int id);
	public Pojo updateAnzhiPicture(int pictureType);
	public boolean delBatchAnzhiPicture(String ids);
	public Pojo updateAnzhiPicture(AnzhiPicture anzhipicture);
	public QueryList<AnzhiPicture> findAnzhiPictureAll(int size,int pageNum,String condition);

}