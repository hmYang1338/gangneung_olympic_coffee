package sercurity;

import java.util.Arrays;

import javax.annotation.Resource;

import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

/**
 * 2차
 * @author hyunmoYang
 */
@org.springframework.stereotype.Service("shaEncoder")
public class SHAPasswordEncoder implements PasswordEncoder {
	
	@Resource(name="passwordEncoder")
	private ShaPasswordEncoder shaPasswordEncoder;
	private byte[] salt = null;

	public SHAPasswordEncoder() {
		shaPasswordEncoder = new ShaPasswordEncoder();
	}
	public SHAPasswordEncoder(int sha) {
		shaPasswordEncoder = new ShaPasswordEncoder(sha);
	}
	
	public void setEncodeHashAsBase64(boolean encodeHashAsBase64) {
		shaPasswordEncoder.setEncodeHashAsBase64(encodeHashAsBase64);
	}
	public void setSalt(byte[] salt) {
		System.out.println(Arrays.toString(salt));
		this.salt = salt;
	}

	public String encode(CharSequence rawPassword) {
		return shaPasswordEncoder.encodePassword(rawPassword.toString(), salt);
	}
	public boolean matches(CharSequence rawPassword, String encodedPassword) {
		return shaPasswordEncoder.isPasswordValid(encodedPassword, rawPassword.toString(), salt);
	}
}
