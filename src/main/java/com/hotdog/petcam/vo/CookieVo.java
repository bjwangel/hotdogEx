package com.hotdog.petcam.vo;

public class CookieVo {
	private String name;
	private String email;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "CookieVo [name=" + name + ", email=" + email + "]";
	}
	
}
