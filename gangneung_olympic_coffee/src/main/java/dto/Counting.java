package dto;

import java.util.Date;

public class Counting {
	private int cntNum;
	private String email;
	private int id;
	private int lanCode;
	private int oz;
	private Date accDate;
	
	public Counting() {}

	public Counting(int cntNum, String email, int id, int lanCode, int oz, Date accDate) {
		this.cntNum = cntNum;
		this.email = email;
		this.id = id;
		this.lanCode = lanCode;
		this.oz = oz;
		this.accDate = accDate;
	}

	public int getCntNum() {
		return cntNum;
	}

	public void setCntNum(int cntNum) {
		this.cntNum = cntNum;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getLanCode() {
		return lanCode;
	}

	public void setLanCode(int lanCode) {
		this.lanCode = lanCode;
	}

	public int getOz() {
		return oz;
	}

	public void setOz(int oz) {
		this.oz = oz;
	}

	public Date getAccDate() {
		return accDate;
	}

	public void setAccDate(Date accDate) {
		this.accDate = accDate;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Counting [cntNum=");
		builder.append(cntNum);
		builder.append(", email=");
		builder.append(email);
		builder.append(", id=");
		builder.append(id);
		builder.append(", lanCode=");
		builder.append(lanCode);
		builder.append(", oz=");
		builder.append(oz);
		builder.append(", accDate=");
		builder.append(accDate);
		builder.append("]");
		return builder.toString();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((accDate == null) ? 0 : accDate.hashCode());
		result = prime * result + cntNum;
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + id;
		result = prime * result + lanCode;
		result = prime * result + oz;
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
		Counting other = (Counting) obj;
		if (accDate == null) {
			if (other.accDate != null)
				return false;
		} else if (!accDate.equals(other.accDate))
			return false;
		if (cntNum != other.cntNum)
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (id != other.id)
			return false;
		if (lanCode != other.lanCode)
			return false;
		if (oz != other.oz)
			return false;
		return true;
	}
	
}
