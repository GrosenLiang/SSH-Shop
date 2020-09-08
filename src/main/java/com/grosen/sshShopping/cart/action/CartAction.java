package com.grosen.sshShopping.cart.action;

import com.grosen.sshShopping.cart.vo.Cart;
import com.grosen.sshShopping.cart.vo.CartItem;
import com.grosen.sshShopping.product.service.ProductService;
import com.grosen.sshShopping.product.vo.Product;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;


/**
 * @author Grosen
 * @create 2020-09-03 9:22
 */
public class CartAction extends ActionSupport {
    //用于接收商品id
    private Integer pid;
    //用于接收商品购买数量
    private Integer count;
    //
    private ProductService productService;

    //提供一个活的购物车的方法
    public Cart getCart(){
        //从session获取购物车
        Cart cart = (Cart) ServletActionContext.getRequest().getSession().getAttribute("cart");
        //判断是否有购物车，没有就创建
        if(cart == null){
            cart = new Cart();
            ServletActionContext.getRequest().getSession().setAttribute("cart",cart);
        }
        return cart;
    }

    //添加购物车方法
    public String addCart(){
        //封装购物项
        CartItem cartItem = new CartItem();
        cartItem.setCount(count);
        //根据pid查找商品
        Product product = productService.findByPid(pid);
        cartItem.setProduct(product);
        //获得的购物车
        Cart cart = getCart();
        cart.addCart(cartItem);
        return "addCartSuccess";
    }

    //清空购物车
    public String clearCart(){
        //获得购物车
        Cart cart = getCart();
        //调用购物车中清空购物车的方法
        cart.clearCart();
        return "clearCartSuccess";
    }

    //移除购物项
    public String removeCart(){
        //h获得购物车
        Cart cart = getCart();
        //调用cart中的方法
        cart.removeCart(pid);
        return "removeCartSuccess";
    }

    //首页跳转购物车
    public String myCart(){
        return "myCartSuccess";
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public void setProductService(ProductService productService) {
        this.productService = productService;
    }
}
