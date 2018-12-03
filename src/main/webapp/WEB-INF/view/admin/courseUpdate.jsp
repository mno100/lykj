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
	<jsp:include page="head.jsp"></jsp:include>
	<script src="/lykj/static/js/admin/ajaxfileupload.js?v=1" type="text/javascript"></script>
  
	<link href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
	<link href="/lykj/static/time/assets/theme/css/tempusdominus-bootstrap-4.css" rel="stylesheet">
	<script src="/lykj/static/time/js/jquery-1.11.0.min.js" type="text/javascript"></script>
	<script src="https://cdn.bootcss.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/lykj/static/time/js/moment-with-locales.min.js"></script>
	<script src="/lykj/static/time/assets/theme/js/base.js"></script>
	<script src="/lykj/static/time/assets/theme/js/tempusdominus-bootstrap-4.js"></script>
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
                <h3>教师管理</h3>
              </div>
              <div class="title_right"> </div>
            </div>
            <div class="clearfix"></div>
            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>教师信息修改<small></small></h2>

                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <br />
                   <form id="form" action="/lykj/admin/courseUpdate" method="post" data-parsley-validate class="form-horizontal form-label-left">
                   <input type="hidden" name="id" value="${course.id}">
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">教师编号<span class="required">：</span>
                        </label>
                        <div class="col-md-2 col-sm-10 col-xs-12">
                          <input type="text" id="tid" name="tid" required="required"class="form-control col-md-7 col-xs-12" value="${course.tid}">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">学生编号<span class="required">：</span>
                        </label>
                        <div class="col-md-2 col-sm-10 col-xs-12">
                          <input type="text" id="sid" name="sid" required="required" class="form-control col-md-7 col-xs-12"value="${course.sid}">
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">开始时间<span class="required">：</span>
                        </label>
                         <div class="col-md-2 col-sm-10 col-xs-12">
                           <div class="input-group date" id="datetimepicker2" data-target-input="nearest">
                    <input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker2" name="starttime" value="<fmt:formatDate value="${course.start}" pattern="yyyy年MM月dd日 HH:mm:ss"/>"/>
                    <div class="input-group-append" data-target="#datetimepicker2" data-toggle="datetimepicker">
                        <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                    </div>
             		   </div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">结束时间<span class="required">：</span>
                        </label>
                        <div class="col-md-2 col-sm-10 col-xs-12">
                          <div class="input-group date" id="datetimepicker1" data-target-input="nearest">
                    <input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker1" name="endtime" value="<fmt:formatDate value="${course.end}" pattern="yyyy年MM月dd日 HH:mm:ss"/>"/>
                    <div class="input-group-append" data-target="#datetimepicker1" data-toggle="datetimepicker">
                        <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                    </div>
             		   </div>
                        </div>
                      </div>
                     
                      <div class="form-group" >
                        <div class="col-md-2 col-sm-10 col-xs-12 col-md-offset-3">
                          <button class="btn btn-primary" type="button" onclick="javascript:location.href='/lykj/admin/courseList'">返回</button>
						  
                          <button type="submit" class="btn btn-success" >修改</button>
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
    
    <script type="text/javascript">
            $(function () {
                $('#datetimepicker2').datetimepicker({
                    locale: 'zh-cn'
                });
                
            });
            $(function () {
                $('#datetimepicker1').datetimepicker({
                    locale: 'zh-cn'
                });
                
            });
        </script>
  </body>
</html>