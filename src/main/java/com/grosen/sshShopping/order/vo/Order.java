package com.grosen.sshShopping.order.vo;

import com.grosen.sshShopping.user.vo.User;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * 订单实体
 * @author Grosen
 * @create 2020-09-03 10:34
 */
public class Order {
    private Integer oid;
    private  Double total = 0d;
    private Date ordertime;
    private String name;
    private String addr;
    private String phone;
    private Integer state;
    //与用户关联关系
    private User user;
    //与订单关联关系
    private Set<OrderItem> orderItems = new HashSet<OrderItem>();

    public Integer getOid() {
        return oid;
    }

    public void setOid(Integer oid) {
        this.oid = oid;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public Date getOrdertime() {
        return ordertime;
    }

    public void setOrdertime(Date ordertime) {
        this.ordertime = ordertime;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Set<OrderItem> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(Set<OrderItem> orderItems) {
        this.orderItems = orderItems;
    }
}
