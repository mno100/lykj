<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Home</title>
<link rel="shortcut icon" type="image/x-icon" href="../lykj/static/images/menu.ico" />
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="梨语英语 Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="/lykj/static/css/index/bootstrap1.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="/lykj/static/css/index/style1.css" rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="/lykj/static/css/index/jquery-ui1.css" type='text/css' />
<link rel="stylesheet" href="/lykj/static/css/index/smoothbox1.css" type='text/css' >
<!-- //Custom Theme files -->
<!-- js -->
<script src="/lykj/static/js/index/jquery.min1.js"></script>
<!-- //js -->
<!--webfont-->
<link href='https://fonts.googleapis.com/css?family=Gloria+Hallelujah' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<!-- start-smoth-scrolling -->
<script type="text/javascript" src="/lykj/static/js/index/move-top1.js"></script>
<script type="text/javascript" src="/lykj/static/js/index/easing1.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
	
</script>

<!-- start-smoth-scrolling -->

</head>
<body>
<script src="/lykj/static/js/index/jquery.vide.min1.js"></script>
	<div data-vide-bg="/lykj/static/video/index/srix">
		<div class="center-container">
			<div class="navigation">
				<div class="container">
					<div class="logo">
						<h1 style="color:beige"><a href="index.jsp"><img src="/lykj/static/images/index/menu.png" alt=" " /></a></h1>
					</div>
					<div class="navigation-right">
						<span class="menu"><img src="/lykj/static/images/index/menu.png" alt=" " /></span>
						<nav class="link-effect-3" id="link-effect-3">
							<ul class="nav1 nav nav-wil">
								<li class="active"><a data-hover="" href="index.jsp">首页</a></li>
								<li><a data-hover="" href="#about" class="scroll">关于</a></li>
								<li><a data-hover="" href="#team" class="scroll">团队</a></li>
								<li><a data-hover="" href="#gallery" class="scroll">照片墙</a></li>
								<li><a data-hover="" href="#contact" class="scroll">报名</a></li>
							</ul>
						</nav>
							<!-- script-for-menu -->
								<script>
								   $( "span.menu" ).click(function() {
									 $( "ul.nav1" ).slideToggle( 300, function() {
									 // Animation complete.
									  });
									 });
								</script>
							<!-- /script-for-menu -->
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="w3ls_banner_info">
				<div class="container">
					<div class="w3l_banner_logo">
						<h2>S</h2>
					</div>
					<h3>教育带来机遇，也带来灵感</h3>
					<p>除此之外，开心就好</p>

				</div>
			</div>
		</div>
	</div>
<!-- about -->
	<div class="about" style="background-color:#c1e9ff">
		<div class="container">
			<div class="agileits_about_grids">
				<div class="col-md-6 agileits_about_grid_left">
					<h3>我们所能提供的是</h3>
					<p style="font-size:18px;">五大教学方法：<br/>
					趣味式学习：告别枯燥学习<br/>
					主题式教学：在生活中学习<br/>
					外教直授课：母语式教学<br/>
					系统式学习：语言启蒙规律<br/>
					定期小测试：深入了解进度<br/>
					</p>
				</div>
				<div class="col-md-6 agileits_about_grid_right">
					<img src="/lykj/static/images/index/16.jpg" alt=" " class="img-responsive" />
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
<!-- //about -->
<!-- banner-bottom -->
	<div class="banner-bottom" style="background-color:#c1e9ff">
		<div class="container">
			<div class="col-md-4 wthree_banner_bottom_left">
				<img src="/lykj/static/images/index/1.jpg" alt=" " class="img-responsive" />
			</div>
			<div class="col-md-8 wthree_banner_bottom_right">
				
				<p style="font-size:18px;">三大级别提升：<br/>
					入门级：培养英语语感，创造语言环境<br/>
					基础级：丰富词语汇量，引导开口交流<br/>
					进阶级：提高听说能力，增强语言思维<br/>
				</p>
				<h3 style="margin: 0 7em;">课程获得：</h3>
				
					<p style="font-size:18px">
					1.与老师直接沟通，确保高质量教学<br/>
					2.使用电脑，平板上课，在家学习无压力<br/>
					3.老师课后反馈，及时跟进孩子学习进度</p>

			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
<!-- //banner-bottom -->
<!-- banner-bottom-image-text -->
	<div id="about" class="banner-bottom-image-text" style="background-color:#c1e9ff">
		<div class="col-md-8 banner-bottom-image-text-left">
			<h3>关于我们</h3>
			<p style="font-size:18px;">梨语幼儿语言发展机构由华南师范大学联手澳门大学人文学院学生创办的创业机构，
			我们一直在探索幼儿语言与学习和社交能力的相互关系，运用统计模型和前沿科研方法，
			找到通过语言教育来促进儿童智力发展的方法。我们一直致力于将学龄前儿童的语言教育模式，
			引入国内课堂，让语言教育少走弯路。     
