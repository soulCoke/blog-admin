package com.ruoyi.project.blog.comment.controller;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.project.blog.comment.domain.ArticleComment;
import com.ruoyi.project.blog.comment.service.IArticleCommentService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 文章评论Controller
 * 
 * @author ruoyi
 * @date 2019-09-14
 */
@Controller
@RequestMapping("/blog/comment")
public class ArticleCommentController extends BaseController
{
    private String prefix = "blog/comment";

    @Autowired
    private IArticleCommentService articleCommentService;

    @RequiresPermissions("blog:comment:view")
    @GetMapping()
    public String comment()
    {
        return prefix + "/comment";
    }

    /**
     * 查询文章评论列表
     */
    @RequiresPermissions("blog:comment:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(ArticleComment articleComment)
    {
        startPage();
        List<ArticleComment> list = articleCommentService.selectArticleCommentList(articleComment);
        return getDataTable(list);
    }

    /**
     * 导出文章评论列表
     */
    @RequiresPermissions("blog:comment:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(ArticleComment articleComment)
    {
        List<ArticleComment> list = articleCommentService.selectArticleCommentList(articleComment);
        ExcelUtil<ArticleComment> util = new ExcelUtil<ArticleComment>(ArticleComment.class);
        return util.exportExcel(list, "comment");
    }

    /**
     * 新增文章评论
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存文章评论
     */
    @RequiresPermissions("blog:comment:add")
    @Log(title = "文章评论", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(ArticleComment articleComment)
    {
        return toAjax(articleCommentService.insertArticleComment(articleComment));
    }

    /**
     * 修改文章评论
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        ArticleComment articleComment = articleCommentService.selectArticleCommentById(id);
        mmap.put("articleComment", articleComment);
        return prefix + "/edit";
    }

    /**
     * 修改保存文章评论
     */
    @RequiresPermissions("blog:comment:edit")
    @Log(title = "文章评论", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(ArticleComment articleComment)
    {
        return toAjax(articleCommentService.updateArticleComment(articleComment));
    }

    /**
     * 删除文章评论
     */
    @RequiresPermissions("blog:comment:remove")
    @Log(title = "文章评论", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(articleCommentService.deleteArticleCommentByIds(ids));
    }
}
