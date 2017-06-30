
Drop table  if exists oauth_client_details;
create table oauth_client_details (
  client_id VARCHAR(255) PRIMARY KEY,
  resource_ids VARCHAR(255),
  client_secret VARCHAR(255),
  scope VARCHAR(255),
  authorized_grant_types VARCHAR(255),
  web_server_redirect_uri VARCHAR(255),
  authorities VARCHAR(255),
  access_token_validity INTEGER,
  refresh_token_validity INTEGER,
  additional_information TEXT,
  create_time timestamp default now(),
  archived tinyint(1) default '0',
  trusted tinyint(1) default '0',
  autoapprove VARCHAR (255) default 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


Drop table  if exists oauth_access_token;
create table oauth_access_token (
  create_time timestamp default now(),
  token_id VARCHAR(255),
  token BLOB,
  authentication_id VARCHAR(255),
  user_name VARCHAR(255),
  client_id VARCHAR(255),
  authentication BLOB,
  refresh_token VARCHAR(255)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


Drop table  if exists oauth_refresh_token;
create table oauth_refresh_token (
  create_time timestamp default now(),
  token_id VARCHAR(255),
  token BLOB,
  authentication BLOB
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


Drop table  if exists oauth_code;
create table oauth_code (
  create_time timestamp default now(),
  code VARCHAR(255),
  authentication BLOB
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- Add indexes
create index token_id_index on oauth_access_token (token_id);
create index authentication_id_index on oauth_access_token (authentication_id);
create index user_name_index on oauth_access_token (user_name);
create index client_id_index on oauth_access_token (client_id);
create index refresh_token_index on oauth_access_token (refresh_token);

create index token_id_index on oauth_refresh_token (token_id);

create index code_index on oauth_code (code);
-- ###############
--    create MySQL database , if need create, cancel the comment
-- ###############
-- create database if not exists oauth2 default character set utf8;
-- use oauth2 set default character = utf8;

-- ###############
--    grant privileges  to oauth2/oauth2
-- ###############
-- GRANT ALL PRIVILEGES ON oauth2.* TO oauth2@localhost IDENTIFIED BY "oauth2";

-- ###############
-- Domain:  User
-- ###############
Drop table  if exists user_;
CREATE TABLE user_ (
  id int(11) NOT NULL auto_increment,
  guid varchar(255) not null unique,
  create_time datetime ,
  archived tinyint(1) default '0',
  email varchar(255),
  password varchar(255) not null,
  phone varchar(255),
  username varchar(255) not null unique,
   default_user tinyint(1) default '0',
   last_login_time datetime ,
  PRIMARY KEY  (id)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;


-- ###############
-- Domain:  Privilege
-- ###############
Drop table  if exists user_privilege;
CREATE TABLE user_privilege (
  user_id int(11),
  privilege varchar(255),
  KEY user_id_index (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- Initial database  data

truncate user_;
truncate user_privilege;
-- admin, password is admin  ( All privileges)
insert into user_(id,guid,create_time,email,password,phone,username,default_user)
values
(21,'29f6004fb1b0466f9572b02bf2ac1be8',now(),'admin@wdcy.cc','21232f297a57a5a743894a0e4a801fc3','028-1234567','admin',true);

-- unity, password is unity  ( ROLE_UNITY)
insert into user_(id,guid,create_time,email,password,phone,username,default_user)
values
(22,'55b713df1c6f423e842ad68668523c49',now(),'unity@wdcy.cc','439b3a25b555b3bc8667a09a036ae70c','','unity',false);

insert into user_privilege(user_id,privilege) values (22,'UNITY');

-- mobile, password is mobile  ( ROLE_MOBILE)
insert into user_(id,guid,create_time,email,password,phone,username,default_user)
values
(23,'612025cb3f964a64a48bbdf77e53c2c1',now(),'mobile@wdcy.cc','532c28d5412dd75bf975fb951c740a30','','mobile',false);

insert into user_privilege(user_id,privilege) values (23,'MOBILE');


-- initial oauth client details test data
-- 'unity-client'   support browser, js(flash) visit
-- 'mobile-client'  only support mobile-device visit
truncate  oauth_client_details;
insert into oauth_client_details
(client_id, resource_ids, client_secret, scope, authorized_grant_types,
web_server_redirect_uri,authorities, access_token_validity,
refresh_token_validity, additional_information, create_time, archived, trusted)
values
('unity-client','unity-resource', 'unity', 'read,write','authorization_code,refresh_token,implicit',
null,'ROLE_CLIENT',null,
null,null, now(), 0, 0),
('mobile-client','mobile-resource', 'mobile', 'read,write','password,refresh_token',
null,'ROLE_CLIENT',null,
null,null, now(), 0, 0);
