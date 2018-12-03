package lykj.database.dao;

import lykj.database.model.Admin;

public interface AdminMapper {

	Admin findByUsername(String username);



}
