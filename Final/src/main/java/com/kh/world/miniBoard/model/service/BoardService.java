package com.kh.world.miniBoard.model.service;

import java.util.List;

import com.kh.world.common.util.PageInfo;
import com.kh.world.miniBoard.model.vo.Board;
import com.kh.world.miniBoard.model.vo.Reply;

public interface BoardService {

	int getBoardCount();

	List<Board> getBoardList(PageInfo pageInfo);

	Board findBoardByNo(int no);

	int delete(int no);

	int save(Board board);

	int save(Reply reply);

	List<Reply> findReplyByNo(int no);
	

}
