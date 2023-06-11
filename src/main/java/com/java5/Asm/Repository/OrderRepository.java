package com.java5.Asm.Repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.java5.Asm.Entity.Cilent;
import com.java5.Asm.Entity.Order;

import jakarta.transaction.Transactional;

public interface OrderRepository extends JpaRepository<Order, String>{
	@Transactional
    @Modifying
    @Query(value = "INSERT INTO order_table (id_order,total,date,status,note,id_client) VALUES (?1,?2,?3,?4,?5,?6)", nativeQuery = true)
    void insertOrder(String id_order, double total, Date date, boolean status, String note, Long iCilent);
	
	@Query("SELECT o FROM Order o WHERE o.idOrder = ?1")
	Order getOrder(String idOrder);

	@Transactional
	@Modifying
	@Query("UPDATE Order p SET p.status=true WHERE p.idOrder=?1")
	void updateDonHang(String MaDH);
	
	@Query("SELECT o.status FROM Order o WHERE o.idOrder = ?1")
	boolean findCilentAndStatusByOrderId(String idOrder);
	
	@Query("SELECT o.iCilent FROM Order o WHERE o.idOrder = ?1")
	Cilent findCilentByOrderId(String idOrder);
	

    @Query("SELECT o.idOrder, o.iCilent.fullName, od.idProduct.nameProduct, od.idProduct.image, od.SoLuong, od.TongGia " +
            "FROM Order o " +
            "JOIN o.iCilent c " +
            "JOIN OrderDetail od ON od.iOrder = o " +
            "WHERE o.idOrder = ?1")
    List<Object[]> findOrderDetailsByOrderId(String idOrder);
    
    @Query("SELECT o FROM Order o WHERE o.idOrder = ?1")
	Order findOrder(String idOrder);
}

	
