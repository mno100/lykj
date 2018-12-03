<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="/lykj/admin/index" class="site_title"><i class="fa fa-paw"></i> <span>徐教育的店</span></a>
            </div>
            <div class="clearfix"></div>
            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_pic">
                <img src="/lykj/static/images/admin/img.jpg" alt="..." class="img-circle profile_img">
              </div>
              <div class="profile_info">
                <span>欢迎,</span>
                <h2>${admin.username}</h2>
              </div>
            </div>
            <!-- /menu profile quick info -->
            <br />
            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h3>功能列表</h3>
                <ul class="nav side-menu">
                  <li><a><i class="fa fa-home"></i> 学生管理 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="/lykj/admin/studentList">学生列表</a></li>
                      <li><a href="/lykj/admin/goStudentAdd">添加新学生</a></li>                 
                    </ul>
                  </li>
                  <li><a><i class="fa fa-edit"></i>老师管理<span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="/lykj/admin/teacherList">老师列表</a></li>
                      <li><a href="/lykj/admin/goTeacherAdd">添加新老师</a></li>
                    </ul>
                  </li>
                   <li><a><i class="fa fa-edit"></i>课程管理<span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="/lykj/admin/courseList">课程列表</a></li>
                      <li><a href="/lykj/admin/goCourseAdd">添加课程</a></li>   
                    </ul>
                  </li>
                </ul>
              </div>
              <div class="menu_section">
                <h3>系统管理</h3>
                <ul class="nav side-menu">
                  <li><a><i class="fa fa-bug"></i> 系统设置 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="#" onclick="javascript:alert('功能开发中');">系统开启/关闭</a></li>
                      <li><a href="#" onclick="javascript:alert('功能开发中');">系统更新</a></li>
                      <li><a href="#" onclick="javascript:alert('功能开发中');">接口设置</a></li>
                      <li><a href="#" onclick="javascript:alert('功能开发中');">短信设置</a></li>
                      <li><a href="#" onclick="javascript:alert('功能开发中');">邮件设置</a></li>
                    </ul>
                  </li>

                  <li><a href="javascript:void(0)"><i class="fa fa-laptop"></i> 语言设置 <span class="label label-success pull-right">设置</span></a></li>
                </ul>
              </div>

            </div>
            <!-- /sidebar menu -->

            <!-- /menu footer buttons -->
            <div class="sidebar-footer hidden-small">
              <a data-toggle="tooltip" data-placement="top" title="Settings">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Lock">
                <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Logout" href="#">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
              </a>
            </div>
            <!-- /menu footer buttons -->
          </div>
        </div>
      </div>
    </div>