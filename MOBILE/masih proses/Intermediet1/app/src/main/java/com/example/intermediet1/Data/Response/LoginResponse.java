package com.example.intermediet1.Data.Response;

import com.google.gson.annotations.SerializedName;

public class LoginResponse{

	@SerializedName("loginResult")
	private LoginResult loginResult;

	@SerializedName("error")
	private boolean error;

	@SerializedName("message")
	private String message;

	public LoginResult getLoginResult(){
		return loginResult;
	}

	public boolean isError(){
		return error;
	}

	public String getMessage(){
		return message;
	}
}