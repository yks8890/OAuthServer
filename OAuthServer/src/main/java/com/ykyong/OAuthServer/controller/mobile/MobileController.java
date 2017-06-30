package com.ykyong.OAuthServer.controller.mobile;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ykyong.OAuthServer.dto.UserJsonDto;
import com.ykyong.OAuthServer.service.UserService;

/**
 * @author Shengzhao Li
 */
@Controller
@RequestMapping("/m/")
public class MobileController {

    @Autowired
    private UserService userService;


    @RequestMapping("dashboard")
    public String dashboard() {
        return "mobile/dashboard";
    }

    @RequestMapping("user_info")
    @ResponseBody
    public UserJsonDto userInfo() {
        return userService.loadCurrentUserJsonDto();
    }

}