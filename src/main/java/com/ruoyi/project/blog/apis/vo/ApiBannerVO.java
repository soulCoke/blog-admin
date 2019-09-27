package com.ruoyi.project.blog.apis.vo;

import lombok.Data;

/**
 * @author soulCoke
 * @ClassName ApiBannerVO.java
 * @Description TODO
 * @createTime 2019年09月26日 10:09:00
 */
@Data
public class ApiBannerVO {
    private Long id;
    private String title;
    private  String url;
    private String type;
    private String created_at;
}
