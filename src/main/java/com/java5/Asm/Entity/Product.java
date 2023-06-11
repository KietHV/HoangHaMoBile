package com.java5.Asm.Entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import java.io.Serializable;
import java.util.Date;


@Data
@Entity
@Getter
@Setter
@NoArgsConstructor
public class Product implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idProduct;
    @NotBlank(message = "Tên Sản Phẩm không được để trống")
    private String nameProduct;

    @Min(value = 0, message = "Giá Sản Phẩm phải là số không âm")
    @NotNull(message = "Giá Sản Phẩm không được để trống")
    private Double price;
    @NotBlank(message = "Mô Tả Sản Phẩm không được để trống")
    private String note;

    @NotBlank(message = "Category không được để trống")
    private String type;

    @NotBlank(message = "Image không được để trống")
    private String image;

    private Date date;

    @Min(value = 0, message = "Giá Sale phải là số không âm")
    @NotNull(message = "Giá Sale không được để trống")
    private Double sale;

    @Min(value = 0, message = "Qty phải là số không âm")
    @Max(value = 5, message = "Qty không được vượt quá 5")
    private int Qty;


    public Product(Long idProduct, String nameProduct, Double price, String note, String type, String image,
            Date date,int Qty) {
        this.idProduct = idProduct;
        this.nameProduct = nameProduct;
        this.price = price;
        this.note = note;
        this.type = type;
        this.image = image;
        this.date = date;
        this.Qty = Qty;
    }

   
}
