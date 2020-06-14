package com.chx.service;
import com.chx.model.ChxPurBill;
import com.chx.model.PageBean;
import java.util.List;

public interface IChxPurBillService {
    /**获得所有采购计划*/
    public List<ChxPurBill> getAllChxBills();
    /**获得单个对象通过编号*/
    public ChxPurBill getChxPurBillById(int id);
    /**添加*/
    public int add(ChxPurBill entity);
    /**编辑*/
    public int edit(ChxPurBill entity);
    /**删除*/
    public int delete(int id);
    /**更新状态*/
    public int updateStatus(int id,int status);
    /**获得所有采购计划*/
    public List<ChxPurBill> getSubChxBills(String dm);
}
