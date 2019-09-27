package com.ruoyi.project.blog.article.service;

import com.ruoyi.project.blog.article.domain.Article;
import java.util.List;

/**
 * 博客文章Service接口
 * 
 * @author ruoyi
 * @date 2019-09-14
 */
public interface IArticleService 
{
    /**
     * 查询博客文章
     * 
     * @param id 博客文章ID
     * @return 博客文章
     */
    public Article selectArticleById(Long id);

    /**
     * 查询博客文章列表
     * 
     * @param article 博客文章
     * @return 博客文章集合
     */
    public List<Article> selectArticleList(Article article);

    /**
     * 新增博客文章
     * 
     * @param article 博客文章
     * @return 结果
     */
    public int insertArticle(Article article);

    /**
     * 修改博客文章
     * 
     * @param article 博客文章
     * @return 结果
     */
    public int updateArticle(Article article);

    /**
     * 批量删除博客文章
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteArticleByIds(String ids);

    /**
     * 删除博客文章信息
     * 
     * @param id 博客文章ID
     * @return 结果
     */
    public int deleteArticleById(Long id);
}
