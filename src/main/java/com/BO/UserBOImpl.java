package com.BO;

import com.DAO.UserDAOImpl;
import com.entity.User;

public class UserBOImpl implements UserBO {
	
	@Override
	public User login(String email, String password) {
		return (new UserDAOImpl()).login(email, password);
	}

}
