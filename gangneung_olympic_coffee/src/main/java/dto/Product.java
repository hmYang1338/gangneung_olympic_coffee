package dto;

public class Product {
	private int id;
	private int lanCode;
	private int oz;
	private int code;
	private int price;
	
	public Product() {}

	public Product(int id, int lanCode, int oz, int code, int price) {
		this.id = id;
		this.lanCode = lanCode;
		this.oz = oz;
		this.code = code;
		this.price = price;
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

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("product [id=");
		builder.append(id);
		builder.append(", lanCode=");
		builder.append(lanCode);
		builder.append(", oz=");
		builder.append(oz);
		builder.append(", code=");
		builder.append(code);
		builder.append(", price=");
		builder.append(price);
		builder.append("]");
		return builder.toString();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + code;
		result = prime * result + id;
		result = prime * result + lanCode;
		result = prime * result + oz;
		result = prime * result + price;
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
		Product other = (Product) obj;
		if (code != other.code)
			return false;
		if (id != other.id)
			return false;
		if (lanCode != other.lanCode)
			return false;
		if (oz != other.oz)
			return false;
		if (price != other.price)
			return false;
		return true;
	}
	
}
