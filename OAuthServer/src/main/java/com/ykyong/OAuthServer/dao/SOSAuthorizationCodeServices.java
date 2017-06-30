package com.ykyong.OAuthServer.dao;

import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.code.JdbcAuthorizationCodeServices;

import javax.sql.DataSource;


/**
 * 2016/7/23
 *
 * @author Shengzhao Li
 */
public class SOSAuthorizationCodeServices extends JdbcAuthorizationCodeServices {


    public SOSAuthorizationCodeServices(DataSource dataSource) {
        super(dataSource);
    }


    @Override
    @Cacheable(value = com.ykyong.OAuthServer.util.CacheConstants.AUTHORIZATION_CODE_CACHE, key = "#code")
    protected void store(String code, OAuth2Authentication authentication) {
        super.store(code, authentication);
    }

    @Override
    @CacheEvict(value = com.ykyong.OAuthServer.util.CacheConstants.AUTHORIZATION_CODE_CACHE, key = "#code")
    public OAuth2Authentication remove(String code) {
        return super.remove(code);
    }
}
