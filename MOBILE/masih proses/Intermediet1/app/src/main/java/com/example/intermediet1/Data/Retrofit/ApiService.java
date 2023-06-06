package com.example.intermediet1.Data.Retrofit;

import com.example.intermediet1.Data.Response.ListStoryDetail;
import com.example.intermediet1.Data.Response.ListStoryItem;
import com.example.intermediet1.Data.Response.LoginResponse;
import com.example.intermediet1.Data.Response.RegisterResponse;

import java.io.File;

import okhttp3.MultipartBody;
import okhttp3.RequestBody;
import retrofit2.Call;
import retrofit2.http.*;

public interface ApiService {

    @FormUrlEncoded
    @POST("register")
    Call<RegisterResponse> getRegister(
            @Field("name") String name,
            @Field("email") String email,
            @Field("password") String password
    );
    @FormUrlEncoded
    @POST("login")
    Call<LoginResponse> getLogin (
            @Field("email") String email,
            @Field("password") String password
    );

    @GET("stories")
    Call<ListStoryItem> getAllStories(
            @Header("Authorization") String token,
            @Query("page") int page,
            @Query("size") int size,
            @Query("location") int location
    );

    @GET("stories/{id}")
    Call<ListStoryDetail> getDetail(
            @Header("Authorization") String token,
            @Path("id") String id
    );

    @Multipart
    @POST("stories")
    Call<RegisterResponse> uploadFile(
            @Header("Authorization") String token,
            @Part MultipartBody.Part file,
            @Part("description") RequestBody desc,
            @Part("lat") RequestBody lat,
            @Part("lon") RequestBody lon
            );
}
