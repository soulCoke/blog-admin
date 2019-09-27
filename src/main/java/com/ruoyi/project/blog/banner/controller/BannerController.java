package com.ruoyi.project.blog.banner.controller;

import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.utils.file.FileUploadUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.config.RuoYiConfig;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.blog.banner.domain.Banner;
import com.ruoyi.project.blog.banner.service.IBannerService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

/**
 * banner图Controller
 * 
 * @author ruoyi
 * @date 2019-09-26
 */
@Controller
@RequestMapping("/blog/banner")
public class BannerController extends BaseController
{
    private String prefix = "blog/banner";

    @Autowired
    private IBannerService bannerService;

    @RequiresPermissions("blog:banner:view")
    @GetMapping()
    public String banner()
    {
        return prefix + "/banner";
    }

    /**
     * 查询banner图列表
     */
    @RequiresPermissions("blog:banner:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Banner banner)
    {
        startPage();
        List<Banner> list = bannerService.selectBannerList(banner);
        return getDataTable(list);
    }

    /**
     * 导出banner图列表
     */
    @RequiresPermissions("blog:banner:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Banner banner)
    {
        List<Banner> list = bannerService.selectBannerList(banner);
        ExcelUtil<Banner> util = new ExcelUtil<Banner>(Banner.class);
        return util.exportExcel(list, "banner");
    }

    /**
     * 新增banner图
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存banner图
     */
    @RequiresPermissions("blog:banner:add")
    @Log(title = "banner图", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Banner banner, MultipartFile file)
    {
        if (file!=null && !file.isEmpty()) {
            try {
                String img = RuoYiConfig.getDomain()+ FileUploadUtils.upload(RuoYiConfig.getProfile()+ Constants.RESOURCE_PREFIX_BLOG, file);
                banner.setUrl(img);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return toAjax(bannerService.insertBanner(banner));
    }

    /**
     * 修改banner图
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        Banner banner = bannerService.selectBannerById(id);
        mmap.put("banner", banner);
        return prefix + "/edit";
    }

    /**
     * 修改保存banner图
     */
    @RequiresPermissions("blog:banner:edit")
    @Log(title = "banner图", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Banner banner, MultipartFile file)
    {
        if (file!=null && !file.isEmpty()) {
            try {
                String img = RuoYiConfig.getDomain()+ FileUploadUtils.upload(RuoYiConfig.getProfile()+ Constants.RESOURCE_PREFIX_BLOG, file);
                banner.setUrl(img);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return toAjax(bannerService.updateBanner(banner));
    }

    /**
     * 删除banner图
     */
    @RequiresPermissions("blog:banner:remove")
    @Log(title = "banner图", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(bannerService.deleteBannerByIds(ids));
    }
}
