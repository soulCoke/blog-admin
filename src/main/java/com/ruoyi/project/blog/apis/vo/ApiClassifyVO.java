package com.ruoyi.project.blog.apis.vo;

import lombok.Data;

import java.util.List;

@Data
public class ApiClassifyVO {
    private Long id;
    private String name;
    private String[] tags;
    private String tempTags;
}
