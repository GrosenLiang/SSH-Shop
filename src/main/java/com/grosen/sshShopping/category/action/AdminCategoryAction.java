package com.grosen.sshShopping.category.action;

import com.grosen.sshShopping.category.service.CategoryService;
import com.grosen.sshShopping.category.vo.Category;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import java.util.List;

/**
 * @author Grosen
 * @create 2020-09-04 20:46
 */
public class AdminCategoryAction extends ActionSupport implements ModelDriven<Category> {
    private Category category = new Category();

    //注入service
    private CategoryService categoryService;

    //后台查询所有一级分类
    public String findAll(){
        List<Category> cList = categoryService.findAll();
        //带到页面
        ActionContext.getContext().getValueStack().set("cList",cList);
        return "findAllSuccess";
    }

    //后台添加一级分类
    public String save(){
        categoryService.save(category);

        return "saveSuccess";
    }

    //后台删除一级分类（如果有二级分类是删不了的，级联直接删也删不了，要先查询再删除）
    public String delete(){
        //级联删除一定要先查询再删除,如果不查询直接删的话，本来的这个category中是没有带有二级分类的集合的。
        //先根据cid查询一级分类
        category = categoryService.findByCid(category.getCid());
        categoryService.delete(category);
        return "deleteSuccess";
    }

    //后台编辑一级分类
    public String edit(){
        //先查询
        category = categoryService.findByCid(category.getCid());
        //跳转页面
        //这个category是用模型驱动返回的，如果需要在页面上进行获取，需要model.xx
        return "editSuccess";
    }

    //后台修改一级分类
    public String update(){
        String cname1 = category.getCname();
        category = categoryService.findByCid(category.getCid());
        category.setCname(cname1);
        categoryService.update(category);
        return "updateSuccess";
    }


    public void setCategoryService(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    @Override
    public Category getModel() {
        return category;
    }
}
