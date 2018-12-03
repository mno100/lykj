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
    <script type="text/javascript">
   
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
                <h3>教师管理 </h3>
              </div>
              <div class="title_right"> </div>
            </div>
            <div class="clearfix"></div>
            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>教师信息添加<small></small></h2>

                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <br />
                    <form id="form" action="/lykj/admin/teacherAdd" method="post" data-parsley-validate class="form-horizontal form-label-left">
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">教师名称<span class="required">：</span>
                        </label>
                        <div class="col-md-2 col-sm-10 col-xs-12">
                          <input type="text" id="name" name="name" required="required"class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">教师年龄<span class="required">：</span>
                        </label>
                        <div class="col-md-2 col-sm-10 col-xs-12">
                          <input type="text" id="age" name="age" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">联系方式<span class="required">：</span>
                        </label>
                        <div class="col-md-2 col-sm-10 col-xs-12">
                          <input type="text" id="mobile" name="mobile" required="required"  class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">微信号<span class="required">：</span>
                        </label>
                        <div class="col-md-2 col-sm-10 col-xs-12">
                          <input type="text" id="wechat" name="wechat" required="required"  class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>

                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">地址<span class="required">：</span>
                        </label>
                        <div class="col-md-2 col-sm-10 col-xs-12">
                          <input type="text" id="address" name="address" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div> 
                      
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">教学语言<span class="required">：</span>
                        </label>
                        <div class="col-md-2 col-sm-10 col-xs-12">
                          <input type="text" id="language" name="language" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div> 

                      <div class="form-group" >
                        <div class="col-md-2 col-sm-10 col-xs-12 col-md-offset-3">
                          <button class="btn btn-primary" type="button" onclick="javascript:location.href='/lykj/admin/teacherList'">返回</button>
						  <button class="btn btn-primary" type="reset" onclick="javascript:location.href='/lykj/admin/goTeacherAdd'">重置</button>
                          <button type="submit" class="btn btn-success" >提交</button>
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