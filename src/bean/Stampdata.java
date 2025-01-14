package bean;

import java.io.Serializable;

public class Stampdata implements Serializable {
	private int stampId;
	private String StampNameJapanese;
	private String StampNameEnglish;
	private String StampNameChinese;
	private String StampNameKorean;
	private String StampImg;


	public int getStampId() {
		return stampId;
	}
	public void setStampId(int stampId) {
		this.stampId = stampId;
	}
	public String getStampNameJapanese() {
		return StampNameJapanese;
	}
	public void setStampNameJapanese(String stampNameJapanese) {
		StampNameJapanese = stampNameJapanese;
	}
	public String getStampNameEnglish() {
		return StampNameEnglish;
	}
	public void setStampNameEnglish(String stampNameEnglish) {
		StampNameEnglish = stampNameEnglish;
	}
	public String getStampNameChinese() {
		return StampNameChinese;
	}
	public void setStampNameChinese(String stampNameChinese) {
		StampNameChinese = stampNameChinese;
	}
	public String getStampNameKorean() {
		return StampNameKorean;
	}
	public void setStampNameKorean(String stampNameKorean) {
		StampNameKorean = stampNameKorean;
	}
	public String getStampImg() {
		return StampImg;
	}
	public void setStampImg(String stampImg) {
		StampImg = stampImg;
	}


}
