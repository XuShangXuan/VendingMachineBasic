<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Language" content="zh-tw">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="bootstrap4.0/bootstrap.min.css"/>
<!-- http:localhost:8085/VendingMachineShoppingCar/Login.jsp -->
<title>販賣機</title>
<script type="text/javascript" src="bootstrap4.0/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="bootstrap4.0/popper.min.js"></script>
<script type="text/javascript" src="bootstrap4.0/bootstrap.min.js"></script>
	<style type="text/css">
		.page {
			display:inline-block;
			padding-left: 10px;
		}
	</style>
	
	<script type="text/javascript">
	
		function addCartGoods(goodsID, buyQuantityIdx){
			console.log("goodsID:", goodsID);			
			var buyQuantity = document.getElementsByName("buyQuantity")[buyQuantityIdx].value;
			console.log("buyQuantity:", buyQuantity);
			const formData = new FormData();
			formData.append('action', 'addCartGoods');
			formData.append('goodsID', goodsID);
			formData.append('buyQuantity', buyQuantity);
			// 送出商品加入購物車請求
			const request = new XMLHttpRequest();
			// 第三個參數是代表非同步
			request.open("POST", "FrontEndAction.do", true);
			request.send(formData);
			// 接回XMLHttpRequest非同步請求回傳
			request.onreadystatechange = function() {
		        if (this.readyState == 4 && this.status == 200) {
		        	const result = JSON.parse(this.responseText);
		        	const cartSize = result.cartSize;
		            document.getElementById("CartGoodsSize").value = "購物車(" + cartSize + ")";
		            document.getElementsByName("buyQuantity")[buyQuantityIdx].value = 0;
		            alert("已加入購物車");
		      };
		   }
		}
		
		function clearCartGoods(){
			const formData = new FormData();
			formData.append('action', 'clearCartGoods');
			// 送出清空購物車商品請求
			const request = new XMLHttpRequest();
			// 第三個參數如果省略也代表非同步
			request.open("POST", "FrontEndAction.do");
			request.send(formData);
			document.getElementById("CartGoodsSize").value = "購物車(0)";
			alert("已清除購物車");
		}
		
	</script>
</head>

