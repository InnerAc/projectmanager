package hhu.fu.projectmanager.entity.dao;

import java.util.List;

import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import hhu.fu.projectmanager.entity.Project;
@Repository("projectDAO")
public class ProjectDAO extends BaseDAO<Project>{

	@Override
	public Project findById(int pid) {
		init();
		Project project = session.get(Project.class, pid);
		tran.commit();
		return project;
	}

	@Override
	public List<Project> findAll() {
		init();
		Query<Project> projects = session.createQuery("from Project",Project.class);
		tran.commit();
		return projects.list();
	}
	
	public List<Project> findByName(String name){
		String hsql = "from Project where pname=?";
		init();
		Query<Project> projects = session.createQuery(hsql,Project.class).setParameter(0, name);
		return projects.list();
	}
	
}
