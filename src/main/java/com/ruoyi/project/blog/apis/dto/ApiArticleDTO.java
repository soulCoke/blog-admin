package com.ruoyi.project.blog.apis.dto;

import lombok.Data;

/**
 * @author soulCoke
 * @ClassName ApiArticleDTO.java
 * @Description TODO
 * @createTime 2019年09月24日 21:24:00
 */
@Data
public class ApiArticleDTO extends  BaseApiDTO {
    private String tag; // 标签
    private Integer articleFlag;// 1：上一章  2：下一张
    private Long article_id;
    private Long userId;
    private Integer delFlag; //1:点击，阅读  2：喜欢  3：评论
}
