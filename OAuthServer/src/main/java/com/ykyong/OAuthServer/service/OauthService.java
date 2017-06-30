package com.ykyong.OAuthServer.service;


import java.util.List;

import com.ykyong.OAuthServer.dto.OauthClientDetails;
import com.ykyong.OAuthServer.dto.OauthClientDetailsDto;

/**
 * @author Shengzhao Li
 */

public interface OauthService {

    OauthClientDetails loadOauthClientDetails(String clientId);

    List<OauthClientDetailsDto> loadAllOauthClientDetailsDtos();

    void archiveOauthClientDetails(String clientId);

    OauthClientDetailsDto loadOauthClientDetailsDto(String clientId);

    void registerClientDetails(OauthClientDetailsDto formDto);
}