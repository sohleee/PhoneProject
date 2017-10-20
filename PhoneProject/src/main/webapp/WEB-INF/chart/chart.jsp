<%@page import="java.util.ArrayList"%>
<%@page import="com.dto.cart.SalesDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style type="text/css">
#container, #sliders {
	min-width: 310px;
	max-width: 800px;
	margin: 0 auto;
}

#container {
	height: 400px;
}
</style>
<body>

	

	<div id="container"></div>
	<div id="sliders">
		<table>
			<tr>
				<td>Alpha Angle</td>
				<td><input id="alpha" type="range" min="0" max="45" value="15" />
					<span id="alpha-value" class="value"></span></td>
			</tr>
			<tr>
				<td>Beta Angle</td>
				<td><input id="beta" type="range" min="-45" max="45" value="15" />
					<span id="beta-value" class="value"></span></td>
			</tr>
			<tr>
				<td>Depth</td>
				<td><input id="depth" type="range" min="20" max="100"
					value="50" /> <span id="depth-value" class="value"></span></td>
			</tr>
		</table>
	</div>
	
<%
List<SalesDTO> list = (List<SalesDTO>) request.getAttribute("list");
ArrayList<Integer> iphone = new ArrayList();
ArrayList<Integer> galaxy = new ArrayList();
ArrayList<String> category =new ArrayList();


for (int j = 0; j < list.size(); j++) {
	
	if ("I".equals(list.get(j).getTelecom_num().substring(0,1))) {

		iphone.add(list.get(j).getPhone_price()*list.get(j).getPhone_amount());
		category.add(list.get(j).getOrderdate());
	}
	if ("G".equals(list.get(j).getTelecom_num().substring(0,1))) {

		galaxy.add(list.get(j).getPhone_price()*list.get(j).getPhone_amount());
	}
	
}//for

request.setAttribute("iphone", iphone);
request.setAttribute("galaxy", galaxy);
request.setAttribute("category", category);
%>
	
	<script type="text/javascript">
		// Set up the chart
		var iphoneArr= ${iphone};
		var galaxyArr= ${galaxy};
		var categoryItems= ${category};
		var chart = new Highcharts.Chart({
			chart : {
				renderTo : 'container',
				type : 'column',
				options3d : {
					enabled : true,
					alpha : 15,
					beta : 15,
					depth : 50,
					viewDistance : 25
				}
			},
			title : {
				text : 'phone82 판매 내역'
			},
			subtitle : {
				text : '통신사별 연간 판매 내역'
			},
			plotOptions : {
				column : {
					depth : 25
				}
			},

			series : [
					{
						name : "iphone",
						data : iphoneArr
							<%-- [
							
						<%=iphone.get(0).getPhone_price()*iphone.get(0).getPhone_amount()%>	,
						<%=iphone.get(1).getPhone_price()*iphone.get(1).getPhone_amount()%>	,
						<%=iphone.get(2).getPhone_price()*iphone.get(2).getPhone_amount()%> ,
						<%=iphone.get(3).getPhone_price()*iphone.get(3).getPhone_amount()%>	,
						<%=iphone.get(4).getPhone_price()*iphone.get(4).getPhone_amount()%>	,
						<%=iphone.get(5).getPhone_price()*iphone.get(5).getPhone_amount()%>	,
						<%=iphone.get(6).getPhone_price()*iphone.get(6).getPhone_amount()%>	,
						<%=iphone.get(7).getPhone_price()*iphone.get(7).getPhone_amount()%>	,
						<%=iphone.get(8).getPhone_price()*iphone.get(8).getPhone_amount()%>	,
						<%=iphone.get(9).getPhone_price()*iphone.get(9).getPhone_amount()%>	,
						<%=iphone.get(10).getPhone_price()*iphone.get(10).getPhone_amount()%>,
						<%=iphone.get(11).getPhone_price()*iphone.get(11).getPhone_amount()%>
						] --%>
					},
					{	<%-- [
							<%=iphone.get(0).getPhone_price()*iphone.get(0).getPhone_amount()%>	,
						<%=galaxy.get(1).getPhone_price()*galaxy.get(1).getPhone_amount()%>	,
						<%=galaxy.get(2).getPhone_price()*galaxy.get(2).getPhone_amount()%> ,
						<%=galaxy.get(3).getPhone_price()*galaxy.get(3).getPhone_amount()%>	,
						<%=galaxy.get(4).getPhone_price()*galaxy.get(4).getPhone_amount()%>	,
						<%=galaxy.get(5).getPhone_price()*galaxy.get(5).getPhone_amount()%>	,
						<%=galaxy.get(6).getPhone_price()*galaxy.get(6).getPhone_amount()%>	,
						<%=galaxy.get(7).getPhone_price()*galaxy.get(7).getPhone_amount()%>	,
						<%=galaxy.get(8).getPhone_price()*galaxy.get(8).getPhone_amount()%>	,
						<%=galaxy.get(9).getPhone_price()*galaxy.get(9).getPhone_amount()%>	,
						<%=galaxy.get(10).getPhone_price()*galaxy.get(10).getPhone_amount()%>,
						<%=galaxy.get(11).getPhone_price()*galaxy.get(11).getPhone_amount()%>
						] --%>
						name : "galaxy",
						data :galaxyArr
						
					}
					
				]
			,
			xAxis: {
	            categories:categoryItems
	        },
	        legend: {
	            layout: 'vertical',
	            align: 'right',
	            verticalAlign: 'middle',
	            borderWidth: 0
	        }
			
		});

		function showValues() {
			$('#alpha-value').html(chart.options.chart.options3d.alpha);
			$('#beta-value').html(chart.options.chart.options3d.beta);
			$('#depth-value').html(chart.options.chart.options3d.depth);
		}

		// Activate the sliders
		$('#sliders input').on('input change', function() {
			chart.options.chart.options3d[this.id] = parseFloat(this.value);
			showValues();
			chart.redraw(false);
		});

		showValues();
	</script>
	
	
