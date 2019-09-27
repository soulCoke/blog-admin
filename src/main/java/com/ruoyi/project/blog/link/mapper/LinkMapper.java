package com.ruoyi.project.blog.link.mapper;

import com.ruoyi.project.blog.link.domain.Link;
import java.util.List;

/**
 * 友链Mapper接口
 * 
 * @author ruoyi
 * @date 2019-09-26
 */
public interface LinkMapper 
{
    /**
     * 查询友链
     * 
     * @param id 友链ID
     * @return 友链
     */
    public Link selectLinkById(Long id);

    /**
     * 查询友链列表
     * 
     * @param link 友链
     * @return 友链集合
     */
    public List<Link> selectLinkList(Link link);

    /**
     * 新增友链
     * 
     * @param link 友链
     * @return 结果
     */
    public int insertLink(Link link);

    /**
     * 修改友链
     * 
     * @param link 友链
     * @return 结果
     */
    public int updateLink(Link link);

    /**
     * 删除友链
     * 
     * @param id 友链ID
     * @return 结果
     */
    public int deleteLinkById(Long id);

    /**
     * 批量删除友链
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteLinkByIds(String[] ids);
}
