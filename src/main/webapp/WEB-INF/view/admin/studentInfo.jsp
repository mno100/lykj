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
                <h3>学生管理</h3>
              </div>
                            <div class="title_right"> </div>
            </div>
            <div class="clearfix"></div>
            <div class="row">

              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>学生详情<small></small></h2>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <br />
                    <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">

                      <div class="form-group">
                        <label class="control-label col-md-4 col-sm-3 col-xs-12" for="first-name">学生ID<span class="required">:</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12" style="margin-top: 7px;">
                        ${student.id}
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-4 col-sm-3 col-xs-12" for="last-name">学生名称<span class="required">:</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12" style="margin-top: 7px;">
                        ${student.name}
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-4 col-sm-3 col-xs-12" for="last-name">学生年龄<span class="required">:</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12" style="margin-top: 7px;">
                        ${student.age}
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-4 col-sm-3 col-xs-12" for="last-name">联系方式<span class="required">:</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12" style="margin-top: 7px;">
                        ${student.mobile}
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-4 col-sm-3 col-xs-12" for="last-name">微信号<span class="required">:</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12" style="margin-top: 7px;">
                        ${student.wechat}
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-4 col-sm-3 col-xs-12" for="last-name">有无基础<span class="required">:</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12" style="margin-top: 7px;">
                        ${student.base}
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-4 col-sm-3 col-xs-12" for="last-name">地址<span class="required">:</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12" style="margin-top: 7px;">
                        ${student.address}
                        </div>
                      </div>
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-4">
                          <button class="btn btn-primary" type="button" onclick="javascript:location.href='/lykj/admin/studentList'">返回</button>
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
  </body>
</html>