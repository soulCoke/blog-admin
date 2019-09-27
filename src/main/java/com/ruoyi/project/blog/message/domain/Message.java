package com.ruoyi.project.blog.message.domain;

import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;
import java.util.Date;

/**
 * 留言对象 blog_message
 * 
 * @author ruoyi
 * @date 2019-09-14
 */
@Data
public class Message extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 删除时间 */
    private Date deleteTime;

    /** 0：删除 1：存在 */
    private Integer status;

    /** 内容 */
    @Excel(name = "内容")
    private String content;

    /** 回复父id */
    private Long replyId;

    /** 作者 */
    @Excel(name = "作者")
    private Long userId;

    private String userName;

}
