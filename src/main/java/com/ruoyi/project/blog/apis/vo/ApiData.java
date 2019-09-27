package com.ruoyi.project.blog.apis.vo;

import lombok.Data;

/**
 * @author soulCoke
 * @ClassName ApiData.java
 * @Description TODO
 * @createTime 2019年09月24日 22:23:00
 */
@Data
public class ApiData {
    private String status; //状态     success
    private Integer code; // 200
    private Object data;
    private String message;// 消息
}
