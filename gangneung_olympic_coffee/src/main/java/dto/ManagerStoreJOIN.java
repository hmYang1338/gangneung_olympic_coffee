package dto;

public class ManagerStoreJOIN {
	private String email;
	private String name;
	private String tel;
	private String s_name;
	private String s_addr;
	private String s_tel;
	
	public ManagerStoreJOIN() {}
	public ManagerStoreJOIN(String email, String name, String tel, String s_name, String s_addr, String s_tel) {
		super();
		this.email = email;
		this.name = name;
		this.tel = tel;
		this.s_name = s_name;
		this.s_addr = s_addr;
		this.s_tel = s_tel;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String gets_addr() {
		return s_addr;
	}
	public void sets_addr(String s_addr) {
		this.s_addr = s_addr;
	}
	public String getS_tel() {
		return s_tel;
	}
	public void setS_tel(String s_tel) {
		this.s_tel = s_tel;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ManagerStoreJOIN [email=");
		builder.append(email);
		builder.append(", name=");
		builder.append(name);
		builder.append(", tel=");
		builder.append(tel);
		builder.append(", s_name=");
		builder.append(s_name);
		builder.append(", s_addr=");
		builder.append(s_addr);
		builder.append(", s_tel=");
		builder.append(s_tel);
		builder.append("]");
		return builder.toString();
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((s_addr == null) ? 0 : s_addr.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((s_name == null) ? 0 : s_name.hashCode());
		result = prime * result + ((s_tel == null) ? 0 : s_tel.hashCode());
		result = prime * result + ((tel == null) ? 0 : tel.hashCode());
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
		ManagerStoreJOIN other = (ManagerStoreJOIN) obj;
		if (s_addr == null) {
			if (other.s_addr != null)
				return false;
		} else if (!s_addr.equals(other.s_addr))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (s_name == null) {
			if (other.s_name != null)
				return false;
		} else if (!s_name.equals(other.s_name))
			return false;
		if (s_tel == null) {
			if (other.s_tel != null)
				return false;
		} else if (!s_tel.equals(other.s_tel))
			return false;
		if (tel == null) {
			if (other.tel != null)
				return false;
		} else if (!tel.equals(other.tel))
			return false;
		return true;
	}
}
