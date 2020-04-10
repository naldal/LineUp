package index.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import index.bean.IndexReviewDTO;
import restaurant.bean.RestaurantDTO;
@Repository
@Transactional
public class IndexDAOMybatis implements IndexDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<IndexReviewDTO> indexReviewList() {
		System.out.println("join"+sqlSession.selectList("indexSQL.indexReviewList"));
		return sqlSession.selectList("indexSQL.indexReviewList");
	}

}
