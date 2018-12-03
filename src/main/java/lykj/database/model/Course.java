package lykj.database.model;

import java.math.BigDecimal;
import java.util.Date;




public class Course {
	
	private int id;
	private int sid;
	private int tid;

	private Date start;
	private Date end;
	private BigDecimal basesalary;
	private BigDecimal reward;
	private BigDecimal salary;
	private Student student;
	private Teacher teacher;
	private int finish;
	private int endsalary;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}

	public Date getStart() {
		return start;
	}
	public void setStart(Date start) {
		this.start = start;
	}
	public Date getEnd() {
		return end;
	}
	public void setEnd(Date end) {
		this.end = end;
	}
	public BigDecimal getBasesalary() {
		return basesalary;
	}
	public void setBasesalary(BigDecimal basesalary) {
		this.basesalary = basesalary;
	}
	public BigDecimal getReward() {
		return reward;
	}
	public void setReward(BigDecimal reward) {
		this.reward = reward;
	}
	public BigDecimal getSalary() {
		return salary;
	}
	public void setSalary(BigDecimal salary) {
		this.salary = salary;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	public int getFinish() {
		return finish;
	}
	public void setFinish(int finish) {
		this.finish = finish;
	}
	public int getEndsalary() {
		return endsalary;
	}
	public void setEndsalary(int endsalary) {
		this.endsalary = endsalary;
	}
	
	

}
