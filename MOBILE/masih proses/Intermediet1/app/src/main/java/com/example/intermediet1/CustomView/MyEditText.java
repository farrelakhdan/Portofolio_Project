package com.example.intermediet1.CustomView;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.AttributeSet;
import android.view.View;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.widget.AppCompatEditText;
import androidx.core.content.ContextCompat;

import com.example.intermediet1.R;

public class MyEditText extends AppCompatEditText {
    private Drawable errorButton, lock;

    public MyEditText(@NonNull Context context) {
        super(context);
        init();
    }

    public MyEditText(@NonNull Context context, @Nullable AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    public MyEditText(@NonNull Context context, @Nullable AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init();
    }
    private void showErrorButton() {
        setCompoundDrawablesWithIntrinsicBounds(lock,null,errorButton,null);
    }
    private void hideErrorButton() {
        setCompoundDrawablesWithIntrinsicBounds(lock,null,null,null);
    }

    public void init() {
        errorButton = (Drawable) ContextCompat.getDrawable(getContext(), R.drawable.baseline_error_outline_24);
        lock = (Drawable) ContextCompat.getDrawable(getContext(), R.drawable.baseline_lock_24);
        addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence charSequence, int i, int i1, int i2) {

            }

            @Override
            public void onTextChanged(CharSequence charSequence, int i, int i1, int i2) {
                if (charSequence.length() < 8) {
                    showErrorButton();
                }else {
                    hideErrorButton();
                }
            }

            @Override
            public void afterTextChanged(Editable editable) {

            }
        });
    }

    @Override
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        setHint("Masukkan Password");
        setTextAlignment(View.TEXT_ALIGNMENT_VIEW_START);
    }
}
