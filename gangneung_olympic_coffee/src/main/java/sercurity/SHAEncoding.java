package sercurity;

/**
 * SHA-256으로 패스워드를 받아와 암호화된 Password와 salt값을 제공하는 클래스
 * @author hyunmoYang
 */
public class SHAEncoding {
	private String salt = GetSalt.getSalt();
	private SHAPasswordEncoder encoder = new SHAPasswordEncoder(256);
	
	public SHAEncoding() {}
	
	public String getSalt() {
		return salt;
	}
	
	public void setSalt(String salt) {
		this.salt = salt;
	}
	
	public SHAPasswordEncoder getEncoder() {
		return encoder;
	}
	public void setEncoder(SHAPasswordEncoder encoder) {
		this.encoder = encoder;
	}
	
	/**
	 * 패스워드 값을 받아와 salt값을 생성하여, 
	 * @param password : 사용자의 패스워드 값을 입력받음
	 * @return 암호화 된 패스워드를 리턴 함
	 */
	public String getPassword(String password) {
		encoder.setEncodeHashAsBase64(true);
		encoder.setSalt(salt.getBytes());
		return new PasswordEncoding(encoder).encode(password);
	}
	
	public boolean passwordEquals(String dbPassword, String newPassword) {
		encoder.setEncodeHashAsBase64(true);
		if(encoder.matches(newPassword,dbPassword)) {
			System.out.println("로그인 성공");	// test
			return true;
		}
		return false;
	}
}
