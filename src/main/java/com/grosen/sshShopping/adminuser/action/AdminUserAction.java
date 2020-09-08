package com.grosen.sshShopping.adminuser.action;

import com.grosen.sshShopping.adminuser.service.AdminUserService;
import com.grosen.sshShopping.adminuser.vo.AdminUser;
import com.grosen.sshShopping.user.vo.User;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.ServletActionContext;

/**
 * @author Grosen
 * @create 2020-09-04 16:59
 */
public class AdminUserAction extends ActionSupport implements ModelDriven<AdminUser> {
    private AdminUserService adminUserService;
    private AdminUser adminUser = new AdminUser();


    //提供登录方法
    public String login(){
        AdminUser adminExistUser = adminUserService.login(adminUser);
        if(adminExistUser == null){
            //用户名或密码错误
            this.addActionError("用户名或密码错误");
            return "loginFail";
        }else {
            ServletActionContext.getRequest().getSession().setAttribute("adminExistUser",adminExistUser);
            return "loginSuccess";
        }
    }




    public void setAdminUserService(AdminUserService adminUserService) {
        this.adminUserService = adminUserService;
    }

    @Override
    public AdminUser getModel() {
        return adminUser;
    }
}
