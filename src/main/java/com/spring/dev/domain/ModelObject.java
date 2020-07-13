package com.spring.dev.domain;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public abstract class ModelObject {

	/**
	 * Javascript 에 쉽게 매핑하기 위해서 toString 은 Json String 으로 리턴 한다.
	 * 
	 */
	@Override
	public String toString() {
		ObjectMapper mapper = new ObjectMapper();
		//object 형식을 json으로 변환시켜준다.  
		try {
			return mapper.writeValueAsString(this);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return "{}";
	}
}
