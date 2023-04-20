<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Anton' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Neucha' rel='stylesheet' type='text/css'>
  <script src="https://cpwebassets.codepen.io/assets/editor/iframe/iframeRefreshCSS-44fe83e49b63affec96918c9af88c0d80b209a862cf87ac46bc933074b8c557d.js"></script>
  <script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<style>
/*GLOBALS*/
*{margin:0; padding:0; list-style:none;}

body, hmtl{background: #ecf0f1; font-family: 'Anton', sans-serif;}


#wrapper{
	width:600px;
	margin:50px auto;
	height:400px;
	position:relative;
	color:#fff;
	text-shadow:rgba(0,0,0,0.1) 2px 2px 0px;	
}

#slider-wrap{
	width:600px;
	height:400px;
	position:relative;
	overflow:hidden;
}

#slider-wrap ul#slider{
	width:100%;
	height:100%;
	
	position:absolute;
	top:0;
	left:0;		
}

#slider-wrap ul#slider li{
	float:left;
	position:relative;
	width:600px;
	height:400px;	
}

#slider-wrap ul#slider li > div{
	position:absolute;
	top:20px;
	left:35px;	
}

#slider-wrap ul#slider li > div h3{
	font-size:36px;
	text-transform:uppercase;	
}

#slider-wrap ul#slider li > div span{
	font-family: Neucha, Arial, sans serif;
	font-size:21px;
}

#slider-wrap ul#slider li img{
	display:block;
	width:100%;
  height: 100%;
}


/*btns*/
.btns{
	position:absolute;
	width:50px;
	height:60px;
	top:50%;
	margin-top:-25px;
	line-height:57px;
	text-align:center;
	cursor:pointer;	
	background:rgba(0,0,0,0.1);
	z-index:100;
	
	
	-webkit-user-select: none;  
	-moz-user-select: none; 
	-khtml-user-select: none; 
	-ms-user-select: none;
	
	-webkit-transition: all 0.1s ease;
	-moz-transition: all 0.1s ease;
	-o-transition: all 0.1s ease;
	-ms-transition: all 0.1s ease;
	transition: all 0.1s ease;
}

.btns:hover{
	background:rgba(0,0,0,0.3);	
}

#next{right:-50px; border-radius:7px 0px 0px 7px;}
#previous{left:-50px; border-radius:0px 7px 7px 7px;}
#counter{
	top: 30px; 
	right:35px; 
	width:auto;
	position:absolute;
}

#slider-wrap.active #next{right:0px;}
#slider-wrap.active #previous{left:0px;}


/*bar*/
#pagination-wrap{
	min-width:20px;
	margin-top:350px;
	margin-left: auto; 
	margin-right: auto;
	height:15px;
	position:relative;
	text-align:center;
}

#pagination-wrap ul {
	width:100%;
}

#pagination-wrap ul li{
	margin: 0 4px;
	display: inline-block;
	width:5px;
	height:5px;
	border-radius:50%;
	background:#fff;
	opacity:0.5;
	position:relative;
  top:0;
  
  
}

#pagination-wrap ul li.active{
  width:12px;
  height:12px;
  top:3px;
	opacity:1;
	box-shadow:rgba(0,0,0,0.1) 1px 1px 0px;	
}




