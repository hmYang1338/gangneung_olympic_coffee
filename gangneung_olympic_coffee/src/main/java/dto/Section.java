package dto;

public class Section {
	private int code;
	private String type;
	private int parentCode;
	
	public Section() {}

	public Section(int code, String type, int parentCode) {
		this.code = code;
		this.type = type;
		this.parentCode = parentCode;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getParentCode() {
		return parentCode;
	}

	public void setParentCode(int parentCode) {
		this.parentCode = parentCode;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("section [code=");
		builder.append(code);
		builder.append(", type=");
		builder.append(type);
		builder.append(", parentCode=");
		builder.append(parentCode);
		builder.append("]");
		return builder.toString();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + code;
		result = prime * result + parentCode;
		result = prime * result + ((type == null) ? 0 : type.hashCode());
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
		Section other = (Section) obj;
		if (code != other.code)
			return false;
		if (parentCode != other.parentCode)
			return false;
		if (type == null) {
			if (other.type != null)
				return false;
		} else if (!type.equals(other.type))
			return false;
		return true;
	}
	
}
