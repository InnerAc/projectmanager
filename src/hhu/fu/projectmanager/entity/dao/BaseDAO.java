package hhu.fu.projectmanager.entity.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;

public abstract class BaseDAO<T> {
	@Autowired
	SessionFactory sessionFactory;
	Session session = null;
	Transaction tran =  null;
	
	Class<T> tcalss;
	
	public void init(){
		session = sessionFactory.openSession();
		tran = session.beginTransaction();
	}
	
	public void insert(T t){
		init();
		session.save(t);
		tran.commit();
	}
	
	public abstract T findById(int id);
	
	public void update(T t){
		init();
		session.update(t);
		tran.commit();
	}
	
	public abstract List<T> findAll();
}
