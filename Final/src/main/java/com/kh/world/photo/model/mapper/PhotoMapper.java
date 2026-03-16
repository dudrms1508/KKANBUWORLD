package com.kh.world.photo.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.kh.world.common.util.PageInfo;
import com.kh.world.minihome.model.vo.Minihome;
import com.kh.world.photo.model.vo.Photo;
import com.kh.world.photo.model.vo.PhotoReply;
@Mapper
public interface PhotoMapper {

	List<Photo> findLastPhoto(int minihomeNo);

	List<Photo> findReplyPhoto(int minihomeNo);

	List<Photo> findViewPhoto(int minihomeNo);

	int insertPhoto(Photo photo);

	Photo findPhotoByNo(int no);

	int updatePhoto(Photo photo);

//	List<Photo> findPhotoByFolderNo(int folderNo);

	int getPhotoCountByFolder(int folderNo);

	List<Photo> findPhotoByFolderNo(@Param("folderNo") int folderNo, RowBounds rowBounds);

	int deletePhoto(List<String> list);

	int insertReply(PhotoReply reply);

	List<PhotoReply> findReplyByNo(int no);

	int deleteReplyByNo(int no);

	int updateReply(PhotoReply reply);

	Minihome findMinihomeByNo(int minihomeNo);

	int getPhotoCountByFolder(@Param("folderNo")int folderNo,@Param("minihomeNo") int minihomeNo);

	List<Photo> findPhotoByFolderNo(@Param("folderNo")int folderNo,@Param("minihomeNo") int minihomeNo, RowBounds rowBounds);


}
