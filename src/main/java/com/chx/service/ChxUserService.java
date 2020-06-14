package com.chx.service;

import com.chx.dao.IChxUserDao;
import com.chx.model.ChxUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class ChxUserService implements IChxUserService {

    @Autowired
    IChxUserDao sysUserDao;

    @Override
    public List<ChxUser> getAllSysUsers() {
        return  sysUserDao.getAllChxUsers();
    }

    @Override
    public ChxUser getUserById(int id) {
        return sysUserDao.getUserById(id);
    }

    @Override
    public int add(ChxUser entity) {
        return sysUserDao.add(entity);
    }

    @Override
    public int edit(ChxUser user) {
       return sysUserDao.edit(user);
    }

    @Override
    public int delete(int id) {
        return sysUserDao.delete(id);
    }

    @Override
    public int getUserPassCount(ChxUser user) {
        return sysUserDao.getUserPassCount(user);
    }

    @Override
    public int getUserCount(String loginName) {
        return sysUserDao.getUserCount(loginName);
    }

    @Override
    public ChxUser getUserStateByName(String loginName) {
        return sysUserDao.getUserState(loginName);
    }
}
