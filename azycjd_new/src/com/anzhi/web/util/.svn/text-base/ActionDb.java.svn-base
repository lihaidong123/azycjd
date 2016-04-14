package com.anzhi.web.util;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.InvalidResultSetAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.jdbc.support.rowset.SqlRowSet;

import com.anzhi.web.dao.IAnzhiExperienceRecordDao;
import com.anzhi.web.pojo.AnZhiMemberVipInfo;
import com.anzhi.web.pojo.AnzhiExperienceRecord;
import com.anzhi.web.pojo.AnzhiMember;
import com.anzhi.web.pojo.AnzhiNovel;
import com.anzhi.web.pojo.AnzhiWebEditor;
import com.anzhi.web.pojo.ChapterSubscribeNum;
import com.anzhi.web.pojo.WebEditorFather;

public class ActionDb<T> extends DateFormat{
	@Autowired 
	private JdbcTemplate jdbcTemplate;
	//批量执行增删改
	public boolean excuteUpdate(List<Pojo> list){
		for(int i=0;i<list.size();i++){
			Pojo p=list.get(i);
			try {
				jdbcTemplate.update(p.getSql(), p.getObj());
			} catch (DataAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return false;  
	}
	
	//添加一条记录，并获得插入记录的id
	public int excuteUpdate(final Pojo p){
		final String sql=p.getSql();
		final Object[] object=p.getObj();
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(new PreparedStatementCreator() {	
			public PreparedStatement createPreparedStatement(Connection conn)
					throws SQLException {
				PreparedStatement pst = conn.prepareStatement(sql,
						new String[] { "id" });
				if(object!=null){
					for(int i=0;i<object.length;i++){
						pst.setObject(i+1, object[i]);
					}
				}
				return pst;
			}
		}, keyHolder);
		int ids = keyHolder.getKey().intValue();
		return ids;
	}
	public boolean excuteBatchUpdate(String sql,String ids){
		return true;
	}
	public boolean excuteBatchUpdate(String sql,List list){
		return true;
	}
	
	public QueryList<T> excuteQuery(FatherPojo fatherPojo,String tabName,int size,int num,String condition,String orderField){
		int number = 0;
		int beg,end=0;
		num=num<=0?1:num;
		beg=(num-1)*size;
		end=num*size;
		if (num > 1) {
	          number = size * (num - 1);
	    }
		QueryList<T> queryList=new QueryList<T>();//需要返回的
		List<T> list=new ArrayList<T>();//查询到的泛型集合
		String sql="select count(*) from "+tabName;
		if(condition!=null&&condition!=""){
			sql+=" where 1=1 "+condition;
		}
		
		int total=this.getTotal(sql);//获得总记录数
		try {
			if(size!=0){
				int totalNums=total%size==0?(total/size):(total/size)+1;
				queryList.setTotalNum(totalNums);//设置页面总页数
				queryList.setDownNum(num+1);//设置下一页
				queryList.setEndNum(totalNums);//设置最后一页
				queryList.setFirstNum(1);//设置首页
				queryList.setUpNum(num-1);//设置上一页
				queryList.setTotal(total);//设置总记录数
				queryList.setNum(num);//设置当前页
			}
		} catch (Exception e1) {

		}
		if(num==0){
			num+=1;
		}
		queryList.setNum(num);//当前页
		/*if(condition!=null&&condition!=""){
			if(tabName.equals("anzhi_fen_juan")){
				sql="select * from "+tabName+" where 1=1 "+condition+" order by id asc limit "+beg+","+size;
			}else{
				sql="select * from "+tabName+" where 1=1 "+condition+" order by "+orderField+" desc limit "+beg+","+size;
			}
		}else{
			if(tabName.equals("anzhi_fen_juan")){
				sql="select * from "+tabName+" order by id asc limit "+beg+","+size;
			}else{
				sql="select * from "+tabName+" order by "+orderField+" desc limit "+beg+","+size;
			}
		}*/
		
		
		  
		if(tabName.equals("anzhi_fen_juan")||tabName.equals("anzhi_novel_view")){
			if(condition!=null&&condition!=""){
				if(tabName.equals("anzhi_fen_juan")){
					sql="select * from "+tabName+" where id in (select id from (select id, row_number() over (order by "+orderField+" asc)scn from "+tabName+" where 1=1 "+condition+") t where scn<="+end+" and scn>"+beg+")";
				}else{
					sql="select * from "+tabName+" where id in (select id from (select id, row_number() over (order by "+orderField+" desc)scn from "+tabName+" where 1=1 "+condition+") t where scn<="+end+" and scn>"+beg+")";
				}
			}else{
				if(tabName.equals("anzhi_fen_juan")){
					sql="select * from "+tabName+" where id in (select id from (select id, row_number() over (order by "+orderField+" asc)scn from "+tabName+") t where scn<="+end+" and scn>"+beg+")";
				}else{
					sql="select * from "+tabName+" where id in (select id from (select id, row_number() over (order by "+orderField+" desc)scn from "+tabName+") t where scn<="+end+" and scn>"+beg+")";
				}
			}
			if(tabName.equals("anzhi_fen_juan")){
				sql+=" order by "+orderField+" asc";
			}else{
				sql+=" order by "+orderField+" desc";
			}
			
		}else if(tabName.equals("anzhi_novel_recommand_view")&&orderField.equals("recommand_time")&&!condition.equals("")){
			sql="select * from "+tabName+" where id in (select id from (select id, row_number() over (order by "+orderField+" desc)scn from "+tabName+" where 1=1 "+condition+") t where scn<="+end+" and scn>"+beg+")"+condition;
			sql+=" order by "+orderField+" desc";
		}else if(tabName.equals("anzhi_novel_discounted_view")||tabName.equals("anzhi_novel_recommand_view")){
			sql="select * from "+tabName+" where 1=1 "+condition+" and id in (select id from (select id, row_number() over (order by id desc)scn from "+tabName+" where 1=1 "+condition+") t where scn<="+end+" and scn>"+beg+")"+condition;
			sql+=" order by id desc";
		}else if(tabName.equals("anzhi_novel_dashang")||tabName.equals("anzhi_novel_dashang_yue")||tabName.equals("anzhi_novel_dashang_zhou")||tabName.equals("anzhi_novel_dianjilv")||tabName.equals("anzhi_novel_dingyue")||tabName.equals("anzhi_novel_gengxin")||tabName.equals("anzhi_novel_shoucang")||tabName.equals("anzhi_novel_gengxin")||tabName.equals("anzhi_novel_tuijian")||tabName.equals("anzhi_novel_yuepiao")){
			if(condition!=null&&condition!=""){
				sql="select * from "+tabName+" where id in (select id from (select id, row_number() over (order by num desc)scn from "+tabName+" where 1=1 "+condition+") t where scn<="+end+" and scn>"+beg+")";
			}else{
				sql="select * from "+tabName+" where id in (select id from (select id, row_number() over (order by num desc)scn from "+tabName+") t where scn<="+end+" and scn>"+beg+")";
			}
			sql+=" order by num desc";
		}else if(tabName.equals("anzhi_third_recommand_view")){
			if(condition!=null&&condition!=""){
				sql="select * from "+tabName+" where recommand_id in (select recommand_id from (select recommand_id, row_number() over (order by recommand_id desc)scn from "+tabName+" where 1=1 "+condition+") t where scn<="+end+" and scn>"+beg+")";
			}else{
				sql="select * from "+tabName+" where recommand_id in (select recommand_id from (select recommand_id, row_number() over (order by recommand_id desc)scn from "+tabName+") t where scn<="+end+" and scn>"+beg+")";
			}
			sql+=" order by recommand_id desc";
		}else{
			if(condition!=null&&condition!=""){
				sql="select * from "+tabName+" where id in (select id from (select id, row_number() over (order by id desc)scn from "+tabName+" where 1=1 "+condition+") t where scn<="+end+" and scn>"+beg+")";
			}else{
				sql="select * from "+tabName+" where id in (select id from (select id, row_number() over (order by id desc)scn from "+tabName+") t where scn<="+end+" and scn>"+beg+")";
			}
			sql+=" order by id desc";
		}
  
		try {
			
			//ResultSet rs=conn.prepareStatement(sql).executeQuery();
			SqlRowSet s=jdbcTemplate.queryForRowSet(sql);
			while(s.next()){
				int colLength=s.getMetaData().getColumnCount();

				Object[] obj=new Object[colLength];
				if(tabName.equals("kunming_vote")||tabName.equals("kunming_vote_options")||tabName.equals("kunming_question_view")||tabName.equals("kunming_apply_view")){
					obj=new Object[colLength+1];
				}
				for(int i=0;i<=obj.length-1;i++){
					obj[i]=s.getObject(i+1);
				}
				list.add((T) fatherPojo.setValues(obj));
			}
			queryList.setList(list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			
		}
		return queryList;
	}
	public QueryList<T> excuteQuery(FatherPojo fatherPojo,String tabName,int size,int num,String condition){
		return this.excuteQuery(fatherPojo, tabName, size, num, condition,"id");
	}

	//获得记录数
	public int getTotal(String sql){
		int total=0;		
		try {
			return jdbcTemplate.queryForInt(sql);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			
		}
		return total;
	}
	
	public Timestamp getNowTime(){
		return new Timestamp(new Date().getTime());
	}
	public String getNow(){
		return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
	}
	
	//根据传入的sql查询泛型集合
	public List<T> excuteQuery(FatherPojo fatherPojo,String sql){
		List<T> list=new ArrayList<T>();//查询到的泛型集合
		try {
			SqlRowSet s=jdbcTemplate.queryForRowSet(sql);
			while(s.next()){
				int colLength=s.getMetaData().getColumnCount();
				Object[] obj=new Object[colLength];
				for(int i=0;i<=obj.length-1;i++){
					obj[i]=s.getObject(i+1);
				}
				list.add((T) fatherPojo.setValues(obj));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			
		}
		return list;
	}
	
	//根据指定的sql查询某个字段
	public Object getObjectBySql(String sql){
		try {
			SqlRowSet s=jdbcTemplate.queryForRowSet(sql);
			if(s.next()){
				Object obj=s.getObject(1);
				if(obj==null){
					return "";
				}else{
					return obj;
				}
			}
		} catch (InvalidResultSetAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
	}
	
	/**
	 * 获得表字段的整形值[只有一个值]
	 * @param sql 查询sql语句
	 */
	public int getIntBySqlDb(String sql){
		Object obj= getObjectBySql(sql);
		try {
			if(obj!=null){
				return Integer.parseInt(obj.toString());
			}else{
				return 0;
			}
		} catch (NumberFormatException e) {
			return 0;
		}
	}
	
	/**
	 * 获得表字段的double值[只有一个值]
	 * @param sql 查询sql语句
	 */
	public double getDoubleBySqlDb(String sql){
		Object obj= getObjectBySql(sql);
		try {
			if(obj!=null){
				return Double.parseDouble(obj.toString());
			}else{
				return 0;
			}
		} catch (NumberFormatException e) {
			return 0;
		}
	}
	
	/**
	 * 获得表字段的字符串[只有一个值]
	 * @param sql 查询sql语句
	 */
	public String getStringBySqlDb(String sql){
		Object obj= getObjectBySql(sql);
		try {
			if(obj!=null){
				return obj.toString()+"";
			}else{
				return "0";
			}
		} catch (NumberFormatException e) {
			return "0";
		}
	}
	
	/**
	 * 修改某个字段的值
	 * @param tableName
	 * @param id
	 * @param field
	 * @param value
	 * @return
	 */
	public Pojo updateTableField(String tableName, int id, String field,
			String value) {
		Pojo pojo=new Pojo();
		pojo.setSql("update "+tableName+" set "+field+"=? where id=?");
		pojo.setObj(new Object[]{
			value,
			id
		});
		return pojo;
	}
	
	public Pojo updateTableField(String tableName, int id, String field,
			int value) {
		Pojo pojo=new Pojo();
		pojo.setSql("update "+tableName+" set "+field+"=? where id=?");
		pojo.setObj(new Object[]{
			value,
			id
		});
		return pojo;
	}
	
	/**
	 * 追加某个字段的值
	 * @param tableName
	 * @param id
	 * @param field
	 * @param value
	 * @return
	 */
	public void updateTableFieldAppend(String tableName, int id, String field,
			int value) {
		jdbcTemplate.update("update "+tableName+" set "+field+"="+field+"+? where id=?", new Object[]{
			value,
			id
		});
	}
	
	/**
	 * 修改某个字段的值
	 * @param tableName
	 * @param id
	 * @param field
	 * @param value
	 * @return
	 */
	public void updateTableFieldVoid(String tableName, int id, String field,
			int value) {
		jdbcTemplate.update("update "+tableName+" set "+field+"=? where id=?", new Object[]{
			value,
			id
		});
	}
	
	/**
	 * 删除某条记录
	 * @param tableName
	 * @param id
	 * @param field
	 * @param value
	 * @return
	 */
	public void delTableRow(String tableName, int id) {
		jdbcTemplate.update("delete from "+tableName+" where id=?", new Object[]{
			id
		});
	}
	
	
	/**
	 * 根据小说id查询该小说下的各章节的订阅数
	 * @param size
	 * @param num
	 * @param condition
	 * @return
	 */
	public QueryList<ChapterSubscribeNum> findChapterDingYueNumDb(int size,int num,String condition,int novelId){
		int number = 0;
		int beg,end=0;
		num=num<=0?1:num;
		beg=(num-1)*size;
		end=num*size;
		if (num > 1) {
	          number = size * (num - 1);
	    }
		QueryList<ChapterSubscribeNum> queryList=new QueryList<ChapterSubscribeNum>();//需要返回的
		List<ChapterSubscribeNum> list=new ArrayList<ChapterSubscribeNum>();//查询到的泛型集合
		String sql="select count(*) from anzhi_chapter_subscribe_report_nums where novel_id="+novelId;
		int total=this.getTotal(sql);//获得总记录数
		try {
			if(size!=0){
				int totalNums=total%size==0?(total/size):(total/size)+1;
				queryList.setTotalNum(totalNums);//设置页面总页数
				queryList.setDownNum(num+1);//设置下一页
				queryList.setEndNum(totalNums);//设置最后一页
				queryList.setFirstNum(1);//设置首页
				queryList.setUpNum(num-1);//设置上一页
				queryList.setTotal(total);//设置总记录数
				queryList.setNum(num);//设置当前页
			}
		} catch (Exception e1) {

		}
		if(num==0){
			num+=1;
		}
		queryList.setNum(num);//当前页

		sql="select * from anzhi_chapter_subscribe_report_nums_new where id in (select id from (select id, row_number() over (order by id desc)scn from anzhi_chapter_subscribe_report_nums_new where novel_id="+novelId+") t where scn<="+end+" and scn>"+beg+") order by id asc";
		//sql="select * from anzhi_chapter_subscribe_report_nums_new where novel_id="+novelId+" limit "+beg+","+size;
		try {
			SqlRowSet s=jdbcTemplate.queryForRowSet(sql);
			while(s.next()){
				int colLength=s.getMetaData().getColumnCount();
				Object[] obj=new Object[colLength];
				for(int i=0;i<=obj.length-1;i++){
					obj[i]=s.getObject(i+1);
				}
				list.add(new ChapterSubscribeNum().setValues(obj));
			}
			queryList.setList(list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			
		}
		return queryList;
	}
	
	/**
	 * 
	 * 获得整形的请求参数值
	 * @param request
	 * @return
	 */
	public int getInt(HttpServletRequest request,String param){
		if(request.getParameter(param)!=null&&!request.getParameter(param).equals("")){
			try {
				return Integer.parseInt(request.getParameter(param));
			} catch (NumberFormatException e) {
				return -1;
			}
		}
		return -1;
	}
	
	/**
	 * 获得小说类型
	 * @param oldChar
	 * @return
	 */
	public String getNovelType(String oldChar){
		String types="";
		if(oldChar!=null&&!oldChar.equals("")){
			String[] arr=oldChar.split("/");
			for(String s:arr){
				if(!s.equals("")){
					String[] st=s.split("@");
					types+=st.length>0?st[0]+"/":"";
				}
			}
		}
		return types.equals("")?types:types.substring(0,types.length()-1);
	}
	/**
	 * 参数验证
	 * 
	 * @param request
	 * @param param
	 * @return
	 */
	public boolean checkParam(HttpServletRequest request,String param){
		if(request.getParameter(param)!=null&&!request.getParameter(param).equals("")){
			return true;
		}
		return false;
	}

	/**
	 * 根据小说文字计算需要的安之币
	 * @param charNum
	 * @return
	 */
	public int getAnZhiBi(int charNum){
		return (charNum/1000)*4;
	}
	
	/**
	 * 
	 * @param thisBuyChapterNum--本次购买的章节数
	 * @param am
	 * @param pojoList
	 */
	public void checkSubscribeTask(int thisBuyChapterNum,AnzhiMember am,List<Pojo> pojoList,IAnzhiExperienceRecordDao anzhiexperiencerecordDao){
		//先查询今天已经订阅了几章
		int chatpterNum=this.getIntBySqlDb("select count(*) from anzhi_chapter_subscribe where member_id="+am.getId()+" and add_time between '"+this.getDateType(0)+"' and '"+this.getDateType(1)+"'");
		if((chatpterNum+thisBuyChapterNum)>=5){
			//看看是否已经增加了任务记录
			int n=this.getIntBySqlDb("select count(*) from anzhi_experience_record where member_id="+am.getId()+" and experience_type=4 and add_time between '"+this.getDateType(0)+"' and '"+this.getDateType(1)+"'");
			if(n==0){
				//如果没有记录，则添加。同时增加用户的经验
				AnzhiExperienceRecord anzhiexperiencerecord=new AnzhiExperienceRecord();
				anzhiexperiencerecord.setAddTime(this.getNowTime());
				anzhiexperiencerecord.setExperienceNum(20);
				anzhiexperiencerecord.setExperienceType(4);
				anzhiexperiencerecord.setMemberId(am.getId());
				anzhiexperiencerecord.setState(0);
				anzhiexperiencerecord.setVote("当日订阅章节达到"+(chatpterNum+thisBuyChapterNum)+"章，给予20个经验");
				pojoList.add(anzhiexperiencerecordDao.addAnzhiExperienceRecord(anzhiexperiencerecord));
				//修改该用户的经验  先查找 后修改
				
				this.updateTableFieldAppend("anzhi_member", am.getId(), "member_experience", 20);	
				int jingyan=this.getIntBySqlDb("select member_experience from anzhi_member where id="+am.getId());
				am.setMemberExperience(jingyan);
			}
		}
	}
	
	/**
	 * 根据传入的小说集合改变小说类型
	 * @param oldChar
	 * @return
	 */
	public QueryList<AnzhiNovel> novelTypeChange(QueryList<AnzhiNovel> list){
		for(int i=0;i<list.getList().size();i++){
			AnzhiNovel an=list.getList().get(i);
			an.setNovelType(this.getNovelType(an.getNovelType()));
		}
		return list;
	}
	
	/**
	 * 根据传入的小说集合改变小说类型
	 * @param oldChar
	 * @return
	 */
	public void getWebEditorFather(QueryList<WebEditorFather> list){
		if(list.getList()==null){
			return;
		}
		for(int i=0;i<list.getList().size();i++){
			WebEditorFather an=list.getList().get(i);
			AnzhiWebEditor aw=new AnzhiWebEditor();
			SqlRowSet s=jdbcTemplate.queryForRowSet("select * from anzhi_web_editor where id="+an.getEditorId());
			while(s.next()){
				int colLength=s.getMetaData().getColumnCount();
				Object[] obj=new Object[colLength];
				for(int k=0;k<=obj.length-1;k++){
					obj[k]=s.getObject(k+1);
				}
				an.setAnzhiWebEditor(aw.setValues(obj));
			}
		}
	}
	

	public Timestamp getTimestampFull(String times){
		if(times!=null&&times!=""){
			try {
				return new Timestamp(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(times).getTime());
			} catch (ParseException e) {
				return new Timestamp(new Date().getTime());
			}
		}else{
			return new Timestamp(new Date().getTime());
		}
	}
	
	
	public QueryList<T> shuku(FatherPojo fatherPojo,String tabName,int size,int num,String condition,String orderField){
		int number = 0;
		int beg,end=0;
		num=num<=0?1:num;
		beg=(num-1)*10;
		end=num*10;
		if (num > 1) {
	          number = size * (num - 1);
	    }
		QueryList<T> queryList=new QueryList<T>();//需要返回的
		List<T> list=new ArrayList<T>();//查询到的泛型集合
		String sql="select count(*) from "+tabName;
		if(condition!=null&&condition!=""){
			sql+=" where 1=1 "+condition;
		}
		int total=this.getTotal(sql);//获得总记录数
		try {
			if(size!=0){
				int totalNums=total%10==0?(total/10):(total/10)+1;
				queryList.setTotalNum(totalNums);//设置页面总页数
				queryList.setDownNum(num+1);//设置下一页
				queryList.setEndNum(totalNums);//设置最后一页
				queryList.setFirstNum(1);//设置首页
				queryList.setUpNum(num-1);//设置上一页
				queryList.setTotal(total);//设置总记录数
				queryList.setNum(num);//设置当前页
			}
		} catch (Exception e1) {

		}
		if(num==0){
			num+=1;
		}
		queryList.setNum(num);//当前页
		/*if(condition!=null&&condition!=""){
			sql="select * from "+tabName+" where 1=1 "+condition+" order by "+orderField+" desc limit "+beg+","+size;
		}else{
			sql="select * from "+tabName+" order by "+orderField+" desc limit "+beg+","+size;
		}*/
		
		if(condition!=null&&condition!=""){
			sql="select * from "+tabName+" where id in (select id from (select id, row_number() over (order by "+orderField+" desc)scn from "+tabName+" where 1=1 "+condition+") t where scn<="+end+" and scn>"+beg+")";
		}else{
			sql="select * from "+tabName+" where id in (select id from (select id, row_number() over (order by "+orderField+" desc)scn from "+tabName+") t where scn<="+end+" and scn>"+beg+")";
		}
		
		sql+=" order by "+orderField+" desc";
		
		try {
			
			//ResultSet rs=conn.prepareStatement(sql).executeQuery();
			SqlRowSet s=jdbcTemplate.queryForRowSet(sql);
			while(s.next()){
				int colLength=s.getMetaData().getColumnCount();
				Object[] obj=new Object[colLength];
				for(int i=0;i<=obj.length-1;i++){
					obj[i]=s.getObject(i+1);
				}
				list.add((T) fatherPojo.setValues(obj));
			}
			queryList.setList(list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			
		}
		return queryList;
	}
	
	public int getNowMonthYuePia(int memberId){
		int n=0;
		try {
			SqlRowSet s=jdbcTemplate.queryForRowSet("select consume_anzhi_money from anzhi_consume where consume_anzhi_money>=1000 and member_id="+memberId+" and consume_time between '"+this.getDateType(4)+"' and '"+this.getDateType(5)+"'");
			while(s.next()){
				int colLength=s.getMetaData().getColumnCount();
				Object[] obj=new Object[colLength];
				for(int i=0;i<=obj.length-1;i++){
					if(s.getObject(i+1)!=null){
						if(Integer.parseInt(s.getObject(i+1).toString())>=10000){
							n+=10;
						}else if(Integer.parseInt(s.getObject(i+1).toString())>=5000){
							n+=5;
						}else if(Integer.parseInt(s.getObject(i+1).toString())>=1888){
							n+=2;
						}else if(Integer.parseInt(s.getObject(i+1).toString())>=1000){
							n+=1;
						}
					}
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			
		}
		return n;
	}
	
	public int getYp(int anzhiMoney){
		int n=0;
		if(anzhiMoney>=10000){
			n+=10;
		}else if(anzhiMoney>=5000){
			n+=5;
		}else if(anzhiMoney>=1888){
			n+=2;
		}
		return n;
	}
	public int getPageNum(HttpServletRequest request){
		int pageNum=this.getInt(request, "pageNum");
		if(pageNum<1){
			pageNum=1;
		}
		return pageNum;
	}
	
	public AnZhiMemberVipInfo getVipLevel(int memberId){
		//查询该用户所有的消费安之币
		AnZhiMemberVipInfo anZhiMemberVipInfo=new AnZhiMemberVipInfo();
		int anzhibi=this.getIntBySqlDb("select sum(consume_anzhi_money) from anzhi_consume where member_id="+memberId);
		anZhiMemberVipInfo.setAnzhibi(anzhibi);
		anZhiMemberVipInfo.setMemberId(memberId);
		if(anzhibi>100000){
			anZhiMemberVipInfo.setEndLevelAnzhibi(1000000000);
			anZhiMemberVipInfo.setVipType(3);
			anZhiMemberVipInfo.setVipName("高级");
		}else if(anzhibi>50000){
			anZhiMemberVipInfo.setEndLevelAnzhibi(100000);
			anZhiMemberVipInfo.setVipType(2);
			anZhiMemberVipInfo.setVipName("中级");
		}else if(anzhibi>10000){
			anZhiMemberVipInfo.setEndLevelAnzhibi(50000);
			anZhiMemberVipInfo.setVipType(1);
			anZhiMemberVipInfo.setVipName("初级");
		}else{
			anZhiMemberVipInfo.setEndLevelAnzhibi(10000);
			anZhiMemberVipInfo.setVipType(0);
			anZhiMemberVipInfo.setVipName("无");
		}
		return anZhiMemberVipInfo;
	}
	
	public int getVipDiscount(AnZhiMemberVipInfo anZhiMemberVipInfo,int consumeMoney){
		if(anZhiMemberVipInfo.getVipType()==3){
			return (int)(consumeMoney*0.8);
		}else if(anZhiMemberVipInfo.getVipType()==2){
			return (int)(consumeMoney*0.6);
		}else if(anZhiMemberVipInfo.getVipType()==1){
			return (int)(consumeMoney*0.4);
		}else{
			return (int)(consumeMoney*1);
		}
	} 
	
	public List<Object[]> getList(String sql){
		List<Object[]> list=new ArrayList<Object[]>();
		try {
			SqlRowSet s=jdbcTemplate.queryForRowSet(sql);
			while(s.next()){
				int colLength=s.getMetaData().getColumnCount();
				Object[] obj=new Object[colLength];
				for(int i=0;i<=obj.length-1;i++){
					obj[i]=s.getObject(i+1);
				}
				list.add(obj);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			
		}
		return list;
	}
}