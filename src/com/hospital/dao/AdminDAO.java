package com.hospital.dao;

import com.hospital.model.Admin;

public interface AdminDAO {

	boolean register(Admin admin);
	boolean checkAdmin(Admin admin);
}
