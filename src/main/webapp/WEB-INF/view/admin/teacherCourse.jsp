<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
	java.util.Random random = new java.util.Random();
	int cssVer = random.nextInt(100);
%>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="format-detection" content="telephone=no">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="/lykj/static/js/public/jquery-1.8.3.min.js" type="text/javascript" charset="utf-8"></script>
	<title>梨语科技</title>
    <!-- Bootstrap -->
    <link href="/lykj/static/css/admin/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="/lykj/static/css/admin/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="/lykj/static/css/admin/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="/lykj/static/css/admin/green.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="/lykj/static/css/admin/custom.min.css" rel="stylesheet">
    <script type="text/javascript">
	//alert(contextName);
	function backPage(num) {
		var pageIndex=parseInt($("#pageIndex").val());
		pageIndex=pageIndex+num;
		$("#pageIndex").val(pageIndex);
		$("#from").submit();
	}
	
	function studyDel(num) {
		var pageIndex=parseInt($("#pageIndex").val());
		pageIndex=pageIndex+num;
		$("#pageIndex").val(pageIndex);
		$("#from").submit();
	}
	
	</script>
  </head>
  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
      	<!-- left menu -->
		<jsp:include page="left.jsp"></jsp:include>	
        <!-- top navigation -->
        <jsp:include page="top.jsp"></jsp:include>	
        <!-- /top navigation -->
        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>课程管理 </h3>
              </div>
                           <div class="title_right"> </div>
            </div>
            <div class="clearfix"></div>
            <div class="row">

              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>课程列表</h2>
                  
                       
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                   <form id="from" action="/lykj/admin/teacherCourse?tid=${tid}" method="post">
                    
                    <!-- 数据列表 -->
                    <div class="row">
                    <div class="table-responsive">
                    <table id="datatable-checkbox" class="table table-striped jambo_table bulk_action">
                      <thead>
                        <tr class="headings">
						  <th class="column-title"></th>
                          <th class="column-title">课程学生</th>
                          <th class="column-title">开始时间</th>
                          <th class="column-title">结束时间</th>
                          <th class="column-title">上课状态</th>
                        </tr>
                      </thead>
                      <tbody>
                      <c:forEach var="course" items="${list}">
                        <tr>
						  <td></td>
                          <td>${course.student.name}</td>
                          <td><fmt:formatDate value="${course.start}" pattern="yyyy年MM月dd日 HH:mm:ss"/></td>
                          <td><fmt:formatDate value="${course.end}" pattern="yyyy年MM月dd日 HH:mm:ss"/></td>
 
                          <td>
                   <c:choose>
                   <c:when test="${course.finish == 0}">
                    <a href="/lykj/admin/courseFinish?id=${course.id}"  class="btn btn-warning btn-xs">
                           <i class="fa fa-pencil"></i>未上课</a>	
                           </c:when>
                           <c:otherwise>
				    <a href="/lykj/admin/courseNotFinish?id=${course.id}" class="btn btn-success btn-xs">
                           <i class="fa fa-pencil"></i>已上课</a>	
                           </c:otherwise>
                   </c:choose> 
                          </td>
                        </tr>
                        </c:forEach>
                      </tbody>
                    </table>
                    </div>
                    </div>
                    <!-- 分页 -->
		            <div class="row">
		            	<div style="padding-left: 5px;float: left;padding-top: 10px;">
		            			${page.totalCount}条数据，每页 1 到  10 条，共${page.totalPageCount} 页
		            	</div>
		            	<div style="float:right;text-align: right;margin: 2px 0;">
		            		<div id="datatable_paginate">
		            		<ul class="pagination" style="margin: 2px 0;">
		            		<c:choose>
							   <c:when test="${page.pageIndex>1}">
							   	<li class="paginate_button" id="backPage" onclick="backPage(-1)" >
			            			<a href="#" style="background-color: #ddd;height: 30px;border-radius: 5px">上一页</a>
			            		</li>  
							   </c:when>
							   <c:otherwise>  
								   <li class="paginate_button previous disabled" id="backPage" onclick="">
			            			<a href="#" style="background-color: #ddd;height: 30px;border-radius: 5px">上一页</a>
			            			</li>
							   </c:otherwise>  
							</c:choose>
		            		<li class="paginate_button" style="float: left;padding: 2px 4px 1px 4px;">
		            		<input type="text" style="width: 40px;" name="pageIndex" id="pageIndex" value="${page.pageIndex}" aria-controls="datatable" data-dt-idx="2">
		            		</li>
		            		<li class="paginate_button" id="datatable_next" onclick="backPage(0)">
		            		<a href="#" style="background-color: #ddd;height: 30px;border-radius: 5px">前往</a>
		            		</li>
		            		<c:choose>
							   <c:when test="${page.pageIndex < page.totalPageCount}">
							   	<li class="paginate_button" id="datatable_next" style="padding: 4px 4px 4px 4px" onclick="backPage(1)">
			            		<a href="#" style="background-color: #ddd;height: 30px;border-radius: 5px;margin-left: 4px;">下一页</a>
			            		</li>
							   </c:when>
							   <c:otherwise>  
								   <li class="paginate_button previous disabled" id="backPage">
			            			<a href="#" style="background-color: #ddd;height: 30px;border-radius: 5px；margin-left: 4px;">下一页</a>
			            			</li>
							   </c:otherwise>  
							</c:choose>
		            		</ul></div>
		            	</div>
		            </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-right">
            Gentelella - Bootstrap Admin Template by Colorlib. More Templates <a href="#" target="_blank" title="梨语科技">梨语科技</a> - Collect from <a href="#" title="梨语科技" target="_blank">梨语科技</a>
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      </div>
    </div>
    <!-- jQuery -->
    <script src="/lykj/static/js/admin/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="/lykj/static/js/admin/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="/lykj/static/js/admin/fastclick.js"></script>
    <!-- NProgress -->
    <script src="/lykj/static/js/admin/nprogress.js"></script>
    <!-- iCheck -->
    <script src="/lykj/static/js/admin/icheck.min.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="/lykj/static/js/admin/custom.min.js"></script>
    
  </body>
</html>