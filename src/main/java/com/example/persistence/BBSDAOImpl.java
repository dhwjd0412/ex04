package com.example.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.domain.BBSVO;

@Repository
public class BBSDAOImpl implements BBSDAO{
	@Inject
	SqlSession session;
	private static final String namespace="BBSMapper";
	
	@Override
	public List<BBSVO> list(Integer start,String key,String word) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("key",key);
		map.put("word",word);
		map.put("start", start);
		return session.selectList(namespace + ".list",map);
	}

	@Override
	public int total(String key, String word) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("key",key);
		map.put("word",word);
		return session.selectOne(namespace + ".total",map);
	}
	
}
