package com.BO;

import com.entity.User;

public interface UserBO {
	public User login(String email, String password);
}
