package com.ruoyi.project.blog.classify.controller;

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
import com.ruoyi.project.blog.classify.domain.Classify;
import com.ruoyi.project.blog.classify.service.IClassifyService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 文章分类Controller
 * 
 * @author ruoyi
 * @date 2019-09-14
 */
@Controller
@RequestMapping("/blog/classify")
public class ClassifyController extends BaseController
{
    private String prefix = "blog/classify";

    @Autowired
    private IClassifyService classifyService;

    @RequiresPermissions("blog:classify:view")
    @GetMapping()
    public String classify()
    {
        return prefix + "/classify";
    }

    /**
     * 查询文章分类列表
     */
    @RequiresPermissions("blog:classify:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Classify classify)
    {
        startPage();
        List<Classify> list = classifyService.selectClassifyList(classify);
        return getDataTable(list);
    }

    /**
     * 导出文章分类列表
     */
    @RequiresPermissions("blog:classify:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Classify classify)
    {
        List<Classify> list = classifyService.selectClassifyList(classify);
        ExcelUtil<Classify> util = new ExcelUtil<Classify>(Classify.class);
        return util.exportExcel(list, "classify");
    }

    /**
     * 新增文章分类
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存文章分类
     */
    @RequiresPermissions("blog:classify:add")
    @Log(title = "文章分类", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Classify classify)
    {
        return toAjax(classifyService.insertClassify(classify));
    }

    /**
     * 修改文章分类
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        Classify classify = classifyService.selectClassifyById(id);
        mmap.put("classify", classify);
        return prefix + "/edit";
    }

    /**
     * 修改保存文章分类
     */
    @RequiresPermissions("blog:classify:edit")
    @Log(title = "文章分类", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Classify classify)
    {
        return toAjax(classifyService.updateClassify(classify));
    }

    /**
     * 删除文章分类
     */
    @RequiresPermissions("blog:classify:remove")
    @Log(title = "文章分类", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(classifyService.deleteClassifyByIds(ids));
    }
}