<body class="bg-light">
	<div class="pos-f-t fixed-top">
	    <div class="collapse" id="navbarColor01">
	      <div class="bg-dark p-4">
	        <h4 class="text-white">Collapsed content</h4>
	        <span class="text-muted">Toggleable via the navbar brand.</span>
	      </div>
	    </div>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	      <a class="navbar-brand" href="FrontEndAction.do?action=queryGoodsBySearchCondition">
		    <img src="DrinksImage/coffee.jpg" style="border-radius:50%;" width="30" height="24" class="d-inline-block align-text-top">
		    Vending Machine(${sessionScope.member.customerName})
		  </a>		  
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="navbar-toggler-icon"></span>
	      </button>
	      <div class="collapse navbar-collapse" id="navbarColor01">
	        <ul class="navbar-nav mr-auto">
	          <li class="nav-item">
	          	<a href="BackEndActionSearchGoods.do?goodsID=&keyword=&minPrice=&maxPrice=&sortByPrice=&stock=&status=&action=queryGoodsBySearchCondition&showPageCount=3&currentPage=1" class="text-light nav-link">後台頁面</a>
	          </li>
	        </ul>
	        <form action="FrontEndAction.do" method="get" class="form-inline">
        	  <input type="hidden" name="action" value="queryGoodsBySearchCondition"/>
			  <input type="hidden" name="currentPage" value="1"/>
		      <input  type="search" name="searchKeyword" value="${searchCondition.keyword}" class="form-control mr-sm-2" placeholder="搜尋商品名稱" aria-label="Search">
		      <button class="btn btn-outline-info my-2 my-sm-0" type="submit">搜尋</button>
		    </form>
		    &nbsp;&nbsp;
			<form class="form-inline" action="FrontEndAction.do" method="get">
				<input type="hidden" name="action" value="queryCartGoods"/>
				<input class="btn btn-outline-light my-2 my-sm-0" type="submit" id="CartGoodsSize" value="購物車(${fn:length(carGoods)})"/>
			</form>
		    &nbsp;&nbsp;
			<form class="form-inline" action="LoginAction.do" method="post">
				<input type="hidden" name="action" value="logout"/>
				<button class="btn btn-outline-success" type="submit">登出</button>
			</form>
	      </div>
	    </nav>
    </div>
	<br/>
	<br/>
	<br/>
	<div class="container">
		<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
		  <ol class="carousel-indicators">
		    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
		    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
		    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		  </ol>
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img class="d-block w-100" src="DrinksImage/220937.png">
		    </div>
		    <div class="carousel-item">
		      <img class="d-block w-100" src="DrinksImage/225541.png">
		    </div>
		    <div class="carousel-item">
		      <img class="d-block w-100" src="DrinksImage/230014.png">
		    </div>
		  </div>
		  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		  </a>
		</div>
		
		<br/>
		<c:forEach items="${searchCondition.goods}" var="good" varStatus="status">
			
			<c:if test="${status.first}">
				<div class="card-deck">
			</c:if>
			<c:if test="${status.count eq 4}">
				</div>
				<br/>
				<div class="card-deck">
			</c:if>
			  <div class="card">
			    <img src="DrinksImage/${good.goodsImageName}" class="card-img-top">
			    <div class="card-body">
			      <h5 class="card-title">${good.goodsName}</h5>
			      <h5 class="card-title">$${good.goodsPrice}</h5>
			      <p class="card-text">${good.goodsDescreption}</p>
			      <p class="card-text">剩餘數量/${good.goodsQuantity}</p>
			    </div>
			    <div class="card-footer">
			    	<div class="form-row">
					    <div class="col">
					      <input class="form-control" type="number" name="buyQuantity" min="1" max="${good.goodsQuantity}" placeholder="購買數量"/>
					    </div>
					    <div class="col" align="right">
					      <button type="button" class="btn btn-outline-success" onclick="addCartGoods(${good.goodsID},${status.index})">加入購物車</button>
					    </div>
			  		</div>
			    </div>
			  </div>
			<c:if test="${status.last}">
				</div>
			</c:if>
		</c:forEach>
		<br/>
		<div class="row">
			<div class="col">
				<ul class="pagination" style="float: right">
			      <c:if test="${searchCondition.page.currentPage != 1}">
				      <li class="page-item">				      
				        <a class="page-link" href="FrontEndAction.do?action=queryGoodsBySearchCondition&currentPage=1&searchKeyword=${searchCondition.keyword}">«</a>
				      </li>
				      <li class="page-item">
				        <a class="page-link" href="FrontEndAction.do?action=queryGoodsBySearchCondition&currentPage=${searchCondition.page.currentPage-1}&searchKeyword=${searchCondition.keyword}">‹</a>
				      </li>
			      </c:if>
			      <c:forEach begin="${searchCondition.page.startPage}" end="${searchCondition.page.endPage}" var="pageNum">
			      	<c:if test="${searchCondition.page.currentPage != pageNum}">
			      		<li class="page-item"><a class="page-link" href="FrontEndAction.do?action=queryGoodsBySearchCondition&currentPage=${pageNum}&searchKeyword=${searchCondition.keyword}"> ${pageNum}</a></li>
			      	</c:if>
			      	<c:if test="${searchCondition.page.currentPage == pageNum}">
			      		<li class="page-item active"><a class="page-link" href="FrontEndAction.do?action=queryGoodsBySearchCondition&currentPage=${pageNum}&searchKeyword=${searchCondition.keyword}"> ${pageNum}</a></li>
			      	</c:if>
			      </c:forEach>
			      <c:if test="${searchCondition.page.currentPage != searchCondition.page.pageTotalCount}">
				      <li class="page-item">
				        <a class="page-link" href="FrontEndAction.do?action=queryGoodsBySearchCondition&currentPage=${searchCondition.page.currentPage+1}&searchKeyword=${searchCondition.keyword}">›</a>
				      </li>
				      <li class="page-item">
				        <a class="page-link" href="FrontEndAction.do?action=queryGoodsBySearchCondition&currentPage=${searchCondition.page.pageTotalCount}&searchKeyword=${searchCondition.keyword}">»</a>
				      </li>
			      </c:if>
			    </ul>
		    </div>
		</div>
	</div>
</body>
</html>