package com.grosen.sshShopping.product.service;

import com.grosen.sshShopping.product.dao.ProductDao;
import com.grosen.sshShopping.product.vo.Product;
import com.grosen.sshShopping.utils.PageBean;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author Grosen
 * @create 2020-09-01 20:37
 * 商品业务层代码
 */
@Transactional
public class ProductService {

    //注入DAO
    private ProductDao productDao;

    //查询热门商品
    public List<Product> findByHot(){
        return productDao.findByHot();
    }

    //查询最新商品
    public List<Product> findByNew(){
        return productDao.findByNew();
    }

    //根据Pid查询商品
    public Product findByPid(Integer pid){
        return productDao.findByPid(pid);
    }

    public void setProductDao(ProductDao productDao) {
        this.productDao = productDao;
    }

    public PageBean<Product> findByPage(Integer cid, Integer page) {
        //创建一个分页的bean
        PageBean<Product> pageBean = new PageBean<>();
        //封装PageBean
        pageBean.setPage(page);
        Integer limit = 8;
        pageBean.setLimit(limit);
        //按照一级分类id查询所有商品
        Integer totalCount = productDao.findByCount(cid);
        pageBean.setTotalCount(totalCount);
        //设置总页数
        Integer totalPage = 0;
        if(totalCount % limit == 0){
            totalPage = totalCount/limit;
        }else {
            totalPage = (totalCount/limit)+1;
        }
        pageBean.setTotalPage(totalPage);
        //设置list集合
        Integer begin = (page-1) * limit;
        List<Product> list = productDao.findByPage(cid,begin,limit);
        pageBean.setList(list);
        return pageBean;
    }

    //业务层根据二级分类id进行查询
    public PageBean<Product> findByCsid(Integer csid,Integer page) {
        PageBean<Product> pageBean = new PageBean<Product>();
        //设置当前页数
        pageBean.setPage(page);
        //设置每页显示记录数
        Integer limit = 8;
        pageBean.setLimit(limit);
        //设置总记录数
        Integer totalCount = productDao.findByCountCsid(csid);
        pageBean.setTotalCount(totalCount);
        //设置总页数
        Integer totalPage = 0;
        if(totalCount % limit == 0){
            totalPage = totalCount / limit;
        }else {
            totalPage = totalCount / limit +1;
        }
        pageBean.setTotalPage(totalPage);
        //设置list集合
        Integer begin = (page-1)*limit;
        List<Product> list = productDao.findByPageCsid(csid,begin,limit);
        pageBean.setList(list);
        return pageBean;
    }

    public PageBean<Product> findAllByPage(Integer page) {
        PageBean<Product> pageBean = new PageBean<Product>();
        //设置当前页数
        pageBean.setPage(page);
        //设置每页显示记录数
        Integer limit = 8;
        pageBean.setLimit(limit);
        //设置总记录数
        Integer totalCount = productDao.findByCount();
        pageBean.setTotalCount(totalCount);
        //设置总页数
        Integer totalPage = 0;
        if(totalCount % limit == 0){
            totalPage = totalCount / limit;
        }else {
            totalPage = totalCount / limit +1;
        }
        pageBean.setTotalPage(totalPage);
        //设置list集合
        Integer begin = (page-1)*limit;
        List<Product> list = productDao.findAll(begin,limit);
        pageBean.setList(list);
        return pageBean;
    }

    public void save(Product product) {
        productDao.save(product);
    }

    public void delete(Product product1) {
        productDao.delete(product1);
    }

    public void update(Product product) {
        productDao.update(product);
    }
}
