package security;

import javax.annotation.Resource;

import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

/**
 * 
 * 사용자의 암호를 SHA-256으로 암호화 하고 사용자의 비밀번호 입력을 인증하는 클래스
 * 
 * @author 양현모
 *
 */
@Service
public class ShaEncoder {

	@Resource(name = "passwordEncoder")
	private BCryptPasswordEncoder encoder;

	/**
	 * 사용자의 암호를 입력받아 암호화를 하여 리턴 함
	 * 
	 * @param password
	 * @return 암호화 된 패스워드
	 */
	public String encoding(String password) {
		return encoder.encode(password);
	}
	
	/**
	 * 사용자의 암호화된 비밀번호를 로그인 시 비교하여 확인
	 * @param rawPassword 입력받은 암호
	 * @param encodedPassword 암호화된 문자열
	 * @return 암호가 맞으면 true 틀리면 false
	 */
	
	public boolean matches(CharSequence rawPassword, String encodedPassword) {
		return encoder.matches(rawPassword,encodedPassword);
	}
	
}