package com.example.intermediet1.Data.Response;

public class RegisterResponse{
	private boolean error;
	private String message;

	public boolean isError(){
		return error;
	}

	public String getMessage(){
		return message;
	}
}
