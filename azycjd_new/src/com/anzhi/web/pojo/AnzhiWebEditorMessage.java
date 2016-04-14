package com.anzhi.web.pojo;
import java.util.List;
import java.sql.Timestamp;
import java.util.Date;
import com.anzhi.web.util.FatherPojo;
import com.anzhi.web.util.OverrideTimestamp;
public class AnzhiWebEditorMessage extends FatherPojo implements java.io.Serializable {
	public AnzhiWebEditorMessage(){
	}
	public AnzhiWebEditorMessage setValues(Object[] obj) {
		AnzhiWebEditorMessage model=new AnzhiWebEditorMessage();
		model.setId(obj[0]==null?0:Integer.parseInt(obj[0].toString()));
		model.setEditorId(obj[1]==null?0:Integer.parseInt(obj[1].toString()));
		model.setTypes(obj[2]==null?0:Integer.parseInt(obj[2].toString()));
		model.setMessContent(obj[3]==null?"":obj[3].toString());
		model.setVote(obj[4]==null?"":obj[4].toString());
		model.setState(obj[5]==null?0:Integer.parseInt(obj[5].toString()));
		model.setAddTime(obj[6]==null?null:new OverrideTimestamp(0).getOverrideDate((Timestamp)obj[6]));
		return model;
	}
	private Integer id;
	public void setId(Integer id){
		this.id=id;
	}
	public Integer getId(){
		return this.id;
	}
	private Integer editorId;
	
	public Integer getEditorId() {
		return editorId;
	}
	public void setEditorId(Integer editorId) {
		this.editorId = editorId;
	}
	private Integer types;
	public void setTypes(Integer types){
		this.types=types;
	}
	public Integer getTypes(){
		return this.types;
	}
	private String messContent;
	public void setMessContent(String messContent){
		this.messContent=messContent;
	}
	public String getMessContent(){
		return this.messContent;
	}
	private String vote;
	public void setVote(String vote){
		this.vote=vote;
	}
	public String getVote(){
		return this.vote;
	}
	private Integer state;
	public void setState(Integer state){
		this.state=state;
	}
	public Integer getState(){
		return this.state;
	}
	private Timestamp addTime;
	public void setAddTime(Timestamp addTime){
		this.addTime=addTime;
	}
	public Timestamp getAddTime(){
		return this.addTime;
	}

}