package com.java5.Asm.Controller;

import java.io.File;
import java.time.LocalDate;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.java5.Asm.Entity.Product;
import com.java5.Asm.Repository.ProductRepository;
import com.java5.Asm.Service.ParamService;
import com.java5.Asm.Service.ShoppingCartService;



@Controller
@Validated
public class ProductController {
	
	@Autowired
	ParamService ps;
	
	@Autowired
    private ShoppingCartService cart;
	
	@Autowired
	ProductRepository dao;

	@RequestMapping("/hoanghamobile")
	public String showProduct(Model model) {
		List<Product> itemApple = dao.fillProductApple();
		model.addAttribute("itemApple", itemApple);
		List<Product> itemSamsung = dao.fillProductSamSung1();
		Collections.shuffle(itemSamsung);
		model.addAttribute("itemSamsung", itemSamsung);

		List<Product> itemComputer = dao.fillComputer();
		model.addAttribute("itemComputer", itemComputer);

		List<Product> itemRandom = dao.findRandom5Products();
		Collections.shuffle(itemRandom);
		model.addAttribute("itemRandom", itemRandom);
		model.addAttribute("cart", cart);
       
		return "product/index";
	}

	@RequestMapping("/hoanghamobile/products")
	public String ShowListProduct1(Model model) {
		List<Product> itemlistproduct = dao.findAll();
		model.addAttribute("itemlistproduct", itemlistproduct);
		return "admin/products";
	}

	@GetMapping("/hoanghamobile/findproduct")
	public String FindProduct(Model model, @RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam("p") Optional<Integer> p) {

		Pageable pageble = PageRequest.of(p.orElse(0), 10);
		List<Product> items = dao.findProduct("%" + keyword + "%");
		Page<Product> items2 = dao.findAllByNameProduct("%" + keyword + "%", pageble);

		model.addAttribute("page", items2);
		model.addAttribute("itemfind", items);
		model.addAttribute("keyword", keyword);

		return "product/findproduct";
	}
	@RequestMapping("/hoanghamobile/findproduct1")
	public String findProduct1(Model model, @RequestParam("keyword") String keyword,
            @RequestParam(value = "p", required = false) Optional<Integer> p) {

		List<Product> items = dao.findAllBynameProductContainingIgnoreCase(keyword);
		System.out.println(items.toString());
		model.addAttribute("itemlistproduct", items);
		model.addAttribute("keyword", keyword);

		return "admin/products";
	}


	

	@GetMapping("/hoanghamobile/edit-product")
	public String EditProdcut(Model model, @RequestParam("id") Long id) {
		Product items = dao.findByIdProduct(id);

		model.addAttribute("items", items);

		return "admin/edit-product";
	}

	@RequestMapping("/hoanghamobile/updateproduct")
	public String updateProduct(@ModelAttribute("items") Product items , @RequestParam("fileInput") MultipartFile mtp) {
		File saveFile = ps.save(mtp, "IMG");
		items.setImage(saveFile.getName());
		dao.updatenameProduct(items.getNameProduct(), items.getIdProduct(), items.getPrice(), items.getNote(),
				items.getSale(), items.getImage(),items.getType());
		return "admin/edit-product";
	}
	@RequestMapping("/hoanghamobile/deleteproduct/")
	public String deleteProduct(@RequestParam("id") Long id) {
	    dao.deleteProduct(id);
	    return "redirect:/hoanghamobile/products";
	}
	
	@RequestMapping("/hoanghamobile/product")
	public String viewProduct(Model model , @RequestParam("id") Long id) {
		Product items = dao.findByIdProduct(id);
		model.addAttribute("item",items);
		List<Product> itemRandom = dao.findRandom5Products();
		Collections.shuffle(itemRandom);
		model.addAttribute("itemRandom", itemRandom);
		model.addAttribute("cart", cart);
		return "product/productDetail";
	}
	
	@RequestMapping("/hoanghamobile/add-product")
	public String addProduct(@Validated @ModelAttribute("item") Product items, BindingResult result, Model model) {
	    if (result.hasErrors()) {
	        // Xử lý khi có lỗi validation
	        model.addAttribute("validationErrors", result.getAllErrors());
	        return "admin/add-product"; // Thay thế bằng tên trang hiển thị lỗi của bạn
	    }
	    Date currentDate = new Date();
	    items.setDate(currentDate);
	    dao.save(items);
	    return "redirect:/hoanghamobile/products";
	}

}
