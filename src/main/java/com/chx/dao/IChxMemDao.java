package com.chx.dao;
import com.chx.model.ChxMem;
import org.apache.ibatis.annotations.*;
import java.util.HashMap;
import java.util.List;

/**数据访问接口*/
public interface IChxMemDao {
    /**获得所有客户*/
    public List<ChxMem> getAllChxMems();
    /**获得单个客户对象通过编号*/
    public ChxMem getChxMemById(int id);
    /**添加
     * 设置jdbcType，否则空值会报错400*/
     @Insert("insert into chx_member(CardID,MemName,KindName,Sex,Age,Work_Unit,Phone_Num,BirthDay,BirthDay_Lunar," +
             "Medical_History,Nature,Talk_Willing,Talk_Way,Talk_Topic,Consume_Pattern,Income,Health_Focus," +
             "Price_Focus,Brand_Focus,Accept_Recommend,Other_Info,Card_Use_Type,Shop_Code,Sale_Sum,Profit_Sum,LastSaleDate)" +
            " values(#{cardId,jdbcType=VARCHAR},#{memName,jdbcType=VARCHAR},#{kindName,jdbcType=VARCHAR},#{sex,jdbcType=VARCHAR},#{age,jdbcType=INTEGER},#{workUnit,jdbcType=VARCHAR},#{phoneNum,jdbcType=VARCHAR},#{birthDay,jdbcType=TIMESTAMP},#{birthDayLunar,jdbcType=TIMESTAMP}," +
             " #{medicalHistory,jdbcType=VARCHAR},#{nature,jdbcType=VARCHAR},#{talkWilling,jdbcType=VARCHAR},#{talkWay,jdbcType=VARCHAR},#{talkTopic,jdbcType=VARCHAR},#{consumePattern,jdbcType=VARCHAR},#{income,jdbcType=VARCHAR},#{healthFocus,jdbcType=VARCHAR}," +
             " #{priceFocus,jdbcType=VARCHAR},#{brandFocus,jdbcType=VARCHAR},#{acceptRecommend,jdbcType=VARCHAR},#{otherInfo,jdbcType=VARCHAR},#{cardUseType,jdbcType=VARCHAR},#{shopCode,jdbcType=VARCHAR},#{saleSum,jdbcType=NUMERIC},#{profitSum,jdbcType=NUMERIC},#{lastSaleDate,jdbcType=TIMESTAMP})")
     @SelectKey(statement = "SELECT IDENT_CURRENT('chx_member')", keyProperty = "memId", before = false, resultType = int.class)
     public int add(ChxMem chxm);

    /**编辑*/
    @Update("update chx_member set CardID=#{cardId,jdbcType=VARCHAR},MemName=#{memName,jdbcType=VARCHAR},KindName=#{kindName,jdbcType=VARCHAR},Sex=#{sex,jdbcType=VARCHAR},Age=#{age,jdbcType=INTEGER},Work_Unit=#{workUnit,jdbcType=VARCHAR}," +
        "   BirthDay=#{birthDay,jdbcType=TIMESTAMP},BirthDay_Lunar=#{birthDayLunar,jdbcType=TIMESTAMP},Medical_History=#{medicalHistory,jdbcType=VARCHAR},Nature=#{nature,jdbcType=VARCHAR},Talk_Willing=#{talkWilling,jdbcType=VARCHAR}," +
        "   Talk_Way=#{talkWay,jdbcType=VARCHAR},Talk_Topic=#{talkTopic,jdbcType=VARCHAR},Consume_Pattern=#{consumePattern,jdbcType=VARCHAR},Income=#{income,jdbcType=VARCHAR},Health_Focus=#{healthFocus,jdbcType=VARCHAR}," +
        "   Price_Focus=#{priceFocus,jdbcType=VARCHAR},Brand_Focus=#{brandFocus,jdbcType=VARCHAR},Accept_Recommend=#{acceptRecommend,jdbcType=VARCHAR},Other_Info=#{otherInfo,jdbcType=VARCHAR}," +
        "   Card_Use_Type=#{cardUseType,jdbcType=VARCHAR}" +
        "   where MemID=#{memId,jdbcType=INTEGER}")
    public int edit(ChxMem entity);

    /**删除*/
    public int delete(int memId);

    /**分页查询-搜索条件*/
    public int searchCount(HashMap<String,Object> map);
    /**
     * 分页操作，searchByPage 分页方法
     * @param map
     * @return
     */
    public List<ChxMem> searchByPage(HashMap<String,Object> map);
}