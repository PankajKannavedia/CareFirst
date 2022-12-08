package com.hospital.dao;

import com.hospital.model.User;

public interface UserDAO {

	boolean register(User user);
	boolean checkUser(User user);
}
