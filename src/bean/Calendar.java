package bean;

import java.io.Serializable;

public class Calendar implements Serializable {
	private String calendarDate;
	private int userId;
	private int stampId;
	private String stampImg;
	private String memo;

	// ゲッタ
	public String getCalendarDate() {
		return calendarDate;
	}

	public int getUserId() {
		return userId;
	}

	public int getStampId() {
		return stampId;
	}

	public String getStampImg(){
		return stampImg;
	}

	public String getMemo() {
		return memo;
	}

	// セッタ
	public void setCalendarDate(String calendarDate) {
		this.calendarDate = calendarDate;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public void setStampId(int stampId) {
		this.stampId = stampId;
	}

	public void setStampImg(String stampImg) {
		this.stampImg = stampImg;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}
}
