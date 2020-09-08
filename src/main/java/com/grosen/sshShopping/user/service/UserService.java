package com.grosen.sshShopping.user.service;

import com.grosen.sshShopping.user.dao.UserDao;
import com.grosen.sshShopping.user.vo.User;
import com.grosen.sshShopping.utils.MailUtils;
import com.grosen.sshShopping.utils.UUIDUtils;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author Grosen
 * @create 2020-08-28 13:46
 * 用户模块：业务层代码
 */

@Transactional
public class UserService {
    //注入userDao
    private UserDao userDao;

    //检验用户名是否存在
    public User findByUsername(String username) {
        return userDao.findByUsername(username);
    }

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    //注册用户
    public void save(User user) {
    //    保存到数据库：
        user.setState(0);       //0代表未激活，1代表激活
        String code = UUIDUtils.getUUID()+UUIDUtils.getUUID();
        user.setCode(code);
        userDao.save(user);
    //    发送激活邮件
        MailUtils.sendMail(user.getEmail(),code);

    }

    //根据激活码查询用户
    public User findByCode(String code) {
        return userDao.findByCode(code);
    }

    public void update(User existUser) {
        userDao.update(existUser);
    }
}
