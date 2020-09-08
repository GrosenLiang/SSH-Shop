package com.grosen.sshShopping.category.service;

import com.grosen.sshShopping.category.dao.CategoryDAO;
import com.grosen.sshShopping.category.vo.Category;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author Grosen
 * @create 2020-09-01 18:38
 * 一级分类业务层
 */
@Transactional
public class CategoryService {
    //注入categoryDao
    private CategoryDAO categoryDAO;

    //查询所有一级分类
    public List<Category> findAll(){
        return categoryDAO.findAll();
    }

    public void setCategoryDAO(CategoryDAO categoryDAO) {
        this.categoryDAO = categoryDAO;
    }

    //后台保存一级分类的方法
    public void save(Category category) {
        categoryDAO.save(category);
    }


    public Category findByCid(Integer cid) {
        return categoryDAO.findByCid(cid);
    }

    public void delete(Category category) {
        categoryDAO.delete(category);
    }

    public void update(Category category) {
        categoryDAO.update(category);
    }
}
