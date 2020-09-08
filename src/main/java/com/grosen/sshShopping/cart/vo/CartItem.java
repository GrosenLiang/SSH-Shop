package com.grosen.sshShopping.cart.vo;

import com.grosen.sshShopping.product.vo.Product;

/**
 * 购物项
 * @author Grosen
 * @create 2020-09-02 21:50
 */
public class CartItem {
    private Product product;
    private Integer count;
    private Double subtotal;

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Double getSubtotal() {
        return count*product.getShop_price();
    }

    public void setSubtotal(Double subtotal) {
        this.subtotal = subtotal;
    }
}
