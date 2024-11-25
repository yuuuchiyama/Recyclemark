package bean;

public class History implements java.io.Serializable{

	private int searchId;
	private String userId;
	private int recycleId;
	private String time;

	public int getSearchId() {
		return searchId;
	}

	public String getUserId() {
		return userId;
	}

	public int getRecycleId(){
		return recycleId;
	}

	public String getTime(){
		return time;
	}

	public void setSearchId(int searchId) {
		this.searchId = searchId;
	}

	public void setUserId(String userId){
		this.userId = userId;
	}

	public void setRecycleId(int recycleId){
		this.recycleId = recycleId;
	}

	public void setTime(String time){
		this.time = time;
	}
}
