<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>join</title>
<%@ include file="../include/header.jsp" %>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Anton' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Neucha' rel='stylesheet' type='text/css'>
 <script src="https://cpwebassets.codepen.io/assets/editor/iframe/iframeRefreshCSS-44fe83e49b63affec96918c9af88c0d80b209a862cf87ac46bc933074b8c557d.js"></script>
 <script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
 <style type="text/css">
 *{margin:0; padding:0; list-style:none;}
a{text-decoration:none;	color:#666;}
a:hover{color:#1bc1a3;}
body, hmtl{background: #ecf0f1; font-family: 'Anton', sans-serif;}
	
a {text-decoration-line: none; }

#home{
position: absolute;
width: 40px;
height: 34px;
left: 0px;
top: 45px;

font-style: normal;
font-weight: 400;
font-size: 10px;
line-height: 29px;
color: black;
}
p {
font-family: 'Inter';
font-style: normal;
font-weight: 400;
font-size: 3px;
line-height: 18px;
}
h1, h2{text-shadow:none; text-align:center;}
h1{	color: #666; text-transform:uppercase;	font-size:36px;}
h2{ color: #7f8c8d; font-family: Neucha, Arial, sans serif; font-size:18px; margin-bottom:30px;} 
span{ font-size: 12px; color: #999999;}
#container {margin-left: 200px; width: 1200px;}
#pf_img {float: left;}

#line {color: gray; opacity: 50%; margin-left: 40px; padding-left: 49px;}


select {width: 233px; height: 21px; border: 1px solid gray; font-family: inherit;}
input {width: 227px; height: 17px; border: 1px solid gray; font-family: inherit;}
.TOTAL {font-size: 25px; padding-left: 100px; color: #999999;}
#review{width: 500px; height:100px; border: none; margin-top: 100px;}
#reDirectMessage{color: red; font-size: 11px;}
</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<form method="post" id="productCart" name="productCart">
<div id="container">

	<div id="contents">


	<!-- 상단 제품 정보(detail)  -->
		<div class="detail">
			<div class="detailArea ">

				<!-- 이미지 영역 -->
				<div id="pf_img" name="pf_img">
					<img src="/upload/${dto.pf_img}"
					alt="대표이미지" width="470px;" height="470px;" />
				</div>
				<!-- 카테고리 -->
					<div>
					<table id="cate_name" frame="void">
						
						<tbody>
							<tr>
								<th><span style="padding-left: 20px;">CATEGORY</span></th>
									<td>
										<span style="padding-left: 45px;">
											<span style="padding-left: 75px;" >${dto.cate_name}</span>
										</span>
									</td>
								</tr>
						</tbody>
					</table>
				</div>	
				<!-- 구분선 -->
				<span id="line">
					───────────────────────────────────
				</span>
				<!-- 제품명  -->
				<div>
					<table id="p_name" frame="void">
						
						<tbody>
							<tr>
								<td style="padding-left: 110px;">
									<span>
										<span style="padding-left: 75px; font-size: 10px;">${dto.p_name}</span>
									</span>
									</td>
								</tr>
						</tbody>
					</table>
				</div>	
				
				
				<!-- 구분선 -->
				<span id="line">
					───────────────────────────────────
				</span>
					<!-- detailText -->
				<div class="detailText">
					<div>
						<table id="p_info" frame="void" style="margin:10px 0 10px 0;">
							
							<tbody>
								<tr>
									<th><span style="padding-left: 20px;">Info</span></th>
									<td style="padding-left: 65px;" align="left">
										<span>
											<span style=" font-size: 10px;">${dto.p_info}</span>
										</span>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<!-- 구분선 -->
				<span id="line">
					───────────────────────────────────
				</span>


				<!-- detailText -->
				<div class="detailText">
					<div>
						<table id="p_price" frame="void" style="margin:10px 0 10px 0;">
							
							<tbody>
								<tr>
									<th><span style="padding-left: 20px;">PRICE</span></th>
									<td style="padding-left: 65px;">
										<span>
											<span style="padding-left: 75px;">${dto.p_price}</span>원
										</span>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					

					<!-- 상품옵션 -->
					<table id="tableDistance" frame="void" style="margin-bottom: 10px;">
						<tbody>
							<tr>
								<th><span style="padding-left: 20px;">Color</span></th>
								<td style="padding-left: 35px; ">
								<span>
									<span style="padding-left: 5px;">
									<select name="color_option">
											<option value="one">One Color style</option>
									</select>
									</span>
								</span>
								</td>
							</tr>
					
							<tr>
								<th><span  style="padding-left: 20px;">SIZE</span></th>
								<td style="padding-left: 35px; ">
								<span>
									<span style="padding-left: 5px;">
									<select name="size_option">
											<option value="size" selected>SIZE</option>
											<option value="M">M(90~95)</option>
											<option value="L">L(100~105)</option>
											<option value="XL">XL(105~FRLL)</option>
									</select>
									</span>
								</span>
								</td>
							</tr>
						</tbody>
					</table>
					<!-- //상품옵션 -->
					
					<!-- 구분선 -->
					<span id="line">
						───────────────────────────────────
					</span>
					
					<!-- 여백 -->
					<table style="margin-bottom: 3px"/>
					

					<!-- total 금액 표출-->
					<table>
						<tr>
							<td class="TOTAL" style="padding-left: 85px; " >
								TOTAL  ${sum}
							</td>
						
						</tr>
						<tr>
							<td  class="addToCart" id="cateCheck" width="20px" style="padding-left: 25px;">
								<br></br><br><br>
								<input type="hidden" id="product_id" name="product_id" value="${dto.product_id}">
								<a href="${path}/cart_servlet/productinit.do">
									<img src="../joinimg/cartimg.png" alt="상품 담기" width="100" height="40"/>
								</a>
							</td>
							<td  class="buyNow" id="tableDistance"  >
								<br></br><br><br>
								<a href="${path}/product_servlet/product_list.do">
									<img src="../joinimg/listbtn.png" alt="뒤로가기" width="100" height="40" />
								</a>
							</td>
						</tr>
					</table>
				
						
				</div>
				<!-- //detailText -->

			</div>
			<!-- //detail Area -->

		</div>
		<!-- //상단 제품 정보(detail) -->
			<br><hr>



	
		<!-- 하단부 -->
		<div style="padding-top: 50px; margin-top: 50px;" align="center">
			
			
			<!-- 상품상세정보 -->
			<img src="/upload/${dto.product_img}" width="1000px;"  alt="상품상세정보" />


		
				
			
		</div>
		<!-- //하단부 -->
	
	</div>
	<!-- contents -->
	
</div>
</div>
</form>
<div style="position: fixed; bottom: 40px; right: 5px">
<a href="#p_img">TOP</a>
</div>
</body>
</html>