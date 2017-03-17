package hhu.fu.projectmanager.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import hhu.fu.projectmanager.entity.Label;
import hhu.fu.projectmanager.entity.Project;
import hhu.fu.projectmanager.entity.User;
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

@Controller
@RequestMapping("/project")
public class ProjectController {
	@Autowired
	ProjectDAO projectDAO;
	@Autowired
	LabelDAO labelDAO;
	@Autowired
	UserDAO userDAO;
	
	@RequestMapping("info/{pid}")
	public String index(@PathVariable int pid,Model model){
		Project project = projectDAO.findById(pid);
		List<Label> labels = labelDAO.findAll();
		model.addAttribute("project",project);
		model.addAttribute("labels", labels);
		return "project/info";
	}
	@RequestMapping(value="{uid}/add",method = RequestMethod.GET)
	public String add(){
		return "project/add";
	}
	@RequestMapping(value="{uid}/add",method = RequestMethod.POST)
	public String add(@PathVariable int uid,Project project){
		if(project.getIsjoin() == null){
			project.setIsjoin(false);
		}
		User user = userDAO.findById(uid);
		project.setManager(user);
		project.setStatu("准备中...");
		projectDAO.insert(project);
		return "redirect:/project/info/"+project.getPid();
	}
	
	@RequestMapping("adl/{pid}/{lid}")
	@ResponseBody
	public String addLabel(@PathVariable int pid,@PathVariable int lid){
		Label label = labelDAO.findById(lid);
		projectDAO.addLabel(pid, label);
		return "success";
	}
	
	@RequestMapping("all")
	public String all(Model model){
		List<Project> projects = projectDAO.findAll();
		System.out.println(projects.size());
		model.addAttribute("projects", projects);
		return "project/all";
	}
	
	@RequestMapping("{pid}/poster")
	@ResponseBody
	public String poster(@PathVariable int pid,@RequestParam MultipartFile file,HttpSession session,HttpServletRequest  request) throws IllegalStateException, IOException{
		String fileName = file.getOriginalFilename();
		String realPath=session.getServletContext().getRealPath("/")+"static/poster/";
		String path = realPath+fileName;
		file.transferTo(new File(path));
		projectDAO.updatePoster(pid, fileName);
		return "success";
	}
}
