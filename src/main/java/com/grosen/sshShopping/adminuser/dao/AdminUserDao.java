package com.grosen.sshShopping.adminuser.dao;

import com.grosen.sshShopping.adminuser.vo.AdminUser;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import java.util.List;

/**
 * @author Grosen
 * @create 2020-09-04 16:59
 */
public class AdminUserDao extends HibernateDaoSupport {

    public AdminUser login(AdminUser adminUser) {
        String hql = "from AdminUser where username = ? and password = ?";
        List<AdminUser> list = this.getHibernateTemplate().find(hql,adminUser.getUsername(),adminUser.getPassword());
        if(list.size()>0){
            return list.get(0);
        }
        return null;
    }
}
