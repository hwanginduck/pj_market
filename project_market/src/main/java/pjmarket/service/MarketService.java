package pjmarket.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pjmarket.dao.MarketDao;

@Service
public class MarketService {
	
	@Autowired
	private MarketDao dao;
}
