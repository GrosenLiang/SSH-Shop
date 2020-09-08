package com.grosen.sshShopping.categorysecond.service;

import com.grosen.sshShopping.categorysecond.dao.CategorySecondDao;
import com.grosen.sshShopping.categorysecond.vo.CategorySecond;
import com.grosen.sshShopping.utils.PageBean;

import java.util.List;

/**
 * @author Grosen
 * @create 2020-09-05 10:54
 */
public class CategorySecondService {
    //注入DAO
    private CategorySecondDao categorySecondDao;


    //带有分页查询
    public PageBean<CategorySecond> findAllByPage(Integer page) {
        PageBean<CategorySecond> pageBean = new PageBean<CategorySecond>();
        //设置当前页数
        pageBean.setPage(page);
        //设置每页显示记录数
        int limit = 10;
        pageBean.setLimit(limit);
        //设置总记录数
        int totalCount = 0;
        totalCount = categorySecondDao.findCount();
        pageBean.setTotalCount(totalCount);
        //设置总页数
        int totalPage = 0;
        if(totalCount%limit == 0){
            totalPage = totalCount/limit;
        }else {
            totalPage = totalCount/limit+1;
        }
        pageBean.setTotalPage(totalPage);
        //每页显示数据集合
        int begin = (page-1)*limit;
        List<CategorySecond> list = categorySecondDao.findByPage(begin,limit);
        pageBean.setList(list);

        return pageBean;
    }


    public void setCategorySecondDao(CategorySecondDao categorySecondDao) {
        this.categorySecondDao = categorySecondDao;
    }

    public void save(CategorySecond categorySecond) {
        categorySecondDao.save(categorySecond);
    }

    //根据csid查询
    public CategorySecond findByCsid(Integer csid) {
        return categorySecondDao.findByCsid(csid);
    }

    //删除二级分类
    public void delete(CategorySecond categorySecond) {
        categorySecondDao.delete(categorySecond);
    }

    //后台修改二级分类
    public void update(CategorySecond categorySecond1) {
        categorySecondDao.update(categorySecond1);
    }

    public List<CategorySecond> findAll() {
        return categorySecondDao.findAll();
    }
}
