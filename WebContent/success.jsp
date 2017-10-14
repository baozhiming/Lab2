<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"
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

<title>登陆成功</title>
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
				LinkedList<Object> list = (LinkedList<Object>)session.getAttribute("currentUser");
				while(!list.isEmpty())
				{ %>
					<tbody>
					<tr>
						<td>
							<%out.print(list.removeFirst()); %>
						</td>
						<td>
							<%out.print(list.removeFirst()); %>
						</td>
						<td>
							<%out.print(list.removeFirst()); %>
						</td>
						<td>
							<%out.print(list.removeFirst()); %>
						</td>
						<td>
						    <%out.print(list.removeFirst()); %>
						</td>
						<td>
						    <%out.print(list.removeFirst()); %>
						</td>
					</tr>

				    </tbody>
				<%} %>
 
				
			</table>
			<a href="index.jsp">返回</a>
		</div>
	</div>
</div>
</body>
</html>



