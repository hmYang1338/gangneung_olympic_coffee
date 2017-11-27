package dto;

public class Product {
	private int lanCode;
	private int id;
	private int code;
	private String product;
	private int oz;
	private int hotPrice;
	private int icePrice;
	
	public Product() {}

	public Product(int lanCode, int id, int code, String product, int oz, int hotPrice, int icePrice) {
		super();
		this.lanCode = lanCode;
		this.id = id;
		this.code = code;
		this.product = product;
		this.oz = oz;
		this.hotPrice = hotPrice;
		this.icePrice = icePrice;
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

	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	public int getOz() {
		return oz;
	}

	public void setOz(int oz) {
		this.oz = oz;
	}

	public int getHotPrice() {
		return hotPrice;
	}

	public void setHotPrice(int hotPrice) {
		this.hotPrice = hotPrice;
	}

	public int getIcePrice() {
		return icePrice;
	}

	public void setIcePrice(int icePrice) {
		this.icePrice = icePrice;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Product [lanCode=");
		builder.append(lanCode);
		builder.append(", id=");
		builder.append(id);
		builder.append(", code=");
		builder.append(code);
		builder.append(", product=");
		builder.append(product);
		builder.append(", oz=");
		builder.append(oz);
		builder.append(", hotPrice=");
		builder.append(hotPrice);
		builder.append(", icePrice=");
		builder.append(icePrice);
		builder.append("]");
		return builder.toString();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + code;
		result = prime * result + hotPrice;
		result = prime * result + icePrice;
		result = prime * result + id;
		result = prime * result + lanCode;
		result = prime * result + oz;
		result = prime * result + ((product == null) ? 0 : product.hashCode());
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
		if (hotPrice != other.hotPrice)
			return false;
		if (icePrice != other.icePrice)
			return false;
		if (id != other.id)
			return false;
		if (lanCode != other.lanCode)
			return false;
		if (oz != other.oz)
			return false;
		if (product == null) {
			if (other.product != null)
				return false;
		} else if (!product.equals(other.product))
			return false;
		return true;
	}
	
}
