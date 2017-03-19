package hhu.fu.projectmanager.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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

@Controller
@RequestMapping("/project")
public class ProjectController {
	@Autowired
	ProjectDAO projectDAO;
	@Autowired
	LabelDAO labelDAO;
	@Autowired
	UserDAO userDAO;
	@Autowired
	JointDAO jointDAO;
	
	@RequestMapping("info/{pid}")
	public String index(@PathVariable int pid,Model model){
		Project project = projectDAO.findById(pid);
		List<Label> labels = labelDAO.findAll();
		model.addAttribute("project",project);
		model.addAttribute("labels", labels);
		
		List<Integer> uids = jointDAO.findByProjectApply(pid);
		List<User> users = userDAO.findByIds(uids);
		model.addAttribute("users", users);
		
		List<Integer> juids = jointDAO.findByProjectJoined(pid);
		List<User> jusers = userDAO.findByIds(juids);
		model.addAttribute("jusers", jusers);
		
		
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
		project.setJoinnum(0);
		project.setPoster("defualt.jpg");
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
		String path = realPath+pid;
		file.transferTo(new File(path));
		projectDAO.updatePoster(pid, pid+"");
		return "success";
	}
	
	@RequestMapping("apply/{pid}")
	@ResponseBody
	public String apply(@PathVariable int pid,HttpSession session){
		Object obj = session.getAttribute("me");
		if(obj == null){
			return "请登录";
		}
		User me = (User)obj;
		if(jointDAO.check(me.getUid(), pid)){
			return "已报名";
		}else {
			Project project = projectDAO.findById(pid);
			JoinT joinT = new JoinT();
			joinT.setUid(me.getUid());
			joinT.setPid(pid);
			if(project.getIsjoin()){
				joinT.setPassed(false);
				jointDAO.insert(joinT);
			}else {
				joinT.setPassed(true);
				jointDAO.insert(joinT);
				project.joinOne();
				projectDAO.update(project);
			}
		}
		return "0";
	}
	@RequestMapping("join/{pid}/{uid}")
	@ResponseBody
	public String join(@PathVariable int pid,@PathVariable int uid,HttpSession session){
		Object obj = session.getAttribute("me");
		if(obj == null){
			return "请登录";
		}
		User me = (User)obj;
		Project project = projectDAO.findById(pid);
		if(me.getUid() != project.getManager().getUid()){
			return "请使用管理该项目的账户登录";
		}
		if(project.getJoinnum() == project.getAllnum()){
			return "人员已满";
		}
		jointDAO.agree(uid, pid);
		project.joinOne();
		projectDAO.update(project);
		return "0";
	}
}
