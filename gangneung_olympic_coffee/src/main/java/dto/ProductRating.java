package dto;

import java.util.Date;

public class ProductRating {
	private int ratNum;
	private int id;
	private int lanCode;
	private int oz;
	private String email;
	private int taste;
	private String ratComment;
	private Date ratDate;
	
	public ProductRating() {}

	public ProductRating(int ratNum, int id, int lanCode, int oz, String email, int taste, String ratComment,
			Date ratDate) {
		this.ratNum = ratNum;
		this.id = id;
		this.lanCode = lanCode;
		this.oz = oz;
		this.email = email;
		this.taste = taste;
		this.ratComment = ratComment;
		this.ratDate = ratDate;
	}

	public int getRatNum() {
		return ratNum;
	}

	public void setRatNum(int ratNum) {
		this.ratNum = ratNum;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getTaste() {
		return taste;
	}

	public void setTaste(int taste) {
		this.taste = taste;
	}

	public String getRatComment() {
		return ratComment;
	}

	public void setRatComment(String ratComment) {
		this.ratComment = ratComment;
	}

	public Date getRatDate() {
		return ratDate;
	}

	public void setRatDate(Date ratDate) {
		this.ratDate = ratDate;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ProductRating [ratNum=");
		builder.append(ratNum);
		builder.append(", id=");
		builder.append(id);
		builder.append(", lanCode=");
		builder.append(lanCode);
		builder.append(", oz=");
		builder.append(oz);
		builder.append(", email=");
		builder.append(email);
		builder.append(", taste=");
		builder.append(taste);
		builder.append(", ratComment=");
		builder.append(ratComment);
		builder.append(", ratDate=");
		builder.append(ratDate);
		builder.append("]");
		return builder.toString();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + id;
		result = prime * result + lanCode;
		result = prime * result + oz;
		result = prime * result + ((ratComment == null) ? 0 : ratComment.hashCode());
		result = prime * result + ((ratDate == null) ? 0 : ratDate.hashCode());
		result = prime * result + ratNum;
		result = prime * result + taste;
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
		ProductRating other = (ProductRating) obj;
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
		if (ratComment == null) {
			if (other.ratComment != null)
				return false;
		} else if (!ratComment.equals(other.ratComment))
			return false;
		if (ratDate == null) {
			if (other.ratDate != null)
				return false;
		} else if (!ratDate.equals(other.ratDate))
			return false;
		if (ratNum != other.ratNum)
			return false;
		if (taste != other.taste)
			return false;
		return true;
	}
	
}
