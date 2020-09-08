package com.grosen.sshShopping.cart.vo;

import java.util.Collection;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * 购物车
 * @author Grosen
 * @create 2020-09-02 21:52
 */
public class Cart {
    //购物项的集合：采用map集合，map集合有一个key存在，容易删除商品
    //map的key是商品的id，map的value就是购物项
    private Map<Integer,CartItem> map = new LinkedHashMap<Integer,CartItem>();
    //购物车总计
    private Double total = 0d;

    public Map<Integer, CartItem> getMap() {
        return map;
    }

    public void setMap(Map<Integer, CartItem> map) {
        this.map = map;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    //getCartItems的方法。（相当于类中有一个cartItems的属性）。为什么要加这个？因为
    //遍历map很麻烦，并且数据pid可以在实体里面就获得了
    public Collection<CartItem> getCartItems(){
        return map.values();
    }

    //方法：
    //将购物项添加到购物车
    public  void  addCart(CartItem cartItem){
        //获得购物项的唯一标识
        Integer pid = cartItem.getProduct().getPid();
        //1、判断是否存在该商品
        if(map.containsKey(pid)){
            //已经存在：数量增加，总计增加
            CartItem cartItem1 = map.get(pid);
            cartItem1.setCount(cartItem.getCount()+cartItem1.getCount());
        }else {
            //不存在：添加一个新的购物项，总计增加
            map.put(pid,cartItem);
        }
        //总计增加
        total += cartItem.getSubtotal();
    }

    //从购物车移除购物项
    public void  removeCart(Integer pid){
        //1、将购物项移除
        CartItem cartItem = map.remove(pid);
        //2、总价-这个购物项的小计
        total -= cartItem.getSubtotal();
    }

    //清空购物车
    public void clearCart(){
        //将map集合为空
        map.clear();
        //总价设为0
        total = 0d;
    }

}
