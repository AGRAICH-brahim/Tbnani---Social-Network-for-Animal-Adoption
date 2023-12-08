package com.example.myproject_s3.entities;

public class PhotoEntity {
    private int IdPhoto;
    private int IdAnimal;
    private int IdOffre;
    private String namePhoto;

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

    public String getNamePhoto() {
        return namePhoto;
    }

    public void setNamePhoto(String namePhoto) {
        this.namePhoto = namePhoto;
    }
}
