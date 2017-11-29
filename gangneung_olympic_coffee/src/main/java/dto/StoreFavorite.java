package dto;

import java.util.Date;

public class StoreFavorite {
	private int favNum;
	private String email;
	private int lanCode;
	private int id;
	private Date favDate;
	
	public StoreFavorite() {}
	
	public StoreFavorite(int id, Date favDate) {
		this.id = id;
		this.favDate = favDate;
	}

	public StoreFavorite(int favNum, String email, int lanCode, int id, Date favDate) {
		this.favNum = favNum;
		this.email = email;
		this.lanCode = lanCode;
		this.id = id;
		this.favDate = favDate;
	}

	public int getFavNum() {
		return favNum;
	}

	public void setFavNum(int favNum) {
		this.favNum = favNum;
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

	public Date getFavDate() {
		return favDate;
	}

	public void setFavDate(Date favDate) {
		this.favDate = favDate;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("StoreFavorite [favNum=");
		builder.append(favNum);
		builder.append(", email=");
		builder.append(email);
		builder.append(", lanCode=");
		builder.append(lanCode);
		builder.append(", id=");
		builder.append(id);
		builder.append(", favDate=");
		builder.append(favDate);
		builder.append("]");
		return builder.toString();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((favDate == null) ? 0 : favDate.hashCode());
		result = prime * result + favNum;
		result = prime * result + id;
		result = prime * result + lanCode;
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
		StoreFavorite other = (StoreFavorite) obj;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (favDate == null) {
			if (other.favDate != null)
				return false;
		} else if (!favDate.equals(other.favDate))
			return false;
		if (favNum != other.favNum)
			return false;
		if (id != other.id)
			return false;
		if (lanCode != other.lanCode)
			return false;
		return true;
	}
	
}
