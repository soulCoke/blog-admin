package com.ruoyi.project.blog.apis.vo;

import lombok.Data;

/**
 * @author soulCoke
 * @ClassName ApiLinkVO.java
 * @Description TODO
 * @createTime 2019年09月26日 10:17:00
 */
@Data
public class ApiLinkVO {
    private  Long id;
    private  String title;
    private String url;
    private String img;
    private String desc;
}
