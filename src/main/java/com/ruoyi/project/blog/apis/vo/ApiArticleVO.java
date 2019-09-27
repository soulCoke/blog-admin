package com.ruoyi.project.blog.apis.vo;

import com.ruoyi.project.blog.article.domain.Article;
import lombok.Data;

import java.util.List;

@Data
public class ApiArticleVO  {
    private Long id;
    private String title;
    private String img;
    private String classify;
    private Integer clicks;
    private Integer like;
    private String created_at;
    private String deleted_at;
    private Integer view_count;
    private String[] tags;
    private String tempTags;
    private Integer commentCount;
    private String content;
    private Long classifyId;
    private List<ApiArticleVO> prevArticle;
    private List<ApiArticleVO> nextrAticle;
    private Integer comment;
}
