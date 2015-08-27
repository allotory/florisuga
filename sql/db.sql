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
	'last_login_ip' varchar(15) NOT NULL,		/* 最近登录的IP地址 */
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
	PRIMARY KEY('id'),
	KEY 'pid' ('pid'),
	KEY 'status' ('status')
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

/*
 * 权限表
 */
CREATE TABLE IF NOT EXISTS 'permission' (
	'id' int unsigned NOT NULL AUTO_INCREMENT,	/* 权限 ID（唯一标识） */
	'name' varchar(32) NOT NULL,				/* 权限名称（英文名，对应应用控制器、应用、方法名） */
	'title' varchar(64) DEFAULT NULL,			/* 权限名称 */
	'status' tinyint(1) DEFAULT '0',			/* 启用状态：0-表示禁用，1-表示启用 */
	'remark' varchar(256) DEFAULT NULL,		/* 备注信息 */
	'sort' smallint(6) unsigned DEFAULT NULL,	/* 排序值（默认值为50） */
	'pid' smallint(6) unsigned NOT NULL,		/* 父权限 ID（如:方法pid对应相应的控制器） */
	'level' tinyint(1) unsigned NOT NULL,		/* 权限类型：1-表示应用（模块）, 2-表示控制器, 3-表示方法 */
	PRIMARY KEY ('id'),
	KEY 'name' ('name')
	KEY 'level' ('level'),
	KEY 'pid' ('pid'),
	KEY 'status' ('status')
);

/**
 * 角色权限对应表
 */
CREATE TABLE IF NOT EXISTS 'role_permission' (
  'role_id' int unsigned NOT NULL,			/* 角色 ID（唯一标识） */
  'permission_id' int unsigned NOT NULL,	/* 权限 ID（唯一标识） */
  'level' tinyint(1) NOT NULL,
  'module' varchar(64) DEFAULT NULL,
  KEY 'role_id' ('role_id'),
  KEY 'permission_id' ('permission_id')
)