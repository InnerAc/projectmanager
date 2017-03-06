package hhu.fu.projectmanager.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name="label", uniqueConstraints={@UniqueConstraint(columnNames="lname")})
public class Label {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer lid;		
	private String lname;		//标签名称
	private Integer lweight;	//标签权重
	public Integer getLid() {
		return lid;
	}
	public void setLid(Integer lid) {
		this.lid = lid;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public Integer getLweight() {
		return lweight;
	}
	public void setLweight(Integer lweight) {
		this.lweight = lweight;
	}
}
