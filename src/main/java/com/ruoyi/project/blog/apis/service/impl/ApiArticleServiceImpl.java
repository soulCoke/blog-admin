package com.ruoyi.project.blog.apis.service.impl;

import com.ruoyi.common.exception.BusinessException;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.project.blog.apis.dto.ApiArticleDTO;
import com.ruoyi.project.blog.apis.mapper.ApiArticleMapper;
import com.ruoyi.project.blog.apis.service.ApiArticleService;
import com.ruoyi.project.blog.apis.vo.*;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author soulCoke
 * @ClassName ApiArticleServiceImpl.java
 * @Description TODO
 * @createTime 2019年09月24日 21:30:00
 */
@Service
public class ApiArticleServiceImpl implements ApiArticleService {
    @Autowired
    private ApiArticleMapper apiArticleMapper;

    @Override
    public List<ApiArticleVO> selectArticleList(ApiArticleDTO dto) {
        List<ApiArticleVO> list = apiArticleMapper.selectArticleList(dto);
        for(ApiArticleVO vo : list){
            if(StringUtils.isNotEmpty(vo.getTempTags())){
                vo.setTags(vo.getTempTags().split(","));
            }
        }
        return list;
    }

    @Override
    public List<ApiClassifyVO> selectClassify() {
        List<ApiClassifyVO> list = apiArticleMapper.selectClassify();
        for(ApiClassifyVO vo : list){
            if(StringUtils.isNotEmpty(vo.getTempTags())){
                vo.setTags(vo.getTempTags().split(","));
            }
        }
        return list;
    }

    @Override
    public ApiArticleVO getArticle(ApiArticleDTO dto) {
        List<ApiArticleVO> list = apiArticleMapper.getArticle(dto);
        ApiArticleVO vo =null;
        if(CollectionUtils.isNotEmpty(list)){
            vo = list.get(0);
            vo.setComment(vo.getCommentCount()>0 ? 1: 0);
        }else{
            throw new BusinessException("未知文章");
        }
        dto.setArticleFlag(1);//上一篇
        vo.setPrevArticle(apiArticleMapper.getArticle(dto));
        dto.setArticleFlag(2);//下一篇
        vo.setNextrAticle(apiArticleMapper.getArticle(dto));
        if(StringUtils.isNotEmpty(vo.getTempTags())){
            vo.setTags(vo.getTempTags().split(","));
        }
        dto.setDelFlag(1);
        delArticle(dto);
        return vo;
    }

    @Override
    public List<ApiCommentVO> listComment(ApiArticleDTO dto) {
        return apiArticleMapper.listComment(dto);
    }

    @Override
    public List<ApiMessageVO> listMessage(ApiArticleDTO dto) {
        return apiArticleMapper.listMessage(dto);
    }

    @Override
    public void delArticle(ApiArticleDTO dto) {
         apiArticleMapper.delArticle(dto);
    }

    @Override
    public List<ApiBannerVO> listBanner(ApiArticleDTO dto) {
           return apiArticleMapper.listBanner(dto);
    }

    @Override
    public List<ApiLinkVO> listLink(ApiArticleDTO dto) {
        return apiArticleMapper.listLink(dto);
    }

}
