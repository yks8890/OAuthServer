package com.ykyong.OAuthServer.service.impl;

import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.stereotype.Service;

import com.ykyong.OAuthServer.dao.UserRepository;
import com.ykyong.OAuthServer.dto.User;
import com.ykyong.OAuthServer.dto.UserDto;
import com.ykyong.OAuthServer.dto.UserFormDto;
import com.ykyong.OAuthServer.dto.UserJsonDto;
import com.ykyong.OAuthServer.dto.UserOverviewDto;
import com.ykyong.OAuthServer.dto.WdcyUserDetails;
import com.ykyong.OAuthServer.service.UserService;

/**
 * 处理用户, 账号, 安全相关业务
 *
 * @author Shengzhao Li
 */
@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.findByUsername(username);
        if (user == null || user.archived()) {
            throw new UsernameNotFoundException("Not found any user for username[" + username + "]");
        }

        return new WdcyUserDetails(user);
    }

    @Override
    public UserJsonDto loadCurrentUserJsonDto() {
        final Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        final Object principal = authentication.getPrincipal();

        if (authentication instanceof OAuth2Authentication &&
                (principal instanceof String || principal instanceof org.springframework.security.core.userdetails.User)) {
            return loadOauthUserJsonDto((OAuth2Authentication) authentication);
        } else {
            final WdcyUserDetails userDetails = (WdcyUserDetails) principal;
            return new UserJsonDto(userRepository.findByGuid(userDetails.user().guid()));
        }
    }

    @Override
    public UserOverviewDto loadUserOverviewDto(UserOverviewDto overviewDto) {
        List<User> users = userRepository.findUsersByUsername(overviewDto.getUsername());
        overviewDto.setUserDtos(UserDto.toDtos(users));
        return overviewDto;
    }

    @Override
    public boolean isExistedUsername(String username) {
        final User user = userRepository.findByUsername(username);
        return user != null;
    }

    @Override
    public String saveUser(UserFormDto formDto) {
        User user = formDto.newUser();
        userRepository.saveUser(user);
        return user.guid();
    }


    private UserJsonDto loadOauthUserJsonDto(OAuth2Authentication oAuth2Authentication) {
        UserJsonDto userJsonDto = new UserJsonDto();
        userJsonDto.setUsername(oAuth2Authentication.getName());

        final Collection<GrantedAuthority> authorities = oAuth2Authentication.getAuthorities();
        for (GrantedAuthority authority : authorities) {
            userJsonDto.getPrivileges().add(authority.getAuthority());
        }

        return userJsonDto;
    }
}