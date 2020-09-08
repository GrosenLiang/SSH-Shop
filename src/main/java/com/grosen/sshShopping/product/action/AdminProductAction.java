package com.grosen.sshShopping.product.action;

import com.grosen.sshShopping.categorysecond.service.CategorySecondService;
import com.grosen.sshShopping.categorysecond.vo.CategorySecond;
import com.grosen.sshShopping.product.service.ProductService;
import com.grosen.sshShopping.product.vo.Product;
import com.grosen.sshShopping.utils.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * @author Grosen
 * @create 2020-09-05 21:14
 */
public class AdminProductAction extends ActionSupport {
    //注入商品service
    private ProductService productService;
    //注入二级分类service
    private CategorySecondService categorySecondService;

    //接收page
    private Integer page;

    //接受数据的对象
    private Product product;

    //文件上传需要的属性
    private File upload;
    private String uploadContextType;
    private String uploadFileName;

    public String findAllByPage(){
        //分页查询
        PageBean<Product> pageBean = productService.findAllByPage(page);
        //带到页面
        ActionContext.getContext().getValueStack().set("pageBean",pageBean);
        return "findAllByPageSuccess";
    }


    //跳转添加页面方法
    public String addPage(){
        //查询所有二级分类
        List<CategorySecond> csList = categorySecondService.findAll();
        //保存到值栈
        ActionContext.getContext().getValueStack().set("csList",csList);
        return "addPageSuccess";
    }

    //保存商品
    public String save() throws IOException {
        //完成文件上传
        //获得上传的磁盘绝对路径
        String realPath = ServletActionContext.getServletContext().getRealPath("/products");
        //
        File diskFile = new File(realPath+"/"+uploadFileName);
        FileUtils.copyFile(upload,diskFile);
        //保存数据
        product.setImage("products/"+uploadFileName);
        product.setPdate(new Date());
        //保存到数据库
        productService.save(product);
        return "saveSuccess";
    }

    //删除商品
    public String delete(){
        //Product product1 = productService.findByPid(product.getPid());
        productService.delete(product);
        return "deleteSuccess";
    }

    //跳转编辑商品
    public String edit(){
        List<CategorySecond> csList = categorySecondService.findAll();
        product = productService.findByPid(product.getPid());
        //传到前台
        ActionContext.getContext().getValueStack().set("csList",csList);
        ActionContext.getContext().getValueStack().set("product",product);
        return "editSuccess";
    }

    //编辑商品
    public String update() throws IOException {
        product.setPdate(new Date());
        if(upload != null && upload.isFile()){
            //将原来上传的图片删除
            String path = product.getImage();
            File file = new File(ServletActionContext.getServletContext().getRealPath("/"+path));
            file.delete();
            //完成文件上传
            //获得上传的磁盘绝对路径
            String realPath = ServletActionContext.getServletContext().getRealPath("/products");
            //
            File diskFile = new File(realPath+"/"+uploadFileName);
            FileUtils.copyFile(upload,diskFile);
            //保存数据
            product.setImage("products/"+uploadFileName);
        }
        productService.update(product);
        return "updateSuccess";
    }


    public void setProductService(ProductService productService) {
        this.productService = productService;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public void setCategorySecondService(CategorySecondService categorySecondService) {
        this.categorySecondService = categorySecondService;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public void setUpload(File upload) {
        this.upload = upload;
    }

    public void setUploadContextType(String uploadContextType) {
        this.uploadContextType = uploadContextType;
    }

    public void setUploadFileName(String uploadFileName) {
        this.uploadFileName = uploadFileName;
    }
}
