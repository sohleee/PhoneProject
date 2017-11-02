<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<table  class="table table-hover" style="margin: auto;">


	<tr >
		<th class="td_default" style="text-align:center;">
		<input type="checkbox"
			name="allCheck" id="allCheck" > 선택</th>
		<th class="td_default" style="text-align:center;" >주문번호</th>
		<th class="td_default" style="text-align:center;"colspan="2">상품정보</th>
		<th class="td_default" style="text-align:center;">판매가</th>
		<th class="td_default" style="text-align:center;" colspan="2">수량</th>
		<th class="td_default" style="text-align:center;">합계</th>
		<th colspan="2" style="text-align:center;">기능</th>
	</tr>

	
	<c:if test="${fn:length(cartList)==0}">
		

		<tr>
			<td class="td_default" align="center" colspan="8">카트에 추가된 상품이 없습니다.</td>
		</tr>
	</c:if>

	<c:if test="${fn:length(cartList)!=0}">
		


		<form id="myForm">
			<c:forEach var="xxx" items="${cartList}">

	<input type="hidden" id="phone_price${xxx.num}" value="${xxx.phone_price}">
	<input type="hidden" id="phone_image${xxx.num}" value="${xxx.phone_image}">
	<input type="hidden" id="phone_name${xxx.num}" value="${xxx.phone_name}">
	<input type="hidden" id="telecom_num${xxx.num}" value="${xxx.telecom_num}">
	<input type="hidden" id="telecom${xxx.num}" value="${xxx.telecom}">
				<tr id="cartItem${xxx.num}" style="text-align:center;">
					<td class="td_default" width="80">
						<!-- checkbox는 체크된 값만 서블릿으로 넘어간다. 따라서 value에 삭제할 num값을 설정한다. --> 
						<input type="checkbox" name="check" id="check${xxx.num}" class="check"
						value="${xxx.num}"> <br>
					</td>
					<td class="td_default" width="80">${xxx.num}</td>
					<td class="td_default" width="80">
					<img src="images/${xxx.phone_image}" border="0" align="center" width="80" /></td>
						
					<td class="td_default" width="300">
					${xxx.phone_name}
					</td>
					<td class="td_default" align="center" width="110">
						
					<fmt:formatNumber value="${xxx.phone_price}" type="currency" /></td>
					<td class="td_default" align="center" width="90">
					<input class="input_default" type="text" name="phone_amount"
						id="phone_amount${xxx.num}"  style="text-align: right" maxlength="3"
						size="2" value="${xxx.phone_amount}"></input></td>
					<td><input type="button" value="수정" data-num="${xxx.num}"
						id="amountUpdate" class="btn btn-default"/></td>
					<td class="td_default" align="center" width="80"
						style='padding-left: 5px'><span id="sum${xxx.num}"> <fmt:formatNumber
								value="${xxx.phone_price * xxx.phone_amount}" type="currency" />
					</span></td>
					<td><input type="button"  class="btn btn-default" data-num="${xxx.num}"id="order"value="주문"><br>

					</td>
					<td class="td_default" align="center" width="30"
						style='padding-left: 10px'>
						<input type="button" id="delCart" class="btn btn-default" name="delCart" data-num="${xxx.num}" value="삭제"
						></td>
					
				</tr>

			</c:forEach>

		</form>
		<tr>
			<td colspan="10" align="right">
		<input type="button" class="btn btn-default" id="deleteCheckItem" value="전체 삭제하기 "> &nbsp;&nbsp;&nbsp;&nbsp;
			</td>
		</tr>
	
	</c:if>
</table>


<script>
	$(document).ready(function() {
		$("#amountUpdate").on("click", function() {
			var num = $(this).attr("data-num");
			console.log(num);
			var phone_amount = $("#phone_amount" + num).val();
			var phone_price = $("#phone_price" + num).val();
			$.ajax({
				type : "get",
				url : "amountUpdate",
				dataType : "text",
				data : {
					num : num,
					phone_amount : phone_amount,
					phone_price:phone_price
				},

				success : function(responseData, status, xhr) {

					console.log(responseData);
					$("#sum" + num).empty();
					var value = (phone_amount * phone_price).toLocaleString();
					$("#sum" + num).wrapInner("￦" + value);
				},
				error : function(xhr, status, e) {

					console.log(e);

				}
			});

		});

		$("[name=delCart]").on("click", function() {
			var num = $(this).attr("data-num");
			console.log(num);

			$.ajax({
				type : "get",
				url : "delCart",
				dataType : "text",
				data : {
					num : num,
				},

				success : function(responseData, status, xhr) {

					console.log(responseData);

					$("#cartItem" + num).remove();
				},
				error : function(xhr, status, e) {

					console.log(e);

				}
			});

		});
		$("#allCheck").on("click", function() {
			if ($('input:checkbox[id="allCheck"]').is(":checked")) {
				$("input[name=check]:checkbox").prop('checked', true);
					
				/* $("input[name=check]:checkbox").each(function() {
					$(this).attr("checked", true);
				}); */
			} else {
				$("input[name=check]:checkbox").prop('checked', false);

				/* $("input[name=check]:checkbox").each(function() {
					$(this).attr("checked", false);
				}); */
			}

		})
		$("#deleteCheckItem").on("click", function() {

			console.log($("#myForm").serialize());

			$.ajax({
				type :"get",
				url : "deleteItems",
				dataType : "text",
				data : $("#myForm").serialize(),

				success : function(responseData, status, xhr) {

					console.log(responseData);

				},
				error : function(xhr, status, e) {

					console.log(e);

				}
			});
			var checked = $(":checked");
			$.each(checked, function(idx, v) {
				$("#cartItem" + v.value).remove();
			});

			/* 	$("input[name=check]:checked").each(function() {
			 var num = $(this).val();
			 $.ajax({
			 type : "get",
			 url : "deleteItem",
			 dataType : "text",
			 data : {
			 num : num
			 },

			 success : function(responseData, status, xhr) {

			 console.log(responseData);
			 $("#cartItem" + num).remove();
			 },
			 error : function(xhr, status, e) {

			 console.log(e);

			 }
			 });
			 }); */
		});
		
		$("#order").on("click",function(){
			/* order?phone_model_num=${dto.phone_model_num}
			&phone_name=${dto.phone_name}&phone_price=${dto.phone_price}&phone_image=${dto.phone_image}
			&telecom_num=${dto.telecom_num}&telecom=${dto.telecom}&phone_amount=1 */
			var num = $(this).attr("data-num");
			var phone_name= $("#phone_name"+num).val();
			var phone_price=$("#phone_price"+num).val();
			var phone_image=$("#phone_image"+num).val();
			var phone_amount=$("#phone_amount"+num).val();
			var telecom_num=$("#telecom_num"+num).val();
			var telecom=$("#telecom"+num).val();
			var url="order?phone_model_num="+num+"&phone_name="+phone_name+"&phone_price="+phone_price+"&phone_image="+phone_image
					+"&telecom_num="+telecom_num+"&telecom="+telecom+"&phone_amount="+phone_amount;
			$(location).attr('href', url);
		});
	});
</script>

<c:if test="${!empty requestScope.amountUpdate }">
	<script>
		alert('${requestScope.amountUpdate}');
	</script>
</c:if>









