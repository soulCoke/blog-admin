package com.ruoyi.project.system.info.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * 文件对象 sys_file_info
 * 
 * @author ruoyi
 * @date 2019-09-20
 */
public class FileInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 文件名称 */
    @Excel(name = "文件名称")
    private String name;

    /** 绝对路径 */
    @Excel(name = "绝对路径")
    private String abPath;

    /** 相对路径 */
    @Excel(name = "相对路径")
    private String rtPath;

    /** 网络地址 */
    @Excel(name = "网络地址")
    private String url;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setAbPath(String abPath) 
    {
        this.abPath = abPath;
    }

    public String getAbPath() 
    {
        return abPath;
    }
    public void setRtPath(String rtPath) 
    {
        this.rtPath = rtPath;
    }

    public String getRtPath() 
    {
        return rtPath;
    }
    public void setUrl(String url) 
    {
        this.url = url;
    }

    public String getUrl() 
    {
        return url;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("createTime", getCreateTime())
            .append("name", getName())
            .append("abPath", getAbPath())
            .append("rtPath", getRtPath())
            .append("url", getUrl())
            .toString();
    }
}
