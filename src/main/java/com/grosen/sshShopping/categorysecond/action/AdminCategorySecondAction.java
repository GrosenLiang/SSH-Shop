package com.grosen.sshShopping.categorysecond.action;

import com.grosen.sshShopping.category.service.CategoryService;
import com.grosen.sshShopping.category.vo.Category;
import com.grosen.sshShopping.categorysecond.service.CategorySecondService;
import com.grosen.sshShopping.categorysecond.vo.CategorySecond;
import com.grosen.sshShopping.utils.PageBean;
import com.opensymphony.xwork2.ActionContext;

import java.util.List;

/**
 * @author Grosen
 * @create 2020-09-05 10:53
 */
public class AdminCategorySecondAction {
    //接受当前页数
    private Integer page;
    //注册二级分类service
    private CategorySecondService categorySecondService;
    //注入一级分类service
    private CategoryService categoryService;

    //接受二级分类的数据和一级分类的cid
    private CategorySecond categorySecond;


    //查询二级分类：带有分页查询
    public String findAllByPage(){
        PageBean<CategorySecond> pageBean = categorySecondService.findAllByPage(page);
        //pagebean带到页面
        ActionContext.getContext().getValueStack().set("pageBean",pageBean);
        return "findAllByPageSuccess";
    }

    //跳转到添加页面
    public String addPage(){
        //查询所有一级分类
        List<Category> cList = categoryService.findAll();
        //将数据带页面
        ActionContext.getContext().getValueStack().set("cList",cList);

        return "addPageSuccess";
    }

    //添加二级分类操作
    public String save(){
        categorySecondService.save(categorySecond);

        return "saveSuccess";
    }

    //删除二级分类（仿造一级分类的删除方法
    public String delete(){
        //首先查询二级分类
        categorySecond = categorySecondService.findByCsid(categorySecond.getCsid());
        categorySecondService.delete(categorySecond);
        return "deleteSuccess";
    }

    //跳转到修改二级分类
    public String edit(){
        //需要返回一个categorySecond和一个cList
        categorySecond = categorySecondService.findByCsid(categorySecond.getCsid());
        List<Category> cList = categoryService.findAll();
        ActionContext.getContext().getValueStack().set("cList",cList);
        ActionContext.getContext().getValueStack().set("categorySecond",categorySecond);
        return "editPageSuccess";
    }

    //二级分类修改
    public String update(){
        int cid1 = categorySecond.getCategory().getCid();
        String csname = categorySecond.getCsname();
        CategorySecond categorySecond1 = categorySecondService.findByCsid(categorySecond.getCsid());
        categorySecond1.setCsname(csname);
        categorySecond1.getCategory().setCid(cid1);
        categorySecondService.update(categorySecond1);
        return "updateSuccess";
    }


    public void setPage(Integer page) {
        this.page = page;
    }

    public void setCategorySecondService(CategorySecondService categorySecondService) {
        this.categorySecondService = categorySecondService;
    }

    public void setCategoryService(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    public CategorySecond getCategorySecond() {
        return categorySecond;
    }

    public void setCategorySecond(CategorySecond categorySecond) {
        this.categorySecond = categorySecond;
    }
}