/*Header*/
h1, h2{text-shadow:none; text-align:center;}
h1{	color: #666; text-transform:uppercase;	font-size:36px;}
h2{ color: #7f8c8d; font-family: Neucha, Arial, sans serif; font-size:18px; margin-bottom:30px;} 


a {
  text-decoration: none;
  color: #666;
  
}
a:hover {
  /* background-color: yellow; */
}


/*ANIMATION*/
#slider-wrap ul, #pagination-wrap ul li{
	-webkit-transition: all 0.3s cubic-bezier(1,.01,.32,1);
	-moz-transition: all 0.3s cubic-bezier(1,.01,.32,1);
	-o-transition: all 0.3s cubic-bezier(1,.01,.32,1);
	-ms-transition: all 0.3s cubic-bezier(1,.01,.32,1);
	transition: all 0.3s cubic-bezier(1,.01,.32,1);	
}
</style>

</head>
<body translate="no">
<%@ include file="../include/menu.jsp" %>
<div id="wrapper">
   	  <div id="slider-wrap">
      	  <ul id="slider">
          	 <li>
                <div>
                    <h3>OUTER</h3>
                </div>                
			<a href="#"><img src="../img/img3.jpg"></a>
             </li>
             
             <li>
                <div>
                    <h3>TOP</h3>
                </div>
			<a href="#"><img src="../img/img5.jpg"></a>
             </li>
             
             <li>
                <div>
                    <h3>KNIT</h3>
                </div>
			<a href="#"><img src="../img/img.jpg"></a>
             </li>
             
             <li>
                <div>
                    <h3>BOTTOM</h3>
                </div>
			<a href="#"><img src="../img/img6.jpg"></a>
             </li>
             
             <li>
                <div>
                    <h3>SHOES</h3>
                </div>
			<a href="#"><img src="../img/img7.jpg"></a>
             </li>
             
             
          </ul>
     
          <div class="btns" id="next"><i class="fa fa-arrow-right"></i></div>
          <div class="btns" id="previous"><i class="fa fa-arrow-left"></i></div>
          <div id="counter"></div>
          
          <div id="pagination-wrap">
            <ul>
            </ul>
          </div>
                  
      </div>
  
   </div>
   
   
   
    <script src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-2c7831bb44f98c1391d6a4ffda0e1fd302503391ca806e7fcc7b9b87197aec26.js"></script>
  <script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
      <script id="rendered-js" >

var pos = 0;

var totalSlides = $('#slider-wrap ul li').length;

var sliderWidth = $('#slider-wrap').width();


$(document).ready(function () {

  $('#slider-wrap ul#slider').width(sliderWidth * totalSlides);

	
  $('#next').click(function () {
    slideRight();
  });

  $('#previous').click(function () {
    slideLeft();
  });


  var autoSlider = setInterval(slideRight, 5000);


  $.each($('#slider-wrap ul li'), function () {

 
    var li = document.createElement('li');
    $('#pagination-wrap ul').append(li);
  });


  countSlides();

  pagination();

  $('#slider-wrap').hover(
  function () {$(this).addClass('active');clearInterval(autoSlider);},
  function () {$(this).removeClass('active');autoSlider = setInterval(slideRight, 3000);});

});
function slideLeft() {
  pos--;
  if (pos == -1) {pos = totalSlides - 1;}
  $('#slider-wrap ul#slider').css('left', -(sliderWidth * pos));


  countSlides();
  pagination();
}

function slideRight() {
  pos++;
  if (pos == totalSlides) {pos = 0;}
  $('#slider-wrap ul#slider').css('left', -(sliderWidth * pos));


  countSlides();
  pagination();
}
function countSlides() {
  $('#counter').html(pos + 1 + ' / ' + totalSlides);
}

function pagination() {
  $('#pagination-wrap ul li').removeClass('active');
  $('#pagination-wrap ul li:eq(' + pos + ')').addClass('active');
}
</script>
<script src="https://cpwebassets.codepen.io/assets/editor/iframe/iframeRefreshCSS-44fe83e49b63affec96918c9af88c0d80b209a862cf87ac46bc933074b8c557d.js"></script>
<hr>

<div style="width:100%">
<div style="width:100%;float:left;">
<style type="text/css">
#footer_top{ text-align: left;}
#footer_top .footer-top { border-top: 1px solid #e9e9e9; padding: 40px 0 35px; display: inline-block; width: 100%;}
#footer_top .comm-w {width: 1260px;margin: 0 auto;}
#footer_top .group h4 { margin-bottom: 24px;color: #666; font-size: 14px;font-weight: 600;}
#footer_top .cs {width: 38%;float: left; border-right: 1px solid #e9e9e9;}
#footer_top .cs p.call {color: #2e2b2d; font-size: 36px; line-height: 30px; font-weight: 500;font-family: 'Lato'; padding-bottom: 18px;}
#footer_top .cs p {line-height: 22px;font-size: 14px; color: #888;}
#footer_top .bank {width: 42%;float: left;border-right: 1px solid #e9e9e9; margin-left: 5%;}
#footer_top .bank p.call {color: #2e2b2d; font-size: 36px; line-height: 30px; font-weight: 500;font-family: 'Lato'; padding-bottom: 18px;}
#footer_top .bank p {line-height: 22px;font-size: 14px; color: #888;}
#footer_top .board {width: 9%;float: left; margin-left: 5%;}
#footer_top .board ul li {line-height: 22px; float: none;  width: 100%; margin-bottom: 0;}
#footer_top .board ul li a {font-size:14px;color:#666;}
#footer_top .board ul li a:hover {color:#000;}
#y_footer { width:100%; height: 210px; position:relative; border-top: 1px solid #e9e9e9; }
#y_footer .wrap { width:1260px; margin:0 auto; position:relative;  }
#y_footer img { position:absolute; top:55px; left:0; }
#y_footer address { position:absolute; left:100px; text-align:left; margin:50px 100px; font-style:normal; font-size:14px; line-height:1.6; color:#999; box-sizing:border-box; } 
#y_footer address .ad_ti {font-weight: 600; color:#666;}
#y_footer .escro_foot { position:absolute; right: 270px; top:0px; } 
#y_footer .escro_foot img {  height:80px; width:auto; }
</style>



<div id="footer_top">
	<div class="footer-top">
		<div class="comm-w clear dpi_wrap">
			
			<!-- CS CENTER -->
			<div class="group cs">
				<h4>CS CENTER</h4>
				<div class="con">
					<p class="call">010-0000-0000</p>
					<p class="s_txt">
						10:00 ~ 17:00<br> 
						토/일/공휴일 휴무<br>
                                                점심시간 오후 13:00~14:00
					</p>
				</div>
			</div>
			<!-- CS CENTER -->

			<!-- BANK ACCOUNT -->
			<div class="group bank">
				<h4>BANK ACCOUNT</h4>
				<div class="con">
					<p class="call">12300-00-000000</p>
					<p class="s_txt">
						국민은행<br> 
						예금주 : (주)STYLE IS YOU
					</p>
				</div>
			</div>
			<!-- BANK ACCOUNT -->

			<!-- BOARD -->
			<div class="group board">
				<h4>BOARD</h4>
				<div class="con">
					<ul>
						<!--<li><a href="/cscenter/consultReg.asp"><span>1:1문의</span></a></li>-->
						<li><a href="#"><span>문의게시판</span></a></li>
						<li><a href="#"><span>FAQ</span></a></li>
						<li><a href="#"><span>이용약관</span></a></li>
						<li><a href="#"><span>개인정보처리방침</span></a></li>
					</ul>
				</div>
			</div>
			<!-- BOARD -->
			
		</div>
	</div>
</div>




<footer id="y_footer">
	<div class="footer_wrap">
	<div class="wrap">
		<!-- <img src="/data/yedda/foot_logo.png"> -->
		<address>
				<span style="" class="footCopyrightbtn" onclick="onopen();" valign="absmiddle">사업자정보확인</span> 서울특별시 강남구 테헤란로14길 6 남도빌딩 2층, 3층, 4층<br>
				 대표자명: 윤기환<span class="bar">｜</span>사업자등록번호: 132-81-000000<span class="bar">｜</span>문의전화: 070-7777-7777<span class="bar">｜</span>팩스: 02-1234-1411<span class="bar"><br>
				</span> 통신판매신고: 제2018-서울역삼-0000호 <span class="bar">｜</span> 개인정보관리책임자: 윤기환 (drg4564@gmail.com)<br>
				<br>
				© 2019 <b> H-PLAN </b> ALL RIGHTS RESERVED.
		</address>

	</div>
</div>
</footer>

</div>
</div>

</body>
</html>


</body>
</html>