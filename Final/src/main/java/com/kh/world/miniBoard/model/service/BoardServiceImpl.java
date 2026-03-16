package com.kh.world.miniBoard.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.world.common.util.PageInfo;
import com.kh.world.miniBoard.model.mapper.BoardMapper;
import com.kh.world.miniBoard.model.vo.Board;
import com.kh.world.miniBoard.model.vo.Reply;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper mapper;
	
	@Override
	public int getBoardCount() {
		
		return mapper.selectBoardCount();
	}

	@Override
	public List<Board> getBoardList(PageInfo pageInfo) {
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() -1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.selectAll(rowBounds);
	}
	

	@Override
	public Board findBoardByNo(int no) {
		mapper.updateReadCount(no);
		
		return mapper.selectBoardByNo(no);
	}

	@Override
	@Transactional
	public int delete(int no) {
		
		return mapper.updateStatus(no, "N");
	}

	@Override
	@Transactional
	public int save(Board board) {
		int result = 0;
		
		if (board.getNo() > 0) {
			//update
			result = mapper.updateBoard(board);
			
		}else {
			//insert
			result = mapper.insertBoard(board);
		}
		
		return result;
	}

	@Override
	public int save(Reply reply) {
		int result = 0;
		
		if (reply.getNo() > 0) {
			//update
//			result = mapper.updateRoard(reply);
			
		}else {
			//insert
			result = mapper.insertReply(reply);
		}
		
		return result;
	}

	@Override
	public List<Reply> findReplyByNo(int no) {
		return mapper.findReplyByNo(no);
	}

}
