package com.example.intermediet1;

import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;

import android.Manifest;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.drawable.BitmapDrawable;
import android.net.Uri;
import android.os.Bundle;
import android.provider.MediaStore;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.Toast;

import com.example.intermediet1.Data.Response.RegisterResponse;
import com.example.intermediet1.Data.Retrofit.ApiConfig;
import com.example.intermediet1.Preferences.SharedPreference;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;

import okhttp3.MediaType;
import okhttp3.MultipartBody;
import okhttp3.RequestBody;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class AddStoryActivity extends AppCompatActivity {
    private static final String TAG = DetailPage.class.getSimpleName();
    int img_gallery;
    private ImageView imageView;
    private Button photoButton, galleryButton, uploadButton;
    EditText edtDesc;

    File file;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_add_story);

        imageView = findViewById(R.id.previewImageView);
        photoButton = findViewById(R.id.cameraButton);
        galleryButton = findViewById(R.id.galleryButton);
        uploadButton = findViewById(R.id.uploadButton);
        edtDesc = findViewById(R.id.edt_upl_desc);

        if (ContextCompat.checkSelfPermission(AddStoryActivity.this, Manifest.permission.CAMERA)
            != PackageManager.PERMISSION_GRANTED) {
            ActivityCompat.requestPermissions(AddStoryActivity.this, new String[]{
                    Manifest.permission.CAMERA
            }, 100);
        }

        photoButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent cameraIntent = new Intent(MediaStore.ACTION_IMAGE_CAPTURE);
                startActivityForResult(cameraIntent, 100);
            }
        });

        galleryButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent();
                intent.setType("image/*");
                intent.setAction(Intent.ACTION_GET_CONTENT);

                startActivityForResult(Intent.createChooser(intent, "Select Picture"), img_gallery);
            }
        });

        uploadButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                uploadNewStory(edtDesc.getText().toString());
            }
        });
    }

    private File bitmapToFile(Bitmap bitmap) {
        File file1 = new File(getCacheDir(), "temp_img.jpg");
        try {
            FileOutputStream outputStream = new FileOutputStream(file1);
            bitmap.compress(Bitmap.CompressFormat.JPEG, 5, outputStream);
            outputStream.flush();
            outputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return file1;
    }

    private File convertUriToFile(Uri uri) {
        File file1 = null;
        String[] filePathColumn = {MediaStore.Images.Media.DATA};
        Cursor cursor = getContentResolver().query(uri, filePathColumn, null, null, null);

        if (cursor != null && cursor.moveToFirst()) {
            int columnIndex = cursor.getColumnIndex(filePathColumn[0]);
            String filePath = cursor.getString(columnIndex);
            cursor.close();

            file1 = new File(filePath);
        }

        return file1;
    }

    private File compressFile(File file1) {
        int MAXIMAL_SIZE = 1000000;
        Bitmap bitmap = BitmapFactory.decodeFile(file1.getPath());
        int compressQuality = 100;
        int streamLength;
        do {
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            bitmap.compress(Bitmap.CompressFormat.JPEG, compressQuality, byteArrayOutputStream);
            byte[] bmpByteArray = byteArrayOutputStream.toByteArray();
            streamLength = bmpByteArray.length;
            compressQuality -= 5;
        } while (streamLength > MAXIMAL_SIZE);
        try {
            bitmap.compress(Bitmap.CompressFormat.JPEG, compressQuality, new FileOutputStream(file1));
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        }
        return file1;
    }

    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == 100) {
            Bitmap photo = (Bitmap) data.getExtras().get("data");
            imageView.setImageBitmap(photo);
            Bitmap bitmap = ((BitmapDrawable) imageView.getDrawable()).getBitmap();
            file = bitmapToFile(bitmap);
        }

        if (resultCode == RESULT_OK) {
            if (requestCode == img_gallery) {
                Uri selectedImageUri = data.getData();
                if (null != selectedImageUri) {
                    imageView.setImageURI(selectedImageUri);
                    Bitmap bitmap = ((BitmapDrawable) imageView.getDrawable()).getBitmap();
                    file = bitmapToFile(bitmap);
                }
            }
        }
    }

    void uploadNewStory(String desc) {
        if (file != null) {
            File getFile = compressFile(file);
            SharedPreference pref = new SharedPreference(this);
            RequestBody requestBody = RequestBody.create(MediaType.parse("image/jpeg"), getFile);

            MultipartBody.Part body = MultipartBody.Part.createFormData(
                    "photo",
                    getFile.getName(),
                    requestBody
            );

            RequestBody description = RequestBody.create(MediaType.parse("multipart/form-data"), desc);
            RequestBody lat = RequestBody.create(MediaType.parse("multipart/form-data"), "-10.10");
            RequestBody lon = RequestBody.create(MediaType.parse("multipart/form-data"), "-16.10");

            Call<RegisterResponse> client = ApiConfig.getApiService().uploadFile(pref.getKeyToken(), body,description, lat, lon);
            client.enqueue(new Callback<RegisterResponse>() {
                @Override
                public void onResponse(Call<RegisterResponse> call, Response<RegisterResponse> response) {
                    if (response.isSuccessful()) {
                        if (!response.body().isError()) {
                            Toast.makeText(AddStoryActivity.this, "Data Berhasil Ditambahkan", Toast.LENGTH_SHORT).show();
                            Intent intent = new Intent(AddStoryActivity.this, HomeActivity.class);
                            startActivity(intent);
                        }else {
                            Toast.makeText(AddStoryActivity.this, "Data Gagal Ditambahkan", Toast.LENGTH_SHORT).show();
                        }
                    }
                }

                @Override
                public void onFailure(Call<RegisterResponse> call, Throwable t) {
                    Log.e(TAG, "onFailure: " + t.getMessage());
                }
            });
        } else {

        }
    }
}