package com.kh.world.notice.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.kh.world.notice.model.vo.Notice;

@Mapper
public interface NoticeMapper {

	List<Notice> selectAll();

	int selectNoticeCount(@Param("type") String type, @Param("keyword") String keyword);

	List<Notice> selectListAll(RowBounds rowBounds);

	int insertNotice(Map<String, Object> map);

	int isAdmin(int no);

	int updateNotice(Map<String, Object> map);

	Notice selectNoticeByNo(int no);

	Notice selectNoticeRownum(int no);

	// no값을 넣어서 rownum 있는 notice 가져오는 mapper
	Notice selectNoticeByRownum(int no);

	int deleteNotice(int no);

	//List<Notice> search(@Param("type") String type,@Param("keyword") String keyword);

	List<Notice> search(Map<String, Object> map);

	List<Notice> search(Map<String, Object> map, RowBounds rowBounds);





}
