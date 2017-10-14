package b;

import java.sql.*;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

public class DBConnection{
    static Connection conn;
    
    
    
    /********************查询方法*******************************/
    public LinkedList<Object> inquerybook(String Authorname)
	{
		LinkedList<Object> bookMap = new LinkedList<Object>();
		String tempID = null;
		ResultSet rs1 = null;
		try{
            //调用Class.forName()方法加载驱动程序
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("成功加载MySQL驱动！");
        }catch(ClassNotFoundException e1){
            System.out.println("找不到MySQL驱动!");
            e1.printStackTrace();
        }
        
        String url=String.format("jdbc:mysql://%s:%s/%s", System.getenv("MYSQL_HOST"), System.getenv("MYSQL_PORT"), System.getenv("MYSQL_DB"));    //JDBC的URL    
        //调用DriverManager对象的getConnection()方法，获得一个Connection对象
   
        try {
            conn = DriverManager.getConnection(url,System.getenv("ACCESSKEY"),System.getenv("SECRETKEY"));
            //创建一个Statement对象
            Statement stmt = conn.createStatement(); //创建Statement对象
            Statement stmt1 = conn.createStatement(); //不能重复使用
            System.out.print("成功连接到数据库！");
            
            String sql = "select * from author";    //要执行的SQL
            ResultSet rs = stmt.executeQuery(sql);//创建数据对象
            while (rs.next()){
            	if(rs.getString(2).equalsIgnoreCase(Authorname))
               	{
               	   	tempID = rs.getString(1);
               	
               	    String sql1 = "select * from book";                   //要执行的第二张表                	
                	rs1 = stmt1.executeQuery(sql1);              //创建数据对象
                    while(rs1.next()) {
                	    if(rs1.getString(3).equalsIgnoreCase(tempID))
                	    {
                	    	bookMap.add(rs1.getString(1));
                	    	bookMap.add(rs1.getString(2));
                	    	bookMap.add(rs1.getString(3));
                	    	bookMap.add(rs1.getString(4));
                	    	bookMap.add(rs1.getString(5));
                	    	bookMap.add(rs1.getString(6));
                	    }          
                    }
               	}
            }
            
          //  rs1.close();
            rs.close();
            stmt.close();
            stmt1.close();
            conn.close();
            } catch (SQLException e){
                e.printStackTrace();
            }
        if(bookMap.isEmpty())
        {
        	return null;
        }

		return bookMap;
	}
	
	
	
}