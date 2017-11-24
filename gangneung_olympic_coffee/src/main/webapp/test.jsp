<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>  
<script>
window.onload = function () {

	var chart = new CanvasJS.Chart("chartContainer", {
		animationEnabled: true,
		title:{
			text: "카페별 조회수",
			fontFamily: "arial black",
			fontColor: "#695A42"
		},
		axisY:{	//조회수
			valueFormatString:"#0",
			gridColor: "#B6B1A8",
			tickColor: "#B6B1A8"
		},
		toolTip: {
			shared: true,
			content: toolTipContent
		},
		data: [
			{
				type: "stackedColumn",
				showInLegend: true,
				color: "#696661",
				name: "남성",
				dataPoints: [
					{ y: 6.75, label: "TERAROSA" },
					{ y: 8.57, label: "Coffee Cupper" },
					{ y: 10.64, label: "L.BIN" },
					{ y: 13.97, label: "A.M Bread" },
				 	{ y: 15.42, label: "SANTORINI" },
					{ y: 17.26, label: "BOSA NOVA" }/*,
					{ y: 20.26, x: new Date(2016,0) } */
	 			]
			},
			{        
				type: "stackedColumn",
				showInLegend: true,
				color: "#EDCA93",
				name: "여성",
				dataPoints: [
					{ y: 6.82, label: "TERAROSA" },
					{ y: 9.02, label: "Coffee Cupper" },
					{ y: 11.80, label: "L.BIN" },
					{ y: 14.11, label: "A.M Bread" },
					{ y: 15.96, label: "SANTORINI" },
					{ y: 17.73, label: "BOSA NOVA" }/*,
					{ y: 21.5, x: new Date(2016,0) } */
				]
			}]
	});
	chart.render();
	
	function toolTipContent(e) {
		var str = "";
		var total = 0;
		var str2, str3;
		for (var i = 0; i < e.entries.length; i++){
			var  str1 = "<span style= \"color:"+e.entries[i].dataSeries.color + "\"> "+e.entries[i].dataSeries.name+"</span>: <strong>"+e.entries[i].dataPoint.y+"</strong><br/>";
			total = e.entries[i].dataPoint.y + total;
			str = str.concat(str1);
		}
		str2 = "<span style = \"color:DodgerBlue;\"><strong>"+(e.entries[0].dataPoint.label)+"</strong></span><br/>";
		total = Math.round(total * 100) / 100;
		str3 = "<span style = \"color:Tomato\">Total:</span><strong>"+total+"</strong><br/>";
		return (str2.concat(str)).concat(str3);
	}

}
</script>
</head>
<body>
<div id="chartContainer" style="height: 370px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>