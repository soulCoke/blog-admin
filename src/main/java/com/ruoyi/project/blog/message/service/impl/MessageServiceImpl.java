package com.ruoyi.project.blog.message.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.blog.message.mapper.MessageMapper;
import com.ruoyi.project.blog.message.domain.Message;
import com.ruoyi.project.blog.message.service.IMessageService;
import com.ruoyi.common.utils.text.Convert;

/**
 * 留言Service业务层处理
 * 
 * @author ruoyi
 * @date 2019-09-14
 */
@Service
public class MessageServiceImpl implements IMessageService 
{
    @Autowired
    private MessageMapper messageMapper;

    /**
     * 查询留言
     * 
     * @param id 留言ID
     * @return 留言
     */
    @Override
    public Message selectMessageById(Long id)
    {
        return messageMapper.selectMessageById(id);
    }

    /**
     * 查询留言列表
     * 
     * @param message 留言
     * @return 留言
     */
    @Override
    public List<Message> selectMessageList(Message message)
    {
        return messageMapper.selectMessageList(message);
    }

    /**
     * 新增留言
     * 
     * @param message 留言
     * @return 结果
     */
    @Override
    public int insertMessage(Message message)
    {
        message.setCreateTime(DateUtils.getNowDate());
        return messageMapper.insertMessage(message);
    }

    /**
     * 修改留言
     * 
     * @param message 留言
     * @return 结果
     */
    @Override
    public int updateMessage(Message message)
    {
        message.setUpdateTime(DateUtils.getNowDate());
        return messageMapper.updateMessage(message);
    }

    /**
     * 删除留言对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteMessageByIds(String ids)
    {
        return messageMapper.deleteMessageByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除留言信息
     * 
     * @param id 留言ID
     * @return 结果
     */
    public int deleteMessageById(Long id)
    {
        return messageMapper.deleteMessageById(id);
    }
}
