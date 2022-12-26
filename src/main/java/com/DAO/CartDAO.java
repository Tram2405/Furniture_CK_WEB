package com.DAO;


import java.util.List;

import com.entity.ProductDtls;
import com.entity.cart;

public interface CartDAO {

	public boolean addCart(cart c);
	
	public List<cart> getProductByUser(int UserId);
	
	public boolean deleteProduct(int pid, int uid, int cid);
	
	
	
}
