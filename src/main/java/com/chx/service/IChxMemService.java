package com.chx.service;

import com.chx.model.ChxMem;
import com.chx.model.PageBean;

import java.util.List;

/**图书业务接口*/
public interface IChxMemService {
    /**获得所有图书*/
    public List<ChxMem> getAllChxMems();
    /**获得单个图书对象通过编号*/
    public ChxMem getChxMemById(int id);
    /**添加*/
    public int add(ChxMem entity);
    /**编辑*/
    public int edit(ChxMem entity);
    /**删除*/
    public int delete(int id);
    /**多删除*/
    public int delete(int[] ids);
    /**搜索会员-分页*/
    PageBean<ChxMem> searchByPage(int currentPage,String searchStr,String shopcode);
    /**查询个数*/
    public int searchCount(String searchStr,String shopcode);
}