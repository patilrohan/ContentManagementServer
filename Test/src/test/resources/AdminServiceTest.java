package test.resources;

import static org.junit.Assert.*;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;
import static org.testng.Assert.assertEquals;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.junit.Before;
import org.junit.Test;

import beans.CommentBean;
import beans.Product;
import dao.AdminDBOperation;
import services.AdminService;

public class AdminServiceTest {

//	@Test public void getNextArticleIDTest() {
//		AdminService as=new AdminService();
//		int result=as.getNextArticleID();
//		assertEquals(251, result);
//	}
//	
//	@Test public void insertArticleTest()
//	{  int x=0;   
//	Product p=new Product();
//	p.setAid(251);
//	p.setName("Java Article");
//	p.setDescription("A new java programming article");
//		Session session=new AdminDBOperation().getHibernateSession();
//        Transaction tt=session.beginTransaction();
//		  if(session.save(p)!=null)
//			  x=1;
//        tt.commit();
//        session.close();
//		assertEquals(1, x);
//		
//	}

	AdminService adminservice;
	@Before
	public void setUp()
	{
		adminservice=mock(AdminService.class);
		
	}
	@Test
	public void getNextArticleIDTest() {
		when(adminservice.getNextArticleID()).thenReturn(253);
		System.out.println("Next ArticleID Mockito Test:" + adminservice.getNextArticleID());
		assertEquals(adminservice.getNextArticleID(), 253);
	}
	
	@Test
	public void insertArticleTest() 
	{  Product p=new Product();
	p.setAid(200);
	p.setName("Java Article");
	p.setDescription("A new java programming article");
		when(adminservice.insertArticle(p)).thenReturn(1);
		System.out.println("Insert Article Mockito Test:" + adminservice.insertArticle(p));
		assertEquals(adminservice.insertArticle(p), 1);
	}
	
	@Test
	public void loginCheck() 
	{  
		AdminDBOperation admindb=mock(AdminDBOperation.class);
		when(admindb.loginCheck("nitin","nitin")).thenReturn(1);
		System.out.println("Login Check Mockito Test:" + admindb.loginCheck("nitin","nitin"));
		assertEquals(admindb.loginCheck("nitin","nitin"), 1);
	}
	
	
	@Test
	public void getAllArticles() 
	{  when(adminservice.getAllArticles()).thenReturn(new java.util.ArrayList());
		System.out.println("Get All Articles Mockito Test:" + adminservice.getAllArticles());
		assertEquals(adminservice.getAllArticles(), new java.util.ArrayList());
	}
	
	@Test
	public void deleteArticle() 
	{  when(adminservice.deleteArticle(250)).thenReturn(1);
		System.out.println("Delete Articles Mockito Test:" + adminservice.deleteArticle(250));
		assertEquals(adminservice.deleteArticle(250), 1);
	}
	
	@Test
	public void updateArticle() 
	{  when(adminservice.updateArticle(249,"WP","Wordpress")).thenReturn(1);
		System.out.println("Update Articles Mockito Test:" + adminservice.updateArticle(249,"WP","Wordpress"));
		assertEquals(adminservice.updateArticle(249,"WP","Wordpress"), 1);
	}
	
	@Test
	public void insertComment() 
	{ CommentBean cb=new CommentBean();
	   cb.setAid(250);
	   cb.setDescrip("Nice Article"); 
		when(adminservice.insertComment(cb)).thenReturn(1);
		System.out.println("Update Articles Mockito Test:" + adminservice.insertComment(cb));
		assertEquals(adminservice.insertComment(cb), 1);
	}
}
