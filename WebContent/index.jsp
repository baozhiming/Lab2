<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" import="java.sql.*"
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

<title>图书查询系统</title>
</head>
<body>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<h3 class="text-center">
				图书查询
			</h3>
			<form role="form" class="form-inline" action="inquery" method="post">
				<div class="form-group">
					 <label for="authorname">Author</label><input type="text" class="form-control" name="authorname" />
				</div>
	            <button type="submit" class="btn btn-default">查询</button>
			</form>
			<table class="table">
			  <thead>
			    <tr>
			      <th>
			          ISBN
			      </th>
			      <th>
			          BookTitle
			      </th>
			      <th>
			          AuthorID
			      </th>
			      <th>
			                  删除
			      </th>
			    </tr>
			  </thead>
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
		         String sql = "select * from book";    //要执行的SQL
		         ResultSet rs = stmt.executeQuery(sql);//创建数据对象
		         while(rs.next())
		         {
		         %>
		    	<tbody>
			        <tr>
			          <td>
			              <%out.print(rs.getString(1)); %>
			          </td>
			          <td>
			              <a href="ShowBook.jsp?title=<%=rs.getString(2)%>"><%=rs.getString(2)%></a>
			          </td>
			          <td>
			              <%out.print(rs.getString(3)); %>
			          </td>
			          <td>			             
			              <a href="delBook.jsp?deleteBook=<%=rs.getString(1) %>">delete</a>
			          </td>
			        </tr>
			      </tbody>
		    <%}
		         rs.close();
		         stmt.close();     
		         conn.close();
		         }catch(SQLException e){
		         e.printStackTrace();
		         }
			%>
			
			
			</table>

		</div>
	</div>
</div>
</body>
</html>
