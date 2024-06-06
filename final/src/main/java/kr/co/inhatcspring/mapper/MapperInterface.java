package kr.co.inhatcspring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.inhatcspring.beans.OnlineBoard;

public interface MapperInterface {

    // -------------------
    // Operations for ONLINEBOARD
    // -------------------
    
    /**
     * Inserts a new board data into the ONLINEBOARD table.
     * The BOARDID is automatically generated using a sequence.
     *
     * @param boardDataBean The BoardDataBean object containing the data to be inserted.
     */
    @Insert("INSERT INTO ONLINEBOARD (BOARDID, CATEGORY, TITLE, CONTENT, USERID) VALUES (board_seq.NEXTVAL, #{category}, #{title}, #{content}, #{userId})")
    void insertBoardData(OnlineBoard boardDataBean);

    /**
     * Retrieves a list of board data for a specific category.
     * The results are ordered by BOARDID in descending order.
     *
     * @param category The category for which to retrieve board data.
     * @return A list of BoardDataBean objects representing the board data.
     */
    @Select("SELECT * FROM ONLINEBOARD WHERE CATEGORY = #{category} ORDER BY BOARDID DESC")
    List<OnlineBoard> getBoardList(String category);

    /**
     * Retrieves board data by a specific board ID.
     *
     * @param boardId The ID of the board data to retrieve.
     * @return A BoardDataBean object representing the board data.
     */
    @Select("SELECT * FROM ONLINEBOARD WHERE BOARDID = #{boardId}")
    OnlineBoard getBoardData(@Param("boardId") Long boardId);

    /**
     * Updates board data for a specific board ID.
     *
     * @param boardDataBean The BoardDataBean object containing the updated data.
     */
    @Update("UPDATE ONLINEBOARD SET TITLE = #{title}, CONTENT = #{content} WHERE BOARDID = #{boardId}")
    void updateBoardData(OnlineBoard boardDataBean);

    /**
     * Deletes board data for a specific board ID.
     *
     * @param boardId The ID of the board data to delete.
     */
    @Delete("DELETE FROM ONLINEBOARD WHERE BOARDID = #{boardId}")
    void deleteBoardData(@Param("boardId") Long boardId);

}
