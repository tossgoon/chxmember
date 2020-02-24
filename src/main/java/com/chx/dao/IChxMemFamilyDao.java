package com.chx.dao;
import com.chx.model.ChxMemFamily;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.ArrayList;
import java.util.List;

public interface IChxMemFamilyDao {
    /**
     * 获得所有家庭成员-通过父节点
     */
    @Select("Select * From chx_member_family Where pid=#{pid} Order By FamilyID")
    public ArrayList<ChxMemFamily> getAllChxFamilysByPid(int pid);
    /**
     * 添加
     * 设置jdbcType，否则空值会报错400
     */
    @Insert("insert into chx_member_family(user_type,user_name,kind_name,remark,pid) values(#{userType,jdbcType=VARCHAR},#{userName,jdbcType=VARCHAR},#{kindName,jdbcType=VARCHAR},#{remark,jdbcType=VARCHAR},#{pid,jdbcType=INTEGER})")
    public int add(ChxMemFamily user);
    /**
     * 删除
     */
    @Delete("Delete  From chx_member_family Where  id=#{id,jdbcType=INTEGER}")
    public int delete(int id);
    /**
     * 删除
     */
    @Delete("Delete  From chx_member_family Where  pid=#{pid,jdbcType=INTEGER}")
    public int deleteByPid(int pid);
}
