package com.ruoyi.project.blog.tags.controller;

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
import com.ruoyi.project.blog.tags.domain.Tags;
import com.ruoyi.project.blog.tags.service.ITagsService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 标签Controller
 * 
 * @author ruoyi
 * @date 2019-09-14
 */
@Controller
@RequestMapping("/blog/tags")
public class TagsController extends BaseController
{
    private String prefix = "blog/tags";

    @Autowired
    private ITagsService tagsService;

    @RequiresPermissions("blog:tags:view")
    @GetMapping()
    public String tags()
    {
        return prefix + "/tags";
    }

    /**
     * 查询标签列表
     */
    @RequiresPermissions("blog:tags:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Tags tags)
    {
        startPage();
        List<Tags> list = tagsService.selectTagsList(tags);
        return getDataTable(list);
    }

    /**
     * 导出标签列表
     */
    @RequiresPermissions("blog:tags:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Tags tags)
    {
        List<Tags> list = tagsService.selectTagsList(tags);
        ExcelUtil<Tags> util = new ExcelUtil<Tags>(Tags.class);
        return util.exportExcel(list, "tags");
    }

    /**
     * 新增标签
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存标签
     */
    @RequiresPermissions("blog:tags:add")
    @Log(title = "标签", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Tags tags)
    {
        return toAjax(tagsService.insertTags(tags));
    }

    /**
     * 修改标签
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        Tags tags = tagsService.selectTagsById(id);
        mmap.put("tags", tags);
        return prefix + "/edit";
    }

    /**
     * 修改保存标签
     */
    @RequiresPermissions("blog:tags:edit")
    @Log(title = "标签", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Tags tags)
    {
        return toAjax(tagsService.updateTags(tags));
    }

    /**
     * 删除标签
     */
    @RequiresPermissions("blog:tags:remove")
    @Log(title = "标签", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(tagsService.deleteTagsByIds(ids));
    }
}
