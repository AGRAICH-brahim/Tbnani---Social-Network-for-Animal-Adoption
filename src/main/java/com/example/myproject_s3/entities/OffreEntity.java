package com.example.myproject_s3.entities;

import java.sql.Timestamp;

public class OffreEntity {
    private int IdOffre;
    private int IdProprietaire;
    private int IdAnimal ;
    private String description;
    private Timestamp dateTime;

    public int getIdOffre() {
        return IdOffre;
    }

    public void setIdOffre(int idOffre) {
        IdOffre = idOffre;
    }

    public int getIdProprietaire() {
        return IdProprietaire;
    }

    public void setIdProprietaire(int idProprietaire) {
        IdProprietaire = idProprietaire;
    }

    public int getIdAnimal() {
        return IdAnimal;
    }

    public void setIdAnimal(int idAnimal) {
        IdAnimal = idAnimal;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Timestamp getDateTime() {
        return dateTime;
    }

    public void setDateTime(Timestamp dateTime) {
        this.dateTime = dateTime;
    }
}
