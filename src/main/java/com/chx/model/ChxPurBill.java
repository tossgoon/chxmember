package com.chx.model;
import org.springframework.format.annotation.DateTimeFormat;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;

public class ChxPurBill {

    private Integer id;
    private Integer years;
    private Integer month;
    private String  billnum;
    private Integer flag;
    private String  pid;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private Date createdate;
    private ArrayList<ChxPurBill> chxPurBills;
    private java.math.BigDecimal sumMoney;
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getYears() {
        return years;
    }

    public void setYears(Integer years) {
        this.years = years;
    }

    public Integer getMonth() {
        return month;
    }

    public void setMonth(Integer month) {
        this.month = month;
    }

    public String getBillnum() {
        return billnum;
    }

    public void setBillnum(String billnum) {
        this.billnum = billnum;
    }

    public Integer getFlag() {
        return flag;
    }

    public void setFlag(Integer flag) {
        this.flag = flag;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    public ArrayList<ChxPurBill> getChxPurBills() {
        return chxPurBills;
    }

    public void setChxPurBills(ArrayList<ChxPurBill> chxPurBills) {
        this.chxPurBills = chxPurBills;
    }

    public BigDecimal getSumMoney() {
        return sumMoney;
    }

    public void setSumMoney(BigDecimal sumMoney) {
        this.sumMoney = sumMoney;
    }
}
