package hhu.fu.projectmanager.controller;

import java.util.List;

import hhu.fu.projectmanager.entity.Label;
import hhu.fu.projectmanager.entity.User;
import hhu.fu.projectmanager.entity.dao.LabelDAO;
import hhu.fu.projectmanager.entity.dao.UserDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	LabelDAO labelDAO;
	@Autowired
	UserDAO userDAO;
	
	@RequestMapping("{uname}")
	public String index(@PathVariable String uname,Model model){
		User user = userDAO.findByName(uname);
		List<Label> labels = labelDAO.findAll();
		model.addAttribute("user", user);
		model.addAttribute("labels", labels);
		return "user/info";
	}
	@RequestMapping(value="/add",method = RequestMethod.GET)
	public String add(){
		return "user/add";
	}
	@RequestMapping(value="/add",method = RequestMethod.POST)
	public String add(User user){
		userDAO.insert(user);
		return "user/add";
	}
	@RequestMapping("/all")
	public String all(Model model){
		List<User> users = userDAO.findAll();
		model.addAttribute("users", users);
		return "user/all";
	}
	@RequestMapping("adl/{uid}/{lid}")
	public void addLabel(@PathVariable int uid,@PathVariable int lid){
		Label label = labelDAO.findById(lid);
		userDAO.addLabel(uid, label);
	}
	
}
