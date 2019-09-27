package com.ruoyi.project.blog.link.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.blog.link.mapper.LinkMapper;
import com.ruoyi.project.blog.link.domain.Link;
import com.ruoyi.project.blog.link.service.ILinkService;
import com.ruoyi.common.utils.text.Convert;

/**
 * 友链Service业务层处理
 * 
 * @author ruoyi
 * @date 2019-09-26
 */
@Service
public class LinkServiceImpl implements ILinkService 
{
    @Autowired
    private LinkMapper linkMapper;

    /**
     * 查询友链
     * 
     * @param id 友链ID
     * @return 友链
     */
    @Override
    public Link selectLinkById(Long id)
    {
        return linkMapper.selectLinkById(id);
    }

    /**
     * 查询友链列表
     * 
     * @param link 友链
     * @return 友链
     */
    @Override
    public List<Link> selectLinkList(Link link)
    {
        return linkMapper.selectLinkList(link);
    }

    /**
     * 新增友链
     * 
     * @param link 友链
     * @return 结果
     */
    @Override
    public int insertLink(Link link)
    {
        return linkMapper.insertLink(link);
    }

    /**
     * 修改友链
     * 
     * @param link 友链
     * @return 结果
     */
    @Override
    public int updateLink(Link link)
    {
        return linkMapper.updateLink(link);
    }

    /**
     * 删除友链对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteLinkByIds(String ids)
    {
        return linkMapper.deleteLinkByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除友链信息
     * 
     * @param id 友链ID
     * @return 结果
     */
    public int deleteLinkById(Long id)
    {
        return linkMapper.deleteLinkById(id);
    }
}
