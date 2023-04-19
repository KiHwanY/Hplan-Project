<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Hplan</title>
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
</style>
</head>
<body>
<%@ include file="../include/adminMenu.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 수정 </h1>
		</div>
	</div>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<div class="container">
		<form name="product_Update" id="product_Update"  enctype="multipart/form-data"
		class="form-horizontal" method="post">
			<div class="form-group row">
				<label class="col-sm-2">CATEGOLY</label>
				<div class="col-sm-3">
					<select class="form-control" name="cate_name" id="cate_name">
						<option value="cate" selected>선택</option>
						<option value="outer">OUTER</option>
						<option value="top">TOP</option>
						<option value="knit">KNIT</option>
						<option value="bottom">BOTTOM</option>
						<option value="shoes">SHOES</option>
					</select>
				</div>
			</div>
			<br>
			<div class="form-group row">
				<label class="col-sm-2">상품명</label>
				<div class="col-sm-5">
					<input type="text" name="p_name" id="p_name" class="form-control" value="${dto.p_name}">
				</div>
			</div>
			<br>
			<div class="form-group row">
				<label class="col-sm-2">가격</label>
				<div class="col-sm-5">
					<input type="text" name="p_price" id="p_price" class="form-control" value="${dto.p_price}">
				</div>
			</div>
			<br>
			<div class="form-group row">
				<label class="col-sm-2">상세 정보</label>
				<div class="col-sm-5">
					<textarea name="p_info" id="p_info" cols="50" rows="2" class="form-control" >${dto.p_info} </textarea>
				</div>
			</div>	
			<br>		
			<div class="form-group row">
				<label class="col-sm-2">재고 수</label>
				<div class="col-sm-5">
					<input type="text" name="p_stock" id="p_stock" class="form-control" value="${dto.p_stock}">
				</div>
			</div>
			<br>
			<div class="form-group row">
				<label class="col-sm-2">상품 이미지</label>
				<div class="col-sm-3">
					 <c:if test="${dto.pf_img != null}">
					    ${dto.pf_img}
					    <input type="checkbox" name="fileDel">첨부파일 삭제 <br>
					   </c:if>
					  <input type="file" name="file1"  class="form-control">
				</div>
			</div>
			<br>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10" align="center">
					<input type="hidden" id="product_id" value="${dto.product_id}">
					<input type="button" class="btn btn-primary" value="상품 수정" id="btnUpdate">
					<input type="button" class="btn btn-light" value="취소" id="btnreset">
					<input type="button" class="btn btn-dark" value="상품 삭제" id="btndelete">
				</div>
			</div>
			
		</form>
		
	</div>
<script type="text/javascript">
$(function() {
	$("#btnUpdate").click(function() {
		
		var form1 = document.product_Update;
		
		
		if(form1.cate_name.value == "cate"){
			alert("카테고리를 선택하세요.");
			return false;
		}
		if(!form1.p_name.value){
			alert("상품명을 입력하세요.");
			return false;
		}
		if(!form1.p_price.value){
			alert("상품 가격을 입력하세요.");
			return false;
		}
		if(!form1.p_info.value){
			alert("상품 상세정보를 입력하세요");
			return false;
		}
		if(!form1.p_stock.value){
			alert("상품 재고 수를 입력하세요.");
			return false;
		}
		
		document.product_Update.action = "${path}/product_servlet/product_update.do?product_id=${dto.product_id}";
		document.product_Update.submit();
	});
	
	$("#btnreset").click(function() {
		if(confirm("상품 등록을 취소하시겠습니까?")){
			document.product_Update.action="../admin/adminForm.jsp";
			document.product_Update.submit();
				
		}
	});
	
	$("#btndelete").click(function() {
		if(confirm("상품을 삭제하시겠습니까?")){
			document.product_Update.action="${path}/product_servlet/product_delete.do?product_id=${dto.product_id}";
			document.product_Update.submit();
		}
			
	})
})


</script>	
	
	</body>
</html>