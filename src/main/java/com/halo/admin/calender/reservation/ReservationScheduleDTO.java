package com.halo.admin.calender.reservation;

import com.google.gson.Gson;

public class ReservationScheduleDTO {
	private String no;
	private String service;
	private String applicant;
	private String phoneNumber;
	private String userName;
	private String gender;
	private String birthDate;
	private String year;
	private String month;
	private String dates;
	private String time;
	private String addr;
	private String startPlace;
	private String endPlace;
	private String registrationDate;
	
	public ReservationScheduleDTO() {
		// TODO Auto-generated constructor stub
	}

	public ReservationScheduleDTO(String no, String service, String applicant, String phoneNumber, String userName,
			String gender, String birthDate, String year, String month, String dates, String time, String addr,
			String startPlace, String endPlace, String registrationDate) {
		super();
		this.no = no;
		this.service = service;
		this.applicant = applicant;
		this.phoneNumber = phoneNumber;
		this.userName = userName;
		this.gender = gender;
		this.birthDate = birthDate;
		this.year = year;
		this.month = month;
		this.dates = dates;
		this.time = time;
		this.addr = addr;
		this.startPlace = startPlace;
		this.endPlace = endPlace;
		this.registrationDate = registrationDate;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getService() {
		return service;
	}

	public void setService(String service) {
		this.service = service;
	}

	public String getApplicant() {
		return applicant;
	}

	public void setApplicant(String applicant) {
		this.applicant = applicant;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getDate() {
		return dates;
	}

	public void setDate(String dates) {
		this.dates = dates;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getStartPlace() {
		return startPlace;
	}

	public void setStartPlace(String startPlace) {
		this.startPlace = startPlace;
	}

	public String getEndPlace() {
		return endPlace;
	}

	public void setEndPlace(String endPlace) {
		this.endPlace = endPlace;
	}

	public String getRegistrationDate() {
		return registrationDate;
	}

	public void setRegistRationDate(String registrationDate) {
		this.registrationDate = registrationDate;
	}
	
	public String toJson() {
		Gson gson = new Gson();
		return gson.toJson(this);
	}
}
