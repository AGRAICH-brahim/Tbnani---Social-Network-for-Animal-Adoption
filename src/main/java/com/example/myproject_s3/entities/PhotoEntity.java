package com.example.myproject_s3.entities;

import java.util.Base64;

public class PhotoEntity {
    private int IdPhoto;
    private int IdAnimal;
    private int IdOffre;
    private byte[] photoContent; // Content of the photo as bytes

    public int getIdPhoto() {
        return IdPhoto;
    }

    public void setIdPhoto(int idPhoto) {
        IdPhoto = idPhoto;
    }

    public int getIdAnimal() {
        return IdAnimal;
    }

    public void setIdAnimal(int idAnimal) {
        IdAnimal = idAnimal;
    }

    public int getIdOffre() {
        return IdOffre;
    }

    public void setIdOffre(int idOffre) {
        IdOffre = idOffre;
    }
    public byte[] getPhotoContent() {
        return photoContent;
    }

    public void setPhotoContent(byte[] photoContent) {

        this.photoContent = photoContent;
    }
    public String getBase64EncodedContent() {
        if (photoContent != null) {
            return Base64.getEncoder().encodeToString(photoContent);
        } else {
            return null;
        }
    }
}
