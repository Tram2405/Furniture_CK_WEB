package com.DAO;


import java.util.List;

import com.entity.ProductDtls;

public interface ProductDAO {
    public boolean addProducts(ProductDtls p);
    
    public List<ProductDtls> getAllProducts();
    
    public ProductDtls getProductById(int id);
    
    public boolean updateEditProducts(ProductDtls p);
    
    public boolean deleteProducts(int id);
    
   public List<ProductDtls> getLiving();
    
   public List<ProductDtls> getDin();
   
   public List<ProductDtls> getBed();
   
   public List<ProductDtls> getAllLiving();
   
   public List<ProductDtls> getAllDin();

   public List<ProductDtls> getAllBed();
   
   public List<ProductDtls> getProductBySearch(String ch);
}
