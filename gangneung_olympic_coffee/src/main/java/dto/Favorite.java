package dto;

public class Favorite {
	private int favNum;
	private int id;
	private int lanCode;
	private int oz;
	private String email;
	
	public Favorite() {}

	public Favorite(int favNum, int id, int lanCode, int oz, String email) {
		this.favNum = favNum;
		this.id = id;
		this.lanCode = lanCode;
		this.oz = oz;
		this.email = email;
	}

	public int getFavNum() {
		return favNum;
	}

	public void setFavNum(int favNum) {
		this.favNum = favNum;
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

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("favorite [favNum=");
		builder.append(favNum);
		builder.append(", id=");
		builder.append(id);
		builder.append(", lanCode=");
		builder.append(lanCode);
		builder.append(", oz=");
		builder.append(oz);
		builder.append(", email=");
		builder.append(email);
		builder.append("]");
		return builder.toString();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((email == null) ? 0 : email.hashCode());
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
		Favorite other = (Favorite) obj;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
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
