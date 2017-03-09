package hhu.fu.projectmanager.entity.dao;

import hhu.fu.projectmanager.entity.Label;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("labelDAO")
public class LabelDAO extends BaseDAO<Label>{
	@Override
	public List<Label> findAll(){
		open();
		Query<Label> labels = session.createQuery("from Label", Label.class);
		return labels.list();
	}

	@Override
	public Label findById(int lid) {
		open();
		Label label = session.get(Label.class, lid);
		return label;
	}
}
