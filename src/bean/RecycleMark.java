package bean;

import java.io.Serializable;

public class RecycleMark implements Serializable {
	private int markId;
	private String markImg;
	private int searchCount;

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
}
