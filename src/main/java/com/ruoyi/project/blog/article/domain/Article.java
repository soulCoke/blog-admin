package com.ruoyi.project.blog.article.domain;

import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;
import java.util.Date;

/**
 * 博客文章对象 blog_article
 * 
 * @author ruoyi
 * @date 2019-09-14
 */
@Data
public class Article extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 删除时间 */
    private Date deleteTime;

    /** 0：删除 1：存在 */
    private Integer status;

    /** 作者 */
    private Long userId;

    /** 标题 */
    @Excel(name = "标题")
    private String title;

    /** 描述 */
    @Excel(name = "描述")
    private String description;

    /** 正文 */
    @Excel(name = "正文")
    private String content;

    /** 文章首图 */
    @Excel(name = "文章首图")
    private String img;

    /** 分类id */
    private Long classifyId;

    /** 点击数 */
    @Excel(name = "点击数")
    private Long clickCount;

    /** 喜欢数 */
    @Excel(name = "喜欢数")
    private Long likeCount;

    /** 浏览数 */
    @Excel(name = "浏览数")
    private Long viewCount;

    /** 标签id */
    private String tagIds;
    /** 标签 */
    private String tags;

    /** 评论数 */
    @Excel(name = "评论数")
    private Long commentCount;


}
