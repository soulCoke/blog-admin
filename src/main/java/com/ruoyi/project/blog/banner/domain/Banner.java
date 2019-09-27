package com.ruoyi.project.blog.banner.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * banner图对象 blog_banner
 * 
 * @author ruoyi
 * @date 2019-09-26
 */
public class Banner extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 图片地址 */
    @Excel(name = "图片地址")
    private String url;

    /** 描述 */
    @Excel(name = "描述")
    private String description;

    /** 类型：自定义。自己根据用途 */
    @Excel(name = "类型：自定义。自己根据用途")
    private String type;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setUrl(String url) 
    {
        this.url = url;
    }

    public String getUrl() 
    {
        return url;
    }
    public void setDescription(String description) 
    {
        this.description = description;
    }

    public String getDescription() 
    {
        return description;
    }
    public void setType(String type) 
    {
        this.type = type;
    }

    public String getType() 
    {
        return type;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("url", getUrl())
            .append("description", getDescription())
            .append("type", getType())
            .toString();
    }
}
