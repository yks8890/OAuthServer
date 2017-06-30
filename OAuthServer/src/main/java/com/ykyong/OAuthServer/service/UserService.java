package com.ykyong.OAuthServer.service;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.ykyong.OAuthServer.dto.UserFormDto;
import com.ykyong.OAuthServer.dto.UserJsonDto;
import com.ykyong.OAuthServer.dto.UserOverviewDto;

/**
 * @author Shengzhao Li
 */
public interface UserService extends UserDetailsService {

    UserJsonDto loadCurrentUserJsonDto();

    UserOverviewDto loadUserOverviewDto(UserOverviewDto overviewDto);

    boolean isExistedUsername(String username);

    String saveUser(UserFormDto formDto);
}