package com.florisuga.db;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.florisuga.dao.RoleDAO;
import com.florisuga.model.Role;

public class InitDB {

	public static void main(String[] args) {
		SqlSessionFactory sqlSessionFactory = DBConnection.getSession();
		SqlSession session = sqlSessionFactory.openSession();
		
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
		session.commit();
		
	}
}
