package com.chx.service;

import com.chx.dao.IChxPurDao;
import com.chx.dao.IChxUserDao;
import com.chx.model.ChxPur;
import com.chx.model.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Service
public class ChxPurService implements IChxPurService {

    @Autowired
    IChxPurDao chxPurDao;

    @Override
    public List<ChxPur> getAllChxPurs() {
        return chxPurDao.getAllChxPurs();
    }

    @Override
    public ChxPur getChxPurById(int id) {
        return chxPurDao.getChxPurById(id);
    }

    @Override
    public int add(ChxPur entity) {
        int r = chxPurDao.add(entity);
        if (r > 0 && entity.getPid() != null) {
            //如果是增加分店的数据，则更新总店销售店的数据
            ChxPur fatherPur = chxPurDao.getChxPurById(entity.getPid());
            BigDecimal sl_main = (fatherPur.getZzsl() == null ? BigDecimal.ZERO : fatherPur.getZzsl());
            BigDecimal sl_sub = (entity.getZzsl() == null ? BigDecimal.ZERO : entity.getZzsl());
            chxPurDao.updateSum(entity.getPid(), sl_main.add(sl_sub));
        }
        return r;
    }

    @Override
    public int edit(ChxPur entity) {
        if (entity.getPid() != null) {
            //对于有上级ID的记录，需要更新上级的数据
            ChxPur fatherPur = chxPurDao.getChxPurById(entity.getPid());
            ChxPur subPur = chxPurDao.getChxPurById(entity.getId());
            BigDecimal sl_main = (fatherPur.getZzsl() == null ? BigDecimal.ZERO : fatherPur.getZzsl());
            BigDecimal sub_old = (subPur.getZzsl() == null ? BigDecimal.ZERO : subPur.getZzsl());
            BigDecimal sub_new = (entity.getZzsl() == null ? BigDecimal.ZERO : entity.getZzsl());
            chxPurDao.updateSum(fatherPur.getId(), sl_main.subtract(sub_old).add(sub_new));
        }
        return chxPurDao.edit(entity);
    }

    @Override
    public int delete(int id) {
        ChxPur pur = chxPurDao.getChxPurById(id);
        if (pur.getPid() != null) {
            ChxPur fatherPur = chxPurDao.getChxPurById(pur.getPid());
            BigDecimal sl_main = (fatherPur.getZzsl() == null ? BigDecimal.ZERO : fatherPur.getZzsl());
            BigDecimal sl_sub = (pur.getZzsl() == null ? BigDecimal.ZERO : pur.getZzsl());
            chxPurDao.updateSum(pur.getPid(), sl_main.subtract(sl_sub));
        }
        chxPurDao.deleteSubPurs(id);//删除分店数据
        return chxPurDao.delete(id);//
    }

    @Override
    public int delete(int[] ids) {
        return 0;
    }

    @Override
    public PageBean<ChxPur> searchByPage(int currentPage, String searchStr, String shopcode) {
        return null;
    }

    @Override
    public ArrayList<ChxPur> getSubList(int pid) {
        return chxPurDao.getSubList(pid);
    }

    @Override
    public ArrayList<ChxPur> getSpxxList(String spname) {
        return chxPurDao.getSpxxList(spname);
    }

    @Override
    public ArrayList<ChxPur> getPursByBid(int bid) {
        return chxPurDao.getPursByBid(bid);
    }

    @Override
    public int deletePursByPid(int id) {
        return chxPurDao.deleteSubPurs(id);
    }

    @Override
    public int updateSum(int id, BigDecimal detsl) {
        return chxPurDao.updateSum(id, detsl);
    }

    @Override
    public int editSimple(ChxPur entity) {
        return chxPurDao.editSimple(entity);
    }

    @Override
    public ArrayList<ChxPur> getSubPursByBid(int bid, String dm) {
        return chxPurDao.getSubPursByBid(bid,dm);
    }
}
