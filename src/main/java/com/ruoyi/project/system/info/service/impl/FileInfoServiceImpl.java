package com.ruoyi.project.system.info.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.system.info.mapper.FileInfoMapper;
import com.ruoyi.project.system.info.domain.FileInfo;
import com.ruoyi.project.system.info.service.IFileInfoService;
import com.ruoyi.common.utils.text.Convert;

/**
 * 文件Service业务层处理
 * 
 * @author ruoyi
 * @date 2019-09-20
 */
@Service
public class FileInfoServiceImpl implements IFileInfoService 
{
    @Autowired
    private FileInfoMapper fileInfoMapper;

    /**
     * 查询文件
     * 
     * @param id 文件ID
     * @return 文件
     */
    @Override
    public FileInfo selectFileInfoById(Long id)
    {
        return fileInfoMapper.selectFileInfoById(id);
    }

    /**
     * 查询文件列表
     * 
     * @param fileInfo 文件
     * @return 文件
     */
    @Override
    public List<FileInfo> selectFileInfoList(FileInfo fileInfo)
    {
        return fileInfoMapper.selectFileInfoList(fileInfo);
    }

    /**
     * 新增文件
     * 
     * @param fileInfo 文件
     * @return 结果
     */
    @Override
    public int insertFileInfo(FileInfo fileInfo)
    {
        fileInfo.setCreateTime(DateUtils.getNowDate());
        return fileInfoMapper.insertFileInfo(fileInfo);
    }

    /**
     * 修改文件
     * 
     * @param fileInfo 文件
     * @return 结果
     */
    @Override
    public int updateFileInfo(FileInfo fileInfo)
    {
        fileInfo.setUpdateTime(DateUtils.getNowDate());
        return fileInfoMapper.updateFileInfo(fileInfo);
    }

    /**
     * 删除文件对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteFileInfoByIds(String ids)
    {
        return fileInfoMapper.deleteFileInfoByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除文件信息
     * 
     * @param id 文件ID
     * @return 结果
     */
    public int deleteFileInfoById(Long id)
    {
        return fileInfoMapper.deleteFileInfoById(id);
    }
}
