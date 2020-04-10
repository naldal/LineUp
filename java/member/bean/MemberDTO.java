package member.bean;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class MemberDTO {
	
	private int seq_member; //유저번호
	private String real_name; //사업자명
	private String nickname;  //닉네임
	private String id;		//아이디
	private String pwd;		//비밀번호
	private String tel;		//전화번호
	private String company_num; //사업자등록번호
	private String position; // 사업자/개인
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy.MM.dd")
	private Date log_time; //등록날짜
	private String authStatus;//이메일 인증 체크
	private String authKey; //이메일 인증 번호
	private String store_exist; //사업자중 가게등록유무
	private String reservation;
	
}
