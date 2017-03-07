package hhu.fu.projectmanager.entity;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("labelDAO")
public class LabelDAO {
	@Autowired
	private SessionFactory sessionFactory;
	Session session = null;
	Transaction tran =  null;
	
	public void init(){
		session = sessionFactory.openSession();
		tran = session.beginTransaction();
	}
	
	public void insert(Label label){
		init();
		session.save(label);
		tran.commit();
	}
	
	public Label findById(int lid){
		init();
		Label label = session.get(Label.class, lid);
		tran.commit();
		return label;
	}
	
	public List<Label> findAll(){
		init();
		Query<Label> labels = session.createQuery("from Label", Label.class);
		tran.commit();
		return labels.list();
	}
}
