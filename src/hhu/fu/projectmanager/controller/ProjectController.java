package hhu.fu.projectmanager.controller;

import java.util.List;

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
		projectDAO.insert(project);
		return "redirect:/project/info/"+project.getPid();
	}
	
	@RequestMapping("adl/{pid}/{lid}")
	public void addLabel(@PathVariable int pid,@PathVariable int lid){
		Label label = labelDAO.findById(lid);
		projectDAO.addLabel(pid, label);
	}
	
	@RequestMapping("all")
	public String all(Model model){
		List<Project> projects = projectDAO.findAll();
		System.out.println(projects.size());
		model.addAttribute("projects", projects);
		return "project/all";
	}
}
