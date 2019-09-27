package com.ruoyi.project.blog.apis.contoller;
import com.alibaba.fastjson.JSONObject;
import com.ruoyi.project.blog.apis.service.ApiUserService;
import com.ruoyi.project.blog.apis.vo.ApiData;
import com.ruoyi.project.blog.apis.vo.ApiUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author soulCoke
 * @ClassName ApiUserController.java
 * @Description TODO
 * @createTime 2019年09月26日 10:40:00
 */
@Controller
public class ApiUserController extends BaseApiController {
    @Autowired
    private ApiUserService apiUserService;


    @PostMapping("/apis/login")
    @ResponseBody
    public ApiData login(String name,String password)
    {
        String token = apiUserService.login(name, password);
        JSONObject json = new JSONObject();
        json.put("token",token);
        return getApiData(json);
    }

    @PostMapping("/apis/user/info")
    @ResponseBody
    public ApiData getUserInfo()
    {
        ApiUser apiUser = getUser();
        if(apiUser == null){
            return apiSuccess(null);
        }
        return getApiData(getUser());
    }

    @PostMapping("/apis/logout")
    @ResponseBody
    public ApiData logout()
    {
        return logout();
    }
}
