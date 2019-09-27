package com.ruoyi.project.blog.article.controller;

import java.io.IOException;
import java.util.List;

import com.github.pagehelper.Constant;
import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.file.FileUploadUtils;
import com.ruoyi.framework.config.RuoYiConfig;
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
import com.ruoyi.project.blog.article.domain.Article;
import com.ruoyi.project.blog.article.service.IArticleService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;

/**
 * 博客文章Controller
 * 
 * @author ruoyi
 * @date 2019-09-14
 */
@Controller
@RequestMapping("/blog/article")
public class ArticleController extends BaseController
{
    private String prefix = "blog/article";

    @Autowired
    private IArticleService articleService;

    @RequiresPermissions("blog:article:view")
    @GetMapping()
    public String article()
    {
        return prefix + "/article";
    }

    /**
     * 查询博客文章列表
     */
    @RequiresPermissions("blog:article:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Article article)
    {
        startPage();
        List<Article> list = articleService.selectArticleList(article);
        return getDataTable(list);
    }

    /**
     * 导出博客文章列表
     */
    @RequiresPermissions("blog:article:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Article article)
    {
        List<Article> list = articleService.selectArticleList(article);
        ExcelUtil<Article> util = new ExcelUtil<Article>(Article.class);
        return util.exportExcel(list, "article");
    }

    /**
     * 新增博客文章
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存博客文章
     */
    @RequiresPermissions("blog:article:add")
    @Log(title = "博客文章", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Article article,MultipartFile file)
    {
        if (!file.isEmpty()) {
            try {
                String img = RuoYiConfig.getDomain()+FileUploadUtils.upload(RuoYiConfig.getProfile()+ Constants.RESOURCE_PREFIX_BLOG, file);
                article.setImg(img);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        article.setCreateTime(DateUtils.getNowDate());
        article.setUserId(getUserId());
        return toAjax(articleService.insertArticle(article));
    }

    /**
     * 修改博客文章
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        Article article = articleService.selectArticleById(id);
        mmap.put("article", article);
        return prefix + "/edit";
    }

    /**
     * 修改保存博客文章
     */
    @RequiresPermissions("blog:article:edit")
    @Log(title = "博客文章", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Article article,MultipartFile file)
    {
        if (file!=null && !file.isEmpty()) {
            try {
                String img = RuoYiConfig.getDomain()+FileUploadUtils.upload(RuoYiConfig.getProfile()+ Constants.RESOURCE_PREFIX_BLOG, file);
                article.setImg(img);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        article.setUpdateTime(DateUtils.getNowDate());
        return toAjax(articleService.updateArticle(article));
    }

    /**
     * 删除博客文章
     */
    @RequiresPermissions("blog:article:remove")
    @Log(title = "博客文章", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(articleService.deleteArticleByIds(ids));
    }
}