</p>
			<h4>本课程包含十岁以前幼儿多种语言习得，目前开放有：英语、法语、西班牙语，我们遵循语言启蒙规律，采用高频、真人外教、一对一或一对二微班制、母语式习得方式。
			        在生活中学习，我们的课程涉及到生活中的方方面面，让您的孩子在十岁前能达到母语国六岁孩子的外语水平</h4>
		</div>
		<div class="col-md-4 banner-bottom-image-text-right">
			<img src="/lykj/static/images/index/2.jpg" alt=" " class="img-responsive" />
		</div>
		<div class="clearfix"> </div>
	</div>
<!-- //banner-bottom-image-text -->
<!-- team -->
	<div class="team" id="team" style="background-color:#c1e9ff">
		<div class="container">
			<h3>我们的团队</h3>
		
			
			<div class="agile_team_grids">
				<div class="col-md-5 agile_team_grid">
					
						<img src="/lykj/static/images/index/3.png" alt=" " class="img-responsive" />
					
				</div>
				<p style="font-size:20px;margin:2em;line-height:3;">北美优质外教 ——让孩子“开口说英语”</p>
				<p style="font-size:18px;line-height:1.8;margin:10px" >
					1.	师资规模<br/>
					外教均为北美中小学教师或拥有ESL证书及教育经验的人员。<br/>
					2.	接轨国际<br/>
					在接触外教的基础上，学习外国文化教育，开拓眼界。<br/>
					3.	纯正口音<br/>
					在孩子学习语言的关键词，吸收纯正口音<br/>
				</p>
				
							
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
<!-- //team -->
<div class="tlinks">Collect from 梨语科技</div>

<!-- gallery -->
	<div class="gallery" id="gallery">
		<h3>照片墙</h3>
		
		<div class="w3agile_gallery_grids">
			<div class="col-md-3 w3agile_gallery_grid">
				<div class="w3agile_gallery_image">
					<a class="sb" href="/lykj/static/images/index/8.jpg" title="quis nostrud exercitation ullamco laboris quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum">
						<figure>
							<img src="/lykj/static/images/index/8.jpg" alt="" class="img-responsive" />
							<figcaption>
								<h4>dolore magna aliqua</h4>
								<p>
									Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
									tempor incididunt ut labore et dolore magna aliqua.
								</p>
							</figcaption>
						</figure>
					</a>
				</div>
			</div>
			<div class="col-md-3 w3agile_gallery_grid">
				<div class="w3agile_gallery_image">
					<a class="sb" title="quis nostrud exercitation ullamco laboris quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum" href="/lykj/static/images/index/9.jpg">
						<figure>
							<img src="/lykj/static/images/index/9.jpg" alt="" class="img-responsive" />
							<figcaption>
								<h4>dolore magna aliqua</h4>
								<p>
									Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
									tempor incididunt ut labore et dolore magna aliqua.
								</p>
							</figcaption>
						</figure>
					</a>
				</div>
			</div>
			<div class="col-md-3 w3agile_gallery_grid">
				<div class="w3agile_gallery_image">
					<a class="sb" title="quis nostrud exercitation ullamco laboris quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum" href="/lykj/static/images/index/10.jpg">
						<figure>
							<img src="/lykj/static/images/index/10.jpg" alt="" class="img-responsive" />
							<figcaption>
								<h4>dolore magna aliqua</h4>
								<p>
									Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
									tempor incididunt ut labore et dolore magna aliqua.
								</p>
							</figcaption>
						</figure>
					</a>
				</div>
			</div>
			<div class="col-md-3 w3agile_gallery_grid">
				<div class="w3agile_gallery_image">
					<a class="sb" title="quis nostrud exercitation ullamco laboris quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum" href="/lykj/static/images/index/11.jpg">
						<figure>
							<img src="/lykj/static/images/index/11.jpg" alt="" class="img-responsive" />
							<figcaption>
								<h4>dolore magna aliqua</h4>
								<p>
									Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
									tempor incididunt ut labore et dolore magna aliqua.
								</p>
							</figcaption>
						</figure>
					</a>
				</div>
			</div>
			<div class="col-md-3 w3agile_gallery_grid">
				<div class="w3agile_gallery_image">
					<a class="sb" title="quis nostrud exercitation ullamco laboris quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum" href="/lykj/static/images/index/12.jpg">
						<figure>
							<img src="/lykj/static/images/index/12.jpg" alt="" class="img-responsive" />
							<figcaption>
								<h4>dolore magna aliqua</h4>
								<p>
									Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
									tempor incididunt ut labore et dolore magna aliqua.
								</p>
							</figcaption>
						</figure>
					</a>
				</div>
			</div>
			<div class="col-md-3 w3agile_gallery_grid">
				<div class="w3agile_gallery_image">
					<a class="sb" title="quis nostrud exercitation ullamco laboris quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum" href="/lykj/static/images/index/13.jpg">
						<figure>
							<img src="/lykj/static/images/index/13.jpg" alt="" class="img-responsive" />
							<figcaption>
								<h4>dolore magna aliqua</h4>
								<p>
									Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
									tempor incididunt ut labore et dolore magna aliqua.
								</p>
							</figcaption>
						</figure>
					</a>
				</div>
			</div>
			<div class="col-md-3 w3agile_gallery_grid">
				<div class="w3agile_gallery_image">
					<a class="sb" title="quis nostrud exercitation ullamco laboris quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum" href="/lykj/static/images/index/14.jpg">
						<figure>
							<img src="/lykj/static/images/index/14.jpg" alt="" class="img-responsive" />
							<figcaption>
								<h4>dolore magna aliqua</h4>
								<p>
									Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
									tempor incididunt ut labore et dolore magna aliqua.
								</p>
							</figcaption>
						</figure>
					</a>
				</div>
			</div>
			<div class="col-md-3 w3agile_gallery_grid">
				<div class="w3agile_gallery_image">
					<a class="sb" title="quis nostrud exercitation ullamco laboris quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum" href="/lykj/static/images/index/15.jpg">
						<figure>
							<img src="/lykj/static/images/index/15.jpg" alt="" class="img-responsive" />
							<figcaption>
								<h4>dolore magna aliqua</h4>
								<p>
									Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
									tempor incididunt ut labore et dolore magna aliqua.
								</p>
							</figcaption>
						</figure>
					</a>
				</div>
			</div>
		   <div class="clearfix"> </div>
		</div>
		<script type="text/javascript" src="/lykj/static/js/index/smoothbox.jquery2.js"></script>
	</div>
