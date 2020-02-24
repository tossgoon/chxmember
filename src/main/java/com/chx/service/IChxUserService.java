package com.chx.service;

import com.chx.model.ChxUser;

import java.util.List;

public interface IChxUserService {
    /**获得所有图书*/
    public List<ChxUser> getAllSysUsers();
    /**获得单个图书对象通过编号*/
    public ChxUser getUserById(int id);
    /**添加*/
    public int add(ChxUser entity);
    /**编辑*/
    public int edit(ChxUser user);
    /**删除*/
    public int delete(int id);
    /**查询用户名密码个数*/
    public int getUserPassCount(ChxUser user);
    /**查询用户个数*/
    public int getUserCount(String loginName);
    /**查询用户状态*/
    public ChxUser getUserStateByName(String loginName);
}
