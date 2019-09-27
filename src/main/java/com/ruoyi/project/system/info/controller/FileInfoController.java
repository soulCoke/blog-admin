package com.ruoyi.project.system.info.controller;

import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.file.FileUploadUtils;
import com.ruoyi.framework.config.RuoYiConfig;
import com.ruoyi.framework.config.ServerConfig;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.project.system.info.domain.FileInfo;
import com.ruoyi.project.system.info.service.IFileInfoService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 文件Controller
 * 
 * @author ruoyi
 * @date 2019-09-20
 */
@Controller
@RequestMapping("/system/info")
public class FileInfoController extends BaseController
{
    private String prefix = "system/info";
    @Autowired
    private ServerConfig serverConfig;

    @Autowired
    private IFileInfoService fileInfoService;

    @RequiresPermissions("system:info:view")
    @GetMapping()
    public String info()
    {
        return prefix + "/info";
    }

    /**
     * 查询文件列表
     */
    @RequiresPermissions("system:info:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(FileInfo fileInfo)
    {
        startPage();
        List<FileInfo> list = fileInfoService.selectFileInfoList(fileInfo);
        return getDataTable(list);
    }

    /**
     * 导出文件列表
     */
    @RequiresPermissions("system:info:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(FileInfo fileInfo)
    {
        List<FileInfo> list = fileInfoService.selectFileInfoList(fileInfo);
        ExcelUtil<FileInfo> util = new ExcelUtil<FileInfo>(FileInfo.class);
        return util.exportExcel(list, "info");
    }

    /**
     * 新增文件
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存文件
     */
    @RequiresPermissions("system:info:add")
    @Log(title = "文件", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(FileInfo fileInfo)
    {
        return toAjax(fileInfoService.insertFileInfo(fileInfo));
    }

    /**
     * 修改文件
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        FileInfo fileInfo = fileInfoService.selectFileInfoById(id);
        mmap.put("fileInfo", fileInfo);
        return prefix + "/edit";
    }

    /**
     * 修改保存文件
     */
    @RequiresPermissions("system:info:edit")
    @Log(title = "文件", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(FileInfo fileInfo)
    {
        return toAjax(fileInfoService.updateFileInfo(fileInfo));
    }

    /**
     * 删除文件
     */
    @RequiresPermissions("system:info:remove")
    @Log(title = "文件", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(fileInfoService.deleteFileInfoByIds(ids));
    }
    /**
     * 通用上传请求
     */
    @RequestMapping("/upload")
    @ResponseBody
    @CrossOrigin
    public Object uploadFile(MultipartFile file,String path) throws Exception
    {
        try
        {
            // 上传文件路径
            String filePath = RuoYiConfig.getUploadPath()+path;
            // 上传并返回新文件名称
            String fileName = FileUploadUtils.upload(filePath, file);
            String url = serverConfig.getUrl() + fileName;
            FileInfo fileInfo=new FileInfo();
            fileInfo.setCreateTime(DateUtils.getNowDate());
            fileInfo.setAbPath(RuoYiConfig.getProfile()+fileName);
            fileInfo.setRtPath(fileName);
            fileInfo.setUrl(url);
            JSONObject result =new JSONObject();
            result.put("fileName", fileName);
            result.put("url", url);
            result.put("success","0");
            result.put("message","保存成功");
            return result;
        }
        catch (Exception e)
        {
            return AjaxResult.error(e.getMessage());
        }
    }


    @RequestMapping("/uploadMD")
    @ResponseBody
    public JSONObject uploadMdFile(@RequestParam(value = "editormd-image-file", required = true) MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        JSONObject result =new JSONObject();

        try
        {
            response.setHeader("Content-Type", "html/txt");
            // 上传文件路径
            String filePath = RuoYiConfig.getProfile()+ Constants.RESOURCE_PREFIX_BLOG;
            // 上传并返回新文件名称
            String fileName = FileUploadUtils.upload(filePath, file);
            String url =  RuoYiConfig.getDomain()+fileName;
            FileInfo fileInfo=new FileInfo();
            fileInfo.setCreateTime(DateUtils.getNowDate());
            fileInfo.setAbPath(RuoYiConfig.getProfile()+fileName);
            fileInfo.setRtPath(fileName);
            fileInfo.setUrl(url);

            result.put("fileName", fileName);
            result.put("url", url);
            result.put("success",1);
            result.put("message","保存成功");
        }
        catch (Exception e)
        {
            result.put("success",0);
            result.put("message","保存失败");
        }
        return result;
    }
}
