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

#container2 {
	min-width: 310px;
	max-width: 800px;
	height: 400px;
	margin: 0 auto
}
</style>
<body>

	<table align="center">
		<tr>
			<td id="container2"></td>
			<td id="container"></td>
		</tr>
	</table>



	<div id="sliders" >
		<table >
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
		ArrayList<Integer> kt_v = new ArrayList();
		ArrayList<Integer> lg_v = new ArrayList();
		ArrayList<Integer> skt_v = new ArrayList();
		ArrayList<String> category = new ArrayList();

		for (int j = 0; j < list.size(); j++) {

			if ("K".equals(list.get(j).getTelecom().substring(0, 1))) {

				kt_v.add(list.get(j).getPhone_price() * list.get(j).getPhone_amount());
				category.add(list.get(j).getOrderdate());
			}
			if ("L".equals(list.get(j).getTelecom().substring(0, 1))) {

				lg_v.add(list.get(j).getPhone_price() * list.get(j).getPhone_amount());
			}
			if ("S".equals(list.get(j).getTelecom().substring(0, 1))) {

				skt_v.add(list.get(j).getPhone_price() * list.get(j).getPhone_amount());
			}
		} //for

		request.setAttribute("kt_v", kt_v);
		request.setAttribute("lg_v", lg_v);
		request.setAttribute("skt_v", skt_v);
		request.setAttribute("category", category);
	%>

	<script type="text/javascript">
		// Set up the chart
		var kt_v = ${kt_v};
		var lg_v = ${lg_v};
		var skt_v = ${skt_v};
		var categoryItems = ${category};
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
				},
				backgroundColor : '#c1c1c1',
				width : 400
			},
			title : {
				text : 'phone 판매 내역'
			},
			subtitle : {
				text : '통신사별 연간 판매 내역'
			},
			plotOptions : {
				column : {
					depth : 25
				}
			},

			series : [ {
				name : "KT",
				data : kt_v

			}, {
				name : "LG",
				data : lg_v

			}, {
				name : "SKT",
				data : skt_v

			} ],
			xAxis : {
				categories : categoryItems
			},

			yAxis : {
				title : {
					text : '이 달 총 매출'
				}
			},
			legend : {
				layout : 'vertical',
				align : 'right',
				verticalAlign : 'middle',
				borderWidth : 0
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

		Highcharts.chart('container2', {
			chart : {
				backgroundColor : '#c1c1c1',
				width : 400

			},
			title : {
				text : 'phone 판매 내역'
			},

			subtitle : {
				text : '통신사별 판매내역'
			},
			xAxis : {
				categories : categoryItems
			},
			yAxis : {
				title : {
					text : '이 달 총 매출'
				}
			},
			legend : {
				layout : 'vertical',
				align : 'right',
				verticalAlign : 'middle'
			},

			series : [ {
				name : "KT",
				data : kt_v

			}, {
				name : "LG",
				data : lg_v

			}, {
				name : "SKT",
				data : skt_v

			} ]

		});
	</script>