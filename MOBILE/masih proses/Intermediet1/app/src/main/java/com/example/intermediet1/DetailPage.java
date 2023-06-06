package com.example.intermediet1;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.widget.ImageView;
import android.widget.TextView;

import com.bumptech.glide.Glide;
import com.example.intermediet1.Data.Response.ListStoryDetail;
import com.example.intermediet1.Data.Response.ListStoryItem;
import com.example.intermediet1.Data.Retrofit.ApiConfig;
import com.example.intermediet1.Preferences.SharedPreference;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class DetailPage extends AppCompatActivity {
    private static final String TAG = DetailPage.class.getSimpleName();
    ImageView imageView;
    TextView name, desc;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_detail_page);

        imageView = findViewById(R.id.img_detail_image);
        name = findViewById(R.id.tv_detail_name);
        desc = findViewById(R.id.tv_detail_desc);

        getData(getIntent().getStringExtra("id"));
    }

    private void getData(String id) {
        SharedPreference pref = new SharedPreference(this);
        Call<ListStoryDetail> client = ApiConfig.getApiService().getDetail(pref.getKeyToken(),id);
        client.enqueue(new Callback<ListStoryDetail>() {
            @Override
            public void onResponse(Call<ListStoryDetail> call, Response<ListStoryDetail> response) {
                if (response.isSuccessful()) {
                    if (response.body() != null) {
                        Glide.with(getApplicationContext())
                                .load(response.body().getStory().getPhotoUrl())
                                .into(imageView);
                        name.setText(response.body().getStory().getName());
                        desc.setText(response.body().getStory().getDescription());
                    }
                } else {
                    if (response.body() != null) {
                        Log.e(TAG, "onFailure: ");
                    }
                }
            }

            @Override
            public void onFailure(Call<ListStoryDetail> call, Throwable t) {
                Log.e(TAG, "onFailure: " + t.getMessage());
            }
        });
    }
}