<!-- //gallery -->
<!-- contact -->
	<div class="contact" id="contact" style="background:#ebebeb">
		<div class="col-md-6 w3agile_contact_left">
			<h3>报名</h3>

			<form action="/lykj/studentAdd" method="post">
		       <div class="form-group">
                   <div class="col-md-7 col-sm-10 col-xs-12" style="margin:10px 0">
                          <input type="text" id="name" name="name" placeholder="学生姓名" required="" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <div class="col-md-7 col-sm-10 col-xs-12" style="margin:10px 0">
                         <input type="text" onfocus="(this.type='date')"  name="age" placeholder="出生日期" required="" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      
                     <div class="form-group">
                        <div class="col-md-7 col-sm-10 col-xs-12" style="margin:10px 0">
                          <input type="text" id="mobile" name="mobile" placeholder="联系方式：填写手机号码"  required=""  class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <div class="col-md-7 col-sm-10 col-xs-12" style="margin:10px 0">
                          <input type="text" id="wechat" name="wechat" placeholder="微信号" required=""  class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <div class="col-md-7 col-sm-10 col-xs-12" style="margin:10px 0">
                          <input type="text" id="address" name="address" placeholder="地址" required="" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div> 
  
                      <div class="form-group">
                        <div class="col-md-12 col-sm-10 col-xs-12" style="margin:10px 0">
                        <label class="control-label">外语水平<span class="required">：</span>
                        </label>
                        <label class="radio-inline" style="margin:1px 0;"><input type="radio" name="base" value="有基础">有基础</label>
                        <label class="radio-inline"><input type="radio" name="base" value="无基础">无基础</label><br/>
                        </div>
                      </div> 
                    <div class="form-group">
                        <div class="col-md-7 col-sm-10 col-xs-12">
                          <input type="submit" value="Send">
                        </div>
                      </div> 
                    
			</form>
		</div>
		<div class="col-md-6 w3agile_contact_right">
			<h3><a href="index.html">我们的承诺</a></h3>
			<div class="col-xs-5 w3agile_contact_right_agileinfo">
				<h4 style="font-family: cursive;">1.	免费试课承诺</h4>
				<p><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>对于体验学员，可在本机构免费享有三节课的课程教学。给予孩子最直观的课程体验</p>
				<h4 style="font-family: cursive;">2.	服务承诺</h4>
				<p><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>学员可享受课前咨询，课后反馈，每周总结的服务工作。让家长随时随地跟进孩子的学习进度。</p>
				<h4 style="font-family: cursive;">3.	师资承诺</h4>
				<p><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>梨语一贯坚持“纯北美外教，纯外语教材”的教学理念。保证优质的教学水平。</p>
			</div>
			<div class="col-xs-7 w3agile_contact_right_agileinfo">
				<h3 style="margin: 10px;">扫面下方二维码<br/>客服小姐姐随时<br/>答复您的疑问。<br/></h3>
				<div class="agileits_social_icons">
					<img src="/lykj/static/images/index/QR_Code.jpg">
				</div>
			</div>
			<div class="clearfix"> </div>
			<div class="w3_copy_right">
				<p>Copyright &copy; 2018.Company name All rights reserved.More Templates- Collect from 梨语科技  </p>
				<p style="text-align:center">ICP备案/许可证编号为：粤ICP备18130389号</p>
			</div>
		</div>
		<div class="clearfix"> </div>
	</div>
<!-- //contact -->
<!-- for bootstrap working -->
<script src="/lykj/static/js/index/bootstrap1.js"></script>
<!-- //for bootstrap working -->
<!-- here stars scrolling icon -->
	<script type="text/javascript">
		$(document).ready(function() {
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			*/
								
			$().UItoTop({ easingType: 'easeOutQuart' });
								
			});
	</script>
<!-- //here ends scrolling icon -->
</body>
</html>