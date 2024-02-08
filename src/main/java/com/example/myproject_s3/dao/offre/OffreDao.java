package com.example.myproject_s3.dao.offre;

import com.example.myproject_s3.entities.OffreEntity;

import java.util.List;

public interface OffreDao {
    Long addOffre(OffreEntity offre);

    OffreEntity getOffreById(int offreId);

    List<OffreEntity> getOffresByIdUser(Integer offreId);

    List<OffreEntity> getAllOffres();

    void updateOffre(OffreEntity offre);

    void deleteOffre(int offreId);

}
