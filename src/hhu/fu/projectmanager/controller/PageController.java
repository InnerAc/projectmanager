package hhu.fu.projectmanager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class PageController {
	@RequestMapping("/")
	public String index(Model model){
		Object me = model.asMap().get("me");
		if(me == null){
			model.addAttribute("me", null);
		}
		return "index";
	}
}
