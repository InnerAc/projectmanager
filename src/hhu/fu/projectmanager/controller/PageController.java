package hhu.fu.projectmanager.controller;

import hhu.fu.projectmanager.entity.Project;
import hhu.fu.projectmanager.entity.User;
import hhu.fu.projectmanager.entity.dao.ProjectDAO;
import hhu.fu.projectmanager.entity.dao.UserDAO;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import jdk.nashorn.internal.ir.annotations.Reference;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/")
public class PageController {
	@Autowired
	UserDAO userDAO;
	@Autowired
	ProjectDAO projectDAO;
	
	@RequestMapping("/")
	public String index(Model model){
		Object me = model.asMap().get("me");
		if(me == null){
			model.addAttribute("me", null);
		}
		return "index";
	}
	
	@RequestMapping("/test")
	@ResponseBody
	public List<Project> test(){
//		List<Integer> uids = new ArrayList<Integer>();
//		uids.add(9);
//		uids.add(12);
//		List<User> users = userDAO.findByIds(uids);
//		System.out.println(users);
		
		List<Project> projects = projectDAO.findForPageByDate(0, 2,false);
		
		return projects;
	}
	@RequestMapping("/upload")
	public String upload(@RequestParam MultipartFile file,HttpSession session,HttpServletRequest  request) throws IllegalStateException, IOException{
		System.out.println(file.getOriginalFilename());
		String realPath=session.getServletContext().getRealPath("/")+"static/poster/";
		System.out.println("real path ="+realPath);
		String path = realPath+file.getOriginalFilename();
		System.out.println("path "+path);
		file.transferTo(new File(path));
		return "redirect:/static/poster/"+file.getOriginalFilename();
	}
}
