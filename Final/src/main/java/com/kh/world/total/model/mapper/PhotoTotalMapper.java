package com.kh.world.total.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kh.world.photo.model.vo.Photo;
import com.kh.world.total.model.vo.PhotoTotal;

@Mapper
public interface PhotoTotalMapper {

	PhotoTotal findPhotoTotalNo1();

	PhotoTotal findPhotoTotalNo2();

	PhotoTotal findPhotoTotalNo3();

//	List<Photo> findPhotoView1();
//
//	List<Photo> findPhotoView2();
//
//	List<Photo> findPhotoView3();


}