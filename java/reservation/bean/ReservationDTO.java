package reservation.bean;

import lombok.Data;

@Data
public class ReservationDTO {
	private String name;
	private String howmany;
	private String tel;
	private String log_time;
	private String visiting_time;
	private String accepted;
}
