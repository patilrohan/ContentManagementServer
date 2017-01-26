package controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import beans.Product;
import dao.AdminDBOperation;
import services.AdminService;


@SessionAttributes("uid")
@Controller
public class AdminController {
	
	@ModelAttribute
	public  void addingCommonObjects(Model m)
	{
		m.addAttribute("hmsg","Content Management System");
	
	}
	
	@RequestMapping("/")
	public ModelAndView home(){
		ModelAndView mv=new ModelAndView("Login");
		return mv;
	}
	
	@RequestMapping("/home")
	public ModelAndView homeP(){
		ModelAndView mv=new ModelAndView("AdminPage");
		return mv;
	}

	@RequestMapping("/check")
	public ModelAndView loginCheck(@RequestParam("uid") String s1,@RequestParam("password") String s2){
		ModelAndView mv = null;
		AdminDBOperation d=new AdminDBOperation();
	int x=d.loginCheck(s1,s2);
		if(x==1)
		{  
		
			mv = new ModelAndView("AdminPage");
			 mv.addObject("uid",s1);
			mv.addObject("msg","Login Success");
		}
		else
			
		{ 
			mv = new ModelAndView("Login");
			mv.addObject("msg","Login Fail");
			
		}
			return mv;
	}

@RequestMapping("/logout")
public ModelAndView logout(HttpServletRequest request)
{
ModelAndView mv=new ModelAndView("Login","msg","Logout Successful");
HttpSession ss=request.getSession();
ss.invalidate();
return mv;
 }
}