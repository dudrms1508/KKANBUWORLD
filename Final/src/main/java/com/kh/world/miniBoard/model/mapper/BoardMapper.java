package com.kh.world.miniBoard.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.kh.world.miniBoard.model.vo.Board;
import com.kh.world.miniBoard.model.vo.Reply;

@Mapper //매퍼 스캐너를통해 자동으로 구현하게끔
public interface BoardMapper {
	
	int selectBoardCount();
	
	List<Board> selectAll (RowBounds bounds);
	
	Board selectBoardByNo(@Param("no") int no);
	
	int updateStatus(@Param("no") int no, @Param("status") String status);

	int insertBoard(Board board);
	
	int updateBoard(Board board);

	int insertReply(Reply reply);

	List<Reply> findReplyByNo(@Param("no") int no);

	int updateReadCount(@Param("no") int no);
}
