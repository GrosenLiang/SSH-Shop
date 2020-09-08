package com.grosen.sshShopping.index;

import com.grosen.sshShopping.category.service.CategoryService;
import com.grosen.sshShopping.category.vo.Category;
import com.grosen.sshShopping.product.service.ProductService;
import com.grosen.sshShopping.product.vo.Product;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.ValueStack;

import java.util.List;

/**
 * @author Grosen
 * @create 2020-08-26 20:22
 */
public class IndexAction extends ActionSupport {

    //查询一级分类,注入service
    private CategoryService categoryService;
    //注入商品service
    private ProductService productService;

    //访问首页
    @Override
    public String execute() throws Exception {
        //查询所有一级分类
        List<Category> categories =  categoryService.findAll();
        //查询热门商品
        List<Product> hotList = productService.findByHot();
        //查询最新商品
        List<Product> newList = productService.findByNew();
        //获得值栈存入
        ValueStack stack = ActionContext.getContext().getValueStack();
        //stack.set("categories",categories);
        ActionContext.getContext().getSession().put("categories",categories);
        stack.set("hotList",hotList);
        stack.set("newList",newList);
        return "index";
    }

    public void setCategoryService(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    public void setProductService(ProductService productService) {
        this.productService = productService;
    }
}
