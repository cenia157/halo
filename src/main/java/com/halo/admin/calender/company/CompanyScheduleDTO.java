package com.halo.admin.calender.company;

public class CompanyScheduleDTO {
	private String yearmonth;
	private String title;
	private String txt;
	private String date;
	private String update;
	
	public CompanyScheduleDTO() {
		// TODO Auto-generated constructor stub
	}

	public CompanyScheduleDTO(String yearmonth, String title, String txt, String date, String update) {
		super();
		this.yearmonth = yearmonth;
		this.title = title;
		this.txt = txt;
		this.date = date;
		this.update = update;
	}

	public String getYearmonth() {
		return yearmonth;
	}

	public void setYearmonth(String yearmonth) {
		this.yearmonth = yearmonth;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTxt() {
		return txt;
	}

	public void setTxt(String txt) {
		this.txt = txt;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getUpdate() {
		return update;
	}

	public void setUpdate(String update) {
		this.update = update;
	}
	
	
}
