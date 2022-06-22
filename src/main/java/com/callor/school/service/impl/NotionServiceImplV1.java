package com.callor.school.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.callor.school.model.NotionVO;
import com.callor.school.pesistance.NotionDao;
import com.callor.school.service.NotionService;

@Service
public class NotionServiceImplV1 implements NotionService{

	private final NotionDao notionDao;
	public NotionServiceImplV1(NotionDao notionDao) {
		this.notionDao = notionDao;
	}
	
	@Override
	public void create_notion_table() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<NotionVO> selectAll() {
		List<NotionVO> noList = notionDao.selectAll();
		return noList;
	}

	@Override
	public NotionVO findById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(NotionVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(NotionVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

}
