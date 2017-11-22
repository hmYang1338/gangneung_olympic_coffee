package dto;

public class ManagerStoreJOIN {
	private String email;
	private String name;
	private String tel;
	private String sName;
	private String sAddr;
	private String sTel;
	
	public ManagerStoreJOIN() {}
	public ManagerStoreJOIN(String email, String name, String tel, String sName, String sAddr, String sTel) {
		super();
		this.email = email;
		this.name = name;
		this.tel = tel;
		this.sName = sName;
		this.sAddr = sAddr;
		this.sTel = sTel;
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
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
	public String getsAddr() {
		return sAddr;
	}
	public void setsAddr(String sAddr) {
		this.sAddr = sAddr;
	}
	public String getsTel() {
		return sTel;
	}
	public void setsTel(String sTel) {
		this.sTel = sTel;
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
		builder.append(", sName=");
		builder.append(sName);
		builder.append(", sAddr=");
		builder.append(sAddr);
		builder.append(", sTel=");
		builder.append(sTel);
		builder.append("]");
		return builder.toString();
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((sAddr == null) ? 0 : sAddr.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((sName == null) ? 0 : sName.hashCode());
		result = prime * result + ((sTel == null) ? 0 : sTel.hashCode());
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
		if (sAddr == null) {
			if (other.sAddr != null)
				return false;
		} else if (!sAddr.equals(other.sAddr))
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
		if (sName == null) {
			if (other.sName != null)
				return false;
		} else if (!sName.equals(other.sName))
			return false;
		if (sTel == null) {
			if (other.sTel != null)
				return false;
		} else if (!sTel.equals(other.sTel))
			return false;
		if (tel == null) {
			if (other.tel != null)
				return false;
		} else if (!tel.equals(other.tel))
			return false;
		return true;
	}
}
