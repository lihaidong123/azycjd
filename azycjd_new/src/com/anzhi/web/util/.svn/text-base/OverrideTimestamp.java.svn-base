package com.anzhi.web.util;
import java.sql.Timestamp;
public class OverrideTimestamp extends Timestamp{
	public OverrideTimestamp(long time) {
		super(time);
	}
	public OverrideTimestamp getOverrideDate(Timestamp tt){
		return new OverrideTimestamp(tt.getTime());
	}
	public String toString() {
		int year = super.getYear() + 1900;
		int month = super.getMonth() + 1;
		int day = super.getDate();
		String yearString;
		String monthString;
		String dayString;
		String zeros = "000000000";
		String yearZeros = "0000";
		StringBuffer timestampBuf;
		if (year < 1000) {
			yearString = "" + year;
			yearString = yearZeros.substring(0, (4-yearString.length())) + yearString;
		} else {
			yearString = "" + year;
		}
		if (month < 10) {
			monthString = "0" + month;
		} else {
			monthString = Integer.toString(month);
		} 
		if (day < 10) {
			dayString = "0" + day;
		} else {
			dayString = Integer.toString(day);
		}
		timestampBuf = new StringBuffer();
		timestampBuf.append(yearString);
		timestampBuf.append("-");
		timestampBuf.append(monthString);
		timestampBuf.append("-");
		timestampBuf.append(dayString);
		timestampBuf.append(" ");
		return (timestampBuf.toString());
	}
}