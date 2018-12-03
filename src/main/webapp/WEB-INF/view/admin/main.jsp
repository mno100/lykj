<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<script src="/lykj/static/js/admin/modules/main.js?v=<%=cssVer%>" type="text/javascript" charset="utf-8"></script>
	<title>梨语科技</title>
    <!-- Bootstrap -->
    <link href="/lykj/static/css/admin/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="/lykj/static/css/admin/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="/lykj/static/css/admin/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="/lykj/static/css/admin/green.css" rel="stylesheet">
	
    <!-- bootstrap-progressbar -->
    <link href="/lykj/static/css/admin/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- JQVMap -->
    <link href="/lykj/static/css/admin/jqvmap.min.css" rel="stylesheet"/>
    <!-- bootstrap-daterangepicker -->
    <link href="/lykj/static/css/admin/daterangepicker.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="/lykj/static/css/admin/custom.min.css" rel="stylesheet">
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
      	<!-- 左菜单-->
		<jsp:include page="left.jsp"></jsp:include>	
        <!-- 头部 -->
        <jsp:include page="top.jsp"></jsp:include>	
        <!-- 中部 -->
        <div class="right_col" role="main">
          
          <div class="row">
            <div class="col-md-8 col-sm-8 col-xs-12">

              <div class="row">
                <!-- End to do list -->
                <!-- end of weather widget -->
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-right">
            Copyright © 2018-2025 来自  <a href="#" target="_blank" title="梨语科技">梨语科技</a>
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
    <!-- Chart.js -->
    <script src="/lykj/static/js/admin/Chart.min.js"></script>
    <!-- gauge.js -->
    <script src="/lykj/static/js/admin/gauge.min.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="/lykj/static/js/admin/bootstrap-progressbar.min.js"></script>
    <!-- iCheck -->
    <script src="/lykj/static/js/admin/icheck.min.js"></script>
    <!-- Skycons -->
    <script src="/lykj/static/js/admin/skycons.js"></script>
    <!-- Flot -->
    <script src="/lykj/static/js/admin/jquery.flot.js"></script>
    <script src="/lykj/static/js/admin/jquery.flot.pie.js"></script>
    <script src="/lykj/static/js/admin/jquery.flot.time.js"></script>
    <script src="/lykj/static/js/admin/jquery.flot.stack.js"></script>
    <script src="/lykj/static/js/admin/jquery.flot.resize.js"></script>
    <!-- Flot plugins -->
    <script src="/lykj/static/js/admin/jquery.flot.orderBars.js"></script>
    <script src="/lykj/static/js/admin/jquery.flot.spline.min.js"></script>
    <script src="/lykj/static/js/admin/curvedLines.js"></script>
    <!-- DateJS -->
    <script src="/lykj/static/js/admin/date.js"></script>
    <!-- JQVMap -->
    <script src="/lykj/static/js/admin/jquery.vmap.js"></script>
    <script src="/lykj/static/js/admin/jquery.vmap.world.js"></script>
    <script src="/lykj/static/js/admin/jquery.vmap.sampledata.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="/lykj/static/js/admin/moment.min.js"></script>
    <script src="/lykj/static/js/admin/daterangepicker.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="/lykj/static/js/admin/custom.min.js"></script>
	
  </body>
</html>