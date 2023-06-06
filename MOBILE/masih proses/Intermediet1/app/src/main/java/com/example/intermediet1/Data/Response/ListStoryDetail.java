package com.example.intermediet1.Data.Response;

import com.google.gson.annotations.SerializedName;

public class ListStoryDetail{

	@SerializedName("error")
	private boolean error;

	@SerializedName("message")
	private String message;

	@SerializedName("story")
	private Story story;

	public void setError(boolean error){
		this.error = error;
	}

	public boolean isError(){
		return error;
	}

	public void setMessage(String message){
		this.message = message;
	}

	public String getMessage(){
		return message;
	}

	public void setStory(Story story){
		this.story = story;
	}

	public Story getStory(){
		return story;
	}
}