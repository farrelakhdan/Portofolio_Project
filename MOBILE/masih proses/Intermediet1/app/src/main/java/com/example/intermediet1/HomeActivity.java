package com.example.intermediet1;

import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityOptionsCompat;
import androidx.core.util.Pair;
import androidx.recyclerview.widget.DividerItemDecoration;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;

import com.example.intermediet1.Adapter.HomeAdapter;
import com.example.intermediet1.Data.Response.ListStoryItem;
import com.example.intermediet1.Data.Retrofit.ApiConfig;
import com.example.intermediet1.Preferences.SharedPreference;

import java.util.ArrayList;
import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class HomeActivity extends AppCompatActivity {
    private static final String TAG = MainActivity.class.getSimpleName();
    private RecyclerView recyclerView;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home);

        recyclerView = findViewById(R.id.recv);

        LinearLayoutManager layoutManager = new LinearLayoutManager(this);
        recyclerView.setLayoutManager(layoutManager);
        DividerItemDecoration itemDecoration = new DividerItemDecoration(this, layoutManager.getOrientation());
        recyclerView.addItemDecoration(itemDecoration);

        getData();
    }

    private void getData() {
        SharedPreference pref = new SharedPreference(this);
        Call<ListStoryItem> client = ApiConfig.getApiService().getAllStories(pref.getKeyToken().toString(),1,5,0);
        client.enqueue(new Callback<ListStoryItem>() {
            @Override
            public void onResponse(Call<ListStoryItem> call, Response<ListStoryItem> response) {
                if (response.isSuccessful()) {
                    if (response.body() != null) {
                        setListStory(response.body().getListStory());
                    }
                } else {
                    if (response.body() != null) {
                        Log.e(TAG, "onFailure: ");
                    }
                }
            }

            @Override
            public void onFailure(Call<ListStoryItem> call, Throwable t) {
                Log.e(TAG, "onFailure: " + t.getMessage());
            }
        });
    }

    private void setListStory(List<ListStoryItem> items) {
        ArrayList<ListStoryItem> listItem = new ArrayList<ListStoryItem>();
        for (ListStoryItem item : items) {
            ListStoryItem data = new ListStoryItem();
            data.setName(item.getName());
            data.setDescription(item.getDescription());
            data.setPhotoUrl(item.getPhotoUrl());
            data.setId(item.getId());
            listItem.add(data);
        }
        HomeAdapter adapter = new HomeAdapter(listItem);
        recyclerView.setAdapter(adapter);
        adapter.setOnItemClickCallback(data -> {
            Intent intentToDetail = new Intent(HomeActivity.this, DetailPage.class);
            intentToDetail.putExtra("id", data.getId());
            startActivity(intentToDetail);
        });
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater menuInflater = getMenuInflater();
        menuInflater.inflate(R.menu.option_menu, menu);

        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == R.id.add) {
            Intent intent = new Intent(HomeActivity.this, AddStoryActivity.class);
            startActivity(intent);
            return true;
        }else if (item.getItemId() == R.id.logout) {
            SharedPreference pref = new SharedPreference(this);
            Intent intent = new Intent(HomeActivity.this, MainActivity.class);
            pref.removeKeyToken();
            startActivity(intent);
            return true;
        }else {
            return true ;
        }
    }
}