package com.florisuga.db;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.florisuga.dao.PermissionDAO;
import com.florisuga.dao.RoleDAO;
import com.florisuga.dao.RolePermissionDAO;
import com.florisuga.model.Permission;
import com.florisuga.model.Role;
import com.florisuga.model.RolePermission;

public class InitDB {

	public static void main(String[] args) {
		SqlSessionFactory sqlSessionFactory = DBConnection.getSession();
		SqlSession session = sqlSessionFactory.openSession();
		
		// 角色
		RoleDAO roleDAO = session.getMapper(RoleDAO.class);
		
		Role role0 = new Role();
		role0.setRolename("user");
		role0.setPid(0);
		role0.setStatus(1);
		role0.setRemark("普通用户");
		
		Role role1 = new Role();
		role1.setRolename("admin");
		role1.setPid(0);
		role1.setStatus(1);
		role1.setRemark("管理员");

		roleDAO.insertRole(role0);
		roleDAO.insertRole(role1);
		
		// 权限
		PermissionDAO permissionDAO = session.getMapper(PermissionDAO.class);

		Permission permission0 = new Permission();
		permission0.setName("user");
		permission0.setTitle("用户权限");
		permission0.setStatus(1);
		permission0.setRemark("用户权限");
		permission0.setSort(50);
		permission0.setPid(0);
		permission0.setLevel(0);
		
		Permission permission1 = new Permission();
		permission1.setName("admin");
		permission1.setTitle("管理权限");
		permission1.setStatus(1);
		permission1.setRemark("管理权限");
		permission1.setSort(50);
		permission1.setPid(0);
		permission1.setLevel(0);

		permissionDAO.insertPermission(permission0);
		permissionDAO.insertPermission(permission1);
		
		// 角色权限对照
		RolePermissionDAO rolePermissionDAO = session.getMapper(RolePermissionDAO.class);
		
		RolePermission rolePermission0 = new RolePermission();
		rolePermission0.setRole_id(1);
		rolePermission0.setPermission_id(1);
		
		RolePermission rolePermission1 = new RolePermission();
		rolePermission1.setRole_id(2);
		rolePermission1.setPermission_id(2);

		rolePermissionDAO.insertRolePermission(rolePermission0);
		rolePermissionDAO.insertRolePermission(rolePermission1);
		
		session.commit();
		
	}
}
