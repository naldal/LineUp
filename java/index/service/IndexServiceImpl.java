package index.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import index.bean.IndexReviewDTO;
import index.dao.IndexDAO;
@Service
public class IndexServiceImpl implements IndexService {
	@Autowired
	private IndexDAO indexDAO;
	@Override
	public List<IndexReviewDTO> ReviewList() {
		return indexDAO.indexReviewList();
	}

}
