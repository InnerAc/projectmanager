package hhu.fu.projectmanager.entity.dao;

import java.util.List;

import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import hhu.fu.projectmanager.entity.Label;
import hhu.fu.projectmanager.entity.Project;
import hhu.fu.projectmanager.entity.User;
@Repository("projectDAO")
public class ProjectDAO extends BaseDAO<Project>{

	@Override
	public Project findById(int pid) {
		open();
		Project project = session.get(Project.class, pid);
		return project;
	}

	@Override
	public List<Project> findAll() {
		open();
		Query<Project> projects = session.createQuery("from Project",Project.class);
		return projects.list();
	}
	
	public List<Project> findByName(String name){
		String hsql = "from Project where pname like %?%";
		open();
		Query<Project> projects = session.createQuery(hsql,Project.class).setParameter(0, name);
		return projects.list();
	}

	/**
	 * 向项目添加标签
	 * @param pid
	 * @param label
	 */
	public void addLabel(int pid, Label label) {
		Project project = findById(pid);
		project.addLabel(label);
		begin();
		session.update(project);
		commit();
	}
	
	/**
	 * 更新项目状态
	 * @param pid
	 * @param statu
	 */
	public void updateStatu(int pid,String statu){
		Project project = findById(pid);
		project.setStatu(statu);
		begin();
		session.update(project);
		commit();
	}
	
	/**
	 * 批准时添加教师名单
	 * @param pid
	 * @param user
	 */
	public void addTeacher(int pid,User user){
		Project project = findById(pid);
		project.setTeacher(user);
		begin();
		session.update(project);
		commit();
	}
}
