package com.ruoyi.project.blog.apis.contoller;

import com.github.pagehelper.PageHelper;
import com.ruoyi.common.constant.ShiroConstants;
import com.ruoyi.common.utils.ServletUtils;
import com.ruoyi.framework.config.RuoYiConfig;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.project.blog.apis.dto.BaseApiDTO;
import com.ruoyi.project.blog.apis.vo.ApiData;
import com.ruoyi.project.blog.apis.vo.ApiPageVO;
import com.ruoyi.project.blog.apis.vo.ApiUser;
import com.ruoyi.project.system.user.domain.User;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import java.net.URL;
import java.util.List;

/**
 * @author soulCoke
 * @ClassName BaseApiController.java
 * @Description TODO
 * @createTime 2019年09月24日 21:50:00
 */
@Controller
public class BaseApiController extends BaseController {
    @Autowired
    private CacheManager cacheManager;

    private Cache<String, ApiUser> apiLoginUser;

    @PostConstruct
    public void init()
    {
        apiLoginUser = cacheManager.getCache(ShiroConstants.API_LOGIN_USER);
    }

    protected  ApiUser getUser(){
        HttpServletRequest request = ServletUtils.getRequest();
        String token = request.getHeader("Authorization");
        if(token == null){
            return null;
        }
        return apiLoginUser.get(token);
    }

    protected  ApiData logout(){
        HttpServletRequest request = ServletUtils.getRequest();
        String token = request.getHeader("Authorization");
        apiLoginUser.remove(token);
        return apiSuccess("退出登录成功!");
    }
    /*/**
     * @title
     * @description api 分页数据
     * @author soulCoke
     * @param: dto
     * @param: total
     * @param: list
     * @param: path
     * @updateTime
     * @return: com.ruoyi.project.blog.apis.vo.ApiData
     * @throws
     */
    protected  ApiData getApiData(BaseApiDTO dto,Long total, List<?> list,String path){
        ApiData vo = new ApiData();
        vo.setStatus("success");
        vo.setCode(200);
        ApiPageVO apiPageVO = new ApiPageVO();
        vo.setData(apiPageVO);
        apiPageVO.setCurrent_page(dto.getPage());
        apiPageVO.setData(list);
        apiPageVO.setTotal(total);
        long totalPage = total % dto.getPageSize() == 0 ? total / dto.getPageSize() : total / dto.getPageSize() +1;
        apiPageVO.setPer_page(10);
        apiPageVO.setLast_page(totalPage);
        apiPageVO.setPath(RuoYiConfig.getDomain()+"/"+path);
        apiPageVO.setPrev_page_url(dto.getPage()==1? null : apiPageVO.getPath()+"?page="+(dto.getPage()-1));
        apiPageVO.setFirst_page_url( apiPageVO.getPath()+"?page=1");
        apiPageVO.setLast_page_url( apiPageVO.getPath()+"?page="+totalPage);
        apiPageVO.setNext_page_url(dto.getPage()< totalPage ? apiPageVO.getPath()+"?page="+(dto.getPage()+1) : null );
        return vo;
    }

    protected  ApiData getApiData(Object obj){
        ApiData vo = new ApiData();
        vo.setStatus("success");
        vo.setCode(200);
        vo.setData(obj);
        return vo;
    }

    protected  ApiData apiSuccess(String message){
        ApiData vo = new ApiData();
        vo.setStatus("success");
        vo.setCode(200);
        vo.setMessage(message);
        return vo;
    }

    protected  ApiData apiError(String message){
        ApiData vo = new ApiData();
        vo.setStatus("error");
        vo.setCode(-1);
        vo.setMessage(message);
        return vo;
    }
}
