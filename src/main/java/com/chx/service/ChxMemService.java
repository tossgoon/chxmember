package com.chx.service;

import com.chx.dao.IChxMemDao;
import com.chx.model.ChxMem;
import com.chx.model.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

/**
 * 会员业务
 */
@Service
public class ChxMemService implements IChxMemService {

    @Autowired
    IChxMemDao chxMemDao;

    @Override
    public List<ChxMem> getAllChxMems() {
        return chxMemDao.getAllChxMems();
    }

    @Override
    public ChxMem getChxMemById(int id) {
        return chxMemDao.getChxMemById(id);
    }

    @Override
    public int add(ChxMem entity) {
        return chxMemDao.add(entity);
    }

    @Override
    public int edit(ChxMem entity) {
        return chxMemDao.edit(entity);
    }

    @Override
    public int delete(int id) {
        return chxMemDao.delete(id);
    }

    //多删除，重载
    @Override
    public int delete(int[] ids) {
        int rows = 0;
        for (Integer id : ids) {  //遍历所有的编号
            rows += delete(id);  //调用单删除功能，累计删除行数
        }
        return rows;
    }
    @Override
    public int searchCount(String searchStr,String shopcode) {
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("searchStr", searchStr);
        map.put("shopcode", shopcode);
        return chxMemDao.searchCount(map);
    }

    @Override
    public PageBean<ChxMem> searchByPage(int currentPage, String searchStr,String shopcode) {
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("searchStr", searchStr);
        map.put("shopcode", shopcode);
        PageBean<ChxMem> pageBean = new PageBean<ChxMem>();
        //封装当前页数
        pageBean.setCurrPage(currentPage);
        //每页显示的数据
        int pageSize = 10;
        pageBean.setPageSize(pageSize);
        //当前的查询字符串
        pageBean.setSearchStr(searchStr);
        pageBean.setShopcode(shopcode);
        //封装总记录数
        int totalCount = chxMemDao.searchCount(map);
        pageBean.setTotalCount(totalCount);
        //封装总页数
        double tc = totalCount;
        Double num = Math.ceil(tc / pageSize);//向上取整
        pageBean.setTotalPage(num.intValue());

        int start = (currentPage - 1) * pageSize + 1;
        if (currentPage <= 0) {
            start = 1;
        }
        map.put("pagestart", start);
        map.put("pagesize", pageSize);
        //封装每页显示的数据
        List<ChxMem> lists = chxMemDao.searchByPage(map);
        pageBean.setLists(lists);
        return pageBean;
    }
}