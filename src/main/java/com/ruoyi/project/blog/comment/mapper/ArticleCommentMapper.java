package com.ruoyi.project.blog.comment.mapper;

import com.ruoyi.project.blog.comment.domain.ArticleComment;
import java.util.List;

/**
 * 文章评论Mapper接口
 * 
 * @author ruoyi
 * @date 2019-09-14
 */
public interface ArticleCommentMapper 
{
    /**
     * 查询文章评论
     * 
     * @param id 文章评论ID
     * @return 文章评论
     */
    public ArticleComment selectArticleCommentById(Long id);

    /**
     * 查询文章评论列表
     * 
     * @param articleComment 文章评论
     * @return 文章评论集合
     */
    public List<ArticleComment> selectArticleCommentList(ArticleComment articleComment);

    /**
     * 新增文章评论
     * 
     * @param articleComment 文章评论
     * @return 结果
     */
    public int insertArticleComment(ArticleComment articleComment);

    /**
     * 修改文章评论
     * 
     * @param articleComment 文章评论
     * @return 结果
     */
    public int updateArticleComment(ArticleComment articleComment);

    /**
     * 删除文章评论
     * 
     * @param id 文章评论ID
     * @return 结果
     */
    public int deleteArticleCommentById(Long id);

    /**
     * 批量删除文章评论
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteArticleCommentByIds(String[] ids);
}
