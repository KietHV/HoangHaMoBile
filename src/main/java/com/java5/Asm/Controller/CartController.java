package com.java5.Asm.Controller;

import java.nio.charset.StandardCharsets;
import org.apache.commons.codec.binary.Base64;
import org.apache.jasper.tagplugins.jstl.core.ForEach;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.java5.Asm.Entity.Cilent;
import com.java5.Asm.Entity.Order;
import com.java5.Asm.Entity.Product;
import com.java5.Asm.Repository.ClientReprository;
import com.java5.Asm.Repository.OrderDetailsRepository;
import com.java5.Asm.Repository.OrderRepository;
import com.java5.Asm.Repository.ProductRepository;
import com.java5.Asm.Service.ShoppingCartService;
import com.java5.Asm.impl.MailerServicelml;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class CartController {
	
	@Autowired
	private OrderRepository order;
	
	@Autowired 
	private OrderDetailsRepository orderDetails;
	
	@Autowired
	private ClientReprository client;
	
	@Autowired
	private ShoppingCartService cart;

	@Autowired
	private ProductRepository daop;

	@Autowired
	private HttpServletResponse resp;

	@Autowired
	private HttpServletRequest req;
	
	@Autowired
	MailerServicelml mailer;
	
	private ObjectMapper objectMapper = new ObjectMapper();
	Cookie cookie = null;

	@RequestMapping("/hoanghamobile/cartproduct")
	public String view(Model model, @CookieValue(value = "myCart", required = false) String cartValue) {

		if (cartValue != null && !cartValue.isEmpty()) {
			// Giải mã chuỗi Base64
			byte[] decodedBytes = Base64.decodeBase64(cartValue);
			String decodedValue = new String(decodedBytes, StandardCharsets.UTF_8);

			try {
				Map<Long, Product> map = objectMapper.readValue(decodedValue, new TypeReference<Map<Long, Product>>() {
				});
				cart.setItems(map);
			} catch (JsonProcessingException e) {
				// Xử lý lỗi khi chuyển đổi chuỗi JSON
			}
		}

		model.addAttribute("cart", cart);
		model.addAttribute("total", cart.getAmount());
		List<Product> list = daop.findAll();
		model.addAttribute("test", list);
		model.addAttribute("cilent", new Cilent());
		return "product/cartproduct";
	}

	@RequestMapping("/hoanghamobile/cartproduct/add/{idProduct}")
	public String add(@PathVariable("idProduct") Long id, Model model) throws JsonProcessingException {
//		cookie = new Cookie("myCart", "");
//		cookie.setMaxAge(0);
//		resp.addCookie(cookie);
//		
//		Cookie c[] = req.getCookies();
//		if(c != null) {
//			for (Cookie cookiea : c) {
//				if(cookiea.getName().equals("myCart")) {
//					System.out.println(cookiea.getName() + "         "  + cookiea.getValue());
//				}
//			}
//		}
		
		cart.add(id);
		Map<Long, Product> itemsMap = cart.getItems().stream()
				.collect(Collectors.toMap(Product::getIdProduct, Function.identity()));
		String cartValue = objectMapper.writeValueAsString(itemsMap);
		cart.clear();
		// Mã hóa chuỗi JSON thành chuỗi Base64
		byte[] encodedBytes = Base64.encodeBase64(cartValue.getBytes(StandardCharsets.UTF_8));
		String encodedCartValue = new String(encodedBytes, StandardCharsets.UTF_8);
		cookie = new Cookie("myCart", encodedCartValue);
		cookie.setMaxAge(86400);
		cookie.setPath("/");
		resp.addCookie(cookie);
		
		return "redirect:/hoanghamobile/product?id="+id;
	}

	@RequestMapping("/hoanghamobile/cartproduct/remove/{idProduct}")
	public String remove(@PathVariable("idProduct") Long id) throws JsonProcessingException {
		cart.remove(id);
		Map<Long, Product> itemsMap = cart.getItems().stream()
				.collect(Collectors.toMap(Product::getIdProduct, Function.identity()));
		String cartValue = objectMapper.writeValueAsString(itemsMap);
		cart.clear();
		// Giải mã chuỗi Base64
		byte[] encodedBytes = Base64.encodeBase64(cartValue.getBytes(StandardCharsets.UTF_8));
		String encodedCartValue = new String(encodedBytes, StandardCharsets.UTF_8);

		cookie = new Cookie("myCart", encodedCartValue);
		cookie.setMaxAge(86400);
		cookie.setPath("/");
		resp.addCookie(cookie);
		
		return "redirect:/hoanghamobile/cartproduct";
	}

	@RequestMapping("/hoanghamobile/cartproduct/update/{idProduct}")
	public String update(@PathVariable("idProduct") Long id, @RequestParam("qty") Integer qty)
			throws JsonProcessingException {
		cart.update(id, qty);
		Map<Long, Product> itemsMap = cart.getItems().stream()
				.collect(Collectors.toMap(Product::getIdProduct, Function.identity()));
		String cartValue = objectMapper.writeValueAsString(itemsMap);
		cart.clear();
		// Giải mã chuỗi Base64
		byte[] encodedBytes = Base64.encodeBase64(cartValue.getBytes(StandardCharsets.UTF_8));
		String encodedCartValue = new String(encodedBytes, StandardCharsets.UTF_8);

		cookie = new Cookie("myCart", encodedCartValue);
		cookie.setMaxAge(86400);
		cookie.setPath("/");
		resp.addCookie(cookie);
		
		return "redirect:/hoanghamobile/cartproduct";
	}
	
	private String sanitizeCartValue(String cartValue) {
		if (cartValue != null) {
			// Mã hóa chuỗi JSON thành chuỗi Base64
			String encodedValue = Base64.encodeBase64String(cartValue.getBytes());
			return encodedValue;
		}
		return null;
	}
	
	@RequestMapping("hoanghamobile/carproduct/xacnhandonhang")
	public String xacnhanDH(Model model , @RequestParam("MaDH") String MaHD) {
		order.updateDonHang(MaHD);
		return "redirect:/hoanghamobile/xacnhandonhang";
	}
	
	@RequestMapping("/hoanghamobile/cartproduct/dathang")
	public String dathang(Model model , Cilent cilent)  {
		
		client.save(cilent);
		Pageable pl = PageRequest.of(0, 1);
		List<Cilent> clients = client.findEmail(cilent.getEmail(),pl );
		if (!clients.isEmpty()) {
		    cilent  = clients.get(0);
		    List<Order> listOrder = order.findAll();
		    String idOrderInsert = String.valueOf("HD"+(listOrder.size()+1));
		    order.insertOrder(idOrderInsert, cart.getAmount(), new Date(), false, null, cilent.getIdCilent());
		    String productNames = "";
		    Order od = order.getOrder(idOrderInsert);
		    for (Product product : cart.getItems()) {
		    	productNames += product.getNameProduct() + "\n";
		    	orderDetails.insertOrder_Details(product.getQty(), product.getQty()*product.getPrice(), idOrderInsert, product.getIdProduct());
			}
		    Double tong = cart.getAmount();
		    
		    //Xóa Cookie
		    cookie = new Cookie("myCart", "");
		    cookie.setMaxAge(0);
		    cookie.setPath("/");
			resp.addCookie(cookie);
			cart.clear();
			// Gửi Email Xác Nhận Đơn hàng
			try {
				mailer.send(cilent.getEmail(), "Xác Nhận Đơn Hàng Từ HoangHaMobile", ""
						+ "Vui Lòng Xác Nhận Đơn Hàng :" + idOrderInsert +
						"\n Bạn Hãy Ấn Vào Liên Kết Này Để Xác Nhận Đơn Hàng Vừa Mới Đặt Nhé \n"
						+ "http://localhost:8080/hoanghamobile/carproduct/xacnhandonhang?MaDH="+idOrderInsert +
						"\n Với Các Sản Phẩm Hiện Có : \n  " +productNames+
						"\n Tổng Số Tiền :" +tong + "VND");
			} catch (Exception e) {
				return e.getMessage();
			}
			
		    // Xử lý kết quả top 1 ở đây
		} else {
		    // Không tìm thấy kết quả
		}
		
		return "redirect:/hoanghamobile";
	}
	
	@RequestMapping("/client")
	public String showForm() {
		return "product/infoClient";
	}
	
	

}
