package com.ruoyi.project.blog.tags.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.blog.tags.mapper.TagsMapper;
import com.ruoyi.project.blog.tags.domain.Tags;
import com.ruoyi.project.blog.tags.service.ITagsService;
import com.ruoyi.common.utils.text.Convert;

/**
 * 标签Service业务层处理
 * 
 * @author ruoyi
 * @date 2019-09-14
 */
@Service
public class TagsServiceImpl implements ITagsService 
{
    @Autowired
    private TagsMapper tagsMapper;

    /**
     * 查询标签
     * 
     * @param id 标签ID
     * @return 标签
     */
    @Override
    public Tags selectTagsById(Long id)
    {
        return tagsMapper.selectTagsById(id);
    }

    /**
     * 查询标签列表
     * 
     * @param tags 标签
     * @return 标签
     */
    @Override
    public List<Tags> selectTagsList(Tags tags)
    {
        return tagsMapper.selectTagsList(tags);
    }

    /**
     * 新增标签
     * 
     * @param tags 标签
     * @return 结果
     */
    @Override
    public int insertTags(Tags tags)
    {
        return tagsMapper.insertTags(tags);
    }

    /**
     * 修改标签
     * 
     * @param tags 标签
     * @return 结果
     */
    @Override
    public int updateTags(Tags tags)
    {
        return tagsMapper.updateTags(tags);
    }

    /**
     * 删除标签对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteTagsByIds(String ids)
    {
        return tagsMapper.deleteTagsByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除标签信息
     * 
     * @param id 标签ID
     * @return 结果
     */
    public int deleteTagsById(Long id)
    {
        return tagsMapper.deleteTagsById(id);
    }
}
