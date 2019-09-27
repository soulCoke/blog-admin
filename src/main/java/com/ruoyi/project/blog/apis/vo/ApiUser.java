package com.ruoyi.project.blog.apis.vo;

import lombok.Data;

import java.io.Serializable;

/**
 * @author soulCoke
 * @ClassName ApiUser.java
 * @Description TODO
 * @createTime 2019年09月26日 14:28:00
 */
@Data
public class ApiUser implements Serializable {
    private Long id;
    private String name;
    private String email;
    private String phone;
    private String avatar_url;
    private String intro;
}
