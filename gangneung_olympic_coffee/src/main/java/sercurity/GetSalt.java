package sercurity;

import java.security.SecureRandom;

/**
 * salt값 만들어주는 클래스
 * @author hyunmoYang
 */
public class GetSalt {
	public static String getSalt() {
		String value = "";
		try {
			SecureRandom secureRandom = SecureRandom.getInstance("SHA1PRNG");
			// Salt generation 128 bits long
			byte[] salt = new byte[16];
			secureRandom.nextBytes(salt);
			value = salt.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return value;
	}
} // end of class
