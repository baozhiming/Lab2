package a;
import b.DBConnection;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Book extends ActionSupport {

    private static final long serialVersionUID = 1L;
    private String authorname;//作者
    private String authorID;//ID
    
    //getters & setters
    public String getAutorname()
    {
    	return authorname;
    }
    public void setAuthorname(String authorname)
    {
    	this.authorname=authorname;
    }
    public String getAuthorID()
    {
    	return authorID;
    }
    public void setAuthorID(String authorID)
    {
    	this.authorID=authorID;
    }

    public String execute(){
    	
    	DBConnection db = new DBConnection();
    	if(db.inquerybook(authorname) == null)
    	{
    		return "error";
    	}
    	LinkedList<Object> bookmap = db.inquerybook(authorname);
    	if(!bookmap.isEmpty())
    	{
    	    ActionContext ac = ActionContext.getContext();
    	    Map session = ac.getSession();
    	    session.put("currentUser", bookmap);	
    	    return "success";
    	}
		return null;


    }
}