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
	
	public void begin(){
		tran = session.beginTransaction();
	}
	
	public void open(){
		session = sessionFactory.openSession();
	}
	public void commit(){
		tran.commit();
	}
	
	public void insert(T t){
		begin();
		session.save(t);
		commit();
	}
	
	public abstract T findById(int id);
	
	public void update(T t){
		open();
		begin();
		session.merge(t);
		commit();
	}
	
	public abstract List<T> findAll();
}
