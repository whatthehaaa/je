package com.myprsite.vo;

public class JoinVO {
	String chk1, chk2, chk3, chk4;
	String id, pass, name, year, month, day, birth, gender, email, hp;
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
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getChk1() {
		return chk1;
	}
	public void setChk1(String chk1) {
		this.chk1 = chk1;
	}
	public String getChk2() {
		return chk2;
	}
	public void setChk2(String chk2) {
		this.chk2 = chk2;
	}
	public String getChk3() {
		return chk3;
	}
	public void setChk3(String chk3) {
		this.chk3 = chk3;
	}
	public String getChk4() {
		return chk4;
	}
	public void setChk4(String chk4) {
		this.chk4 = chk4;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		if(birth == null) {
			return year + "-" + month + "-" + day;
		}else {
			return birth;
		}
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	
	
}
