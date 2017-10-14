<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*,java.lang.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Delete Book</title>
</head>
<body>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">

        <%
		try{
           Class.forName("com.mysql.jdbc.Driver");
           }catch(ClassNotFoundException e1){
                 e1.printStackTrace();}
		 Connection conn;
		 String url=String.format("jdbc:mysql://%s:%s/%s", System.getenv("MYSQL_HOST"), System.getenv("MYSQL_PORT"), System.getenv("MYSQL_DB"));    //JDBC的URL    
	        //调用DriverManager对象的getConnection()方法，获得一个Connection对象
	   
	        try {
	            conn = DriverManager.getConnection(url,System.getenv("ACCESSKEY"),System.getenv("SECRETKEY"));
         Statement stmt = conn.createStatement(); //创建Statement对象

         String sql = "delete from book where ISBN=?";
         PreparedStatement pst = conn.prepareStatement(sql);
         pst.setInt(1,Integer.parseInt(request.getParameter("deleteBook")));
         pst.executeUpdate();
         
         
         stmt.close();     
         conn.close();
         }catch(SQLException e){
         e.printStackTrace();
         }
        %>
         	<h3 class="text-center">
			    删除成功！！！
			</h3>
			<a href="index.jsp">返回</a>
		</div>
	</div>
</div>   
</body>
</html>