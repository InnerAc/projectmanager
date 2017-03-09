package hhu.fu.projectmanager.entity.dao;

import java.util.List;

import org.hibernate.query.Query;

import hhu.fu.projectmanager.entity.JoinT;

public class JointDAO extends BaseDAO<JoinT>{

	@Override
	public JoinT findById(int id) {
		open();
		JoinT jt = session.get(JoinT.class, id);
		return jt;
	}

	@Override
	public List<JoinT> findAll() {
		open();
		Query<JoinT> jts = session.createQuery("from JoinT",JoinT.class);
		return jts.list();
	}
	
	public List<Integer> findByProject(int pid){
		open();
		begin();
		String hql = "select uid from JoinT where pid = ?";
		Query<Integer> uids = session.createQuery(hql,Integer.class).setParameter(0, pid);
		commit();
		return uids.list();
	}
	
	public List<Integer> findByUser(int uid){
		open();
		begin();
		String hql = "select pid from JoinT where uid = ?";
		Query<Integer> pids = session.createQuery(hql,Integer.class).setParameter(0, uid);
		commit();
		return pids.list();
	}

}
