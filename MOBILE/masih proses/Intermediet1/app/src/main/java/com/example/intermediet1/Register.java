package com.example.intermediet1;

import static android.content.ContentValues.TAG;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.example.intermediet1.Data.Response.RegisterResponse;
import com.example.intermediet1.Data.Retrofit.ApiConfig;
import com.example.intermediet1.Preferences.SharedPreference;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class Register extends AppCompatActivity {

    Button button;
    EditText name, email, password;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register);

        button = findViewById(R.id.btn_register);
        name = findViewById(R.id.ed_register_nama);
        email = findViewById(R.id.ed_register_email);
        password = findViewById(R.id.ed_register_password);

        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Call<RegisterResponse> client = ApiConfig.getApiService().getRegister(name.getText().toString(), email.getText().toString(), password.getText().toString());
                client.enqueue(new Callback<RegisterResponse>() {
                    @Override
                    public void onResponse(Call<RegisterResponse> call, Response<RegisterResponse> response) {
                        if (response.isSuccessful()) {
                            if (response.body().getMessage().equalsIgnoreCase("User Created")) {
                                Toast.makeText(Register.this, "User Berhasil Dibuat", Toast.LENGTH_SHORT).show();
                                Intent intent = new Intent(Register.this, MainActivity.class);
                                startActivity(intent);
                            }else {
                                Toast.makeText(Register.this, "User Gagal Dibuat", Toast.LENGTH_SHORT).show();
                            }
                        }
                    }

                    @Override
                    public void onFailure(Call<RegisterResponse> call, Throwable t) {
                        Log.e(TAG, "onFailure: " + t.getMessage());
                    }
                });
            }
        });
    }
}