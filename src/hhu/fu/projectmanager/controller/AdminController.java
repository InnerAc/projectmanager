package hhu.fu.projectmanager.controller;

import java.util.List;

import hhu.fu.projectmanager.entity.User;
import hhu.fu.projectmanager.entity.dao.UserDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	UserDAO userDAO;
	@RequestMapping("manager")
	public String manager(Model model){
		List<User> users = userDAO.findByLvl(1);
		model.addAttribute("users", users);
		return "admin/manager";
	}
	@RequestMapping(value="/add",method = RequestMethod.POST)
	public String add(User user){
		User i_user = userDAO.findByName(user.getUserid());
		if(i_user == null){
			user.setAvatar("avatar.jpg");
			user.setLvl(1);
			userDAO.insert(user);
		}
		return "redirect:/admin/manager";
	}

}
