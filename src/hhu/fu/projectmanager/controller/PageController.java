package hhu.fu.projectmanager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class PageController {
	@RequestMapping("/")
	public String index(){
		return "index";
	}
}
