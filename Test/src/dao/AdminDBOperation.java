package dao;
import java.util.ArrayList;
import java.util.Iterator;


import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.criterion.Restrictions;
import beans.Admin;
public class AdminDBOperation{

	public AdminDBOperation()
	{
		Session ss= getHibernateSession();
        Transaction tt= ss.beginTransaction();
		Admin a=new Admin();
		a.setUid("admin");
		a.setPassword("admin");;
		ss.saveOrUpdate(a);
		tt.commit();
				ss.close();
	}
	
	public Session getHibernateSession()
	{
		Session session=null;
		  SessionFactory sf=new AnnotationConfiguration()
					.configure().buildSessionFactory();
			  session =sf.openSession();
		   return session;
	}

	
public int loginCheck(String u,String p)
{
	int des=0;
	  SessionFactory sf=new AnnotationConfiguration()
				.configure().buildSessionFactory();
		Session ses=sf.openSession();
		Transaction tt=ses.beginTransaction();
		Query ps=ses.createQuery("from Admin where uid=:h and password=:i");
		ps.setString("h", u);
		ps.setString("i", p);
		Iterator it=ps.iterate();
		if(it.hasNext())
			des=1;
		  tt.commit();
          ses.close(); 
return des;
}





}