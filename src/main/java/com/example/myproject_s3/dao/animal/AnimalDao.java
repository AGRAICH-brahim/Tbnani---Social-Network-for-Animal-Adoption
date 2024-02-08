package com.example.myproject_s3.dao.animal;

import com.example.myproject_s3.entities.AnimalEntity;

import java.util.List;

public interface AnimalDao {
    Long addAnimal(AnimalEntity animal);

    AnimalEntity getAnimalById(int animalId);
    List<AnimalEntity> getAnimalsByOffre(int offreId);

    List<AnimalEntity> getAllAnimals();

    void updateAnimal(AnimalEntity animal);

    void deleteAnimal(int animalId);
    AnimalEntity recupererDernierAnimal();

}
