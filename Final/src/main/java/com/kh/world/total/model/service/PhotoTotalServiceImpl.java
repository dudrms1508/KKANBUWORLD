package com.kh.world.total.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.world.photo.model.vo.Photo;
import com.kh.world.total.model.mapper.PhotoTotalMapper;
import com.kh.world.total.model.vo.PhotoTotal;

@Service
public class PhotoTotalServiceImpl implements PhotoTotalService {
	
	@Autowired
	private PhotoTotalMapper mapper;

	@Override
	public PhotoTotal findPhotoTotal1() {
		
		return mapper.findPhotoTotalNo1();
	}

	@Override
	public PhotoTotal findPhotoTotal2() {
		
		return mapper.findPhotoTotalNo2();
	}

	@Override
	public PhotoTotal findPhotoTotal3() {
		
		return mapper.findPhotoTotalNo3();
	}


//	@Override
//	public List<Photo> findPhotoView1() {
//		
//		return mapper.findPhotoView1();
//	}
//
//	@Override
//	public List<Photo> findPhotoView2() {
//		
//		return mapper.findPhotoView2();
//	}
//
//	@Override
//	public List<Photo> findPhotoView3() {
//		
//		return mapper.findPhotoView3();
//	}

}