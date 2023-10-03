package com.project.dao;

import com.project.model.User;

public interface EntryDao {

	public User userLogin(String email) ;

	public int userSignUp(User user) ;

}
