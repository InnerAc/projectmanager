package hhu.fu.projectmanager.controller;

import java.util.List;

import hhu.fu.projectmanager.entity.Label;
import hhu.fu.projectmanager.entity.LabelDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/label")
public class LabelController {
	@Autowired
	LabelDAO labelDAO;
	
	@RequestMapping(value="{lid}")
	public String index(@PathVariable int lid,Model model){
		Label label = labelDAO.findById(lid);
		model.addAttribute("label", label);
		return "label/info";
	}
	
	@RequestMapping(value="/add",method = RequestMethod.GET)
	public String add(){
		return "label/add";
	}
	@RequestMapping(value="/add",method = RequestMethod.POST)
	public String add(Label label){
		labelDAO.insert(label);
		return "label/add";
	}
	@RequestMapping("/all")
	public String labels(Model model){
		List<Label> labels = labelDAO.findAll();
		model.addAttribute("labels", labels);
		return "label/all";
	}
}
