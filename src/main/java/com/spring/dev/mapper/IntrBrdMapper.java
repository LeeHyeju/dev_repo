package com.spring.dev.mapper;

import java.util.List;
import org.springframework.stereotype.Repository;
import com.spring.dev.domain.IntrBrd;

@Repository(value = "IntrBrdMapper")
public interface IntrBrdMapper {
	
	public List<IntrBrd> getBrd();
	
}
