package beans;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
@Entity
@Table(name="adminlogin")
public class Admin {
@Id
String uid;
String password;

public String getUid() {
	return uid;
}
public void setUid(String uid) {
	this.uid = uid;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}





}
