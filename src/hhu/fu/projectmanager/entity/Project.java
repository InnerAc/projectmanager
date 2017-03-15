package hhu.fu.projectmanager.entity;

import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="project")
public class Project {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer pid;
	
	private String pname;	//项目名
	private String pdesc;	//项目简介
	private String poster;	//项目海报
	private Long stdate;	//起始日期
	private Long endate;	//结束日期
	private String local;	//活动地点
	private Boolean isjoin;	//是否需要审批
	private Integer joinnum;	//参加的人数
	private Integer allnum;		//总的人数
	private String statu;		//项目状态
	@ManyToOne
	private User manager;		//管理者
	@ManyToOne
	private User teacher;		//审批人
	@ManyToMany
	private List<Label> labels;	//项目标签
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPdesc() {
		return pdesc;
	}
	public void setPdesc(String pdesc) {
		this.pdesc = pdesc;
	}
	public Long getStdate() {
		return stdate;
	}
	public void setStdate(Long stdate) {
		this.stdate = stdate;
	}
	public Long getEndate() {
		return endate;
	}
	public void setEndate(Long endate) {
		this.endate = endate;
	}
	public String getLocal() {
		return local;
	}
	public void setLocal(String local) {
		this.local = local;
	}
	public Boolean getIsjoin() {
		return isjoin;
	}
	public void setIsjoin(Boolean isjoin) {
		this.isjoin = isjoin;
	}
	public Integer getJoinnum() {
		return joinnum;
	}
	public void setJoinnum(Integer joinnum) {
		this.joinnum = joinnum;
	}
	public Integer getAllnum() {
		return allnum;
	}
	public void setAllnum(Integer allnum) {
		this.allnum = allnum;
	}
	public String getStatu() {
		return statu;
	}
	public void setStatu(String statu) {
		this.statu = statu;
	}
	public User getManager() {
		return manager;
	}
	public void setManager(User manager) {
		this.manager = manager;
	}
	public User getTeacher() {
		return teacher;
	}
	public void setTeacher(User teacher) {
		this.teacher = teacher;
	}
	public List<Label> getLabels() {
		return labels;
	}
	public void setLabels(List<Label> labels) {
		this.labels = labels;
	}
	public void addLabel(Label label){
		labels.add(label);
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	
}
