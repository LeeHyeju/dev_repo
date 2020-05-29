package com.spring.dev.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.spring.dev.domain.IntrBrd;
import com.spring.dev.mapper.IntrBrdMapper;

@Service
public class IntrBrdService {
	@Autowired
	IntrBrdMapper mapper;
	
	public List<IntrBrd> getBrd() {
		return mapper.getBrd();
	}
	
}
