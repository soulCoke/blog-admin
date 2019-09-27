package com.ruoyi.project.blog.apis.dto;

import lombok.Data;

/**
 * @author soulCoke
 * @ClassName BaseApiDTO.java
 * @Description TODO
 * @createTime 2019年09月24日 21:24:00
 */
@Data
public class BaseApiDTO {
    private Integer page;
    private Integer pageSize;
    private Integer sumCount;
    private Long id;
}
