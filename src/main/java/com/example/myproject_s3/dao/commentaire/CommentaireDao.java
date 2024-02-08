package com.example.myproject_s3.dao.commentaire;

import com.example.myproject_s3.entities.CommentaireEntity;

import java.util.List;

public interface CommentaireDao {
    void create(CommentaireEntity commentaire);

    List<CommentaireEntity> getAllCommentsByOffreId(int blogId);

    void update(CommentaireEntity commentaire);

    void delete(int id);
    void deleteByIdOffre(int idOffre);
    boolean isDuplicateComment(int userId, int offreId, String content);
}
