package bean;

public class Ranking implements java.io.Serializable{

	private String rankUrl;
	private String imgUrl;
	private String name;
	private int markId;

	public String getRankUrl() {
		return rankUrl;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public String getName(){
		return name;
	}

	public int getMarkId() {
		return markId;
	}


	public void setRankUrl(String rankUrl) {
		this.rankUrl = rankUrl;
	}

	public void setImgUrl(String imgUrl){
		this.imgUrl = imgUrl;
	}

	public void setName(String name){
		this.name = name;
	}

	public void setMarkId(int markId) {
		this.markId = markId;
	}

}
