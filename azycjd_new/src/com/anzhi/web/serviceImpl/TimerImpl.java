package com.anzhi.web.serviceImpl;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anzhi.web.dao.IAnzhiNovelDao;
import com.anzhi.web.pojo.AnzhiChapter;
import com.anzhi.web.pojo.AnzhiNovel;
import com.anzhi.web.service.IAnzhiChapterService;
import com.anzhi.web.service.IAnzhiNovelService;
import com.anzhi.web.service.ITimer;
import com.anzhi.web.service.IUtilService;
import com.anzhi.web.util.QueryList;
import com.anzhi.web.util.UtilData;
@Service
public class TimerImpl extends Thread implements ITimer{
	private static Logger logger=Logger.getLogger(TimerImpl.class.getName());
	@Autowired
	private IAnzhiChapterService anzhichapterService;
	@Autowired
	private IAnzhiNovelService anzhinovelService;
	@Autowired
	private IUtilService utilService;
	@Autowired
	private IAnzhiNovelDao anzhinovelDao;
	private String path;

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	//定时发布
	public void updateChapterState(String path) {
		//查询所有定时发布的
		QueryList<AnzhiChapter> ls=anzhichapterService.findAnzhiChapterAll(5000, 1, " and state=2 and add_time<getdate()");
		for(AnzhiChapter ac:ls.getList()){
			ac.setState(1);
			anzhichapterService.updateAnzhiChapter(path, ac, -1);
			anzhinovelService.createNovel(path, ac.getNovelId());
			QueryList<AnzhiNovel> lst=anzhinovelDao.findAnzhiNovelAll(1, 1, " and id="+ac.getNovelId(), "id");
			if(lst.getList().size()!=0){
				AnzhiNovel an=lst.getList().get(0);
				//更新小说目录
				utilService.createNovelChapter(an, path);
			}
		}
	}
	
	
	@Override
	public void run() {
		while(true){
			String d=new SimpleDateFormat("mm").format(new Date());
			logger.error(d+"-"+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())+":运行了一次");
			UtilData.recordChongZhi(path, d+"-"+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())+":运行了一次");
			try {
				updateChapterState(this.getPath());
				this.sleep(3*60*1000);//让它休息3分钟
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
}
