package com.java5.Asm.Entity;

import java.util.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@Entity
@Getter
@Setter
@NoArgsConstructor
@Table(name = "order_table")
public class Order {
	 @Id
	 
	 private String idOrder;
	 private double Total;
	 private Date date;
	 private Boolean status;
	 private String note;
	 @ManyToOne
	 @JoinColumn(name = "idClient")
	 private Cilent iCilent;
}
