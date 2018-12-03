<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="zh">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title></title>
	<link href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
	<link href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
	<link href="static/time/assets/theme/css/tempusdominus-bootstrap-4.css" rel="stylesheet">
	<script src="static/time/js/jquery-1.11.0.min.js" type="text/javascript"></script>
	<script src="https://cdn.bootcss.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="static/time/js/moment-with-locales.min.js"></script>
	<script src="static/time/assets/theme/js/base.js"></script>
	<script src="static/time/assets/theme/js/tempusdominus-bootstrap-4.js"></script>
</head>
<body>
	<div class="htmleaf-container">
		<header class="htmleaf-header">

		</header>
		<div class="container-fluid">
        <div class="row">
            <div class="col-12 col-md-3 col-xl-2 bd-sidebar"><nav class="bd-links" id="docsNavbarContent">
    
</nav></div>
            <div class="col-12 col-md-9 col-xl-8 py-md-3 pl-md-5 bd-content" role="main">
                <h1 class="bd-title">Usage</h1>


<hr />
<h3 id="using-locales">Using Locales</h3>
<div class="container">
    <div class="row">
        <div class="col-sm-6">
            <div class="form-group">
                <div class="input-group date" id="datetimepicker2" data-target-input="nearest">
                    <input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker2"/>
                    <div class="input-group-append" data-target="#datetimepicker2" data-toggle="datetimepicker">
                        <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            $(function () {
                $('#datetimepicker2').datetimepicker({
                    locale: 'zh-cn'
                });
            });
        </script>
    </div>
</div>
</div>
</div>
</div>
</div>

</body>
</html>