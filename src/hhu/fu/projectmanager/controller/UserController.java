package hhu.fu.projectmanager.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import hhu.fu.projectmanager.entity.JoinT;
import hhu.fu.projectmanager.entity.Label;
import hhu.fu.projectmanager.entity.Project;
import hhu.fu.projectmanager.entity.User;
import hhu.fu.projectmanager.entity.dao.JointDAO;
import hhu.fu.projectmanager.entity.dao.LabelDAO;
import hhu.fu.projectmanager.entity.dao.ProjectDAO;
import hhu.fu.projectmanager.entity.dao.UserDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sun.swing.internal.plaf.metal.resources.metal;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	LabelDAO labelDAO;
	@Autowired
	UserDAO userDAO;
	@Autowired
	ProjectDAO projectDAO;
	@Autowired
	JointDAO jointDAO;
	
	
	@RequestMapping("info/{uname}")
	public String index(@PathVariable String uname,Model model){
		User user = userDAO.findByName(uname);
		List<Label> labels = labelDAO.findAll();
		model.addAttribute("user", user);
		model.addAttribute("labels", labels);
		
		List<Project> mpros = projectDAO.findByUser(user);
		List<Integer> pids = jointDAO.findByUser(user.getUid());
		List<Project> jpros = projectDAO.findByIds(pids);
		model.addAttribute("mpros", mpros);
		model.addAttribute("jpros", jpros);
		int mnum = 0;
		int jnum = 0;
		if(mpros != null){
			mnum = mpros.size();
		}
		if(jpros != null){
			jnum = jpros.size();
		}
		model.addAttribute("mnum", mnum);
		model.addAttribute("jnum", jnum);
		
		return "user/info";
	}

	@RequestMapping("/me")
	public String me(Model model,HttpSession session){
		System.out.println("welcome to me");
		Object me = session.getAttribute("me");
		if(me == null){
			model.addAttribute("info","请先登录");
			model.addAttribute("url", "");
			return "error/errto";
		}
		User user = (User) me;
		List<Label> labels = labelDAO.findAll();
		model.addAttribute("labels", labels);
		//Get manager
		List<Project> mpros = projectDAO.findByUser(user);
		List<Integer> pids = jointDAO.findByUser(user.getUid());
		List<Project> jpros = projectDAO.findByIds(pids);
		model.addAttribute("mpros", mpros);
		model.addAttribute("jpros", jpros);
		int mnum = 0;
		int jnum = 0;
		if(mpros != null){
			mnum = mpros.size();
		}
		if(jpros != null){
			jnum = jpros.size();
		}
		model.addAttribute("mnum", mnum);
		model.addAttribute("jnum", jnum);
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
			user.setAvatar("avatar.jpg");
			user.setLvl(0);
			userDAO.insert(user);
			model.addAttribute("info", "注册成功");
			model.addAttribute("url", "");
		}else{
			model.addAttribute("info","用户名重复!!");
			model.addAttribute("url", "user/add");
		}
		return "error/success";
	}
	
	@RequestMapping(value="/edit",method = RequestMethod.GET)
	public String edit(Model model,HttpSession session){
		Object me = session.getAttribute("me");
		if(me == null){
			model.addAttribute("me", null);
			model.addAttribute("info", "请先登录");
			model.addAttribute("url", "");
			return "error/errto";
		}
		return "user/edit";
	}
	@RequestMapping(value="/edit",method = RequestMethod.POST)
	public String edit(User user,Model model,HttpSession session){
		User me = (User) session.getAttribute("me");
		me.setStunum(user.getStunum());
		me.setUsername(user.getUsername());
		me.setPhone(user.getPhone());
		me.setEmail(user.getEmail());
		userDAO.update(me);
		return "redirect:/user/me";
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
	
	@RequestMapping(value="avatar",method = RequestMethod.POST)
	@ResponseBody
	public String avatar(@RequestParam MultipartFile file,HttpSession session) throws IllegalStateException, IOException{
		Object me = session.getAttribute("me");
		if(me == null){
			return "请登录";
		}
		User user = (User) me;
		String fileName = file.getOriginalFilename();
		String realPath=session.getServletContext().getRealPath("/")+"static/avatar/";
		String path = realPath+user.getUserid()+fileName;
		File img = new File(path);
		img.deleteOnExit();
		file.transferTo(img);
		user.setAvatar(user.getUserid()+fileName);
		userDAO.update(user);
		return "success";
	}
	
	
	@RequestMapping("adl/{uid}/{lid}")
	@ResponseBody
	public String addLabel(@PathVariable int uid,@PathVariable int lid,HttpSession session){
		Label label = labelDAO.findById(lid);
		userDAO.addLabel(uid, label);
		User me = userDAO.findById(uid);
		session.setAttribute("me", me);
		return "success";
	}
	
	@RequestMapping("drop/{uid}")
	@ResponseBody
	public String drop(@PathVariable int uid){
		userDAO.delete(uid);
		return "success";
	}
	
	@RequestMapping("repwd/{uid}")
	@ResponseBody
	public String repwd(@PathVariable int uid){
		User user = userDAO.findById(uid);
		user.setPassword("000000");
		userDAO.update(user);
		return "success";
	}
}
