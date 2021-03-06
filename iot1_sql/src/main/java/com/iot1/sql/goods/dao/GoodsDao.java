package com.iot1.sql.goods.dao;

import java.util.List;

import com.iot1.sql.goods.dto.GoodsInfo;

public interface GoodsDao 
{
	public GoodsInfo selectGoodsInfo(GoodsInfo gi);
	
	public List<GoodsInfo> selectGoodsInfoList(GoodsInfo gi);
	
	public int insertGoodsInfoList(GoodsInfo gi);
	
	public int updateGoodsInfoList(GoodsInfo gi);
	
	public int deleteGoodsInfoList(GoodsInfo gi);
}
