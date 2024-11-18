package bean;

import java.io.Serializable;

public class RecycleMark implements Serializable {
	private int markId;
	private String markImg;
	private int searchCount;
	private String markName;

	// ゲッタ
	public int getMarkId() {
		return markId;
	}

	public String getMarkImg() {
		return markImg;
	}

	public int getSearchCount() {
		return searchCount;
	}

	public String getMarkName(){
		return markName;
	}

	// セッタ
	public void setMarkId(int markId) {
		this.markId = markId;
	}

	public void setMarkImg(String markImg) {
		this.markImg = markImg;
	}

	public void setSearchCount(int searchCount) {
		this.searchCount = searchCount;
	}

	public void setMarkName(String markName) {
		this.markName = markName;
	}
}
