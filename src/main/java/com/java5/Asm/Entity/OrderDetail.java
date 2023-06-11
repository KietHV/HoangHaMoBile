package com.java5.Asm.Entity;

import java.util.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@Entity
@Getter
@Setter
@NoArgsConstructor
	public class OrderDetail {
		 @Id
		 @GeneratedValue(strategy = GenerationType.IDENTITY)
		 private Long idOrderDetail;
		 @ManyToOne
		 @JoinColumn(name = "idOrder")
		 private Order iOrder;
		 @ManyToOne
		 @JoinColumn(name = "idProduct")
		 private Product idProduct;
		 private int SoLuong;
		 private double TongGia;
		 
		 
		 
	}
