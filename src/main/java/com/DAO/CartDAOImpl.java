package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.ProductDtls;
import com.entity.cart;

public class CartDAOImpl implements CartDAO{
	
	private Connection conn;
	
	public CartDAOImpl(Connection conn) {
		super();
		this.conn=conn;
	}

	@Override
	public boolean addCart(cart c) {
		boolean f=false;
		try {
			String sql = "insert into cart(pid,uid,productNam,makein,price,total_price) values(?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, c.getPid());
			ps.setInt(2, c.getUid());
			ps.setString(3, c.getProductName());
			ps.setString(4, c.getMakein());
			ps.setDouble(5, c.getPrice());
			ps.setDouble(6, c.getTotalPrice());
			
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		} catch (Exception e) {
		   e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<cart> getProductByUser(int UserId) {
		 List<cart> list =  new ArrayList<cart>();
		 cart c = null;
		 double totalPrice = 0;
		try {
			String sql= "select * from cart where uid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, UserId);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				c= new cart();
				c.setCid(rs.getInt(1));
				c.setPid(rs.getInt(2));
				c.setUid(rs.getInt(3));
				c.setProductName(rs.getString(4));
				c.setMakein(rs.getString(5));
				c.setPrice(rs.getDouble(6));
				
				totalPrice = totalPrice+rs.getDouble(7);
				c.setTotalPrice(totalPrice);
				list.add(c);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public boolean deleteProduct(int pid,int uid, int cid) {
		boolean f=false;
		try {
			String sql="delete from cart where pid=? and uid=? and cid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setInt(1, pid);
			ps.setInt(2, uid);
			ps.setInt(3, cid);
			
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;	
	}

	
	
}
