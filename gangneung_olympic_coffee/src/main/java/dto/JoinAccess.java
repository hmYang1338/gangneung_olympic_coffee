package dto;

public class JoinAccess {
	private String email;
	private String accessCode;
	
	public JoinAccess() {}

	public JoinAccess(String email, String accessCode) {
		this.email = email;
		this.accessCode = accessCode;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAccessCode() {
		return accessCode;
	}

	public void setAccessCode(String accessCode) {
		this.accessCode = accessCode;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("JoinAccess [email=");
		builder.append(email);
		builder.append(", accessCode=");
		builder.append(accessCode);
		builder.append("]");
		return builder.toString();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((accessCode == null) ? 0 : accessCode.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		JoinAccess other = (JoinAccess) obj;
		if (accessCode == null) {
			if (other.accessCode != null)
				return false;
		} else if (!accessCode.equals(other.accessCode))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		return true;
	}
	
}
