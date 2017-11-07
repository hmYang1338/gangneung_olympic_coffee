package exception;

/**
 * 사용자 정의 예외 클래스
 * 사용자 정의 예외의 최상위 클래스로 지정할 예정임.
 * 필요한 메소드는 추후 추가
 * @author 신승엽
 */
public class MyException extends Exception{

	/**
	 * MyException의 생성자로 해당 메소드 생성시 메시지(msg)를 입력하여, 해당 String이 오류에 나타나도록 함.
	 * @param msg 사용자가 이해할 수 있는 오류 코드
	 */
	public MyException(String msg) {
		super(msg);
	}
}
