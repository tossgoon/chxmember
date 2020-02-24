package com.chx.service;
import com.chx.model.ChxMemFamily;

import java.util.ArrayList;
import java.util.List;

public interface IChxMemFamilyService {
    /**获得所有成员*/
    public ArrayList<ChxMemFamily> getChxMemFamilysByPid(int pid);
    /**添加*/
    public int add(ChxMemFamily entity);
    /**删除*/
    public int delete(int id);
    /**多删除*/
    public int deleteByPid(int pid);
}
