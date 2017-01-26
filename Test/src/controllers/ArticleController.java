package controllers;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import beans.CommentBean;
import beans.Product;
import services.AdminService;

@Controller
public class ArticleController 
{
    @RequestMapping("/save-product")
    public String uploadResources( HttpServletRequest servletRequest, 
                                 @ModelAttribute Product product,
                                 Model model) 
    {
    	
    	   int x=new AdminService().insertArticle(product);
    	     
    	
        //Get the uploaded files and store them
        List<MultipartFile> files = product.getImages();
        @SuppressWarnings("unused")
		List<MultipartFile> docs = product.getDocuments();
        
        List<String> fileNames = new ArrayList<String>();
        List<String> docNames = new ArrayList<String>();
     //uploading code for images
        if (null != files && files.size() > 0) 
        {
            for (MultipartFile multipartFile : files) {
 
                String fileName = multipartFile.getOriginalFilename();
                fileNames.add(fileName);
                
                File upDir = new File(servletRequest.getServletContext().getRealPath("/image"));
               if(!upDir.exists())
            	   upDir.mkdirs();
                File imageFile = new File(upDir, product.getAid()+"_"+fileName);
              System.out.println(">>>>>"+imageFile.getAbsolutePath());
                try
                {
                    multipartFile.transferTo(imageFile);
                } catch (IOException e) 
                {
                    e.printStackTrace();
                }
            }
        }
      //uploading code for documents 
        if (null != files && files.size() > 0) 
        {
            for (MultipartFile multipartFile : docs) {
 
                String docName = multipartFile.getOriginalFilename();
                docNames.add(docName);
                
                File upDir = new File(servletRequest.getServletContext().getRealPath("/document"));
               if(!upDir.exists())
            	   upDir.mkdirs();
               String orignaldoc=(product.getAid()+"_"+docName).replace(' ','_');
                File docFile = new File(upDir, orignaldoc);
              
                try
                {
                    multipartFile.transferTo(docFile);
                } catch (IOException e) 
                {
                    e.printStackTrace();
                }
            }
        }
        
 
        // Here, you can save the product details in database
        if(x!=0) 
        model.addAttribute("product", product);
        return "ViewSubmittedArticle";
    }
     
    @RequestMapping("/create")
    public String inputProduct(Model model) {
        model.addAttribute("product", new Product());
          int aid=new AdminService().getNextArticleID();
     model.addAttribute("aid",aid);
        return "AddArticleForm";
    }
    
    
    @RequestMapping("/viewarticle")
	public ModelAndView viewArticles(){
		ModelAndView mv=new ModelAndView("ViewArticle");
	AdminService as=new AdminService();
	ArrayList<Product> ar=as.getAllArticles();
	mv.addObject("List",ar);
	    	return mv;
	}
    
    
    @RequestMapping("/downloaddocument")
	public ModelAndView downloaddocument(@RequestParam("dname") String dname,HttpServletRequest req) throws Exception{
		ModelAndView mv=new ModelAndView("ViewArticle");
	AdminService as=new AdminService();
	String docname=req.getServletContext().getRealPath("/document/")+dname;
	System.out.println(">>>>>>>>>>>>>>>>."+docname);
	boolean b=as.download(docname);System.out.println(">>>>>>>>>>>>>>>>."+b);
	if(b)
	mv.addObject("smsg","Document Downloaded Successfully in your C drive Download folder");
	ArrayList<Product> ar=as.getAllArticles();
	mv.addObject("List",ar);    
	return mv;
	}
    
    @RequestMapping("/insertcomment")
    public ModelAndView insertcomment(@ModelAttribute("CommentBean") CommentBean cb) {
    	ModelAndView mv=new ModelAndView("ViewArticle");
          int x=new AdminService().insertComment(cb);
          ArrayList<Product> ar=new AdminService().getAllArticles();
      	mv.addObject("List",ar);
     if(x!=0)
          mv.addObject("smsg","Comment Added Successfully");
        return mv;
    }
    
    @RequestMapping("/viewallcomments")
    public ModelAndView insertcomment(@RequestParam("aid") int aid) {
    	ModelAndView mv=new ModelAndView("ViewComments");
        ArrayList<CommentBean> ar=new AdminService().viewComments(aid);
        System.out.println("%%%%%%%%%%%%%%%%%%%%"+ar);
        if(ar!=null || !ar.isEmpty())
      	mv.addObject("List",ar);
        else
        mv.addObject("msg","No Comments Yet");
        	
        return mv;
    }
    
    
    @RequestMapping("/editarticle")
	public ModelAndView editArticles(){
		ModelAndView mv=new ModelAndView("EditArticle");
	AdminService as=new AdminService();
	ArrayList<Product> ar=as.getAllArticles();
	mv.addObject("List",ar);
	    	return mv;
	}
    
    @RequestMapping("/udArticles")
   	public ModelAndView udArticles(@RequestParam("aid") int aid,@RequestParam("aname") String aname,@RequestParam("descr") String descr,@RequestParam("action") String  action){
   		ModelAndView mv=new ModelAndView("EditArticle");
   		AdminService as=new AdminService();
   		
   		int x=0,y=0;
   		if(action.equals("Delete"))
   		{
   			x=as.deleteArticle(aid);  
   		}
   	else if(action.equals("Update"))
   		{
   			y=as.updateArticle(aid,aname,descr);
   		}
  if(x!=0)
   	mv.addObject("msg","Article Deleted Successfully");
  if(y!=0)
	   	mv.addObject("msg","Article Updated Successfully");
  ArrayList<Product> ar=as.getAllArticles();
		mv.addObject("List",ar);
		  
  return mv;
   	}
   
}