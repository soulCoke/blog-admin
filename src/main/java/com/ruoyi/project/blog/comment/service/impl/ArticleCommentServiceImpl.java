package com.ruoyi.project.blog.comment.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.blog.comment.mapper.ArticleCommentMapper;
import com.ruoyi.project.blog.comment.domain.ArticleComment;
import com.ruoyi.project.blog.comment.service.IArticleCommentService;
import com.ruoyi.common.utils.text.Convert;

/**
 * 文章评论Service业务层处理
 * 
 * @author ruoyi
 * @date 2019-09-14
 */
@Service
public class ArticleCommentServiceImpl implements IArticleCommentService 
{
    @Autowired
    private ArticleCommentMapper articleCommentMapper;

    /**
     * 查询文章评论
     * 
     * @param id 文章评论ID
     * @return 文章评论
     */
    @Override
    public ArticleComment selectArticleCommentById(Long id)
    {
        return articleCommentMapper.selectArticleCommentById(id);
    }

    /**
     * 查询文章评论列表
     * 
     * @param articleComment 文章评论
     * @return 文章评论
     */
    @Override
    public List<ArticleComment> selectArticleCommentList(ArticleComment articleComment)
    {
        return articleCommentMapper.selectArticleCommentList(articleComment);
    }

    /**
     * 新增文章评论
     * 
     * @param articleComment 文章评论
     * @return 结果
     */
    @Override
    public int insertArticleComment(ArticleComment articleComment)
    {
        articleComment.setCreateTime(DateUtils.getNowDate());
        return articleCommentMapper.insertArticleComment(articleComment);
    }

    /**
     * 修改文章评论
     * 
     * @param articleComment 文章评论
     * @return 结果
     */
    @Override
    public int updateArticleComment(ArticleComment articleComment)
    {
        articleComment.setUpdateTime(DateUtils.getNowDate());
        return articleCommentMapper.updateArticleComment(articleComment);
    }

    /**
     * 删除文章评论对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteArticleCommentByIds(String ids)
    {
        return articleCommentMapper.deleteArticleCommentByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除文章评论信息
     * 
     * @param id 文章评论ID
     * @return 结果
     */
    public int deleteArticleCommentById(Long id)
    {
        return articleCommentMapper.deleteArticleCommentById(id);
    }
}
