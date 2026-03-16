package com.kh.world.photo.model.service;

import java.util.List;
import java.util.Map;

import com.kh.world.common.util.PageInfo;
import com.kh.world.minihome.model.vo.Minihome;
import com.kh.world.photo.model.vo.Photo;
import com.kh.world.photo.model.vo.PhotoReply;

public interface PhotoService {

	List<Photo> findLastPhoto(int minihomeNo);

	List<Photo> findReplyPhoto(int minihomeNo);

	List<Photo> findViewPhoto(int minihomeNo);

	int save(Photo photo);

	Photo findPhotoByNo(int no);

//	List<Photo> findPhotoByFolderNo(int folderNo);

//	int getPhotoCountByFolder(int folderNo);
	
	int getPhotoCountByFolder(int folderNo, int minihomeNo);

	List<Photo> findPhotoByFolderNo(int folderNo, PageInfo pageInfo);

	int deletePhoto(List<String> list);

	int save(PhotoReply reply);

	List<PhotoReply> findReplyByNo(int no);

	int deleteReplyByNo(int photoNo);

	Minihome findMinihomeByNo(int minihomeNo);

	List<Photo> findPhotoByFolderNo(int folderNo, int minihomeNo, PageInfo pageInfo);

}
