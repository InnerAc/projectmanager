package hhu.fu.projectmanager.entity.dao;

import java.util.List;

import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import hhu.fu.projectmanager.entity.JoinT;

@Repository("jointDAO")
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
	
	public List<Integer> findByProjectApply(int pid){
		open();
		begin();
		String hql = "select uid from JoinT where pid = ? and passed = 0";
		Query<Integer> uids = session.createQuery(hql,Integer.class).setParameter(0, pid);
		commit();
		return uids.list();
	}
	public List<Integer> findByProjectJoined(int pid){
		open();
		begin();
		String hql = "select uid from JoinT where pid = ? and passed = 1";
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
	
	public boolean check(int uid,int pid){
		open();
		String hql = "from JoinT where uid = ? and pid=?";
		Query<JoinT> ress = session.createQuery(hql,JoinT.class).setParameter(0, uid).setParameter(1, pid);
		if(ress.list().size() == 0){
			return false;
		}else {
			return true;
		}
		
	}
	
	public void agree(int uid,int pid){
		open();
		String hql = "from JoinT where uid = ? and pid=?";
		JoinT jt = session.createQuery(hql,JoinT.class).setParameter(0, uid).setParameter(1, pid).uniqueResult();
		jt.setPassed(true);
		update(jt);
	}

}
