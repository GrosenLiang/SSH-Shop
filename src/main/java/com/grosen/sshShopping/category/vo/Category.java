package com.grosen.sshShopping.category.vo;

import com.grosen.sshShopping.categorysecond.vo.CategorySecond;

import java.util.HashSet;
import java.util.Set;

/**
 * @author Grosen
 * @create 2020-09-01 18:38
 */
public class Category {
    private Integer cid;
    private String cname;

    //二级分类集合：
    private Set<CategorySecond> categorySeconds = new HashSet<CategorySecond>();

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public Set<CategorySecond> getCategorySeconds() {
        return categorySeconds;
    }

    public void setCategorySeconds(Set<CategorySecond> categorySeconds) {
        this.categorySeconds = categorySeconds;
    }
}
