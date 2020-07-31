package com.chx.service;
import com.chx.dao.IChxMemDao;
import com.chx.dao.IChxPurBillDao;
import com.chx.model.ChxPurBill;
import com.chx.model.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class ChxPurBillService implements IChxPurBillService {

    @Autowired
    IChxPurBillDao chxPurBillDao;
    @Override
    public List<ChxPurBill> getAllChxBills() {
        return chxPurBillDao.getBills();
    }

    @Override
    public ChxPurBill getChxPurBillById(int id) {
        return chxPurBillDao.getPurBillById(id);
    }

    @Override
    public int add(ChxPurBill entity) {
        return chxPurBillDao.add(entity);
    }

    @Override
    public int edit(ChxPurBill entity) {
        return chxPurBillDao.edit(entity);
    }

    @Override
    public int delete(int id) {
        return chxPurBillDao.delete(id);
    }

    @Override
    public int updateStatus(int id, int status) {
        return chxPurBillDao.updateStatus(id,status);
    }

    @Override
    public List<ChxPurBill> getSubChxBills(String dm) {
        return chxPurBillDao.getSubBills(dm);
    }
}
