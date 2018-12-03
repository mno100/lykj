package lykj.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lykj.service.AdminService;
import lykj.database.dao.AdminMapper;
import lykj.database.model.Admin;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminMapper adminMapper;
	
	@Override
	public Admin findByUsername(String username) {
		return adminMapper.findByUsername(username);
	}
	

}
