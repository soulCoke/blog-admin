package com.ruoyi.project.blog.message.controller;

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
import com.ruoyi.project.blog.message.domain.Message;
import com.ruoyi.project.blog.message.service.IMessageService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 留言Controller
 * 
 * @author ruoyi
 * @date 2019-09-14
 */
@Controller
@RequestMapping("/blog/message")
public class MessageController extends BaseController
{
    private String prefix = "blog/message";

    @Autowired
    private IMessageService messageService;

    @RequiresPermissions("blog:message:view")
    @GetMapping()
    public String message()
    {
        return prefix + "/message";
    }

    /**
     * 查询留言列表
     */
    @RequiresPermissions("blog:message:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Message message)
    {
        startPage();
        List<Message> list = messageService.selectMessageList(message);
        return getDataTable(list);
    }

    /**
     * 导出留言列表
     */
    @RequiresPermissions("blog:message:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Message message)
    {
        List<Message> list = messageService.selectMessageList(message);
        ExcelUtil<Message> util = new ExcelUtil<Message>(Message.class);
        return util.exportExcel(list, "message");
    }

    /**
     * 新增留言
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存留言
     */
    @RequiresPermissions("blog:message:add")
    @Log(title = "留言", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Message message)
    {
        return toAjax(messageService.insertMessage(message));
    }

    /**
     * 修改留言
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        Message message = messageService.selectMessageById(id);
        mmap.put("message", message);
        return prefix + "/edit";
    }

    /**
     * 修改保存留言
     */
    @RequiresPermissions("blog:message:edit")
    @Log(title = "留言", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Message message)
    {
        return toAjax(messageService.updateMessage(message));
    }

    /**
     * 删除留言
     */
    @RequiresPermissions("blog:message:remove")
    @Log(title = "留言", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(messageService.deleteMessageByIds(ids));
    }
}
