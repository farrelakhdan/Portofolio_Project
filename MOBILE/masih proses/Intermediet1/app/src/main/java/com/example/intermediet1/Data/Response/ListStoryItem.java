package com.example.intermediet1.Data.Response;

import java.util.List;
import com.google.gson.annotations.SerializedName;

public class ListStoryItem{

	@SerializedName("listStory")
	private List<ListStoryItem> listStory;

	@SerializedName("error")
	private boolean error;

	@SerializedName("message")
	private String message;

	@SerializedName("photoUrl")
	private String photoUrl;

	@SerializedName("createdAt")
	private String createdAt;

	@SerializedName("name")
	private String name;

	@SerializedName("description")
	private String description;

	@SerializedName("lon")
	private Object lon;

	@SerializedName("id")
	private String id;

	@SerializedName("lat")
	private Object lat;

	public void setListStory(List<ListStoryItem> listStory){
		this.listStory = listStory;
	}

	public List<ListStoryItem> getListStory(){
		return listStory;
	}

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

	public void setPhotoUrl(String photoUrl){
		this.photoUrl = photoUrl;
	}

	public String getPhotoUrl(){
		return photoUrl;
	}

	public void setCreatedAt(String createdAt){
		this.createdAt = createdAt;
	}

	public String getCreatedAt(){
		return createdAt;
	}

	public void setName(String name){
		this.name = name;
	}

	public String getName(){
		return name;
	}

	public void setDescription(String description){
		this.description = description;
	}

	public String getDescription(){
		return description;
	}

	public void setLon(Object lon){
		this.lon = lon;
	}

	public Object getLon(){
		return lon;
	}

	public void setId(String id){
		this.id = id;
	}

	public String getId(){
		return id;
	}

	public void setLat(Object lat){
		this.lat = lat;
	}

	public Object getLat(){
		return lat;
	}
}