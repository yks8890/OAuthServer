package com.ykyong.OAuthServer.dao;


import java.util.List;

import com.ykyong.OAuthServer.dto.OauthClientDetails;
import com.ykyong.OAuthServer.dto.Repository;

/**
 * 处理 OAuth 相关业务的 Repository
 *
 * @author Shengzhao Li
 */
public interface OauthRepository extends Repository {

    OauthClientDetails findOauthClientDetails(String clientId);

    List<OauthClientDetails> findAllOauthClientDetails();

    void updateOauthClientDetailsArchive(String clientId, boolean archive);

    void saveOauthClientDetails(OauthClientDetails clientDetails);
}