package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.Feedback;
import com.entity.User;

public class UserDAOImpl implements UserDAO {

	private Connection conn;

	public UserDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean userRegister(User us) {
		boolean f = false;
		try {
			String sql = "insert into user(name,email,phno,password) values(?,?,?,?)";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhno());
			ps.setString(4, us.getPassword());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public User login(String email, String password) {
		User us = null;

		try {
			String sql = "select * from user where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				us = new User();
				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setPhno(rs.getString(4));
				us.setPassword(rs.getString(5));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return us;
	}

	public boolean checkPassword(int id, String ps) {

		boolean f = false;
		try {

			String sql = "select * from user where id=? and password=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			pst.setString(2, ps);

			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public boolean updateProfile(User us) {

		boolean f = false;
		try {
			String sql = "update user set name=?,email=?,phno=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhno());
			ps.setInt(4, us.getId());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public boolean checkUser(String em) {
		boolean f = true;

		try {
			String sql = "select * from user where email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, em);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				f = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public boolean checkPasswordAuthen(String email, String phno) {
		boolean f = false;
		try {

			String sql = "select * from user where email=? and phno=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, phno);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public boolean forgotPassword(String email, String phno, String password) {

		boolean f = false;
		try {
			String sql = "update user set password=? where email=? and phno=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, password);
			ps.setString(2, email);
			ps.setString(3, phno);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public boolean saveFeedback(Feedback f) {
		boolean fa = false;
		try {
			String sql = "insert into feedback(bookId,userId,comment) values(?,?,?)";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, f.getBookId());
			ps.setInt(2, f.getUserId());
			ps.setString(3, f.getComment());

			int i = ps.executeUpdate();

			if (i == 1) {
				fa = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return fa;
	}

	public User getUserById(int uid) {
		User us = null;

		try {
			String sql = "select * from user where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, uid);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				us = new User();
				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setPhno(rs.getString(4));
				us.setPassword(rs.getString(5));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return us;
	}

}
