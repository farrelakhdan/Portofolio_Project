package com.example.intermediet1.Data.Response;

import com.google.gson.annotations.SerializedName;

public class LoginResult{

	@SerializedName("name")
	private String name;

	@SerializedName("userId")
	private String userId;

	@SerializedName("token")
	private String token;

	public String getName(){
		return name;
	}

	public String getUserId(){
		return userId;
	}

	public String getToken(){
		return token;
	}
}