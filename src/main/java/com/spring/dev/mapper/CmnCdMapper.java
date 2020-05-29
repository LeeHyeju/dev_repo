package com.spring.dev.mapper;

import java.util.List;
import org.springframework.stereotype.Repository;
import com.spring.dev.domain.CmnCd;

@Repository(value = "CmnCdMapper")
public interface CmnCdMapper {
	public List<CmnCd> getCmnCd();
}
