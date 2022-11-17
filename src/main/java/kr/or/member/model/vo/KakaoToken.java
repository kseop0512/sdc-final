package kr.or.member.model.vo;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
public class KakaoToken {
	String token_type;
    String access_token;
    Integer expires_in;
    String refresh_token;
    String id_token;
    Integer refresh_token_expires_in;
    String scope;
}
