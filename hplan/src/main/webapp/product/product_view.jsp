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

#container {margin-left: 200px; width: 1200px;}
#p_img {float: left;}

#line {color: gray; opacity: 50%; margin-left: 40px; padding-left: 49px;}


select {width: 233px; height: 21px; border: 1px solid gray; font-family: inherit;}
input {width: 227px; height: 17px; border: 1px solid gray; font-family: inherit;}
.TOTAL {font-size: 25px; padding-left: 100px;}
#review{width: 500px; height:100px; border: none; margin-top: 100px;}
#reDirectMessage{color: red; font-size: 11px;}
</style>
</head>
<body>
<%@ include file="../include/adminMenu.jsp" %>
<div id="container">

	<div id="contents">


		<!-- 상단 제품 정보(detail)  -->
		<div class="detail">
			<div class="detailArea ">

				<!-- 이미지 영역 -->
				<div id="p_img">
					<img src="${path}/img/${dto.pf_img}" 
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
											<span style="padding-left: 75px;">${dto.cate_name}</span>
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
											<span style="padding-left: 75px;">${dto.p_name}</span>
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
						<table id="tableDistance" frame="void" style="margin:10px 0 10px 0;">
							
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
								<th><span style="padding-left: 20px;">STOCK</span></th>
								<td style="padding-left: 85px; ">
								<span>
									<span style="padding-left: 75px;">${dto.p_stock}</span>
								</span>
								</td>
							</tr>
							<tr>
								<th><span  style="padding-left: 20px;">SELL</span></th>
								<td style="text-align: right;">
								<span>
									<span style="padding-left: 75px;">${dto.p_sell}</span>
								</span>
								</td>
							</tr>
							<tr>
								<th><span  style="padding-left: 20px;">ENROLL</span></th>
								<td style="text-align: right;">
								<span>
									<span style="padding-left: 75px;">${dto.p_enroll}</span>
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
					

					<!-- 구매, 장바구니 버튼 -->
					<table>
						<tr>
							<td class="TOTAL">
								TOTAL  ${map.sum}
							</td>
							<td>
								<span id="reDirectMessage"></span>
							</td>
						</tr>
						<tr>
							<td  class="addToCart" id="tableDistance" width="20px" style="padding-left: 25px;">
								<br></br><br><br>
								<a href="/tinynest/index.jsp?workgroup=product&work=product_btn_action&btn=0&item=164&amount=0">
									<img src="../joinimg/product_update.png" alt="상품 수정하기" width="100" height="40"/>
								</a>
							</td>
							<td  class="buyNow" id="tableDistance"  >
								<br></br><br><br>
								<a href="/tinynest/index.jsp?workgroup=product&work=product_btn_action&btn=1&item=164&amount=0">
									<img src="../joinimg/listbtn.png" alt="뒤로가기" width="100" height="40" />
								</a>
							</td>
						</tr>
					</table>
					<!-- //구매, 장바구니 버튼 -->
						
				</div>
				<!-- //detailText -->

			</div>
			<!-- //detail Area -->

		</div>
		<!-- //상단 제품 정보(detail) -->
			



	
		<!-- 하단부 -->
		<div style="padding-top: 300px; margin-top: 300px; ">
			
			
			<!-- 상품상세정보 -->
			<img src="/tinynest/product_image/knit hoody.png" alt="상품상세정보" />


		
				
			
		</div>
		<!-- //하단부 -->
	
	</div>
	<!-- contents -->
	
</div>

</body>
</html>