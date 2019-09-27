package com.ruoyi.project.blog.apis.vo;

import lombok.Data;

/**
 * @author soulCoke
 * @ClassName ApiComment.java
 * @Description TODO
 * @createTime 2019年09月25日 10:43:00
 */
@Data
public class ApiMessageVO {
    private Long id;
    private String content;
    private Long article_id;
    private Long user_id;
    private Long reply_id;
    private String name;
    private String created_at;
    private String user;
}
