<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'echartTry.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/echarts.common.min.js"></script>
    <!-- 引入jquery.js -->


  </head>
  
  <body>
   <div id="main" style="width: 600px;height:400px;"></div>
     <script type="text/javascript" src="js/jquery-1.12.4.js"></script>
   <script type="text/javascript">

   var myChart = echarts.init(document.getElementById('main'));
         // 显示标题，图例和空的坐标轴
         myChart.setOption({
             title: {
                 text: '异步数据加载示例'
             },
             tooltip: {},
             
             legend: {
                 data:['销量']
             },
             xAxis: {
                 data: []
             },
             //x轴传入的数据
             
             yAxis: {}, //y轴数据自动生成
             series: [{
                 name: '销量', //name=legend.data
                 type: 'bar',
                 data: []     //y轴传入数据
             }]
         });
          
       /*   myChart.showLoading();   */  //数据加载完之前先显示一段简单的loading动画
          
         var names=[];    //类别数组（实际用来盛放X轴坐标值）
         var nums=[];    //销量数组（实际用来盛放Y坐标值）
          alert("2");
         $.ajax({
         type : "post",
  /*        async : true,     */        //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
         url : "servlets",    //请求发送到TestServlet处
         data : {},
         dataType : "json",        //返回数据形式为json
         success : function(result) {
           alert("3");
             //请求成功时执行该函数内容，result即为服务器返回的json对象
             alert
             if (result) {
                    for(var i=0;i<result.length;i++){       
                       names.push(result[i].name);    //挨个取出类别并填入类别数组
                     }
                    for(var i=0;i<result.length;i++){       
                        nums.push(result[i].num);    //挨个取出销量并填入销量数组
                      }
                   alert(result[0].name);
                  
                    myChart.hideLoading();    //隐藏加载动画
                    myChart.setOption({        //加载数据图表
                        xAxis: {
                            data: names
                        },
                        series: [{
                            // 根据名字对应到相应的系列
                            name: '销量',
                            data: nums
                        }]
                    });
                     
             }
          
        },
         error : function(errorMsg) {
             //请求失败时执行该函数
         alert("图表请求数据失败!");
         myChart.hideLoading();
         }
    })
   

   
   
   
   
   
   
   
   </script>
  
  
  
  
   
  </body>
</html>
