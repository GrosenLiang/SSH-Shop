package com.grosen.sshShopping.categorysecond.dao;

import com.grosen.sshShopping.categorysecond.vo.CategorySecond;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import java.util.List;

/**
 * @author Grosen
 * @create 2020-09-05 10:54
 */
public class CategorySecondDao extends HibernateDaoSupport {

    public int findCount() {
        String hql = "select count(*) from CategorySecond";
        List<Long> list = this.getHibernateTemplate().find(hql);
        if(list.size()>0){
            return list.get(0).intValue();
        }
        return 0;
    }

    public List<CategorySecond> findByPage(int begin, int limit) {
        //String hql = "from CategorySecond";
        DetachedCriteria criteria = DetachedCriteria.forClass(CategorySecond.class);
        criteria.addOrder(Order.desc("csid"));
        List<CategorySecond> list = this.getHibernateTemplate().findByCriteria(criteria,begin,limit);
        if(list.size()>0){
            return list;
        }
        return null;
    }

    public void save(CategorySecond categorySecond) {
        this.getHibernateTemplate().save(categorySecond);
    }

    //根据csid查询
    public CategorySecond findByCsid(Integer csid) {
        return this.getHibernateTemplate().get(CategorySecond.class,csid);
    }

    //删除二级分类
    public void delete(CategorySecond categorySecond) {
        this.getHibernateTemplate().delete(categorySecond);
    }

    //修改二级分类
    public void update(CategorySecond categorySecond1) {
        this.getHibernateTemplate().update(categorySecond1);
    }

    public List<CategorySecond> findAll() {
        return this.getHibernateTemplate().find("from CategorySecond ");
    }
}
