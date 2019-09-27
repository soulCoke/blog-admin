package com.ruoyi.project.blog.apis.service;

import com.ruoyi.project.blog.apis.dto.ApiArticleDTO;
import com.ruoyi.project.blog.apis.vo.*;

import java.util.List;

/**
 * @author soulCoke
 * @ClassName ApiArticleService.java
 * @Description TODO
 * @createTime 2019年09月24日 21:30:00
 */
public interface ApiArticleService {
    List<ApiArticleVO> selectArticleList(ApiArticleDTO dto);

    List<ApiClassifyVO> selectClassify();

    ApiArticleVO getArticle(ApiArticleDTO dto);

    List<ApiCommentVO> listComment(ApiArticleDTO dto);

    List<ApiMessageVO> listMessage(ApiArticleDTO dto);

    void delArticle(ApiArticleDTO dto);

    List<ApiBannerVO> listBanner(ApiArticleDTO dto);

    List<ApiLinkVO> listLink(ApiArticleDTO dto);
}
