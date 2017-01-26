package services;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Iterator;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import beans.CommentBean;
import beans.Product;
import dao.AdminDBOperation;

public class AdminService {

	public int getNextArticleID()
	{   int aid=1;
		Session session=new AdminDBOperation().getHibernateSession();
          Query q=session.createQuery("select max(aid) from Product");
           Iterator it=q.iterate();
           if(it.hasNext())
		  aid=(int)it.next();
           session.close();
           System.out.println(">>>>>>>."+aid);
           return ++aid;
	}
	
	public int insertArticle(Product p)
	{   int x=0;
		Session session=new AdminDBOperation().getHibernateSession();
        Transaction tt=session.beginTransaction();
		  if(session.save(p)!=null)
			  x=1;
        tt.commit();
        session.close();
		return x;
	}
	
	public ArrayList<Product> getAllArticles()
	{
		Session session=new AdminDBOperation().getHibernateSession();
		Transaction tt=session.beginTransaction();
		Criteria ct=session.createCriteria(Product.class);
		ArrayList<Product> ar=(ArrayList<Product>)ct.list();	
			return ar;
	}
		
	public boolean download(String dn) throws Exception
	{
		boolean b=false;
		FileInputStream fi=new FileInputStream(dn);
		File f=new File(dn);
		String fn=f.getName();
		int x=(int)f.length();
		byte bb[]=new byte[x];
		fi.read(bb);
		fi.close();
		File ff=new File("c:\\download");
		if(!ff.exists())
		ff.mkdirs();
		FileOutputStream fo=new FileOutputStream("c:\\download\\"+fn);
		fo.write(bb);
		fo.close();
		File fff=new File("c:\\download\\"+fn);
		b=fff.exists();
		return b;
	}

	public int insertComment(CommentBean cb) {
		int x=0;
		Session session=new AdminDBOperation().getHibernateSession();
        Transaction tt=session.beginTransaction();
		  if(session.save(cb)!=null)
			  x=1;
        tt.commit();
        session.close();
		return x;
	}

	public ArrayList<CommentBean> viewComments(int aid) {
		Session session=new AdminDBOperation().getHibernateSession();
		Transaction tt=session.beginTransaction();
		Criteria ct=session.createCriteria(CommentBean.class);
		ct.add(Restrictions.eq("aid", aid));
		ArrayList<CommentBean> ar=(ArrayList<CommentBean>)ct.list();	
			return ar;
	}

	public int deleteArticle(int aid) {
    int x=0;
		Session session=new AdminDBOperation().getHibernateSession();
		Transaction tt=session.beginTransaction();
         Query q=session.createQuery("delete from Product where aid=:a");
         q.setInteger("a", aid);
		  x=q.executeUpdate();
		tt.commit();
		session.close();
		return x;
		}

	public int updateArticle(int aid, String aname, String descr) {
		int x=0;
		Session session=new AdminDBOperation().getHibernateSession();
		Transaction tt=session.beginTransaction();
         Query q=session.createQuery("update Product set aname=:a ,description=:b where aid=:c");
         q.setInteger("c", aid);
         q.setString("a",aname);
         q.setString("b",descr);
          x=q.executeUpdate();
		tt.commit();
		session.close();
		return x;
	}

}
