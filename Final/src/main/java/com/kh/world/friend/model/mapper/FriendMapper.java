package com.kh.world.friend.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kh.world.ilchon.model.vo.Ilchon;
import com.kh.world.ilchon.model.vo.IlchonAddMinihome;

@Mapper
public interface FriendMapper {

	List<IlchonAddMinihome> friendListAll(int no);

}