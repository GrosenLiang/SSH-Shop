package com.grosen.sshShopping.interceptor;

import com.grosen.sshShopping.adminuser.vo.AdminUser;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
import org.apache.struts2.ServletActionContext;

/**
 * @author Grosen
 * @create 2020-09-06 16:57
 */
public class PrivilegeInterceptor extends MethodFilterInterceptor {

    //执行拦截的方法
    @Override
    protected String doIntercept(ActionInvocation invocation) throws Exception {


        //判断session中是否保存了后台用户信息
        AdminUser existAdminUser =  (AdminUser) ServletActionContext.getRequest().getSession().getAttribute("adminExistUser");
        if(existAdminUser == null){
            //没有登录进行访问
            ActionSupport actionSupport = (ActionSupport) invocation.getAction();
            actionSupport.addActionError("您还没有登录！没有权限访问");
            return "loginFail";
        }else {
            //已经登录
            return invocation.invoke();
        }
    }
}
