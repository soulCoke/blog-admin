package com.ruoyi.project.blog.article.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.blog.article.mapper.ArticleMapper;
import com.ruoyi.project.blog.article.domain.Article;
import com.ruoyi.project.blog.article.service.IArticleService;
import com.ruoyi.common.utils.text.Convert;

/**
 * 博客文章Service业务层处理
 * 
 * @author ruoyi
 * @date 2019-09-14
 */
@Service
public class ArticleServiceImpl implements IArticleService 
{
    @Autowired
    private ArticleMapper articleMapper;

    /**
     * 查询博客文章
     * 
     * @param id 博客文章ID
     * @return 博客文章
     */
    @Override
    public Article selectArticleById(Long id)
    {
        return articleMapper.selectArticleById(id);
    }

    /**
     * 查询博客文章列表
     * 
     * @param article 博客文章
     * @return 博客文章
     */
    @Override
    public List<Article> selectArticleList(Article article)
    {
        return articleMapper.selectArticleList(article);
    }

    /**
     * 新增博客文章
     * 
     * @param article 博客文章
     * @return 结果
     */
    @Override
    public int insertArticle(Article article)
    {
        article.setCreateTime(DateUtils.getNowDate());
        return articleMapper.insertArticle(article);
    }

    /**
     * 修改博客文章
     * 
     * @param article 博客文章
     * @return 结果
     */
    @Override
    public int updateArticle(Article article)
    {
        article.setUpdateTime(DateUtils.getNowDate());
        return articleMapper.updateArticle(article);
    }

    /**
     * 删除博客文章对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteArticleByIds(String ids)
    {
        return articleMapper.deleteArticleByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除博客文章信息
     * 
     * @param id 博客文章ID
     * @return 结果
     */
    public int deleteArticleById(Long id)
    {
        return articleMapper.deleteArticleById(id);
    }
}
