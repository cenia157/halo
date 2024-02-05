package com.halo.main;

public class PopupDTO {
	private String p_img;
	private String p_url;
	private int p_flag;
	
	public PopupDTO() {
		// TODO Auto-generated constructor stub
	}

	public PopupDTO(String p_img, String p_url, int p_flag) {
		super();
		this.p_img = p_img;
		this.p_url = p_url;
		this.p_flag = p_flag;
	}

	public String getP_img() {
		return p_img;
	}

	public void setP_img(String p_img) {
		this.p_img = p_img;
	}

	public String getP_url() {
		return p_url;
	}

	public void setP_url(String p_url) {
		this.p_url = p_url;
	}

	public int getP_flag() {
		return p_flag;
	}

	public void setP_flag(int p_flag) {
		this.p_flag = p_flag;
	}

	@Override
	public String toString() {
		return "PopupDTO [p_img=" + p_img + ", p_url=" + p_url + ", p_flag=" + p_flag + "]";
	}
	
	
}
