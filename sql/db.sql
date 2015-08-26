CREATE DATABASE florisuga;

USE florisuga;

/*
 * 用户表
 */
CREATE TABLE IF NOT EXISTS 'user' (
	'id' int unsigned NOT NULL AUTO_INCREMENT,	/* 用户 ID（唯一标识） */
	'username' varchar(32) NOT NULL,			/* 用户名 */
	'password' varchar(256) NOT NULL,			/* 密码 */
	'email' varchar(128) NOT NULL,				/* 邮箱*/
	'create_time' TIMESTAMP(14) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,		/* 创建时间（时间戳） */
	'last_login_time' TIMESTAMP(14) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,  /* 最近一次登录时间（时间戳）*/
	'last_login_ip' varchar(15) NOT NULL,			/* 最近登录的IP地址 */
	'status' tinyint(1) unsigned NOT NULL,		/* 启用状态：0-表示禁用，1-表示启用 */
	'remark' varchar(256) DEFAULT NULL,		/* 备注信息 */
	PRIMARY KEY('id')
);

/*
 * 角色表
 */
CREATE TABLE IF NOT EXISTS 'role' (
	'id' int unsigned NOT NULL AUTO_INCREMENT,	/* 角色 ID（唯一标识） */
	'rolename' varchar(32) NOT NULL,			/* 角色名 */
	'pid' int unsigned DEFAULT NULL,			/* 父角色 ID */
	'status' tinyint(1) unsigned NOT NULL,		/* 启用状态：0-表示禁用，1-表示启用 */
	'remark' varchar(256) DEFAULT NULL,		/* 备注信息 */
	PRIMARY KEY('id')
);

/*
 * 用户与角色对应表
 */
CREATE TABLE IF NOT EXISTS 'role_user' (
	'role_id' int unsigned DEFAULT NULL,	/* 角色 ID（唯一标识） */
	'user_id' int unsigned DEFAULT NULL,	/* 用户 ID（唯一标识） */
	KEY 'role_id' ('role_id'),
	KEY 'user_id' ('user_id')
);
