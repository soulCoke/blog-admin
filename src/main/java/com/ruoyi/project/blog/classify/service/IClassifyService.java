package com.ruoyi.project.blog.classify.service;

import com.ruoyi.project.blog.classify.domain.Classify;
import java.util.List;

/**
 * 文章分类Service接口
 * 
 * @author ruoyi
 * @date 2019-09-14
 */
public interface IClassifyService 
{
    /**
     * 查询文章分类
     * 
     * @param id 文章分类ID
     * @return 文章分类
     */
    public Classify selectClassifyById(Long id);

    /**
     * 查询文章分类列表
     * 
     * @param classify 文章分类
     * @return 文章分类集合
     */
    public List<Classify> selectClassifyList(Classify classify);

    /**
     * 新增文章分类
     * 
     * @param classify 文章分类
     * @return 结果
     */
    public int insertClassify(Classify classify);

    /**
     * 修改文章分类
     * 
     * @param classify 文章分类
     * @return 结果
     */
    public int updateClassify(Classify classify);

    /**
     * 批量删除文章分类
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteClassifyByIds(String ids);

    /**
     * 删除文章分类信息
     * 
     * @param id 文章分类ID
     * @return 结果
     */
    public int deleteClassifyById(Long id);
}
