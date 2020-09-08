package com.grosen.sshShopping.order.dao;

import com.grosen.sshShopping.order.vo.Order;
import com.grosen.sshShopping.order.vo.OrderItem;
import com.grosen.sshShopping.utils.MailUtils;
import com.grosen.sshShopping.utils.PageHibernateCallback;
/*import com.sun.org.apache.regexp.internal.REUtil;*/
import org.aspectj.weaver.ast.Or;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import java.util.List;

/**
 * 订单持久层
 * @author Grosen
 * @create 2020-09-03 11:37
 */
public class OrderDao extends HibernateDaoSupport {

    //dao层保存订单
    public void save(Order order) {
        this.getHibernateTemplate().save(order);
    }

    //我的订单个数统计
    public Integer findByCountUid(Integer uid) {
        String hql = "select count(*) from Order o where o.user.uid = ?";
        List<Long> list = this.getHibernateTemplate().find(hql,uid);
        if(list!=null && list.size()>0){
            return list.get(0).intValue();
        }
        return null;
    }

    //我的订单查询
    public List<Order> findByPageUid(Integer uid, Integer begin, Integer limit) {
        String hql = "from Order o where o.user.uid = ? order by ordertime desc";
        List<Order> list = this.getHibernateTemplate().executeFind(new PageHibernateCallback<Order>(hql,new  Object[]{uid},begin,limit));
        if(list!=null && list.size()>0){
            return list;
        }
        return null;
    }

    //Dao层根据用户id查询订单
    public Order findByOid(Integer oid) {
        return this.getHibernateTemplate().get(Order.class,oid);
    }

    //Dao层修改订单
    public void update(Order currorder) {
        this.getHibernateTemplate().update(currorder);
    }

    public Integer findByCount() {
        List<Long> list = this.getHibernateTemplate().find("select count(*) from Order ");
        if(list.size()>0){
            return list.get(0).intValue();
        }
        return null;
    }

    public List<Order> findAll(Integer begin, Integer limit) {
        DetachedCriteria criteria = DetachedCriteria.forClass(Order.class);
        criteria.addOrder(org.hibernate.criterion.Order.desc("ordertime"));
        List<Order> list = this.getHibernateTemplate().findByCriteria(criteria,begin,limit);
        if(list.size()>0){
            return list;
        }
        return null;
    }

    //DAO层根据订单id查询订单项
    public List<OrderItem> findOrderItem(Integer oid) {
        String hql = "from OrderItem oi where oi.order.oid = ?";
        List<OrderItem> list = this.getHibernateTemplate().find(hql,oid);
        if(list.size()>0){
            return list;
        }
        return null;
    }

    public List<Order> findByState(Integer begin, Integer limit, Integer state) {
        String hql = "from Order o where o.state = ? order by ordertime desc";
        List<Order> list = this.getHibernateTemplate().executeFind(new PageHibernateCallback<Order>(hql,new  Object[]{state},begin,limit));
        if(list!=null && list.size()>0){
            return list;
        }
        return null;
    }


    public Integer findByCountByState(Integer state) {
        String hql = "select count(*) from Order where state = ?";
        List<Long> list = this.getHibernateTemplate().find(hql,state);
        if(list.size()>0){
            return list.get(0).intValue();
        }
        return null;
    }
}
