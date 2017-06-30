package com.ykyong.OAuthServer.dao;


import java.util.List;

import com.ykyong.OAuthServer.dto.Repository;
import com.ykyong.OAuthServer.dto.User;

/**
 * @author Shengzhao Li
 */

public interface UserRepository extends Repository {

    User findByGuid(String guid);

    void saveUser(User user);

    void updateUser(User user);

    User findByUsername(String username);

    List<User> findUsersByUsername(String username);
}