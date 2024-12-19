package com.student.dto;
//-------------------------------------->DTO(Data Transfer Objects)POJO Class
public class student {
     
	//INSTANCE VARIABLEES
	private int id;
	private String name;
	private long phone;
	private String email;
	private String branch;
	private String location;
	private String password;
	private String date;
	private int Option;
	
	
	//GENERATE GETTERS AND SETTERS----->right click on code -->source-->generate getter & setter-->select all-->generate.
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public long getPhone() {
		return phone;
	}
	public void setPhone(long phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getOption() {
		return Option;
	}
	public void setOption(int option) {
		Option = option;
	}
	@Override
	public String toString() {
		return "student [id=" + id + ", name=" + name + ", phone=" + phone + ", email=" + email + ", branch=" + branch
				+ ", location=" + location + "]";
	}	
	
}
