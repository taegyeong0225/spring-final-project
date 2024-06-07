package kr.co.inhatcspring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.inhatcspring.beans.Member;
import kr.co.inhatcspring.beans.OnlineBoard;

public interface MemberMapperInterface {

    @Insert("INSERT INTO Member (userID, Password, nickname,isManager) VALUES (#{userID}, #{password}, #{nickname}, #{isManager})")
    void insertMember(Member member);


    @Select("SELECT * FROM Member WHERE userID = #{userID}")
    Member getMember(@Param("userID") String userID);

    
    @Select("SELECT * FROM Member")
    List<Member> getAllMembers();


    @Update("UPDATE Member SET Password = #{password}, nickname = #{nickname}, Is_manager = #{isManager} WHERE userID = #{userID}")
    void updateMember(Member member);


    @Delete("DELETE FROM Member WHERE userID = #{userID}")
    void deleteMember(@Param("userID") String userID);
    
    @Select("SELECT * FROM ONLINEBOARD WHERE userID = #{userID}")
    List<OnlineBoard> getPostsByUser(String userID);
}
