package sercurity;

import java.security.SecureRandom;

/**
 * salt값 만들어주는 클래스
 * @author hyunmoYang
 */
public class GetSalt {
	public static String getSalt() {
		byte[] salt = new byte[16];
		try {
			SecureRandom secureRandom = SecureRandom.getInstance("SHA1PRNG");
			// Salt generation 128 bits long
			secureRandom.nextBytes(salt);
		} catch (Exception e) {
			e.printStackTrace();
		}
		StringBuffer hexString = new StringBuffer();
		for (int i = 0; i < salt.length; i++) {
			String hex = Integer.toHexString(0xff & salt[i]);
			if (hex.length() == 1) {
				hexString.append('0');
			}
			hexString.append(hex);
		}
		return hexString.toString();
	}
} // end of class
