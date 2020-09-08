package com.grosen.sshShopping.category.dao;

import com.grosen.sshShopping.category.vo.Category;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import java.util.List;

/**
 * @author Grosen
 * @create 2020-09-01 18:26
 */
public class CategoryDAO extends HibernateDaoSupport {

    //查询所有一级分类
    public List<Category> findAll(){
        return this.getHibernateTemplate().find("from Category ");
    }

    //后台保存一级分类
    public void save(Category category) {
        this.getHibernateTemplate().save(category);
    }

    //后台根据id进行查询
    public Category findByCid(Integer cid) {
        return this.getHibernateTemplate().get(Category.class,cid);
    }

    //后台删除一级分类
    public void delete(Category category) {
        this.getHibernateTemplate().delete(category);
    }

    public void update(Category category) {
        this.getHibernateTemplate().update(category);
    }
}
