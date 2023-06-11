package com.java5.Asm.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.java5.Asm.Entity.Users;
import com.java5.Asm.Repository.UserRepository;
@Controller
public class UserController {
	
	@Autowired
	UserRepository dao;

	@RequestMapping("/hoanghamobile/account")
	public String account(Model model) {
		Users user = new Users();
		model.addAttribute("user",user);
		List<Users> items = dao.findAll();
		model.addAttribute("users", items);
		model.addAttribute("dis", "disabled");
		return "admin/account";
	}
	
	@RequestMapping("/user/update")
	public String updateuser(@ModelAttribute("user") Users user) {
		dao.updateUserById(user.getId(), user.getFirstName(), user.getLastName(), user.getEmail(), user.getPassword(), user.getIsEnabled());
		return "redirect:/user/edit/" + user.getId();
	}
	
	@RequestMapping("/user/delete/{id}")
	public String deleteuser(@PathVariable("id") Long id) {
		dao.deleteById(id);
		return "redirect:/hoanghamobile/account";
	}
	
	@RequestMapping("/user/edit/{id}")
	public String edituser(Model model, @PathVariable("id") Long id) {
		Users user = dao.findById(id).get();
		model.addAttribute("user",user);
		List<Users> items = dao.findAll();
		model.addAttribute("users", items);
		model.addAttribute("dis", "");
		return "admin/account";
	}
	
	@ModelAttribute("isenable")
	public Map<Boolean, String> getGenders() {
		Map<Boolean, String> enable = new HashMap<>();
		enable.put(true, "Enable");
		enable.put(false, "Disable");
		return enable;
	}
	
	@RequestMapping("/hoanghamobile/account/search")
	public String search(Model model, @RequestParam("search") String keyword) {
		List<Users> listsearch = dao.findAllByemailContainingIgnoreCase(keyword);
		model.addAttribute("users",listsearch);
		model.addAttribute("search", keyword);
		model.addAttribute("user", new Users());
		return "admin/account";
	}
	
}
