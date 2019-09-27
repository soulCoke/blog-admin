package com.ruoyi.project.blog.apis.service.impl;

import com.ruoyi.common.constant.ShiroConstants;
import com.ruoyi.common.utils.Md5Utils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.framework.config.RuoYiConfig;
import com.ruoyi.framework.shiro.service.LoginService;
import com.ruoyi.project.blog.apis.service.ApiUserService;
import com.ruoyi.project.blog.apis.vo.ApiUser;
import com.ruoyi.project.system.user.domain.User;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * @author soulCoke
 * @ClassName ApiUserServiceImpl.java
 * @Description TODO
 * @createTime 2019年09月26日 14:09:00
 */
@Service
public class ApiUserServiceImpl implements ApiUserService {
    @Autowired
    private CacheManager cacheManager;

    private Cache<String, ApiUser> apiLoginUser;

    @PostConstruct
    public void init()
    {
        apiLoginUser = cacheManager.getCache(ShiroConstants.API_LOGIN_USER);
    }

    @Autowired
    private LoginService loginService;

    @Override
    public String login(String name, String password) {
        User user = loginService.apiLogin(name,password);
        String token =   Md5Utils.hash(user.getLoginName() + System.nanoTime());
        ApiUser apiUser = new ApiUser();
        apiUser.setId(user.getUserId());
        apiUser.setName(user.getLoginName());
        apiUser.setEmail(user.getEmail());
        apiUser.setPhone(user.getPhonenumber());
        apiUser.setAvatar_url(RuoYiConfig.getDomain()+user.getAvatar());
        apiLoginUser.put(token,apiUser);
        return token;
    }
}
