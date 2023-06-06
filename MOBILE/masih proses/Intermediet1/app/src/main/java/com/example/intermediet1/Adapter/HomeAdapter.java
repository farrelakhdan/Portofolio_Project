package com.example.intermediet1.Adapter;

import android.view.LayoutInflater;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.core.app.ActivityOptionsCompat;
import androidx.recyclerview.widget.RecyclerView;

import com.bumptech.glide.Glide;
import com.example.intermediet1.Data.Response.ListStoryItem;
import com.example.intermediet1.databinding.CardViewBinding;

import java.util.List;

public class HomeAdapter extends RecyclerView.Adapter<HomeAdapter.ListViewHolder> {
    private final List<ListStoryItem> list;
    private OnItemClickCallback onItemClickCallback;

    public HomeAdapter(List<ListStoryItem> list) {
        this.list = list;
    }

    public void setOnItemClickCallback(OnItemClickCallback onItemClickCallback) {
        this.onItemClickCallback = onItemClickCallback;
    }

    @NonNull
    @Override
    public HomeAdapter.ListViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        return new HomeAdapter.ListViewHolder(CardViewBinding.inflate(LayoutInflater.from(parent.getContext()),
                parent, false));
    }

    @Override
    public void onBindViewHolder(@NonNull HomeAdapter.ListViewHolder holder, int position) {
        holder.binding.tvItemName.setText(list.get(position).getName());
        holder.binding.tvItemDesc.setText(list.get(position).getDescription());
        Glide.with(holder.binding.getRoot()).
                load(list.get(position).getPhotoUrl())
                .into(holder.binding.imgItemImage);
        holder.itemView.setOnClickListener(v -> {
            onItemClickCallback.onItemClicked(
                    list.get(holder.getAdapterPosition())
            );
        });
    }

    @Override
    public int getItemCount() {
        return list.size();
    }

    public class ListViewHolder extends RecyclerView.ViewHolder {
        CardViewBinding binding;

        public ListViewHolder(@NonNull CardViewBinding binding) {
            super(binding.getRoot());
            this.binding = binding;
        }
    }

    public interface OnItemClickCallback {
        void onItemClicked(ListStoryItem data);
    }
}
