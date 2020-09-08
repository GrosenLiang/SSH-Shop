<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0043)http://localhost:8080/mango/cart/list.jhtml -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

    <title>订单页面</title>
    <link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/cart.css" rel="stylesheet" type="text/css"/>

</head>
<body>

<div class="container header">
    <div class="span5">
        <div class="logo">
            <a href="index.action">
                <img src="${pageContext.request.contextPath}/image/r___________renleipic_01/logo.jpg" alt="果森商城"/>
            </a>
        </div>
    </div>
    <div class="span9">
        <div class="headerAd">
            <img src="${pageContext.request.contextPath}/image/header.jpg" width="320" height="50" alt="正品保障" title="正品保障"/>
        </div>
    </div>
    <%@ include file="menu.jsp"%>
</div>

<div class="container cart">

    <div class="span24">

        <div class="step step1">
            <ul>

                <li  class="current"></li>
                <li  >生成订单成功</li>
            </ul>
        </div>


        <table>
            <tbody>
            <tr>
                订单编号：<s:property value="order.oid"/>
            </tr>
            <tr>
                <th>图片</th>
                <th>商品</th>
                <th>价格</th>
                <th>数量</th>
                <th>小计</th>
            </tr>
            <s:iterator var="o" value="order.orderItems">
            <tr>
                <td width="60">
                    <%--<input type="hidden" name="id" value="22"/>--%>
                    <img src="${pageContext.request.contextPath}/<s:property value="#o.product.image"/>"/>
                </td>
                <td>
                    <a target="_blank"><s:property value="#o.product.pname"/></a>
                </td>
                <td align="center">
                    <s:property value="#o.product.shop_price"/>
                </td>
                <td class="quantity" width="60" align="center">
                     <s:property value="#o.count" />
                </td>
                <td width="140">
                    <span class="subtotal">￥<s:property value="#o.subtotal" /></span>
                </td>
            </tr>
            </s:iterator>
            </tbody>
        </table>
        <dl id="giftItems" class="hidden" style="display: none;">
        </dl>
        <div class="total">
            <em id="promotion"></em>
            商品金额: <strong id="effectivePrice">￥<s:property value="order.total" />元</strong>
        </div>

        <form id="orderForm" action="order_payOrder.action" method="post">
            <input type="hidden" name="oid" value="<s:property value="order.oid"/>"/>
            <div class="span24">
                <p>
                    收货地址：<input name="addr" type="text" value="<s:property value="order.user.addr"/>" style="width:350px" />
                    <br />
                    收货人&nbsp;&nbsp;&nbsp;：<input name="name" type="text" value="<s:property value="order.user.name"/>" style="width:150px" />
                    <br />
                    联系方式：<input name="phone" type="text"value="<s:property value="order.user.phone"/>" style="width:150px" />

                </p>
                <hr />
                <p>
                    选择支付方式：<br/>
                    <input type="radio" name="payMethod" checked value="alipay_<s:property value="order.total"/>"/>支付宝
                    <img src="${pageContext.request.contextPath}/bank_img/Alipay.jpg" align="middle" style="height: 66px;width: 166px" alt="支付宝"/>
                    <input type="radio" name="payMethod" value="wechatPay_<s:property value="order.total"/>"/>微信支付
                    <img src="${pageContext.request.contextPath}/bank_img/Wechatpay.jpg" align="middle" style="height: 66px;width: 166px" alt="微信支付"/>
                </p>
                <hr />
                <p style="text-align:right">
                    <a href="javascript:document.getElementById('orderForm').submit();">
                        <img src="./images/finalbutton.gif" width="204" height="51" border="0" />
                    </a>
                </p>
            </div>
        </form>
    </div>

</div>
<div class="container footer">
    <div class="span24">
        <div class="footerAd">
            <img src="image\r___________renleipic_01/footer.jpg" alt="我们的优势" title="我们的优势" height="52" width="950">
        </div>
    </div>
    <div class="span24">
        <ul class="bottomNav">
            <li>
                <a href="#">关于我们</a>
                |
            </li>
            <li>
                <a href="#">联系我们</a>
                |
            </li>
            <li>
                <a href="#">诚聘英才</a>
                |
            </li>
            <li>
                <a href="#">法律声明</a>
                |
            </li>
            <li>
                <a>友情链接</a>
                |
            </li>
            <li>
                <a target="_blank">支付方式</a>
                |
            </li>
            <li>
                <a target="_blank">配送方式</a>
                |
            </li>
            <li>
                <a >SHOP++官网</a>
                |
            </li>
            <li>
                <a>SHOP++论坛</a>

            </li>
        </ul>
    </div>
    <div class="span24">
        <div class="copyright">Copyright © 2018-2099 网上商城 版权所有</div>
    </div>
</div>
</body>
</html>