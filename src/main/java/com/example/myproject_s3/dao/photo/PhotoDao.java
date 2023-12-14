package com.example.myproject_s3.dao.photo;

import com.example.myproject_s3.entities.PhotoEntity;

import java.util.List;

public interface PhotoDao  {

    void addPhoto(PhotoEntity photo);

    PhotoEntity getPhotoById(int photoId);

    List<PhotoEntity> getAllPhotos();

    void updatePhoto(PhotoEntity photo);

    void deletePhoto(int photoId);

    List<PhotoEntity> getPhotosByOffreId(int offreId);
}
