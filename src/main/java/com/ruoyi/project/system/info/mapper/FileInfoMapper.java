package com.ruoyi.project.system.info.mapper;

import com.ruoyi.project.system.info.domain.FileInfo;
import java.util.List;

/**
 * 文件Mapper接口
 * 
 * @author ruoyi
 * @date 2019-09-20
 */
public interface FileInfoMapper 
{
    /**
     * 查询文件
     * 
     * @param id 文件ID
     * @return 文件
     */
    public FileInfo selectFileInfoById(Long id);

    /**
     * 查询文件列表
     * 
     * @param fileInfo 文件
     * @return 文件集合
     */
    public List<FileInfo> selectFileInfoList(FileInfo fileInfo);

    /**
     * 新增文件
     * 
     * @param fileInfo 文件
     * @return 结果
     */
    public int insertFileInfo(FileInfo fileInfo);

    /**
     * 修改文件
     * 
     * @param fileInfo 文件
     * @return 结果
     */
    public int updateFileInfo(FileInfo fileInfo);

    /**
     * 删除文件
     * 
     * @param id 文件ID
     * @return 结果
     */
    public int deleteFileInfoById(Long id);

    /**
     * 批量删除文件
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteFileInfoByIds(String[] ids);
}
