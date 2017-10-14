<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<table class="table">
				<thead>
					<tr>
						<th>
							ISBN
						</th>
						<th>
							Title
						</th>
						<th>
							AuthorID
						</th>
						<th>
							Publisher
						</th>
						<th>
						    PublishData
						</th>
						<th>
						    Price
						</th>
					</tr>
				</thead>
				<% 
				String tempID = null;
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
                 Statement stmt1 = conn.createStatement(); //创建Statement对象
                 String sql = "select * from book";    //要执行的SQL
                 ResultSet rs = stmt.executeQuery(sql);//创建数据对象
                 while(rs.next())
                 {
                	 if(rs.getString(2).equalsIgnoreCase(request.getParameter("title")))
                	 {
                		 tempID = rs.getString(3);
                		 %>
                		    <tbody>
					           <tr>
						         <td>
							        <%out.print(rs.getString(1)); %>
						         </td>
						         <td>
							        <%out.print(rs.getString(2)); %>
						         </td>
						         <td>
							        <%out.print(rs.getString(3)); %>
						         </td>
						         <td>
							        <%out.print(rs.getString(4)); %>
						         </td>
						         <td>
							        <%out.print(rs.getString(5)); %>
						         </td>
						         <td>
							        <%out.print(rs.getString(6)); %>
						         </td>
					         </tr>

				            </tbody>
                		 <%  }
            	     
                 }
                 %>
                 <table class="table">
                   <thead>
                     <tr>
                       <th>
                         AuthorID
                       </th>
                       <th>
                         Name
                       </th>
                       <th>
                         Age
                       </th>
                       <th>
                         Country
                       </th>
                     </tr>
                   </thead>   
                  <%          
                 String sql1 = "select * from author";    //要执行的SQL
                 ResultSet rs1 = stmt.executeQuery(sql1);//创建数据对象
                 while(rs1.next())
                 {
                	 if(rs1.getString(1).equalsIgnoreCase(tempID))
                	 {%>
                		<tbody>
                		<tr>
						    <td>
		        			    <%out.print(rs1.getString(1)); %>
						    </td>
					        <td>
			    		        <%out.print(rs1.getString(2)); %>
						    </td>
						    <td>
							    <%out.print(rs1.getString(3)); %>
						    </td>
					        <td>
				      	        <%out.print(rs1.getString(4)); %>
						    </td>
						  </tr>       
                		</tbody> 
                		 
                	 <% }
                 }
             
                 rs.close();
                 rs1.close();
                 stmt.close();
                 stmt1.close();
                 conn.close();
                 }catch(SQLException e){
                 e.printStackTrace();
                 }%>
				

			</table>
		</div>
	</div>
</div>
</body>
</html>