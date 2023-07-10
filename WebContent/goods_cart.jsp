<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<title>购物车</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link type="text/css" rel="stylesheet" href="css/bootstrap.css">
	<link type="text/css" rel="stylesheet" href="css/style.css">
	<link type="text/css" rel="stylesheet" href="css/car.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="layer/layer.js"></script>
	<script type="text/javascript" src="js/cart.js"></script>
	<style>
		.car .img {
			width: 190px;
		}
		.car .img img {
			display: block;
			width: 80px;
			height: 80px;
			margin: 3px auto;
		}
		.car .name {
			width: 300px;
		}
		.car .name span {
			line-height: 1;
			margin-top: 8px;
			margin-bottom: 8px;
			font-size: 18px;
			font-weight: normal;
			text-overflow: ellipsis;
			white-space: nowrap;
			overflow: hidden;
		}
		.car .price {
			width: 144px;
			text-align: right;
			padding-right: 84px;
		}
		.car .price span {
			color: #ff6700;
			font-size: 16px;
		}
		.car .number{
			width: 150px;
		}
		.car .subtotal{
			width: 130px;

		}
		.car .ctrl {
			width: 105px;
			padding-right:25px;
			text-align: center;
		}
		.car .ctrl a {
			font-size: 20px;
			cursor: pointer;
			display: block;
			width: 26px;
			height: 26px;
			margin: 30px auto;
			line-height: 26px;
		}
		.car .ctrl a:hover {
			color: #FFF;
			background: #ff6700;
			border-radius: 50%;
		}
		.head_row {
			height: 70px;
			line-height: 70px;
		}
		.head_row, .row {
			border-bottom: solid 1px #e0e0e0;
		}
		.row {
			height: 86px;
			line-height:86px;
			padding: 15px 0;
			margin: 0px;
		}
		#sum_area{
			width:1240px;
			height: 60px;
			background: white;
			margin: 20px auto;
		}
		#sum_area #pay{
			width:250px;
			height:60px;
			text-align: center;
			float: right;
			line-height: 60px;
			font-size: 19px;
			background: #FF4B00;
			color: white;
		}
		#sum_area #pay_amout{
			width:250px;
			height:60px;
			text-align: center;
			float: right;
			line-height: 60px;
			font-size: 16px;
			color:#FF4B00 ;
		}
		#sum_area #pay_amout #price_num{
			width:100px;
			height: 60px;
			font-size: 25px;
			color:#FF4B00 ;
			/*	float: left;*/
		}

		.item_count_i{
			height: 85px;
			width:10%;
			/*border: 1px solid black;*/
			float: left;
			margin-right: 25px;
		}
		.num_count{
			width:150px;
			height:40px;
			border: 1.2px solid #E0E0E0;
			float:right;
			margin-top: 21px;

		}
		.count_i{
			width:30%;
			height:40px;
			line-height: 40px;
			float: left;
			text-align: center;
			font-size:21px;
			color: #747474;
		}
		.count_i:hover{
			width:30%;
			height:40px;
			line-height: 40px;
			float: left;
			text-align: center;
			font-size:21px;
			color: #747474;
			background: #E0E0E0;
			cursor: pointer;
		}
		.c_num{
			width:40%;
			height:40px;
			line-height: 40px;
			float: left;
			text-align: center;
			font-size:16px;
			color: #747474;
		}
		.count_d{
			width:30%;
			height:40px;
			line-height: 40px;
			float: left;
			text-align: center;
			font-size:25px;
			color: #747474;
		}
		.count_d:hover{
			width:30%;
			height:40px;
			line-height: 40px;
			float: left;
			text-align: center;
			font-size:25px;
			color: #747474;
			background: #E0E0E0;
			cursor: pointer;
		}
		.i_acity2 {
			border-color: #ff6700 !important;
			background-color: #ff6700 !important;
		}
	</style>
</head>
<body>







<!--header-->
<jsp:include page="header.jsp">
	<jsp:param name="flag" value="7"></jsp:param>
</jsp:include>
<!--//header-->


<!--cart-items-->
<div class="cart-items">
	<div class="container">

		<h2>我的购物车</h2>
		<c:forEach items="${order.itemMap }" var="item">
		<div class="public-shop-cart">
			<div class="content">
				<div class="cart-title">
            <span>
            <li></li>
            </span>
					<span>商品名称： <a href=""><a href="/goods_detail?id=${item.key}">${item.value.goods.name}</a></a></span>
						<%--            <span>商品名称</span>--%>
					<span>单价</span>
					<span>数量</span>
					<span>小计</span>
					<span>操作</span>

				</div>
				<div class="cart-detail"3>
					<li></li>
					<div class="cart-title">
						<a href="/goods_detail?id=${item.key}">
							<img src="${pageContext.request.contextPath }${item.value.goods.cover}" class="img-responsive">
						</a>
						<div>
								<%--                    <a href=""><a href="/goods_detail?id=${item.key}">${item.value.goods.name}</a></a>--%>

						</div>
					</div>
					<div class="cart-price">&yen;${item.value.price}</div>
					<div class="cart-number">
						<span class="sub"><a href="javascript:buy(${item.key});">+</a></span> <input type="text" id="mumber" value="${item.value.amount}"><span class="plus"><a href="javascript:lessen(${item.key});">-</a></span>
					</div>
					<div class="cart-subtotal">&yen;${order.total}</div>
					<div class="cart-oprate"><a href="javascript:deletes(${item.key});">删除</a></div>
				</div>
				</c:forEach>

			</div>

		</div>


		<div class="cart-header col-md-12">
			<hr>
			<h3>订单总金额: ¥ ${order.total}</h3>
			<a class="btn btn-success btn-lg" style="margin-left:74%;" href="/order_submit">提交订单</a>
		</div>



	</div>
</div>
<!--//cart-items-->






<!--footer-->
<jsp:include page="footer.jsp"></jsp:include>
<!--//footer-->


</body>
</html>