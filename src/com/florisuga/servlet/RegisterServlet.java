package com.florisuga.servlet;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.florisuga.dao.RoleUserDAO;
import com.florisuga.dao.UserDAO;
import com.florisuga.db.DBConnection;
import com.florisuga.model.RoleUser;
import com.florisuga.model.User;
import com.florisuga.security.Encryption;
import com.florisuga.security.Salt;
import com.florisuga.utils.IPUtils;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RegisterServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		// request parameter
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String password_confirmation = request.getParameter("password_confirmation");
		String email = request.getParameter("email");
		
		// IP
		String last_login_ip = IPUtils.getIP(request);
		
		// 密码盐
		String salt = Salt.getSalt();
		// 密码加密
		Encryption en = new Encryption();
		
		// 日期
		Date date = new Date();
		String dateFormate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date); 
		Timestamp now = Timestamp.valueOf(dateFormate);
		
		SqlSessionFactory sqlSessionFactory = DBConnection.getSession();
		SqlSession session = sqlSessionFactory.openSession();
		
		if(!(!password_confirmation.equals(password) | password_confirmation == "" | password == "")) {
			
			// 用户
			UserDAO userDAO = session.getMapper(UserDAO.class);
			
			User user = new User();
			user.setUsername(username);
			user.setPassword(en.sha256Encode(password + salt));
			user.setSalt(salt);
			user.setEmail(email);
			user.setCreate_time(now);
			user.setLast_login_time(now);
			user.setLast_login_ip(last_login_ip);
			user.setStatus(1);
			user.setRemark("普通用户");
			
			userDAO.insertUser(user);
			session.commit();
			
			// 查询user id........
			User u = userDAO.queryUserByName(user);
			System.out.println(u.getId());
			System.out.println(u.getUsername());
			
			// 用户角色
			RoleUserDAO roleUserDAO = session.getMapper(RoleUserDAO.class);
			
			RoleUser roleUser = new RoleUser();
			roleUser.setRole_id(1);
			roleUser.setUser_id(u.getId());
			roleUserDAO.insertRoleUser(roleUser);
			
			session.commit();
			
			response.sendRedirect(request.getContextPath() 
					+ "/success.jsp");
		} else {
			response.sendRedirect(request.getContextPath() 
					+ "/failure.jsp");
		}
		
	}
}
