package bean;

public class User implements java.io.Serializable{

	private String id;
	private String password;
	private String language;

	public String getId() {
		return id;
	}

	public String getPassword() {
		return password;
	}

	public String getLanguage(){
		return language;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setPassword(String password){
		this.password = password;
	}

	public void setLanguage(String language){
		this.language = language;
	}
}
