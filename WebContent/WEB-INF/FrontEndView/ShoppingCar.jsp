<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Language" content="zh-tw">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- http:localhost:8085/VendingMachineFinal/ShoppingCar.jsp -->
<link type="text/css" rel="stylesheet" href="bootstrap4.0/bootstrap.min.css"/>
<title>ShoppingCar</title>
<script type="text/javascript" src="bootstrap4.0/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="bootstrap4.0/popper.min.js"></script>
<script type="text/javascript" src="bootstrap4.0/bootstrap.min.js"></script>

	<script type="text/javascript">
	// Example starter JavaScript for disabling form submissions if there are invalid fields
	(function() {
	  'use strict';
	  window.addEventListener('load', function() {
	    // Fetch all the forms we want to apply custom Bootstrap validation styles to
	    var forms = document.getElementsByClassName('needs-validation');
	    // Loop over them and prevent submission
	    var validation = Array.prototype.filter.call(forms, function(form) {
	      form.addEventListener('submit', function(event) {
	        if (form.checkValidity() === false) {
	          event.preventDefault();
	          event.stopPropagation();
	        }
	        form.classList.add('was-validated');
	      }, false);
	    });
	  }, false);
	})();
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
	          </li>
	        </ul>
	        <form class="form-inline" action="FrontEndAction.do" method="get">
	        	<input type="hidden" name="action" value="queryGoodsBySearchCondition"/>
	        	<button type="submit" class="btn btn-outline-light my-2 my-sm-0">繼續購物</button>
		    </form>
		    &nbsp;&nbsp;
	        <form class="form-inline" action="FrontEndAction.do" method="post">
	        	<input type="hidden" name="action" value="clearCartGoods"/>
	        	<button type="submit" class="btn btn-outline-light my-2 my-sm-0">清空購物車</button>
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
		<table class="table border="1">
		  <thead class="thead-light">
		    <tr>
		      <th scope="col">購買商品清單</th>
		    </tr>
		  </thead>
		</table>
		
		<table class="table">
		  <thead>
		    <tr>
		      <th scope="col">商品編號</th>
		      <th scope="col">商品圖</th>
		      <th scope="col">商品名稱</th>
		      <th scope="col">價格</th>
		      <th scope="col">數量</th>
		    </tr>
		  </thead>
		  <c:if test="${not empty cartGoodsInfo}">
			  <tbody>
			  	<c:forEach items="${cartGoodsInfo.shoppingCartGoods}" var="good">
				    <tr>
				      <th scope="row">${good.goodsID}</th>
				      <td><img src="DrinksImage/${good.goodsImageName}" width="75" height="75"/></td>
				      <td>${good.goodsName}</td>
				      <td>${good.goodsPrice}</td>
				      <td>
				      	<div class="form-row">
					      	${good.buyQuantity}
				        </div>
				      </td>
				    </tr>
			    </c:forEach>
			    	<tr>
				      <th scope="row"></th>
				      <td></td>
				      <td></td>
				      <td>購買總額:</td>
				      <td>${cartGoodsInfo.totalAmount}</td>
				    </tr>
			  </tbody>
		  </c:if>
		</table>
		<c:if test="${not empty cartGoodsInfo}">
			<hr/>
			<br/>
			<form class="needs-validation" novalidate>
	            <div class="row">
	              <div class="col-md-6 mb-3">
	                <label for="firstName">First name <span class="text-muted">(選填)</span></label>
	                <input type="text" class="form-control" id="firstName" placeholder="" value="" required>
	                <div class="invalid-feedback">
	                  Valid first name is required.
	                </div>
	              </div>
	              <div class="col-md-6 mb-3">
	                <label for="lastName">Last name <span class="text-muted">(選填)</span></label>
	                <input type="text" class="form-control" id="lastName" placeholder="" value="" required>
	                <div class="invalid-feedback">
	                  Valid last name is required.
	                </div>
	              </div>
	            </div>
	
	            <div class="mb-3">
	              <label for="email">Email <span class="text-muted">(選填)</span></label>
	              <input type="email" class="form-control" id="email" placeholder="you@mail.com">
	              <div class="invalid-feedback">
	                Please enter a valid email address for shipping updates.
	              </div>
	            </div>
	
	            <div class="mb-3">
	              <label for="address">Address <span class="text-muted">(選填)</span></label>
	              <input type="text" class="form-control" id="address" placeholder="1234 Main St" required>
	              <div class="invalid-feedback">
	                Please enter your shipping address.
	              </div>
	            </div>
	        </form>
			
			<hr/>
			<form class="needs-validation" action="FrontEndAction.do" method="post" novalidate>
				<input type="hidden" name="action" value="buyGoods"/>
				<div class="form-row">
		  			<div class="col-3">
				      <label for="goodsPrice">投入金額</label>
				      <input type="number" name="inputMoney" max="100000" min="0" size="5" class="form-control" placeholder="輸入金額" required>
				      <div class="invalid-feedback">
				        尚未輸入金額!
				      </div>
				      <br/>
				      <button type="submit" class="btn btn-success">結帳</button>
				    </div>
				</div>
			</form>
			<br/>
		</c:if>
	</div>
</body>
</html>