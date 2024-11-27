package bean;

import java.io.Serializable;

public class Favorite implements Serializable {
	private int favId;
	private String userId;
	private int recycleId;
	private String recycleName;
	private String recycleImg;

	// ゲッタ
	public int getFavId() {
		return favId;
	}

	public String getUserId() {
		return userId;
	}

	public int getRecycleId() {
		return recycleId;
	}

	public String getRecycleName() {
		return recycleName;
	}

	public String getRecycleImg() {
		return recycleImg;
	}

	// セッタ
	public void setFavId(int favId) {
		this.favId = favId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void setRecycleId(int recycleId) {
		this.recycleId = recycleId;
	}

	public void setRecycleName(String recycleName) {
		this.recycleName = recycleName;
	}

	public void setRecycleImg(String recycleImg) {
		this.recycleImg = recycleImg;
	}
}
