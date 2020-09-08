package com.grosen.sshShopping.utils;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

/**
 * @author Grosen
 * @create 2020-08-30 22:40
 *
 * 本来按照视频，是应该使用smtp的25默认端口来进行邮件发送的。但是阿里云禁用了这个端口，所以
 * 我不得不修改代码，使用SSL的邮件，用阿里云提供的465端口来进行邮件的发送
 * 此处我不去进行邮箱服务器的创建了，直接使用腾讯的邮件服务来进行发送，具体方法可以百度或者直接打开QQ邮箱
 */
public class MailUtils {

    /*发送邮件的方法*/
    public static void sendMail(String to, String code) {
        Properties properties = new Properties();

        //听说这里第二个参数用的填的是发送方的东西。
        properties.setProperty("mail.smtp.host", "smtp.qq.com");
        properties.setProperty("mail.smtp.socketFactory.port","465");
        properties.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        properties.setProperty("mail.smtp.auth", "true");
        properties.setProperty("mail.smtp.port", "465");


        //1、创建连接
        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                //邮箱的帐号，发送stmp邮件的生成的密码
                return new PasswordAuthentication("151865933@qq.com", "发送邮件的密码");
            }
        });

        //2、创建一个邮件的对象
        Message message = new MimeMessage(session);
        try {
            //设置发件人
            message.setFrom(new InternetAddress("151865933@qq.com"));
            //设置收件人
			message.setRecipient(Message.RecipientType.TO,new InternetAddress(to));
		    //设置主题
            message.setSubject("来自果森商城的激活邮件");
            //设置邮件正文,由于有超链接要点，所以要设置成html，邮件地址是公网ip
            message.setContent("<h1>来自果森商城的激活邮件</h1><h3><a href='http://114.215.180.117:8082/sshShopping/user_active.action?code="+code+"'>点击此处激活</a><h3>","text/html;charset=UTF-8");
            //发送邮件
            Transport.send(message);

        } catch (AddressException e) {
            e.printStackTrace();
        } catch (MessagingException e) {
            e.printStackTrace();
        }

    }
}
