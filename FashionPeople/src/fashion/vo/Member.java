package fashion.vo;

public class Member {
	private String user_id;
	private String email;
	private String pwd;
	private String nickname;
	private boolean male;
	private String birth;
	private boolean caution;
	private String picture;
	private int level;
	public String getUser_id() {
		return user_id;
	}
	public Member setUser_id(String user_id) {
		this.user_id = user_id;
		return this;
	}
	public String getEmail() {
		return email;
	}
	public Member setEmail(String email) {
		this.email = email;
		return this;
	}
	public String getPwd() {
		return pwd;
	}
	public Member setPwd(String pwd) {
		this.pwd = pwd;
		return this;
	}
	public String getNickname() {
		return nickname;
	}
	public Member setNickname(String nickname) {
		this.nickname = nickname;
		return this;
	}
	public boolean isMale() {
		return male;
	}
	public Member setMale(boolean male) {
		this.male = male;
		return this;
	}
	public String getBirth() {
		return birth;
	}
	public Member setBirth(String birth) {
		this.birth = birth;
		return this;
	}
	public boolean isCaution() {
		return caution;
	}
	public Member setCaution(boolean caution) {
		this.caution = caution;
		return this;
	}
	public String getPicture() {
		return picture;
	}
	public Member setPicture(String picture) {
		this.picture = picture;
		return this;
	}
	public int getLevel() {
		return level;
	}
	public Member setLevel(int level) {
		this.level = level;
		return this;
	}
	
	
}
