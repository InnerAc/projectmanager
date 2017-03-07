package hhu.fu.projectmanager.entity.dao;

import java.util.List;

import hhu.fu.projectmanager.entity.Label;
import hhu.fu.projectmanager.entity.User;

import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

@Repository("userDAO")
public class UserDAO extends BaseDAO<User>{

	@Override
	public List<User> findAll() {
		init();
		Query<User> users = session.createQuery("from User", User.class);
		tran.commit();
		return users.list();
	}
	
	public User findByName(String uname){
		String hql="from User where userid=?";
		init();
		User user = session.createQuery(hql,User.class).setParameter(0,uname).uniqueResult();
		return user;
	}
	
	public void addLabel(User user,Label label){
		init();
		user.addLabel(label);
		session.update(user);
		tran.commit();
	}
	
	public void addLabel(int uid,Label label){
		User user = findById(uid);
		user.addLabel(label);
//		init();
		session.update(user);
		tran.commit();
	}

	@Override
	public User findById(int uid) {
		init();
		User user = session.get(User.class, uid);
		tran.commit();
		return user;
	}
}
