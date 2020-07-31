package com.chx.service;
import com.chx.model.ChxPur;
import com.chx.model.PageBean;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public interface IChxPurService {
    /**获得所有采购计划*/
    public List<ChxPur> getAllChxPurs();
    /**获得单个对象通过编号*/
    public ChxPur getChxPurById(int id);
    /**添加*/
    public int add(ChxPur entity);
    /**编辑*/
    public int edit(ChxPur entity);
    /**简单编辑(只编辑名称)*/
    public int editSimple(ChxPur entity);
    /**删除*/
    public int delete(int id);
    /**多删除*/
    public int delete(int[] ids);
    /**分店数据更新后，更新总店数据**/
    public int updateSum(int id, BigDecimal detsl);
    /**删除pid为id的所有分店数据*/
    public int deletePursByPid(int id);
    /**搜索会员-分页*/
    PageBean<ChxPur> searchByPage(int currentPage, String searchStr, String shopcode);
    /**获取子项**/
    ArrayList<ChxPur> getSubList(int pid);
    /**获取子项**/
    ArrayList<ChxPur> getSpxxList(String spname);
    /**根据单号获取商品**/
    ArrayList<ChxPur> getPursByBid(int bid);
    /**根据单号获取商品**/
    ArrayList<ChxPur> getSubPursByBid(int bid,String dm);
}
