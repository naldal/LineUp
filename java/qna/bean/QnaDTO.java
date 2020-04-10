package qna.bean;

import lombok.Data;

@Data
public class QnaDTO {
	private int seq_qna;
	private String category_qna;
	private int seq_member;
	private String subject_qna;
	private String content_qna;
	private String img;
	private String log_time;
	private String status;
	private String secret;
	private String member_id;
	private String reply;
}
