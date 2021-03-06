package com.yinker.scheduler.controller;

import com.yinker.base.BaseController;
import com.yinker.platform.api.dubbo.IUserResourceService;
import com.yinker.platform.api.model.SecUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * @author
 * @version 1.0
 * @since 1.0
 */
 
@RequestMapping("login")
@Controller
public class LoginController extends BaseController{

    @Autowired
    private IUserResourceService userResourceService;

    /**
     * @Description: ssologin
     * @param session
     * @return
     */
    @RequestMapping(value = "/ssologin")
    public ModelAndView ssologin(HttpSession session,String username) {
        ModelAndView model = new ModelAndView();
        model.addObject("service",session.getAttribute("service"));
        model.addObject("username",username);
        model.setViewName("/login/ssologin");
        return model;
    }

    /** 登录页面*/
    @RequestMapping(value="/login")
    public ModelAndView Login(String service,HttpSession session){
        ModelAndView model = new ModelAndView();
        model.setViewName("/index");
        session.setAttribute("service",service);
        return  model;
    }

    /** 校验用户名密码*/
    @RequestMapping(value="/checkUser")
    @ResponseBody
    public Map<String,String> checkUser(String userName, String password){
        //返回结果map
        Map<String,String> resultMap = new HashMap<String, String>();
        //验证登录
        SecUser secUser = userResourceService.loginServeice(userName, password);
        if (null != secUser && null != secUser.getUsername() ) {
            resultMap.put("result", "success");
        } else {
            resultMap.put("result", "error");
        }
        return resultMap;
    }
}
