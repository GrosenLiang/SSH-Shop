package com.grosen.sshShopping.product.dao;

import com.grosen.sshShopping.product.vo.Product;
import com.grosen.sshShopping.utils.PageHibernateCallback;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import java.util.List;

/**
 * @author Grosen
 * @create 2020-09-01 20:37
 * 商品模块持久层
 */
public class ProductDao extends HibernateDaoSupport {

    //查询热门商品（分页）,使用回调的方法
    public List<Product> findByHot(){
        List<Product> list = this.getHibernateTemplate().executeFind(
                new PageHibernateCallback<Product>(
                        "from Product where is_hot=? order by pdate desc",
                        new Object[]{1},0,10));
        if(list.size()>0){
            return list;
        }
        return null;
    }

    //查询最新商品（离线条件查询）
    public List<Product> findByNew(){
        /*List<Product> list = this.getHibernateTemplate().executeFind(
                new PageHibernateCallback<Product>(
                        "from Product order by pdate desc",
                        null,0,10));*/
        DetachedCriteria criteria = DetachedCriteria.forClass(Product.class);
        criteria.addOrder(Order.desc("pdate"));
        List<Product> list = this.getHibernateTemplate().findByCriteria(criteria,0,10);
        if(list.size()>0){
            return list;
        }
        return null;
    }

    //根据PID查询商品详情
    public Product findByPid(Integer pid){
        return this.getHibernateTemplate().get(Product.class,pid);
    }

    //根据cid查询商品总记录数
    public Integer findByCount(Integer cid) {
        String hql = "select count(*) from Product p join p.categorySecond cs join cs.category c where c.cid = ?";
        String hql1 = "select count(*) from Product p join p.categorySecond cs join cs.category c where c.cid = ?";
        List<Long> list = this.getHibernateTemplate().find(hql1,cid);
        if(list.size()>0){
            return list.get(0).intValue();
        }
        return null;
    }

    //带分页查询商品
    public List<Product> findByPage(Integer cid, Integer begin, Integer limit) {
        String hql = "select p from Product p join p.categorySecond cs join cs.category c where c.cid = ?";
        List<Product> list =this.getHibernateTemplate().executeFind(new PageHibernateCallback<Product>(hql,new Object[]{cid},begin,limit));
        if(list.size()>0){
            return list;
        }
        return null;
    }

    //根据二级分类查询商品总记录数
    public Integer findByCountCsid(Integer csid) {
        List<Long> list = this.getHibernateTemplate().find("select count(*) from Product p where p.categorySecond.csid =?",csid);
        if(list.size()>0){
            return list.get(0).intValue();
        }
        return null;
    }

    //根据二级分类查询商品信息
    public List<Product> findByPageCsid(Integer csid, Integer begin, Integer limit) {
        String hql = "select p from Product p where p.categorySecond.csid = ?";
        List<Product> list = this.getHibernateTemplate().executeFind(new PageHibernateCallback<Product>(hql,new Object[]{csid},begin,limit));
        if(list.size()>0){
            return list;
        }
        return null;
    }

    public Integer findByCount() {
        List<Long> list = this.getHibernateTemplate().find("select count(*) from Product");
        if(list.size()>0){
            return list.get(0).intValue();
        }
        return null;
    }

    public List<Product> findAll(Integer begin, Integer limit) {
        DetachedCriteria criteria = DetachedCriteria.forClass(Product.class);
        criteria.addOrder(Order.desc("pdate"));
        List<Product> list = this.getHibernateTemplate().findByCriteria(criteria,begin,limit);
        if(list.size()>0){
            return list;
        }
        return null;
    }

    //保存商品
    public void save(Product product) {
        this.getHibernateTemplate().save(product);
    }

    //删除商品
    public void delete(Product product1) {
        this.getHibernateTemplate().delete(product1);
    }

    //更新商品
    public void update(Product product) {
        this.getHibernateTemplate().update(product);
    }


    //带分页查询的商品记录
    /*public List<Product> findByCid(Integer cid){
        String hql = "";
        List<Product> list = this.getHibernateTemplate().executeFind(new PageHibernateCallback<Product>(hql,new Object[]{cid},0,12));
        return list;
    }*/
}
