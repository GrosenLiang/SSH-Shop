package com.grosen.sshShopping.product.action;

import com.grosen.sshShopping.category.service.CategoryService;
import com.grosen.sshShopping.category.vo.Category;
import com.grosen.sshShopping.product.service.ProductService;
import com.grosen.sshShopping.product.vo.Product;
import com.grosen.sshShopping.utils.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import java.util.List;

/**
 * @author Grosen
 * @create 2020-09-01 20:38
 * 商品aciton类
 */
public class ProductAction extends ActionSupport implements ModelDriven<Product> {
    private Product product = new Product();

    //接受CID
    private Integer cid;

    //注入商品service
    private ProductService productService;

    //注入一级分类service
    private CategoryService categoryService;

    //接受当前的页数
    private Integer page;

    //接受Csid
    private Integer csid;

    //根据PID查询商品
    public String findByPid(){
        product = productService.findByPid(product.getPid());
        return "findByPidSuccess";
    }

    //按cid查询跳转到分类页面
    public String findByCid(){
        /*//查询所有一级分类
        List<Category> categories = categoryService.findAll();
        //值栈传值
        ActionContext.getContext().getValueStack().set("categories",categories);*/
        //查询商品
        PageBean pageBean = productService.findByPage(cid,page);
        ActionContext.getContext().getValueStack().set("pageBean",pageBean);
        return "findByCidSuccess";
    }

    //按Csid查询商品信息
    public String findByCsid(){
        //调用service进行查询、
        PageBean<Product> pageBean = productService.findByCsid(csid,page);
        //存入值栈
        ActionContext.getContext().getValueStack().set("pageBean",pageBean);
        return "findByCsidSuccess";
    }

    @Override
    public Product getModel() {
        return product;
    }

    public void setProductService(ProductService productService) {
        this.productService = productService;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCategoryService(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getCsid() {
        return csid;
    }

    public void setCsid(Integer csid) {
        this.csid = csid;
    }
}
