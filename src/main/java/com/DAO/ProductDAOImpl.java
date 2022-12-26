package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import com.entity.ProductDtls;

public class ProductDAOImpl implements ProductDAO{

	private Connection conn;
	
	public ProductDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addProducts(ProductDtls p) {
		boolean f=false;
		try {
			String sql="insert into product_dtls(productname, makein, price, category, status, photo, email) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, p.getProductName());
			ps.setString(2, p.getMakein());
			ps.setString(3, p.getPrice());
			ps.setString(4, p.getCategory());
			ps.setString(5, p.getStatus());
			ps.setString(6, p.getPhotoName());
			ps.setString(7, p.getEmail());
			
			int i = ps.executeUpdate();
			System.out.println(i);
			if (i == 1) {
				f = true;
				
			}
			
		} catch (Exception e) {
			
		}
		 
		return f;
	}

	@Override
	public List<ProductDtls> getAllProducts() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();
		ProductDtls p = null;
		
		try {
			String sql = "select * from product_dtls ";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				p = new ProductDtls();
				p.setProductId(rs.getInt(1));
				p.setProductName(rs.getString(2));
				p.setMakein(rs.getString(3));
				p.setPrice(rs.getString(4));
				p.setCategory(rs.getString(5));
				p.setStatus(rs.getString(6));
				p.setPhotoName(rs.getString(7));
				list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public ProductDtls getProductById(int id) {
		
		ProductDtls p = null;
		try {
			String sql = "select * from product_dtls where productId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setInt(1, id);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				p=new ProductDtls();
				p.setProductId(rs.getInt(1));
				p.setProductName(rs.getString(2));
				p.setMakein(rs.getString(3));
				p.setPrice(rs.getString(4));
				p.setCategory(rs.getString(5));
				p.setStatus(rs.getString(6));
				p.setPhotoName(rs.getString(7));
			}
			} catch (Exception e) {
			e.printStackTrace();
		}
		return p;
	}

	@Override
	public boolean updateEditProducts(ProductDtls p) {
		boolean f = false;
		try {
			String sql = "update product_dtls set productname=?, makein=?, price=?, status=? where productId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, p.getProductName());
			ps.setString(2, p.getMakein());
			ps.setString(3, p.getPrice());
			ps.setString(4, p.getStatus());
			ps.setInt(5, p.getProductId());
			
			int i = ps.executeUpdate();
			if(i==1) {
				f=true;
			}		
		} catch (Exception e) {
			e.printStackTrace();
	  }
		return f;
	}

	@Override
	public boolean deleteProducts(int id) {
		boolean f = false;
		try {
			String sql = "delete from product_dtls where  productId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i= ps.executeUpdate();
			if(1==1) {
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

	@Override
	public List<ProductDtls> getLiving() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();
		ProductDtls p = null;
		try {
			String sql= "select * from product_dtls where category=? order by productId DESC ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Phong khach");
			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next() && i<= 4) {
				p = new ProductDtls();
				p.setProductId(rs.getInt(1));
				p.setProductName(rs.getString(2));
				p.setMakein(rs.getString(3));
				p.setPrice(rs.getString(4));
				p.setCategory(rs.getString(5));
				p.setStatus(rs.getString(6));
				p.setPhotoName(rs.getString(7));
				list.add(p);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<ProductDtls> getDin() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();
		ProductDtls p = null;
		try {
			String sql= "select * from product_dtls where category=? order by productId DESC ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Phong an");
			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next() && i<= 4) {
				p = new ProductDtls();
				p.setProductId(rs.getInt(1));
				p.setProductName(rs.getString(2));
				p.setMakein(rs.getString(3));
				p.setPrice(rs.getString(4));
				p.setCategory(rs.getString(5));
				p.setStatus(rs.getString(6));
				p.setPhotoName(rs.getString(7));
				list.add(p);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<ProductDtls> getBed() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();
		ProductDtls p = null;
		try {
			String sql= "select * from product_dtls where category=? order by productId DESC ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Phong ngu");
			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next() && i<= 4) {
				p = new ProductDtls();
				p.setProductId(rs.getInt(1));
				p.setProductName(rs.getString(2));
				p.setMakein(rs.getString(3));
				p.setPrice(rs.getString(4));
				p.setCategory(rs.getString(5));
				p.setStatus(rs.getString(6));
				p.setPhotoName(rs.getString(7));
				list.add(p);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<ProductDtls> getAllLiving() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();
		ProductDtls p = null;
		try {
			String sql= "select * from product_dtls where category=? order by productId DESC ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Phong khach");
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				p = new ProductDtls();
				p.setProductId(rs.getInt(1));
				p.setProductName(rs.getString(2));
				p.setMakein(rs.getString(3));
				p.setPrice(rs.getString(4));
				p.setCategory(rs.getString(5));
				p.setStatus(rs.getString(6));
				p.setPhotoName(rs.getString(7));
				list.add(p);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<ProductDtls> getAllDin() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();
		ProductDtls p = null;
		try {
			String sql= "select * from product_dtls where category=? order by productId DESC ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Phong an");
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				p = new ProductDtls();
				p.setProductId(rs.getInt(1));
				p.setProductName(rs.getString(2));
				p.setMakein(rs.getString(3));
				p.setPrice(rs.getString(4));
				p.setCategory(rs.getString(5));
				p.setStatus(rs.getString(6));
				p.setPhotoName(rs.getString(7));
				list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<ProductDtls> getAllBed() {
		List<ProductDtls> list = new ArrayList<ProductDtls>();
		ProductDtls p = null;
		try {
			String sql= "select * from product_dtls where category=? order by productId DESC ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Phong ngu");
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				p = new ProductDtls();
				p.setProductId(rs.getInt(1));
				p.setProductName(rs.getString(2));
				p.setMakein(rs.getString(3));
				p.setPrice(rs.getString(4));
				p.setCategory(rs.getString(5));
				p.setStatus(rs.getString(6));
				p.setPhotoName(rs.getString(7));
				list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<ProductDtls> getProductBySearch(String ch) {
		List<ProductDtls> list = new ArrayList<ProductDtls>();
		ProductDtls p = null;
		
		try {
			String sql = "select *from product_dtls where productname like ? or makein like ? or category like ? and status=? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+ch+"%");
			ps.setString(2, "%"+ch+"%");
			ps.setString(3, "%"+ch+"%");
			ps.setString(4, "Active");
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				
				p = new ProductDtls();
				p.setProductId(rs.getInt(1));
				p.setProductName(rs.getString(2));
				p.setMakein(rs.getString(3));
				p.setPrice(rs.getString(4));
				p.setCategory(rs.getString(5));
				p.setStatus(rs.getString(6));
				p.setPhotoName(rs.getString(7));
				p.setEmail(rs.getString(8));
				list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	
    
	
}
