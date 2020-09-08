package com.grosen.sshShopping.user.action;

import com.grosen.sshShopping.user.service.UserService;
import com.grosen.sshShopping.user.vo.User;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author Grosen
 * @create 2020-08-26 22:52
 */
public class UserAction extends ActionSupport implements ModelDriven<User> {
    //接收用户数据的驱动模型
    private User user = new User();
    //注入UserService
    private UserService userService;

    //接受验证码
    private String checkcode;

    //跳转到注册页面
    public String registPage(){
        return "registPage";
    }

    //前台校验用户名是否存在
    public String checkUserName() throws IOException {
        //查询数据库（根据用户名）
        User existUser = userService.findByUsername(user.getUsername());
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/html;charset=UTF-8");
        //p判断用户是否存在
        if (existUser == null){
        //    没有这个用户，可以使用
            response.getWriter().println("<font color='green'>用户名可以使用</font>");
        }else {
            response.getWriter().println("<font color='red'>用户名已被占用</font>");
        }

        return null;
    }

    //用户注册
    public String regist(){
        //获取session中的验证码
        String checkcode1 = (String) ServletActionContext.getRequest().getSession().getAttribute("checkcode");
        if(checkcode == null || !checkcode.equalsIgnoreCase(checkcode1)){
            this.addActionError("验证码错误！");
            return "rigistFail";
        }
        //存入数据库
        userService.save(user);
        //传递字符串到页面
        this.addActionMessage("用户注册成功，请去邮箱激活！");
        return "msg";
    }

    //用户激活方法
    public String active(){
        //驱动模型会自动接收激活码
        //按照激活码查询用户
        User existUser = userService.findByCode(user.getCode());
        if(existUser == null){
            //激活码篡改
            this.addActionMessage("激活失败，激活码被篡改了！");
        }else {
            //激活：修改用户状态
            existUser.setState(1);
            userService.update(existUser);
            //激活成功
            this.addActionMessage("激活成功！");
        }
        return "msg";
    }

    //跳转登录页面
    public String loginPage(){
        return "loginPage";
    }

    //用户登录
    public String login(){
        //根据用户名查询用户
        User existUser = userService.findByUsername(user.getUsername());
        //登录失败
        if(existUser == null){
            this.addActionError("用户不存在！");
            return "loginFail";
        }else if(existUser.getState() != 1){
            this.addActionError("用户未激活！");
            return "loginFail";
        }else if (!user.getPassword().equals(existUser.getPassword())){
            this.addActionError("密码错误！");
            return "loginFail";
        }
        //验证码
        String checkcode1 = (String) ServletActionContext.getRequest().getSession().getAttribute("checkcode");
        if(checkcode == null || !checkcode.equalsIgnoreCase(checkcode1)){
            this.addActionError("验证码错误！");
            return "loginFail";
        }
        //登录成功
        ServletActionContext.getRequest().getSession().setAttribute("existUser",existUser);
        return "loginSuccess";
    }

    //用户退出
    public String quit(){
        ServletActionContext.getRequest().getSession().invalidate();
        return "quitSuccess";
    }

    @Override
    public User getModel() {
        return user;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public void setCheckcode(String checkcode) {
        this.checkcode = checkcode;
    }
}
