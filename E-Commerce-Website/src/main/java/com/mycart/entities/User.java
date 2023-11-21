package com.mycart.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.UniqueConstraint;



@Entity
public class User {

	// userId will act as a primary key and GeneratedValue will auto increment the the useId
	// the column name will be user_id and max length is 10
	//column name will be same as that of specified in a column annotation but it will be map to a userId property in our class
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(length = 10, name = "user_id")
	private int userId;

	@Column(length=100, name="user_name")
	private String userName;
	
	@Column(length=100,  name="user_email", unique = true, nullable = false)
	private String userEmail;
	
	@Column(length=100, name="user_password")
	private String userPassword;
	
	
	@Column(length=12, name="user_phone")
	private String userPhone;
	
	@Column(length=1500, name="user_pic")
	private String userPic;

	// The length of address can be 1500 characters and column name will be
	// user_address; Column annotation allowed to specify the length
	@Column(length = 1500, name = "user_address")
	private String userAddress;
	
	
	
	@Column(name="user_type")
	private String userType;

	//parametrized constructor using which we can provide userID
	public User(int userId, String userName, String userEmail, String userPassword, String userPhone, String userPic,
			String userAddress,String userType) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.userPhone = userPhone;
		this.userPic = userPic;
		this.userAddress = userAddress;
		this.userType=userType;
	}

	//this constructor is used with auto-incremented userId as we used @GeneratedValue annotation
	public User(String userName, String userEmail, String userPassword, String userPhone, String userPic,
			String userAddress, String userType) {
		super();
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.userPhone = userPhone;
		this.userPic = userPic;
		this.userAddress = userAddress;
		this.userType=userType;
	}

	//default constructor
	public User() {
		super();
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserPic() {
		return userPic;
	}

	public void setUserPic(String userPic) {
		this.userPic = userPic;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	
	

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}
	
	//when we want to print using reference then specific user will get printed
	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", userEmail=" + userEmail + ", userPassword="
				+ userPassword + ", userPhone=" + userPhone + ", userPic=" + userPic + ", userAddress=" + userAddress
				+ ", userType=" + userType + "]";
	}

	
	}
