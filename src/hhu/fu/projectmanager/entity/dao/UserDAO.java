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
		open();
		Query<User> users = session.createQuery("from User", User.class);
		return users.list();
	}
	
	public List<User> findByIds(List<Integer> uids){
		if(uids == null || uids.size() == 0){
			return null;
		}
		open();
		String hql = "from User where uid=";
		boolean one = true;
		for(Integer uid : uids){
			if(one){
				hql += uid;
				one = false;
			}else{
				hql += " or uid="+uid;
			}
		}
		System.out.println(hql);
		Query<User> users = session.createQuery(hql, User.class);
		return users.list();
	}
	
	public User findByName(String uname){
		String hql="from User where userid=?";
		open();
		User user = session.createQuery(hql,User.class).setParameter(0,uname).uniqueResult();
		return user;
	}
	
	
	/**
	 * 给用户打标签
	 * @param uid
	 * @param label
	 */
	public void addLabel(int uid,Label label){
		User user = findById(uid);
		user.addLabel(label);
		begin();
		session.update(user);
		commit();
	}

	@Override
	public User findById(int uid) {
		open();
		User user = session.get(User.class, uid);
		return user;
	}
	
	/**
	 * 修改用户级别
	 * @param uid
	 * @param lvl
	 */
	public void updateLvl(int uid,int lvl){
		User user = findById(uid);
		begin();
		user.setLvl(lvl);
		session.update(user);
		commit();
	}
	
	/**
	 * 更改头像信息
	 * @param uid
	 * @param avatar
	 */
	public void updataAvatar(int uid,String avatar){
		User user = findById(uid);
		begin();
		user.setAvatar(avatar);
		session.update(user);
		commit();
	}
	
	public List<User> findByLvl(int lvl){
		String hql="from User where lvl=?";
		open();
		List<User> users = session.createQuery(hql,User.class).setParameter(0,lvl).list();
		return users;
	}
	
	public void deleteById(int uid){
		User user = findById(uid);
	}
}
