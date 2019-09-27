package com.ruoyi.project.blog.apis.contoller;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.project.blog.apis.dto.ApiArticleDTO;
import com.ruoyi.project.blog.apis.service.ApiArticleService;
import com.ruoyi.project.blog.apis.vo.*;
import com.ruoyi.project.blog.comment.domain.ArticleComment;
import com.ruoyi.project.blog.comment.service.IArticleCommentService;
import com.ruoyi.project.blog.message.domain.Message;
import com.ruoyi.project.blog.message.service.IMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
public class ApiArticleController extends BaseApiController {
    @Autowired
    private ApiArticleService apiArticleService;
    @Autowired
    private IArticleCommentService articleCommentService;
    @Autowired
    private IMessageService messageService;
    /*/**
     * @title 文章列表功能
     * @description
     * @author soulCoke
     * @param: article
     * @updateTime
     * @return: com.ruoyi.framework.web.page.TableDataInfo
     * @throws
     */
    @RequestMapping("/apis/article/list")
    @ResponseBody
    public ApiData list(ApiArticleDTO dto)
    {
        dto.setPageSize(dto.getPageSize() == null ? 10:dto.getPageSize());
        Page page=PageHelper.startPage(dto.getPage(),dto.getPageSize());
        List<ApiArticleVO> list = apiArticleService.selectArticleList(dto);
        return getApiData(dto,page.getTotal(),list,"apis/article/list");
    }
    @RequestMapping("/apis/tag/list")
    @ResponseBody
    public ApiData listArticleByTags(ApiArticleDTO dto)
    {
        dto.setPageSize(dto.getPageSize() == null ? 10:dto.getPageSize());
        Page page=PageHelper.startPage(dto.getPage(),dto.getPageSize());
        List<ApiArticleVO> list = apiArticleService.selectArticleList(dto);
        List<ApiTagsVO> resultList = new ArrayList<>();
        ApiTagsVO rvo = null;
        for(ApiArticleVO vo :list){
            rvo = new ApiTagsVO();
            rvo.setArticle_id(vo.getId());
            rvo.setArticle(vo);
            resultList.add(rvo);

        }
        return getApiData(dto,page.getTotal(),resultList,"/apis/tag/list");
    }
    /*/**
     * @title
     * @description 文章分类
     * @author soulCoke
     * @param: id
     * @updateTime
     * @return: com.ruoyi.project.blog.apis.vo.ApiData
     * @throws
     */
    @RequestMapping("/apis/article/classify")
    @ResponseBody
    public ApiData classify(Long id)
    {
        return getApiData(apiArticleService.selectClassify());
    }

    /**
     * @title
     * @description 文章详情
     * @author soulCoke
     * @updateTime
     * @return: com.ruoyi.project.blog.apis.vo.ApiData
     * @throws
     */
    @RequestMapping("/apis/article")
    @ResponseBody
    public ApiData article(ApiArticleDTO dto)
    {
        return getApiData(apiArticleService.getArticle(dto));
    }
    /*/**
     * @title
     * @description 新增评论
     * @author soulCoke
     * @param: content
     * @param: name
     * @param: article_id
     * @param: username
     * @updateTime
     * @return: com.ruoyi.project.blog.apis.vo.ApiData
     * @throws
     */
    @RequestMapping("/apis/comment/add")
    @ResponseBody
    public ApiData addComment(String content,String name,Long article_id,String username)
    {
        ArticleComment articleComment = new ArticleComment();
        articleComment.setContent(content);
        articleComment.setArticleId(article_id);
        articleComment.setUserName(username);
        articleComment.setCreateTime(DateUtils.getNowDate());
        articleCommentService.insertArticleComment(articleComment);
        ApiArticleDTO dto =new ApiArticleDTO();
        dto.setId(article_id);
        dto.setDelFlag(3);
        apiArticleService.delArticle(dto);
        return getApiData(null);
    }

    /*/**
     * @title
     * @description 文章评论分页
     * @author soulCoke
     * @param: dto
     * @updateTime
     * @return: com.ruoyi.project.blog.apis.vo.ApiData
     * @throws
     */
    @RequestMapping("/apis/comment/read")
    @ResponseBody
    public ApiData readComment(ApiArticleDTO dto)
    {
        dto.setPageSize(dto.getPageSize() == null ? 10:dto.getPageSize());
        Page page=PageHelper.startPage(dto.getPage(),dto.getPageSize());
        List<ApiCommentVO> list = apiArticleService.listComment(dto);
        return getApiData(dto,page.getTotal(),list,"/apis/comment/read");
    }

    @RequestMapping("apis/comment/person")
    @ResponseBody
    public ApiData personComment(ApiArticleDTO dto)
    {
        dto.setPageSize(dto.getPageSize() == null ? 10:dto.getPageSize());
        Page page=PageHelper.startPage(dto.getPage(),dto.getPageSize());
        List<ApiCommentVO> list = apiArticleService.listComment(dto);
        return getApiData(dto,page.getTotal(),list,"apis/comment/person");
    }

    /*/**
     * @title
     * @description 新增评论
     * @author soulCoke
     * @param: content
     * @param: ykname
     * @param: name
     * @updateTime
     * @return: com.ruoyi.project.blog.apis.vo.ApiData
     * @throws
     */
    @RequestMapping("/apis/message/add")
    @ResponseBody
    public ApiData addComment(String content,String ykname,String name)
    {
        Message message = new Message();
        message.setContent(content);
        message.setCreateTime(DateUtils.getNowDate());
        message.setUserName(StringUtils.isEmpty(ykname) ? name : ykname);
        messageService.insertMessage(message);
        return getApiData(null);
    }

    @RequestMapping("/apis/message/list")
    @ResponseBody
    public ApiData listMessage(ApiArticleDTO dto)
    {
        dto.setPageSize(dto.getPageSize() == null ? 10:dto.getPageSize());
        Page page=PageHelper.startPage(dto.getPage(),dto.getPageSize());
        List<ApiMessageVO> list = apiArticleService.listMessage(dto);
        return getApiData(dto,page.getTotal(),list,"/apis/message/list");
    }

    @RequestMapping("/apis/message/person")
    @ResponseBody
    public ApiData personMessage(ApiArticleDTO dto)
    {
        dto.setPageSize(dto.getPageSize() == null ? 10:dto.getPageSize());
        Page page=PageHelper.startPage(dto.getPage(),dto.getPageSize());
        List<ApiMessageVO> list = apiArticleService.listMessage(dto);
        return getApiData(dto,page.getTotal(),list,"/apis/message/person");
    }

    @RequestMapping("/apis/article/like")
    @ResponseBody
    public ApiData likeArticle(ApiArticleDTO dto)
    {
        dto.setDelFlag(2);
        apiArticleService.delArticle(dto);
        return getApiData(null);
    }

    @RequestMapping("/apis/ad")
    @ResponseBody
    public ApiData listBanner(ApiArticleDTO dto)
    {
        JSONObject result = new JSONObject();
        List<ApiBannerVO> list = apiArticleService.listBanner(dto);
        for(ApiBannerVO vo :list){
            result.put(vo.getType(),vo);
        }
        return getApiData(result);
    }

    @RequestMapping("/apis/link/list")
    @ResponseBody
    public ApiData listLink(ApiArticleDTO dto)
    {
        dto.setPageSize(dto.getPageSize() == null ? 10:dto.getPageSize());
        Page page=PageHelper.startPage(dto.getPage(),dto.getPageSize());
        List<ApiLinkVO> list = apiArticleService.listLink(dto);
        return getApiData(dto,page.getTotal(),list,"/apis/link/list");
    }

}
