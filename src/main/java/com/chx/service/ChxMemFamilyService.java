package com.chx.service;

import com.chx.dao.IChxMemDao;
import com.chx.dao.IChxMemFamilyDao;
import com.chx.model.ChxMemFamily;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ChxMemFamilyService implements IChxMemFamilyService {

    @Autowired
    IChxMemFamilyDao chxMemFamilyDao;

    @Override
    public ArrayList<ChxMemFamily> getChxMemFamilysByPid(int pid) {
        return chxMemFamilyDao.getAllChxFamilysByPid(pid);
    }

    @Override
    public int add(ChxMemFamily entity) {
        return chxMemFamilyDao.add(entity);
    }

    @Override
    public int delete(int id) {
        return chxMemFamilyDao.delete(id);
    }

    @Override
    public int deleteByPid(int pid) {
        return chxMemFamilyDao.deleteByPid(pid);
    }
}
