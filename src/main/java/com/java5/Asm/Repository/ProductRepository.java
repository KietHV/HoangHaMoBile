package com.java5.Asm.Repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.java5.Asm.Entity.Product;

import jakarta.transaction.Transactional;

public interface ProductRepository extends JpaRepository<Product, Long> {
	@Query("SELECT p FROM Product p WHERE p.type='Apple' ORDER BY p.idProduct DESC")
	List<Product> fillProductApple();

	@Query("SELECT p FROM Product p WHERE p.type IN ('Samsung', 'Oppo', 'Xiaomi') ORDER BY RAND()")
	List<Product> fillProductSamSung1();

	@Query("SELECT p FROM Product p WHERE p.type='Máy tính'")
	List<Product> fillComputer();

	@Query("SELECT p FROM Product p WHERE p.type IN ('Samsung', 'Oppo', 'Xiaomi','Apple') ORDER BY RAND()")
	List<Product> findRandom5Products();

	@Query("SELECT p FROM Product p WHERE p.nameProduct LIKE ?1")
	List<Product> findProduct(String keyword);

	Product findByIdProduct(Long idProduct);

	@Query("SELECT p FROM Product p WHERE p.nameProduct LIKE ?1")
	Page<Product> findAllByNameProduct(String keyWord, Pageable pageble);

	@Transactional
	@Modifying
	@Query("UPDATE Product p SET p.nameProduct=?1 ,p.price=?3,p.note=?4,p.sale=?5 ,p.image=?6 , p.type=?7 WHERE p.idProduct=?2")

	void updatenameProduct(String Name,Long id,Double price,String note,Double sale,String image,String type);
	
	@Transactional
	@Modifying
	@Query("DELETE FROM Product p WHERE p.idProduct = ?1")
	void deleteProduct(Long id);
	
	List<Product> findAllBynameProductContainingIgnoreCase(String keywords);
	
	
	

}
