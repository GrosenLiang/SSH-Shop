package com.grosen.sshShopping.order.action;

import com.grosen.sshShopping.cart.vo.Cart;
import com.grosen.sshShopping.cart.vo.CartItem;
import com.grosen.sshShopping.order.service.OrderService;
import com.grosen.sshShopping.order.vo.Order;
import com.grosen.sshShopping.order.vo.OrderItem;
import com.grosen.sshShopping.user.vo.User;
import com.grosen.sshShopping.utils.HttpClientUtil;
import com.grosen.sshShopping.utils.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;


/**
 * @author Grosen
 * @create 2020-09-03 11:37
 */
public class OrderAction extends ActionSupport implements ModelDriven<Order> {
    //注入订单service
    private OrderService orderService;

    //接受我的订单分页page
    private Integer page;

    //接受oid
    //private Integer oid;
    private Order order = new Order();

    //用于接收采用的银行的编号
    private String payMethod;

    //用于后台发送post请求
    HttpClientUtil httpClientUtil = new HttpClientUtil();

    //生成订单
    public String creatOrder(){
        //将order存入数据库
        //封装order
        Order order = new Order();
        //封装总价---从购物车信息获得
        //h获得购物车
        Cart cart = (Cart)ServletActionContext.getRequest().getSession().getAttribute("cart");
        //判断（因为有可能别人直接访问action，制作空订单，修改价格）
        if(cart == null){
            this.addActionError("您还没有购物！请先购物！");
            return "msg";
        }
        order.setTotal(cart.getTotal());
        //设置所属用户
        User existUser = (User)ServletActionContext.getRequest().getSession().getAttribute("existUser");
        if(existUser == null){
            this.addActionError("您还没有登录！请先登录！");
            return "msg";
        }
        order.setUser(existUser);
        //封装时间
        order.setOrdertime(new Date());
        //封装状态
        order.setState(1);//1未付款，2已经付款，3已经发货，没有确认收货，4订单完成
        //为订单设置订单项集合
        for(CartItem cartItem : cart.getCartItems()){
            //将购物车的数据封装到订单项中
            OrderItem orderItem = new OrderItem();
            orderItem.setCount(cartItem.getCount());
            orderItem.setSubtotal(cartItem.getSubtotal());
            orderItem.setProduct(cartItem.getProduct());
            orderItem.setOrder(order);
            //放入订单的集合
            order.getOrderItems().add(orderItem);
        }

        //购物车清空
        cart.clearCart();
        //调用service保存订单操作
        orderService.save(order);
        //存入值栈到前台
        ActionContext.getContext().getValueStack().set("order",order);
        return "creatOrderSuccess";
    }

    //查询我的订单
    public String findByUid(){
        //获得用户id
        User existUser = (User) ServletActionContext.getRequest().getSession().getAttribute("existUser");
        //调用service
        PageBean<Order> pageBean = orderService.findByPageUid(existUser.getUid(),page);
        //将分页数据显示
        ActionContext.getContext().getValueStack().set("pageBean",pageBean);
        return "findByUidSuccess";
    }

    //根据订单的id查询
    public String findByOid(){
        //根据oid查询订单
        Order order1 = orderService.findByOid(order.getOid());
        //保存订单对象
        ActionContext.getContext().getValueStack().set("order",order1);
        return "findByOidSuccess";
    }

    //为订单付款
    public String payOrder(){
        //使用驱动模型接收：订单号，地址，姓名，电话，付款银行
        //修改订单
        //先查询订单，在进行修改
        Order currorder = orderService.findByOid(order.getOid());
        currorder.setAddr(order.getAddr());
        currorder.setName(order.getName());
        currorder.setPhone(order.getPhone());
        orderService.update(currorder);
        //完成付款操作
        //付款请求参数
        Map<String,String> payParams = new HashMap<String, String>();
        payParams.put("accountId","支付接口的id");
        payParams.put("accountKey","支付接口的密码");
        payParams.put("tradeWayType",payMethod);
        payParams.put("occupationPeriodTimeLength","300");
        payParams.put("callbackUrl","http://114.215.180.117:8082/sshShopping/order_callback.action");
        payParams.put("callbackPostData","oid="+currorder.getOid());
        String payImg = httpClientUtil.doPost("http://cloudpad.api.ateamcn.com/operation/combineSet/easyPay_etrade-selfpay/easyPay_createTradeOfItem/easyPay_createTradeOfItem.php",payParams);
        //以下是假装支付成功跳转的
        ActionContext.getContext().getValueStack().set("payImg",payImg);
        ActionContext.getContext().getValueStack().set("oid",currorder.getOid());
        return "paySuccess";
    }

    //付款成功的方法：
    public String callback(){
        //修改订单状态
        Order currOrder = orderService.findByOid(order.getOid());
        currOrder.setState(2);
        orderService.update(currOrder);
        return null;
    }

    //付款成功跳转页面
    public String orderSuccess(){
        Order currOrder = orderService.findByOid(order.getOid());
        //页面跳转
        this.addActionMessage("订单付款成功！订单编号："+currOrder.getOid()+"，金额："+currOrder.getTotal());
        return "msg";
    }

    //付款成功查询订单状态：
    public String checkOrderState() throws IOException {
        Order currOrder = orderService.findByOid(order.getOid());
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().write(currOrder.getState().toString());
        return null;
    }


    //确认收货：修改订单状态
    public String updateState(){
        Order currOrder = orderService.findByOid(order.getOid());
        currOrder.setState(4);
        orderService.update(currOrder);
        return "updateStateSuccess";
    }


    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    /*public Integer getOid() {
        return oid;
    }

    public void setOid(Integer oid) {
        this.oid = oid;
    }*/

    public String getPayMethod() {
        return payMethod;
    }

    public void setPayMethod(String payMethod) {
        this.payMethod = payMethod;
    }

    @Override
    public Order getModel() {
        return order;
    }
}
