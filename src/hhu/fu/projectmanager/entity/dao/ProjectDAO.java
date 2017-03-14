package hhu.fu.projectmanager.entity.dao;

import java.util.List;

import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import com.sun.xml.internal.fastinfoset.util.StringArray;

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
	
	/**
	 * 按照日期分页
	 * @param offset
	 * @param length
	 * @return
	 */
	public List<Project> findForPageByDate(int offset,int length,boolean isjoin){
		open();
		String hql = "";
		if(isjoin){//需要审批
			hql = "from Project where statu='准备中...' order by stdate";
		}else {
			hql = "from Project where statu='准备中...' and isjoin=false order by stdate";
		}
		Query<Project> projects = session.createQuery(hql,Project.class).setFirstResult(offset).setMaxResults(length);
		return projects.list();
	}
	
	/**
	 * 按照日期分页
	 * @param offset
	 * @param length
	 * @return
	 */
	public List<Project> findForPageByNum(int offset,int length,boolean isjoin){
		open();
		String hql = "";
		if(isjoin){//需要审批
			hql = "from Project where statu='准备中...' and joinnum < allnum order by allnum/joinnum";
		}else {
			hql = "from Project where statu='准备中...' and joinnum < allnum and isjoin=false order by allnum/joinnum";
		}
		Query<Project> projects = session.createQuery(hql,Project.class).setFirstResult(offset).setMaxResults(length);
		return projects.list();
	}
	
	public List<Project> findByName(String name){
		String hql = "from Project where pname like %?%";
		open();
		Query<Project> projects = session.createQuery(hql,Project.class).setParameter(0, name);
		return projects.list();
	}
	
	public List<Project> findByNameUser(String name,User user){
		String hql = "from Project where pname like %?% and manager=?";
		open();
		Query<Project> projects = session.createQuery(hql,Project.class).setParameter(0, name).setParameter(1, user);
		return projects.list();
	}
	
	public List<Project> findByUser(User user){
		String hql = "from Project where manager=?";
		open();
		Query<Project> projects = session.createQuery(hql,Project.class).setParameter(0, user);
		return projects.list();
	}

	public List<Project> findByIds(List<Integer> pids){
		if(pids == null || pids.size() ==0){
			return null;
		}
		open();
		String hql = "from Project where pid=";
		boolean one = true;
		for(Integer pid : pids){
			if(one){
				hql += pid;
				one = false;
			}else{
				hql += " or pid="+pid;
			}
		}
		Query<Project> projects = session.createQuery(hql, Project.class);
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
	
	/**
	 * 向项目添加海报
	 * @param pid
	 * @param poster
	 */
	public void updatePoster(int pid,String poster){
		Project project = findById(pid);
		project.setPoster(poster);
		begin();
		session.update(project);
		commit();
	}
}
