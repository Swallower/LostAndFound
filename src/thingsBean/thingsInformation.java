package thingsBean;


import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.mysql.jdbc.Blob;

public class thingsInformation {
	/**

	 */
	private int id;
	private String userId;
	private int state;
	private String title;
	private String content;
	private String type;
	private Date losttime;
	private Date updatetime;
	private String img;
	private String place;

	
	public thingsInformation() {
		super();
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPlace(){return place;}
	public void setPlace(String place){this.place=place;}
	public int getState() {
		return state;
	}


	public void setState(int state) {
		this.state = state;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public Date getLosttime() {
		return losttime;
	}


	public void setLosttime(Date losttime) {
		this.losttime = losttime;
	}


	public Date getUpdatetime() {
		return updatetime;
	}


	public void setUpdatetime(Date updatetime) {
		this.updatetime = updatetime;
	}


	public String getImg() {
		return img;
	}


	public void setImg(String img) {
		this.img = img;
	}

    @Override
    public String toString() {
        return "thingsInformation{" +
                "id=" + id +
                ", userId='" + userId + '\'' +
                ", state=" + state +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", type='" + type + '\'' +
                ", losttime=" + losttime +
                ", updatetime=" + updatetime +
                ", img='" + img + '\'' +
                ", place='" + place + '\'' +
                '}';
    }
}
