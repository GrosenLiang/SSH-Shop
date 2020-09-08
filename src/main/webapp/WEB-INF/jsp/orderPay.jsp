<%--
  Created by IntelliJ IDEA.
  User: liangguoshen
  Date: 2020/9/6
  Time: 22:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
    <head>
        <title>请在5分钟之内完成付款</title>
        <script>
            function checkOrderState() {
                var oid = document.getElementById("oid").value;
                //1.创建异步对象
                var xhr = createXmlHttp();
                //2.设置监听
                xhr.onreadystatechange = function () {
                    if (xhr.readyState == 4) {
                        if (xhr.status == 200) {
                            console.log(xhr.responseText);
                            if(xhr.responseText == 2){
                                window.location.href = "${pageContext.request.contextPath}/order_orderSuccess.action?oid="+oid+"&amp;time="+new Date().getTime();
                            }
                        }
                    }
                }
                //3.打开连接
                xhr.open("GET","${pageContext.request.contextPath}/order_checkOrderState.action?oid="+oid+"&amp;time="+new Date().getTime(),true);
                //4.发送
                xhr.send(null);
            }

            function createXmlHttp() {
                var xmlHttp;
                if (window.XMLHttpRequest) {
                    xmlHttp = new XMLHttpRequest();
                } else{
                    xmlHttp = new ActiveXObject("Microsoft.XMLHttp");
                }
                return xmlHttp;
            }
        </script>

    </head>
    <body onload="setInterval(checkOrderState,5000)">
        <h1>请在5分钟之内完成付款！过期付款无效！</h1>
        <img src="<s:property value="payImg"/>">
        <input type="hidden" id="oid" value="<s:property value="oid"/>">
    </body>
</html>
