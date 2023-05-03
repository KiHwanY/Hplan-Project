<%@page import="hplan.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>H-PLAN</title>
<%@ include file="../include/header.jsp" %>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Anton' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Neucha' rel='stylesheet' type='text/css'>
  <script src="https://cpwebassets.codepen.io/assets/editor/iframe/iframeRefreshCSS-44fe83e49b63affec96918c9af88c0d80b209a862cf87ac46bc933074b8c557d.js"></script>
  <script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
  <script type="text/javascript">
  $(function() {
	content_list();
});
  
  function content_list() { /* 상품 콘텐츠 출력 */
		$.ajax({
			type: "post",
			url: "${path}/product_servlet/contentList.do",
			success: function(result) {
				$("#content").html(result);
			}
		});
	}
  
  
  </script>
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
#productList {margin-left: 50px; display: flex; flex-wrap: wrap; width: 1500px;}
#productTitle{margin-left: 50px; margin-bottom: 50px; font-size: 10px; font-weight: normal;}
#paging{text-align: center;}
.product {float: left; width: 480px;  text-align: left; border: 1px solid white; }
#p_name {
	font-size: 12px;
	color: #999999;
	display: flex;
	font-weight: normal;
	line-height: 18px;
	margin: 20px 0 0 7px;
	flex-direction: column;
	line-height: 0.75em;
	padding-left: 30px;
}
#p_price {
	font-size: 12px;
	color: #999999;
	font-style: italic;
	font-weight: normal;
	line-height: 18px;
	display: flex;
	margin: 10px 0 50px 7px;
	flex-direction: column;
	line-height: 0.75em;
	padding-left: 30px;
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
			<a href="${path}/main_servlet/outer.do"><img src="../img/img3.jpg"></a>
             </li>
             
             <li>
                <div>
                    <h3>TOP</h3>
                </div>
			<a href="${path}/main_servlet/top.do"><img src="../img/img5.jpg"></a>
             </li>
             
             <li>
                <div>
                    <h3>KNIT</h3>
                </div>
			<a href="${path}/main_servlet/knit.do"><img src="../img/img.jpg"></a>
             </li>
             
             <li>
                <div>
                    <h3>BOTTOM</h3>
                </div>
			<a href="${path}/main_servlet/bottom.do"><img src="../img/img6.jpg"></a>
             </li>
             
             <li>
                <div>
                    <h3>SHOES</h3>
                </div>
			<a href="${path}/main_servlet/shoes.do"><img src="../img/img7.jpg"></a>
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
<div id="content"></div>


<%@ include file="../include/footer.jsp" %>
</body>
</html>