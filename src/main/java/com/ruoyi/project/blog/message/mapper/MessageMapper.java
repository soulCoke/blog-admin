package com.ruoyi.project.blog.message.mapper;

import com.ruoyi.project.blog.message.domain.Message;
import java.util.List;

/**
 * 留言Mapper接口
 * 
 * @author ruoyi
 * @date 2019-09-14
 */
public interface MessageMapper 
{
    /**
     * 查询留言
     * 
     * @param id 留言ID
     * @return 留言
     */
    public Message selectMessageById(Long id);

    /**
     * 查询留言列表
     * 
     * @param message 留言
     * @return 留言集合
     */
    public List<Message> selectMessageList(Message message);

    /**
     * 新增留言
     * 
     * @param message 留言
     * @return 结果
     */
    public int insertMessage(Message message);

    /**
     * 修改留言
     * 
     * @param message 留言
     * @return 结果
     */
    public int updateMessage(Message message);

    /**
     * 删除留言
     * 
     * @param id 留言ID
     * @return 结果
     */
    public int deleteMessageById(Long id);

    /**
     * 批量删除留言
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteMessageByIds(String[] ids);
}
