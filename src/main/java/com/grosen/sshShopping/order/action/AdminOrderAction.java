package com.grosen.sshShopping.order.action;

import com.grosen.sshShopping.order.service.OrderService;
import com.grosen.sshShopping.order.vo.Order;
import com.grosen.sshShopping.order.vo.OrderItem;
import com.grosen.sshShopping.utils.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import java.util.List;

/**
 * @author Grosen
 * @create 2020-09-06 11:17
 */
public class AdminOrderAction extends ActionSupport implements ModelDriven<Order> {
    private Order order = new Order();

    private Integer page;

    //注入service
    private OrderService orderService;

    //带分页查询的方法
    public String findAllByPage(){
        PageBean<Order> pageBean = orderService.findAllByPage(page);
        //存入值栈
        ActionContext.getContext().getValueStack().set("pageBean",pageBean);
        return "findAllByPageSuccess";
    }

    //根据订单状态查询订单
    public String findByState(){
        PageBean<Order> pageBean = orderService.findByState(page,order.getState());
        //存入值栈
        ActionContext.getContext().getValueStack().set("pageBean",pageBean);
        return "findByStateSuccess";
    }

    //根据订单id查询订单项
   public String findOrderItem(){
        List<OrderItem> list = orderService.findOrderItem(order.getOid());
        //通过值栈显示
        ActionContext.getContext().getValueStack().set("list",list);
        return "findOrderItemSuccess";
   }

   //后台修改订单状态
    public String updateState(){
        //根据id查询订单
        Order currOrder = orderService.findByOid(order.getOid());
        //修改订单状态
        currOrder.setState(3);
        orderService.update(currOrder);
        //页面跳转
        return "updateStateSuccess";
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }


    @Override
    public Order getModel() {
        return order;
    }
}
