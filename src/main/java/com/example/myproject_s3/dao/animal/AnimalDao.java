package com.example.myproject_s3.dao.animal;

import com.example.myproject_s3.entities.AnimalEntity;

import java.util.List;

public interface AnimalDao {
    Long addAnimal(AnimalEntity animal);

    AnimalEntity getAnimalById(Long animalId);

    List<AnimalEntity> getAllAnimals();

    void updateAnimal(AnimalEntity animal);

    void deleteOffre(Long animalId);
    AnimalEntity recupererDernierAnimal();

}
