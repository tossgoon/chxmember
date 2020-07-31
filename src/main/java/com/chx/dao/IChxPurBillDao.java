package com.chx.dao;
import com.chx.model.ChxPurBill;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.math.BigDecimal;
import java.util.List;

public interface IChxPurBillDao {
    /**
     * 获得单个对象通过编号
     */
    @Select("Select * From chx_purchase_bill Where id=#{id}")
    public ChxPurBill getPurBillById(int id);

    /**
     * 添加
     * 设置jdbcType，否则空值会报错400
     */
    @Insert("insert into chx_purchase_bill(years,month,billnum,flag,pid,createdate,sum_Money) "
            +" values(#{years,jdbcType=INTEGER},#{month,jdbcType=INTEGER},#{billnum,jdbcType=VARCHAR},#{flag,jdbcType=INTEGER},#{pid,jdbcType=INTEGER},#{createdate,jdbcType=TIMESTAMP},#{sumMoney,jdbcType=NUMERIC})")
    public int add(ChxPurBill bill);

    /**
     * 编辑
     */
    @Update("Update chx_purchase_bill Set flag=#{flag,jdbcType=INTEGER} Where id=#{id,jdbcType=INTEGER}")
    public int edit(ChxPurBill bill);

    @Update(" update chx_purchase_bill Set flag=#{1,jdbcType=INTEGER} " +
            " where id= #{0,jdbcType=INTEGER}   ")
    public int updateStatus(int id, int status);
    /**
     * 删除
     */
    @Delete("Delete  From chx_purchase_bill Where  id=#{id,jdbcType=INTEGER}")
    public int delete(int id);

    @Select("Select * From chx_purchase_bill Order By createdate desc")
    public List<ChxPurBill>  getBills();

    @Select(" select * from chx_purchase_bill " +
            "  where id in( " +
            " select billid from chx_purchase p1 " +
            " where p1.id in(select pid from chx_purchase p2 where p2.dm=#{dm,jdbcType=VARCHAR})) " +
            " order by createdate desc")
    public List<ChxPurBill>  getSubBills(String dm);
}
