package com.java5.Asm.Repository;

import java.util.Date;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.java5.Asm.Entity.OrderDetail;

import jakarta.transaction.Transactional;

public interface OrderDetailsRepository extends JpaRepository<OrderDetail, Long>{

	@Transactional
    @Modifying
    @Query(value = "INSERT INTO order_detail (so_luong,tong_gia,id_order,id_product) VALUES (?1,?2,?3,?4)", nativeQuery = true)
    void insertOrder_Details(int qty, double totalprice, String id_order, Long idProduct);
	
}
