package com.chx.dao;
import com.chx.model.ChxUser;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import java.util.List;

public interface IChxUserDao {
    /**
     * 获得所有客户
     */

    @Select("Select * From chx_user")
    public List<ChxUser> getAllChxUsers();

    /**
     * 获得单个客户对象通过编号
     */
    @Select("Select * From chx_user Where id=#{id}")
    public ChxUser getUserById(int id);

    /**
     * 添加
     * 设置jdbcType，否则空值会报错400
     */
    @Insert("insert into chx_user(loginName,password,shopcode) values(#{loginName,jdbcType=VARCHAR},#{password,jdbcType=VARCHAR},#{shopcode,jdbcType=VARCHAR})")
    public int add(ChxUser user);

    /**
     * 编辑
     */
    @Update("Update chx_user Set shopcode=#{shopcode,jdbcType=VARCHAR},state=#{state,jdbcType=INTEGER} Where id=#{id,jdbcType=INTEGER}")
    public int edit(ChxUser user);

    /**
     * 更新密码
     */
    @Update("Update chx_user Set password=#{password,jdbcType=VARCHAR} Where id=#{id,jdbcType=INTEGER}")
    public int changePassword(ChxUser user);

    /**
     * 删除
     */
    @Delete("Delete  From chx_user Where  id=#{id,jdbcType=INTEGER}")
    public int delete(int id);

    /**
     * 查询用户名密码*/
    @Select("Select Count(*) From chx_user Where loginName=#{loginName,jdbcType=VARCHAR} And password=#{password,jdbcType=VARCHAR}")
    public int getUserPassCount(ChxUser user);

    /**
     * 查询用户名个数*/
    @Select("Select Count(*) From chx_user Where loginName=#{loginName,jdbcType=VARCHAR}")
    public int getUserCount(String loginName);

    @Select("Select * From chx_user Where loginName=#{loginName,jdbcType=VARCHAR}")
    public ChxUser getUserState(String loginName);

}
