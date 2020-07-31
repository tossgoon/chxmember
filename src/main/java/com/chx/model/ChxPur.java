package com.chx.model;

import org.springframework.format.annotation.DateTimeFormat;
import java.util.ArrayList;
import java.util.Date;

public class ChxPur {
    private Integer id;
    private String  cglb;
    private String bm;
    private  String mc;
    private String sccj;
    private String gg;
    private java.math.BigDecimal yssl;
    private String jhdw;
    private String dm;
    private String remark;
    private java.math.BigDecimal xgsl;
    private java.math.BigDecimal zzsl;
    private Integer pid;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createdate;
    private ArrayList<ChxPur> chxPursList;
    private Integer status;
    private Integer billid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCglb() {
        return cglb;
    }

    public void setCglb(String cglb) {
        this.cglb = cglb;
    }

    public String getBm() {
        return bm;
    }

    public void setBm(String bm) {
        this.bm = bm;
    }

    public String getMc() {
        return mc;
    }

    public void setMc(String mc) {
        this.mc = mc;
    }

    public String getSccj() {
        return sccj;
    }

    public void setSccj(String sccj) {
        this.sccj = sccj;
    }

    public String getGg() {
        return gg;
    }

    public void setGg(String gg) {
        this.gg = gg;
    }

    public java.math.BigDecimal getYssl() {
        return yssl;
    }

    public void setYssl(java.math.BigDecimal yssl) {
        this.yssl = yssl;
    }

    public String getJhdw() {
        return jhdw;
    }

    public void setJhdw(String jhdw) {
        this.jhdw = jhdw;
    }

    public String getDm() {
        return dm;
    }

    public void setDm(String dm) {
        this.dm = dm;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public java.math.BigDecimal getXgsl() {
        return xgsl;
    }

    public void setXgsl(java.math.BigDecimal xgsl) {
        this.xgsl = xgsl;
    }

    public java.math.BigDecimal getZzsl() {
        return zzsl;
    }

    public void setZzsl(java.math.BigDecimal zzsl) {
        this.zzsl = zzsl;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    public ArrayList<ChxPur> getChxPursList() {
        return chxPursList;
    }

    public void setChxPursList(ArrayList<ChxPur> chxPursList) {
        this.chxPursList = chxPursList;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getBillid() {
        return billid;
    }

    public void setBillid(Integer billid) {
        this.billid = billid;
    }
}
