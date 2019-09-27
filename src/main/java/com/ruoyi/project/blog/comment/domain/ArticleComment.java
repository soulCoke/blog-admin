package com.ruoyi.project.blog.comment.domain;

import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;
import java.util.Date;

/**
 * 文章评论对象 blog_article_comment
 * 
 * @author ruoyi
 * @date 2019-09-14
 */
@Data
public class ArticleComment extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 删除时间 */
    private Date deleteTime;

    /** 0删除 1 存在 */
    private Integer status;

    /** 用户id */
    private Long userId;

    /** 内容 */
    @Excel(name = "内容")
    private String content;

    /** 文章id */
    private Long articleId;

    /** 回复父id */
    private Long replyId;

    private String userName;
    


}
