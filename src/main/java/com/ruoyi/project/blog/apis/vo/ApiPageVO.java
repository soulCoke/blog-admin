package com.ruoyi.project.blog.apis.vo;

import lombok.Data;

import java.util.List;

/**
 * @author soulCoke
 * @ClassName ApiPageVO.java
 * @Description TODO
 * @createTime 2019年09月24日 21:51:00
 */
@Data
public class ApiPageVO {
    private Integer current_page;//当前页
    private List<?> data; // 分页数据
    private Long total; // 总数
    private Integer per_page; //每页10条
    private Long last_page; // 最后一页
    private String path; // url 基础路径
    private String prev_page_url; // 上一页地址
    private String first_page_url; // 第一页地址
    private String last_page_url; // 最后一页地址
    private String next_page_url; //下一页地址

}
