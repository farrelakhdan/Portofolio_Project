package com.example.intermediet1;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import com.example.intermediet1.Data.Response.LoginResponse;
import com.example.intermediet1.Data.Retrofit.ApiConfig;
import com.example.intermediet1.Preferences.SharedPreference;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class MainActivity extends AppCompatActivity {
    Button buttonLogin, btnToReg;
    EditText edtEmail, edtPassword;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        edtEmail = findViewById(R.id.ed_login_email);
        edtPassword = findViewById(R.id.ed_login_password);
        buttonLogin = findViewById(R.id.btn_login);
        btnToReg = findViewById(R.id.btn_register_login);
        SharedPreference pref = new SharedPreference(getApplicationContext());

        if (!pref.getKeyToken().isEmpty()) {
            Intent intent = new Intent(MainActivity.this, HomeActivity.class);
            startActivity(intent);
        }
        buttonLogin.setOnClickListener(view -> {
            Call<LoginResponse> client = ApiConfig.getApiService().getLogin(edtEmail.getText().toString(), edtPassword.getText().toString());
            client.enqueue(new Callback<LoginResponse>() {
                @Override
                public void onResponse(@NonNull Call<LoginResponse> call, @NonNull Response<LoginResponse> response) {
                    if (response.isSuccessful()) {
                        if (response.body() != null) {

                            pref.setKeyToken("Bearer " + response.body().getLoginResult().getToken());
                            Intent intent = new Intent(MainActivity.this, HomeActivity.class);
                            startActivity(intent);
                        }
                    }
                }

                @Override
                public void onFailure(@NonNull Call<LoginResponse> call, @NonNull Throwable t) {

                }
            });
        });

        btnToReg.setOnClickListener(view -> {
            Intent intent = new Intent(MainActivity.this, Register.class);
            startActivity(intent);
        });

        ObjectAnimator email = ObjectAnimator.ofFloat(edtEmail, View.ALPHA, 1f).setDuration(500);
        ObjectAnimator password = ObjectAnimator.ofFloat(edtPassword, View.ALPHA, 1f).setDuration(500);
        ObjectAnimator btnLogin = ObjectAnimator.ofFloat(buttonLogin, View.ALPHA, 1f).setDuration(500);
        ObjectAnimator btnRegis = ObjectAnimator.ofFloat(btnToReg, View.ALPHA, 1f).setDuration(500);

        AnimatorSet animator = new AnimatorSet();
        animator.playSequentially(email,password,btnLogin,btnRegis);
        animator.start();
    }
}