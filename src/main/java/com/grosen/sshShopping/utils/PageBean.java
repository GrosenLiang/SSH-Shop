package com.grosen.sshShopping.utils;

import java.util.List;

/**
 * @author Grosen
 * @create 2020-09-02 15:20
 * 分页
 */
public class PageBean<T> {
    private Integer page;   //当前页数
    private Integer limit;  //每页显示的记录数
    private Integer totalCount; //总记录数
    private Integer totalPage;  //总页数
    private List<T> list;

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getLimit() {
        return limit;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }

    public Integer getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(Integer totalCount) {
        this.totalCount = totalCount;
    }

    public Integer getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(Integer totalPage) {
        this.totalPage = totalPage;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }
}
