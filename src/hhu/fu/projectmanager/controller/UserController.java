package hhu.fu.projectmanager.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.sun.swing.internal.plaf.metal.resources.metal;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	LabelDAO labelDAO;
	@Autowired
	UserDAO userDAO;
	
	@RequestMapping("info/{uname}")
	public String index(@PathVariable String uname,Model model){
		User user = userDAO.findByName(uname);
		List<Label> labels = labelDAO.findAll();
		model.addAttribute("user", user);
		model.addAttribute("labels", labels);
		return "user/info";
	}

	@RequestMapping("me")
	public String me(Model model){
		Object me = model.asMap().get("me");
		if(me == null){
			model.addAttribute("info","请先登录");
			model.addAttribute("url", "");
			return "error/errot";
		}
		return "user/me";
	}
	
	@RequestMapping("/all")
	public String all(Model model){
		List<User> users = userDAO.findAll();
		model.addAttribute("users", users);
		return "user/all";
	}
	@RequestMapping(value="/add",method = RequestMethod.GET)
	public String add(){
		return "user/add";
	}
	@RequestMapping(value="/add",method = RequestMethod.POST)
	public String add(User user,Model model){
		User i_user = userDAO.findByName(user.getUserid());
		if(i_user == null){
			userDAO.insert(user);
			model.addAttribute("info", "注册成功");
			model.addAttribute("url", "");
		}else{
			model.addAttribute("info","用户名重复!!");
			model.addAttribute("url", "user/add");
		}
		return "error/errto";
	}
	@RequestMapping(value="login",method = RequestMethod.POST)
	public String login(String userid,String password,Model model,HttpSession session){
		User user = userDAO.findByName(userid);
		if(user == null){
			model.addAttribute("info", "用户名不存在，请重新输入");
			model.addAttribute("url", "");
		}else if(user.getPassword().equals(password)){
			session.setAttribute("me", user);
			return "redirect:/";
		}else {
			model.addAttribute("info", "密码错误");
			model.addAttribute("url", "");
		}
		model.addAttribute("me", null);
		return "error/errto";
	}
	@RequestMapping("logout")
	public String logout(HttpSession session){
		session.setAttribute("me", null);
		return "redirect:/";
	}
	
	@RequestMapping(value="update",method = RequestMethod.POST)
	public String update(User user,Model model){
		userDAO.update(user);
		return "user/me";
	}
	
	
	@RequestMapping("adl/{uid}/{lid}")
	@ResponseBody
	public String addLabel(@PathVariable int uid,@PathVariable int lid){
		Label label = labelDAO.findById(lid);
		userDAO.addLabel(uid, label);
		return "success";
	}
	
}
