package com.anzhi.web.serviceImpl;
import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anzhi.web.dao.IAnzhiChapterDao;
import com.anzhi.web.dao.IAnzhiNovelDao;
import com.anzhi.web.dao.IAnzhiThirdRecommandDao;
import com.anzhi.web.pojo.AnzhiChapter;
import com.anzhi.web.pojo.AnzhiNovel;
import com.anzhi.web.pojo.AnzhiThirdRecommand;
import com.anzhi.web.service.IAnzhiThirdRecommandService;
import com.anzhi.web.util.ActionDb;
import com.anzhi.web.util.Pojo;
import com.anzhi.web.util.QueryList;
import com.tadu.util.AddBook;
@Service
public class AnzhiThirdRecommandServiceImpl extends ActionDb  implements IAnzhiThirdRecommandService {
	@Autowired
	private IAnzhiThirdRecommandDao anzhithirdrecommandDao;
	@Autowired
	private IAnzhiNovelDao anzhinovelDao;
	@Autowired
	private IAnzhiChapterDao anzhichapterDao;
	public JSONObject addAnzhiThirdRecommand(AnzhiThirdRecommand anzhithirdrecommand,List list){
		JSONObject jsonBack=new JSONObject();
		List<Pojo> pojoList=new ArrayList<Pojo>();
		String resut="导入成功";
		boolean con=true;
		if(list!=null){
			for(int i=0;i<list.size();i++){
				try {
					Object[] obj=(Object[])list.get(i);
					AnzhiThirdRecommand at=new AnzhiThirdRecommand();
					at.setAddTime(getNowTime());
					at.setNovelId(Integer.parseInt(obj[1].toString()));
					at.setThirdType(anzhithirdrecommand.getThirdType());
					at.setRecommandVote(obj[3].toString());
					at.setRecommandState(0);
					pojoList.add(anzhithirdrecommandDao.addAnzhiThirdRecommand(at));
				} catch (Exception e) {
					resut="导入失败，第"+(i+1)+"行数据异常！";
					jsonBack.put("success", false);
					con=false;
					break;
				}
			}
		}
		if(con){
			this.excuteUpdate(pojoList);
			jsonBack.put("success", true);
			if(anzhithirdrecommand.getThirdType().equals(11)){
				//塔读
				for(int i=0;i<list.size();i++){
					try {
						Object[] obj=(Object[])list.get(i);
						JSONObject p=new JSONObject();
						QueryList<AnzhiNovel> ls=anzhinovelDao.findAnzhiNovelAll(1, 1, " and id="+Integer.parseInt(obj[1].toString()),"id");
						if(ls.getList().size()!=0){
							QueryList<AnzhiChapter> chap=anzhichapterDao.findAnzhiChapterAll(10000, 1, " and novel_id="+Integer.parseInt(obj[1].toString()));
							AddBook add=new AddBook(ls.getList().get(0),chap.getList());
						}
					} catch (Exception e) {
						resut="小说推送失败，第"+(i+1)+"行数据异常！";
					}
				}
			}
		}
		jsonBack.put("mess", resut);
		return jsonBack;
	}

	public boolean addBatchAnzhiThirdRecommand(List<AnzhiThirdRecommand> list){
		return anzhithirdrecommandDao.addBatchAnzhiThirdRecommand(list);
	}

	public boolean delAnzhiThirdRecommand(int id){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhithirdrecommandDao.delAnzhiThirdRecommand(id));
		this.excuteUpdate(pojoList);
		return true;
	}

	public boolean delBatchAnzhiThirdRecommand(String ids){
		return anzhithirdrecommandDao.delBatchAnzhiThirdRecommand(ids);
	}

	public boolean updateAnzhiThirdRecommand(AnzhiThirdRecommand anzhithirdrecommand){
		List<Pojo> pojoList=new ArrayList<Pojo>();
		pojoList.add(anzhithirdrecommandDao.updateAnzhiThirdRecommand(anzhithirdrecommand));
		this.excuteUpdate(pojoList);
		return true;
	}

	public QueryList<AnzhiThirdRecommand> findAnzhiThirdRecommandAll(int size,int pageNum,String condition){
		return anzhithirdrecommandDao.findAnzhiThirdRecommandAll(size,pageNum,condition);
	}


}