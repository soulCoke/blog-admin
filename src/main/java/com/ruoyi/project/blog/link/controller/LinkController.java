package com.ruoyi.project.blog.link.controller;

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
import com.ruoyi.project.blog.link.domain.Link;
import com.ruoyi.project.blog.link.service.ILinkService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 友链Controller
 * 
 * @author ruoyi
 * @date 2019-09-26
 */
@Controller
@RequestMapping("/blog/link")
public class LinkController extends BaseController
{
    private String prefix = "blog/link";

    @Autowired
    private ILinkService linkService;

    @RequiresPermissions("blog:link:view")
    @GetMapping()
    public String link()
    {
        return prefix + "/link";
    }

    /**
     * 查询友链列表
     */
    @RequiresPermissions("blog:link:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Link link)
    {
        startPage();
        List<Link> list = linkService.selectLinkList(link);
        return getDataTable(list);
    }

    /**
     * 导出友链列表
     */
    @RequiresPermissions("blog:link:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Link link)
    {
        List<Link> list = linkService.selectLinkList(link);
        ExcelUtil<Link> util = new ExcelUtil<Link>(Link.class);
        return util.exportExcel(list, "link");
    }

    /**
     * 新增友链
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存友链
     */
    @RequiresPermissions("blog:link:add")
    @Log(title = "友链", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Link link)
    {
        return toAjax(linkService.insertLink(link));
    }

    /**
     * 修改友链
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        Link link = linkService.selectLinkById(id);
        mmap.put("link", link);
        return prefix + "/edit";
    }

    /**
     * 修改保存友链
     */
    @RequiresPermissions("blog:link:edit")
    @Log(title = "友链", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Link link)
    {
        return toAjax(linkService.updateLink(link));
    }

    /**
     * 删除友链
     */
    @RequiresPermissions("blog:link:remove")
    @Log(title = "友链", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(linkService.deleteLinkByIds(ids));
    }
}
