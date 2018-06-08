package com.bit.nullnull.member.model;

public class kakaoin {
	
	private String kakaoEmail;
	private String kaccount_email_verified;
	private String id;
	private String profile_image;
	private String nickname;
	private String thumbnail_image;
	
	
	public kakaoin() {}
	
	
	public String getKakaoEmail() {
		return kakaoEmail;
	}
	public void setKakaoEmail(String kakaoEmail) {
		this.kakaoEmail = kakaoEmail;
	}
	public String getKaccount_email_verified() {
		return kaccount_email_verified;
	}
	public void setKaccount_email_verified(String kaccount_email_verified) {
		this.kaccount_email_verified = kaccount_email_verified;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getProfile_image() {
		return profile_image;
	}
	public void setProfile_image(String profile_image) {
		this.profile_image = profile_image;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getThumbnail_image() {
		return thumbnail_image;
	}
	public void setThumbnail_image(String thumbnail_image) {
		this.thumbnail_image = thumbnail_image;
	}


	public kakaoin(String kakaoEmail, String kaccount_email_verified, String id, String profile_image, String nickname,
			String thumbnail_image) {
		super();
		this.kakaoEmail = kakaoEmail;
		this.kaccount_email_verified = kaccount_email_verified;
		this.id = id;
		this.profile_image = profile_image;
		this.nickname = nickname;
		this.thumbnail_image = thumbnail_image;
	}


	@Override
	public String toString() {
		return "kakaoin [kakaoEmail=" + kakaoEmail + ", kaccount_email_verified=" + kaccount_email_verified + ", id="
				+ id + ", profile_image=" + profile_image + ", nickname=" + nickname + ", thumbnail_image="
				+ thumbnail_image + "]";
	}
	
	
	
	
	

}
