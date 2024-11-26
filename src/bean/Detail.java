package bean;

import java.io.Serializable;

public class Detail implements Serializable {
	private int markId;
	private String markImg;
	private String markName;
	private String markDescribe;

	// ゲッタ
	public int getMarkId() {
		return markId;
	}

	public String getMarkImg() {
		return markImg;
	}

	public String getMarkName(){
		return markName;
	}

	public String getMarkDescribe() {
		return markDescribe;
	}

	// セッタ
	public void setMarkId(int markId) {
		this.markId = markId;
	}

	public void setMarkImg(String markImg) {
		this.markImg = markImg;
	}

	public void setMarkName(String markName) {
		this.markName = markName;
	}

	public void setMarkDescribe(String markDescribe) {
		this.markDescribe = markDescribe;
	}
}
