package com.java5.Asm.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.java5.Asm.Entity.Order;
import com.java5.Asm.Entity.OrderDetail;
import com.java5.Asm.Repository.OrderDetailsRepository;
import com.java5.Asm.Repository.OrderRepository;




@Controller
public class ReportController {
	
	@Autowired
	OrderDetailsRepository odDAO;
	
	@Autowired
	OrderRepository ordDAO;
	
	@Autowired
    private RequestCountInterceptorController Count;
	
	@RequestMapping("/hoanghamobile/report")
	public String showReport(ModelMap model) {
		// tổng tiền
		double tongtien = odDAO.getTotalPrice();
		model.addAttribute("tongtien", tongtien);
		// sl bán ra
		double slBan = odDAO.getTotalSL();
		model.addAttribute("slBan", slBan);
		// sl đơn hàng
		int slOrder = ordDAO.getSLOrder();
		model.addAttribute("slOrder", slOrder);
		
		Long slTruyCap = Count.getAccessCount();
		model.addAttribute("slTruyCap", slTruyCap);
		
		 
		List<OrderDetail> allOrder = odDAO.allOrder();
		model.addAttribute("allOrder", allOrder);
		
		return "admin/report";
		
	}
}
