package com.chx.dao;

import com.chx.model.ChxPur;
import org.apache.ibatis.annotations.*;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**数据访问接口*/
public interface IChxPurDao {
    /**获得所有客户*/
    public List<ChxPur> getAllChxPurs();
    /**获得单个客户对象通过编号*/
    public ChxPur getChxPurById(int id);
    /**添加
     * 设置jdbcType，否则空值会报错400*/
     @Insert("insert into chx_purchase(cglb,bm,mc,sccj,gg,yssl,jhdw,dm,remark,xgsl,zzsl,pid,createdate,status,billid)" +
            " values(#{cglb,jdbcType=VARCHAR},#{bm,jdbcType=VARCHAR},#{mc,jdbcType=VARCHAR},#{sccj,jdbcType=VARCHAR},#{gg,jdbcType=VARCHAR},#{yssl,jdbcType=NUMERIC}," +
             " #{jhdw,jdbcType=VARCHAR},#{dm,jdbcType=VARCHAR},#{remark,jdbcType=VARCHAR},#{xgsl,jdbcType=NUMERIC},#{zzsl,jdbcType=NUMERIC},#{pid,jdbcType=INTEGER},getdate(),#{status,jdbcType=INTEGER},#{billid,jdbcType=INTEGER})")
     @SelectKey(statement = "SELECT IDENT_CURRENT('chx_purchase')", keyProperty = "id", before = false, resultType = int.class)
     public int add(ChxPur chxPur);

    /**编辑*/
    @Update("update chx_purchase set cglb=#{cglb,jdbcType=VARCHAR},bm=#{bm,jdbcType=VARCHAR},mc=#{mc,jdbcType=VARCHAR},sccj=#{sccj,jdbcType=VARCHAR},gg=#{gg,jdbcType=VARCHAR}," +
        "   yssl=#{yssl,jdbcType=NUMERIC},  jhdw=#{jhdw,jdbcType=VARCHAR},  dm=#{dm,jdbcType=VARCHAR}, remark=#{remark,jdbcType=VARCHAR},xgsl=#{xgsl,jdbcType=NUMERIC},zzsl=#{zzsl,jdbcType=NUMERIC},pid=#{pid,jdbcType=INTEGER}, createdate=#{createdate,jdbcType=TIMESTAMP},status=#{status,jdbcType=INTEGER}" +
        "   where id=#{id,jdbcType=INTEGER}")
    public int edit(ChxPur chxPur);

    /**编辑*/
    @Update("update chx_purchase set bm=#{bm,jdbcType=VARCHAR},mc=#{mc,jdbcType=VARCHAR},sccj=#{sccj,jdbcType=VARCHAR},gg=#{gg,jdbcType=VARCHAR}," +
            "    jhdw=#{jhdw,jdbcType=VARCHAR} where id=#{id,jdbcType=INTEGER}")
    public int editSimple(ChxPur chxPur);


    @Update(" update chx_purchase set zzsl=#{1,jdbcType=NUMERIC} " +
            " where id= #{0,jdbcType=INTEGER}   ")
    public int updateSum(int id, BigDecimal detsl);

    /**删除*/
    //@Delete("delete from chx_purchase where id=#{id,jdbcType=INTEGER}")
    public int delete(int id);
    /**删除*/
    @Delete("delete from chx_purchase where pid=#{pid,jdbcType=INTEGER}")
    public int deleteSubPurs(int pid);

    /**分页查询-搜索条件*/
    public int searchCount(HashMap<String, Object> map);
    /**
     * 分页操作，searchByPage 分页方法
     * @param map
     * @return
     */
    public List<ChxPur> searchByPage(HashMap<String, Object> map);

    @Select("Select * From chx_purchase Where pid=#{pid} Order By dm")
    public ArrayList<ChxPur> getSubList(int pid);

    @Select("Select bm,mc,sccj,gg,jhdw From p_spjcxx_sz Where mc like '%${spname}%' Order By mc")
    public ArrayList<ChxPur> getSpxxList(@Param("spname")String spname);

    @Select("Select * From chx_purchase Where billid=${bid} Order By bm")
    public ArrayList<ChxPur> getPursByBid(@Param("bid")int bid);

    @Select(" select p2.bm,p2.mc,p2.sccj,p2.gg,p2.jhdw,p1.yssl,p1.zzsl,p1.createdate from chx_purchase p1 " +
            " left join chx_purchase p2 " +
            " on p1.pid=p2.id " +
            " where p1.dm=#{dm,jdbcType=VARCHAR} and p2.billid=#{bid,jdbcType=INTEGER} " +
            " order by p2.bm ")
    public ArrayList<ChxPur> getSubPursByBid(@Param("bid")int bid,@Param("dm")String dm);
}