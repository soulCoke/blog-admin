package com.ruoyi.project.blog.apis.mapper;

import com.ruoyi.project.blog.apis.dto.ApiArticleDTO;
import com.ruoyi.project.blog.apis.vo.*;

import java.util.List;

/**
 * @author soulCoke
 * @ClassName ApiArticleMapper.java
 * @Description TODO
 * @createTime 2019年09月24日 21:31:00
 */
public interface ApiArticleMapper {
    public List<ApiArticleVO> selectArticleList(ApiArticleDTO dto);

    List<ApiClassifyVO> selectClassify();

    List<ApiArticleVO> getArticle(ApiArticleDTO dto);

    List<ApiCommentVO> listComment(ApiArticleDTO dto);

    List<ApiMessageVO> listMessage(ApiArticleDTO dto);

    void delArticle(ApiArticleDTO dto);

    List<ApiBannerVO> listBanner(ApiArticleDTO dto);

    List<ApiLinkVO> listLink(ApiArticleDTO dto);
}
