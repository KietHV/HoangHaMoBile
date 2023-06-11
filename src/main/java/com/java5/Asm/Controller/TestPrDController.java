package com.java5.Asm.Controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.java5.Asm.Entity.Cilent;
import com.java5.Asm.Entity.Order;
import com.java5.Asm.Repository.OrderRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class TestPrDController {
	@Autowired
	OrderRepository oder;

	@RequestMapping("/hoanghamobile/xacnhandonhang")
	public String showForm() {
		return "product/xacnhandonhang";
	}

	@RequestMapping("/hoanghamobile/tracuudonhang")
	public String showForm1(Model model, HttpSession session) {

		return "product/tracuudonhang";
	}

	@RequestMapping("/hoanghamobile/tracuumadonhang")
	public String showForm1(Model model, @RequestParam(value = "MaHD", required = false) String MaDH, HttpSession session) {
		
		Order od = oder.findOrder(MaDH);
		if (od != null) {
			Boolean status = oder.findCilentAndStatusByOrderId(MaDH);
			System.out.println(status);
			String tt = "";
			if (status) {
				tt = "Đã Xác Nhận";
			} else {
				tt = "Chưa Xác Nhận";
			}
			model.addAttribute("status", tt);
			Cilent cl = oder.findCilentByOrderId(MaDH);
			model.addAttribute("cl", cl);

			List<Object[]> orderDetails = oder.findOrderDetailsByOrderId(MaDH);
			int qty = 0;
			double total = 0.0;
			for (Object[] result : orderDetails) {

				int quantity = (int) result[4];
				qty += quantity;
				double totalPrice = (double) result[5];
				total += totalPrice;
				// Sử dụng thông tin đã lấy ra để thực hiện các xử lý khác
				// Ví dụ: hiển thị thông tin trên giao diện, thực hiện tính toán, v.v.
			}
			model.addAttribute("orderDetails", orderDetails);
			model.addAttribute("total", total);
			model.addAttribute("qty", qty);

		}else {
			String tt = "Đơn hàng không tồn tại";
			model.addAttribute("status", tt);
			model.addAttribute("cl", null);
			model.addAttribute("orderDetails", null);
			model.addAttribute("total", 0);
			model.addAttribute("qty", 0);
		}

		return "product/tracuudonhang";
	}
}
