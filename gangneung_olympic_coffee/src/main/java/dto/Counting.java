package dto;

import java.util.Date;

public class Counting {
	private int seq;
	private String email;
	private int lanCode;
	private int id;
	private int code;
	private int oz;
	private Date accDate;
	
	public Counting() {}

	public Counting(int seq, String email, int lanCode, int id, int code, int oz, Date accDate) {
		this.seq = seq;
		this.email = email;
		this.lanCode = lanCode;
		this.id = id;
		this.code = code;
		this.oz = oz;
		this.accDate = accDate;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getLanCode() {
		return lanCode;
	}

	public void setLanCode(int lanCode) {
		this.lanCode = lanCode;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
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
		builder.append("Counting [seq=");
		builder.append(seq);
		builder.append(", email=");
		builder.append(email);
		builder.append(", lanCode=");
		builder.append(lanCode);
		builder.append(", id=");
		builder.append(id);
		builder.append(", code=");
		builder.append(code);
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
		result = prime * result + code;
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + id;
		result = prime * result + lanCode;
		result = prime * result + oz;
		result = prime * result + seq;
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
		if (code != other.code)
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
		if (seq != other.seq)
			return false;
		return true;
	}

}
