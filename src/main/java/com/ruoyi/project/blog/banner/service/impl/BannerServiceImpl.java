package com.ruoyi.project.blog.banner.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.blog.banner.mapper.BannerMapper;
import com.ruoyi.project.blog.banner.domain.Banner;
import com.ruoyi.project.blog.banner.service.IBannerService;
import com.ruoyi.common.utils.text.Convert;

/**
 * banner图Service业务层处理
 * 
 * @author ruoyi
 * @date 2019-09-26
 */
@Service
public class BannerServiceImpl implements IBannerService 
{
    @Autowired
    private BannerMapper bannerMapper;

    /**
     * 查询banner图
     * 
     * @param id banner图ID
     * @return banner图
     */
    @Override
    public Banner selectBannerById(Long id)
    {
        return bannerMapper.selectBannerById(id);
    }

    /**
     * 查询banner图列表
     * 
     * @param banner banner图
     * @return banner图
     */
    @Override
    public List<Banner> selectBannerList(Banner banner)
    {
        return bannerMapper.selectBannerList(banner);
    }

    /**
     * 新增banner图
     * 
     * @param banner banner图
     * @return 结果
     */
    @Override
    public int insertBanner(Banner banner)
    {
        return bannerMapper.insertBanner(banner);
    }

    /**
     * 修改banner图
     * 
     * @param banner banner图
     * @return 结果
     */
    @Override
    public int updateBanner(Banner banner)
    {
        return bannerMapper.updateBanner(banner);
    }

    /**
     * 删除banner图对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteBannerByIds(String ids)
    {
        return bannerMapper.deleteBannerByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除banner图信息
     * 
     * @param id banner图ID
     * @return 结果
     */
    public int deleteBannerById(Long id)
    {
        return bannerMapper.deleteBannerById(id);
    }
}
