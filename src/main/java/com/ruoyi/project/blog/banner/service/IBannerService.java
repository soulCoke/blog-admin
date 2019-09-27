package com.ruoyi.project.blog.banner.service;

import com.ruoyi.project.blog.banner.domain.Banner;
import java.util.List;

/**
 * banner图Service接口
 * 
 * @author ruoyi
 * @date 2019-09-26
 */
public interface IBannerService 
{
    /**
     * 查询banner图
     * 
     * @param id banner图ID
     * @return banner图
     */
    public Banner selectBannerById(Long id);

    /**
     * 查询banner图列表
     * 
     * @param banner banner图
     * @return banner图集合
     */
    public List<Banner> selectBannerList(Banner banner);

    /**
     * 新增banner图
     * 
     * @param banner banner图
     * @return 结果
     */
    public int insertBanner(Banner banner);

    /**
     * 修改banner图
     * 
     * @param banner banner图
     * @return 结果
     */
    public int updateBanner(Banner banner);

    /**
     * 批量删除banner图
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteBannerByIds(String ids);

    /**
     * 删除banner图信息
     * 
     * @param id banner图ID
     * @return 结果
     */
    public int deleteBannerById(Long id);
}
