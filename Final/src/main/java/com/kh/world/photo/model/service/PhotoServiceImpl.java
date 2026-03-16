package com.kh.world.photo.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.world.common.util.PageInfo;
import com.kh.world.minihome.model.vo.Minihome;
import com.kh.world.photo.model.mapper.PhotoMapper;
import com.kh.world.photo.model.vo.Photo;
import com.kh.world.photo.model.vo.PhotoReply;
@Service
public class PhotoServiceImpl implements PhotoService {
	
	@Autowired
	private PhotoMapper mapper;

	@Override
	public List<Photo> findLastPhoto(int minihomeNo) {
		return mapper.findLastPhoto(minihomeNo);
	}

	@Override
	public List<Photo> findReplyPhoto(int minihomeNo) {
		return mapper.findReplyPhoto(minihomeNo);
	}

	@Override
	public List<Photo> findViewPhoto(int minihomeNo) {
		return mapper.findViewPhoto(minihomeNo);
	}

	
	@Override
	@Transactional
	public int save(Photo photo) {
		int result = 0;
		if (photo.getNo() > 0) {
			//update
			result = mapper.updatePhoto(photo);
		}else {
			//insert
			result = mapper.insertPhoto(photo);
		}
		
		
		return result;
	}

	@Override
	public Photo findPhotoByNo(int no) {
		// TODO Auto-generated method stub
		return mapper.findPhotoByNo(no);
	}

//	@Override
//	public List<Photo> findPhotoByFolderNo(int folderNo) {
//		return mapper.findPhotoByFolderNo(folderNo);
//	}

//	@Override
//	public int getPhotoCountByFolder(int folderNo) {
//		return mapper.getPhotoCountByFolder(folderNo);
//	}


	@Override
	public List<Photo> findPhotoByFolderNo(int folderNo, PageInfo pageInfo) {
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() -1)* limit ;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		
		return mapper.findPhotoByFolderNo(folderNo ,rowBounds);
	}

	@Override
	public int deletePhoto(List<String> list) {
		return mapper.deletePhoto(list);
	}

	@Override
	public int save(PhotoReply reply) {
		int result = 0;
		if (reply.getNo() > 0) {
			//update
			result = mapper.updateReply(reply);
		}else {
			//insert
			result = mapper.insertReply(reply);
		}
		
		
		return result;
	}

	@Override
	public List<PhotoReply> findReplyByNo(int no) {
		return mapper.findReplyByNo(no);
	}

	@Override
	public int deleteReplyByNo(int no) {
		return mapper.deleteReplyByNo(no);
	}

	@Override
	public Minihome findMinihomeByNo(int minihomeNo) {
		return mapper.findMinihomeByNo(minihomeNo);
	}

	@Override
	public int getPhotoCountByFolder(int folderNo, int minihomeNo) {
		return mapper.getPhotoCountByFolder(folderNo,minihomeNo);
	}

	@Override
	public List<Photo> findPhotoByFolderNo(int folderNo, int minihomeNo, PageInfo pageInfo) {
		int limit = pageInfo.getListLimit();
		int offset = (pageInfo.getCurrentPage() -1)* limit ;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		
		return mapper.findPhotoByFolderNo(folderNo,minihomeNo ,rowBounds);
	}
}
