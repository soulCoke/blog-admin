package com.ruoyi.project.blog.classify.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.blog.classify.mapper.ClassifyMapper;
import com.ruoyi.project.blog.classify.domain.Classify;
import com.ruoyi.project.blog.classify.service.IClassifyService;
import com.ruoyi.common.utils.text.Convert;

/**
 * 文章分类Service业务层处理
 * 
 * @author ruoyi
 * @date 2019-09-14
 */
@Service
public class ClassifyServiceImpl implements IClassifyService 
{
    @Autowired
    private ClassifyMapper classifyMapper;

    /**
     * 查询文章分类
     * 
     * @param id 文章分类ID
     * @return 文章分类
     */
    @Override
    public Classify selectClassifyById(Long id)
    {
        return classifyMapper.selectClassifyById(id);
    }

    /**
     * 查询文章分类列表
     * 
     * @param classify 文章分类
     * @return 文章分类
     */
    @Override
    public List<Classify> selectClassifyList(Classify classify)
    {
        return classifyMapper.selectClassifyList(classify);
    }

    /**
     * 新增文章分类
     * 
     * @param classify 文章分类
     * @return 结果
     */
    @Override
    public int insertClassify(Classify classify)
    {
        classify.setCreateTime(DateUtils.getNowDate());
        return classifyMapper.insertClassify(classify);
    }

    /**
     * 修改文章分类
     * 
     * @param classify 文章分类
     * @return 结果
     */
    @Override
    public int updateClassify(Classify classify)
    {
        classify.setUpdateTime(DateUtils.getNowDate());
        return classifyMapper.updateClassify(classify);
    }

    /**
     * 删除文章分类对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteClassifyByIds(String ids)
    {
        return classifyMapper.deleteClassifyByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除文章分类信息
     * 
     * @param id 文章分类ID
     * @return 结果
     */
    public int deleteClassifyById(Long id)
    {
        return classifyMapper.deleteClassifyById(id);
    }
}
