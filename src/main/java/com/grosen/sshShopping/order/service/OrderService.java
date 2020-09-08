package com.grosen.sshShopping.order.service;

import com.grosen.sshShopping.order.dao.OrderDao;
import com.grosen.sshShopping.order.vo.Order;
import com.grosen.sshShopping.order.vo.OrderItem;
import com.grosen.sshShopping.product.vo.Product;
import com.grosen.sshShopping.utils.PageBean;
import org.aspectj.weaver.ast.Or;

import java.util.List;

/**
 * 订单业务层
 * @author Grosen
 * @create 2020-09-03 11:37
 */
public class OrderService {
    //注入订单DAO
    private OrderDao orderDao;



    public void setOrderDao(OrderDao orderDao) {
        this.orderDao = orderDao;
    }

    //业务层保存订单
    public void save(Order order) {
        orderDao.save(order);
    }

    //我的订单业务层代码
    public PageBean<Order> findByPageUid(Integer uid, Integer page) {
        PageBean<Order> pageBean = new PageBean<Order>();
        //设置当前页数
        pageBean.setPage(page);
        //设置每页显示的记录数
        Integer limit = 5;
        pageBean.setLimit(limit);
        //设置总记录数
        Integer totalCount = null;
        totalCount = orderDao.findByCountUid(uid);
        pageBean.setTotalCount(totalCount);
        //设置总页数
        Integer totalPage = null;
        if(totalCount % limit == 0){
            totalPage = totalCount/limit;
        }else {
            totalPage = totalCount/limit+1;
        }
        pageBean.setTotalPage(totalPage);
        //设置每页显示数据集合
        Integer begin = (page-1)*limit;
        List<Order> list = orderDao.findByPageUid(uid,begin,limit);
        pageBean.setList(list);
        return pageBean;
    }

    public Order findByOid(Integer oid) {
        return orderDao.findByOid(oid);
    }

    //修改订单
    public void update(Order currorder) {
        orderDao.update(currorder);
    }

    //业务层分页查询
    public PageBean<Order> findAllByPage(Integer page) {
        PageBean<Order> pageBean = new PageBean<Order>();
        //设置当前页数
        pageBean.setPage(page);
        //设置每页显示记录数
        Integer limit = 10;
        pageBean.setLimit(limit);
        //设置总记录数
        Integer totalCount = orderDao.findByCount();
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
        List<Order> list = orderDao.findAll(begin,limit);
        pageBean.setList(list);
        return pageBean;
    }

    public List<OrderItem> findOrderItem(Integer oid) {
        return orderDao.findOrderItem(oid);
    }

    //根据状态查订单
    public PageBean<Order> findByState(Integer page, Integer state) {
        PageBean<Order> pageBean = new PageBean<Order>();
        //设置当前页数
        pageBean.setPage(page);
        //设置每页显示记录数
        Integer limit = 10;
        pageBean.setLimit(limit);
        //设置总记录数
        Integer totalCount = orderDao.findByCountByState(state);
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
        List<Order> list = orderDao.findByState(begin,limit,state);
        pageBean.setList(list);
        return pageBean;
    }
}
