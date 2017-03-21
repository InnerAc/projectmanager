package hhu.fu.projectmanager.component;

import hhu.fu.projectmanager.entity.dao.ProjectDAO;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class TaskComponent {

	@Autowired
	ProjectDAO projectDAO;
	
	@Scheduled(fixedRate = 10000)
	public void print(){
		long newTime = new Date().getTime()/1000;
		System.out.println(newTime);
		projectDAO.changeType(newTime);
	}
}
