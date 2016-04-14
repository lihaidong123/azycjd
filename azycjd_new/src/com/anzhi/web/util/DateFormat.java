package com.anzhi.web.util;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class DateFormat extends UtilData{
	
	/**
	 * 
	 * 
	 * 
		当天0点时间：2015-11-11 0:00:00
		当天24点时间：2015-11-12 0:00:00
		本周周一0点时间：2015-11-9 0:00:00
		本周周日24点时间：2015-11-16 0:00:00
		本月初0点时间：2015-11-1 0:00:00
		本月未24点时间：2015-12-1 0:00:00
	 * @return
	 */
	
	// 获得当天0点时间
	public Date getTimesmorning() {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.MILLISECOND, 0);
		return cal.getTime();
	}
	
	// 获得当天24点时间
	public Date getTimesnight() {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.HOUR_OF_DAY, 24);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.MILLISECOND, 0);
		return cal.getTime();
	}
	
	// 获得本周一0点时间
	public Date getTimesWeekmorning() {
		Calendar cal = Calendar.getInstance();
		cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONDAY), cal.get(Calendar.DAY_OF_MONTH), 0, 0, 0);
		cal.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY-1);
		return cal.getTime();
	}
	
	// 获得本周日24点时间
	public Date getTimesWeeknight() {
		Calendar cal = Calendar.getInstance();
		cal.setTime(getTimesWeekmorning());
		cal.add(Calendar.DAY_OF_WEEK, 7);
		return cal.getTime();
	}
	
	// 获得本月第一天0点时间
	public Date getTimesMonthmorning() {
		Calendar cal = Calendar.getInstance();
		cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONDAY), cal.get(Calendar.DAY_OF_MONTH), 0, 0, 0);
		cal.set(Calendar.DAY_OF_MONTH, cal.getActualMinimum(Calendar.DAY_OF_MONTH));
		return cal.getTime();
	}
	
	// 获得本月最后一天24点时间
	public Date getTimesMonthnight() {
		Calendar cal = Calendar.getInstance();
		cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONDAY), cal.get(Calendar.DAY_OF_MONTH), 0, 0, 0);
		cal.set(Calendar.DAY_OF_MONTH, cal.getActualMaximum(Calendar.DAY_OF_MONTH));
		cal.set(Calendar.HOUR_OF_DAY, 24);
		return cal.getTime();
	}
	
	//获得上个月的开始时期
	public Date getTimesUpMonthmorning() {
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH)-1, 1, 0, 0, 0);
		return cal.getTime();
	}
	//获得上个月的结束时期
	public Date getTimesUpMonthnight() {
		Calendar cal = Calendar.getInstance();
		cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONDAY)-1, cal.get(Calendar.DAY_OF_MONTH), 0, 0, 0);
		cal.set(Calendar.DAY_OF_MONTH, cal.getActualMaximum(Calendar.DAY_OF_MONTH));
		cal.set(Calendar.HOUR_OF_DAY, 24);
		return cal.getTime();
	}
	public String getDateType(int types){
		Date t=null;
		if(types==0){
			t=getTimesmorning();
		}else if(types==1){
			t=getTimesnight();
		}else if(types==2){
			t=getTimesWeekmorning();
		}else if(types==3){
			t=getTimesWeeknight();
		}else if(types==4){
			t=getTimesMonthmorning();
		}else if(types==5){
			t=getTimesMonthnight();
		}else if(types==6){
			t=getTimesUpMonthmorning();
		}else if(types==7){
			t=getTimesUpMonthnight();
		}
		return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(t);
	}
	
	/**
	 * 
	 * @param t 参照时间
	 * @param d 相差天数
	 * @param con 是否显示23:59:59  true-显示  false-不显示
	 * @return
	 */
	public String getDateStr(Timestamp t,int d,boolean con){
		GregorianCalendar gc=new GregorianCalendar(); 
		gc.setTime(t); 
	    gc.add(5,d);
		if(con){
			return new SimpleDateFormat("yyyy-MM-dd 23:59:59").format(gc.getTime());
		}else{
			return new SimpleDateFormat("yyyy-MM-dd 00:00:00").format(gc.getTime());
		}
	}
}
