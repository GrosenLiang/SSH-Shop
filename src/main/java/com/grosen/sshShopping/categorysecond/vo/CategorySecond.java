package com.grosen.sshShopping.categorysecond.vo;

import com.grosen.sshShopping.category.vo.Category;
import com.grosen.sshShopping.product.vo.Product;

import java.util.HashSet;
import java.util.Set;

/**
 * @author Grosen
 * @create 2020-09-02 9:34
 */
public class CategorySecond {
    private Integer csid;
    private String csname;

    //所属一级分类对象
    private Category category;

    //所属商品的集合
    private Set<Product> products = new HashSet<Product>();

    public Integer getCsid() {
        return csid;
    }

    public void setCsid(Integer csid) {
        this.csid = csid;
    }

    public String getCsname() {
        return csname;
    }

    public void setCsname(String csname) {
        this.csname = csname;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Set<Product> getProducts() {
        return products;
    }

    public void setProducts(Set<Product> products) {
        this.products = products;
    }
}
