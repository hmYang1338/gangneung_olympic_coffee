package dto;

import java.util.Date;

public class ProductFavorite {
	private int favNum;
	private String email;
	private int lanCode;
	private int id;
	private int code;
	private int oz;
	private Date favDate;
	
	public ProductFavorite() {}
	
	public ProductFavorite(int id, int code, int oz, Date favDate) {
		this.id = id;
		this.code = code;
		this.oz = oz;
		this.favDate = favDate;
	}

	public ProductFavorite(int favNum, String email, int lanCode, int id, int code, int oz, Date favDate) {
		this.favNum = favNum;
		this.email = email;
		this.lanCode = lanCode;
		this.id = id;
		this.code = code;
		this.oz = oz;
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

	public Date getFavDate() {
		return favDate;
	}

	public void setFavDate(Date favDate) {
		this.favDate = favDate;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ProductFavorite [favNum=");
		builder.append(favNum);
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
		builder.append(", favDate=");
		builder.append(favDate);
		builder.append("]");
		return builder.toString();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + code;
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((favDate == null) ? 0 : favDate.hashCode());
		result = prime * result + favNum;
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
		ProductFavorite other = (ProductFavorite) obj;
		if (code != other.code)
			return false;
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
		if (oz != other.oz)
			return false;
		return true;
	}
	
}
