package dto;

import java.util.Date;

public class Member {
	private String email;
	private String password;
	private String salt;
	private String name;
	private int gender;
	private Date birth;
	private int nationCode;
	private int lan_code;
	private Date joinDate;
	private Date lastDate;
	private String imgDir;
	private String AccessCode;
	
	public Member() {}

	public Member(String email, String password, String salt, String name, int gender, Date birth, int nationCode,
			int lan_code, Date joinDate, Date lastDate, String imgDir, String accessCode) {
		super();
		this.email = email;
		this.password = password;
		this.salt = salt;
		this.name = name;
		this.gender = gender;
		this.birth = birth;
		this.nationCode = nationCode;
		this.lan_code = lan_code;
		this.joinDate = joinDate;
		this.lastDate = lastDate;
		this.imgDir = imgDir;
		AccessCode = accessCode;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public int getNationCode() {
		return nationCode;
	}

	public void setNationCode(int nationCode) {
		this.nationCode = nationCode;
	}

	public int getLan_code() {
		return lan_code;
	}

	public void setLan_code(int lan_code) {
		this.lan_code = lan_code;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public Date getLastDate() {
		return lastDate;
	}

	public void setLastDate(Date lastDate) {
		this.lastDate = lastDate;
	}

	public String getImgDir() {
		return imgDir;
	}

	public void setImgDir(String imgDir) {
		this.imgDir = imgDir;
	}

	public String getAccessCode() {
		return AccessCode;
	}

	public void setAccessCode(String accessCode) {
		AccessCode = accessCode;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Member [email=");
		builder.append(email);
		builder.append(", password=");
		builder.append(password);
		builder.append(", salt=");
		builder.append(salt);
		builder.append(", name=");
		builder.append(name);
		builder.append(", gender=");
		builder.append(gender);
		builder.append(", birth=");
		builder.append(birth);
		builder.append(", nationCode=");
		builder.append(nationCode);
		builder.append(", lan_code=");
		builder.append(lan_code);
		builder.append(", joinDate=");
		builder.append(joinDate);
		builder.append(", lastDate=");
		builder.append(lastDate);
		builder.append(", imgDir=");
		builder.append(imgDir);
		builder.append(", AccessCode=");
		builder.append(AccessCode);
		builder.append("]");
		return builder.toString();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((AccessCode == null) ? 0 : AccessCode.hashCode());
		result = prime * result + ((birth == null) ? 0 : birth.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + gender;
		result = prime * result + ((imgDir == null) ? 0 : imgDir.hashCode());
		result = prime * result + ((joinDate == null) ? 0 : joinDate.hashCode());
		result = prime * result + lan_code;
		result = prime * result + ((lastDate == null) ? 0 : lastDate.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + nationCode;
		result = prime * result + ((password == null) ? 0 : password.hashCode());
		result = prime * result + ((salt == null) ? 0 : salt.hashCode());
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
		Member other = (Member) obj;
		if (AccessCode == null) {
			if (other.AccessCode != null)
				return false;
		} else if (!AccessCode.equals(other.AccessCode))
			return false;
		if (birth == null) {
			if (other.birth != null)
				return false;
		} else if (!birth.equals(other.birth))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (gender != other.gender)
			return false;
		if (imgDir == null) {
			if (other.imgDir != null)
				return false;
		} else if (!imgDir.equals(other.imgDir))
			return false;
		if (joinDate == null) {
			if (other.joinDate != null)
				return false;
		} else if (!joinDate.equals(other.joinDate))
			return false;
		if (lan_code != other.lan_code)
			return false;
		if (lastDate == null) {
			if (other.lastDate != null)
				return false;
		} else if (!lastDate.equals(other.lastDate))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (nationCode != other.nationCode)
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		if (salt == null) {
			if (other.salt != null)
				return false;
		} else if (!salt.equals(other.salt))
			return false;
		return true;
	}
	
}
