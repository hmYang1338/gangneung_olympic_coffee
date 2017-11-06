package dto;

public class Nation {
	private int nationCode;
	private String nation;
	
	public Nation() {}

	public Nation(int nationCode, String nation) {
		this.nationCode = nationCode;
		this.nation = nation;
	}

	public int getNationCode() {
		return nationCode;
	}

	public void setNationCode(int nationCode) {
		this.nationCode = nationCode;
	}

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("nation [nationCode=");
		builder.append(nationCode);
		builder.append(", nation=");
		builder.append(nation);
		builder.append("]");
		return builder.toString();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((nation == null) ? 0 : nation.hashCode());
		result = prime * result + nationCode;
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
		Nation other = (Nation) obj;
		if (nation == null) {
			if (other.nation != null)
				return false;
		} else if (!nation.equals(other.nation))
			return false;
		if (nationCode != other.nationCode)
			return false;
		return true;
	}
	
}
