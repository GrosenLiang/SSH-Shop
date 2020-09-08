package com.grosen.sshShopping.adminuser.service;

import com.grosen.sshShopping.adminuser.dao.AdminUserDao;
import com.grosen.sshShopping.adminuser.vo.AdminUser;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author Grosen
 * @create 2020-09-04 16:59
 */
@Transactional
public class AdminUserService {
    private AdminUserDao adminUserDao;


    public void setAdminUserDao(AdminUserDao adminUserDao) {
        this.adminUserDao = adminUserDao;
    }

    public AdminUser login(AdminUser adminUser) {
        return adminUserDao.login(adminUser);
    }
}
