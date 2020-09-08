package com.grosen.sshShopping.user.dao;

import com.grosen.sshShopping.user.vo.User;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import java.util.List;

/**
 * @author Grosen
 * @create 2020-08-28 13:47
 * 用户模块：DAO层
 */
public class UserDao extends HibernateDaoSupport {

    //根据用户名查询这个用户
    public User findByUsername(String username) {
        List list = this.getHibernateTemplate().find("from User " +
                "where username = " + "?",username);
        if (list.size()>0){
            return (User) list.get(0);
        }
        return null;
    }

    //保存用户
    public void save(User user) {
        this.getHibernateTemplate().save(user);
    }

    //根据激活码查找用户
    public User findByCode(String code) {
        List<User> existUser = this.getHibernateTemplate().find("from User where code = ?",code);
        if (existUser.size() > 0){
            return existUser.get(0);
        }
        return null;
    }

    public void update(User existUser) {
        this.getHibernateTemplate().update(existUser);
    }
}
