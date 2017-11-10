package dto;

public class Store {
	private int lanCode;
	private int id;
	private String name;
	private String tel;
	private String addr;
	private double lat;
	private double longi;
	private String storeHours;
	
	public Store() {}

	public Store(int lanCode, int id, String name, String tel, String addr, double lat, double longi, String storeHours) {
		this.lanCode = lanCode;
		this.id = id;
		this.name = name;
		this.tel = tel;
		this.addr = addr;
		this.lat = lat;
		this.longi = longi;
		this.storeHours = storeHours;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(int lat) {
		this.lat = lat;
	}

	public double getLongi() {
		return longi;
	}

	public void setLongi(int longi) {
		this.longi = longi;
	}

	public String getStoreHours() {
		return storeHours;
	}

	public void setStoreHours(String storeHours) {
		this.storeHours = storeHours;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Store [lanCode=");
		builder.append(lanCode);
		builder.append(", id=");
		builder.append(id);
		builder.append(", name=");
		builder.append(name);
		builder.append(", tel=");
		builder.append(tel);
		builder.append(", addr=");
		builder.append(addr);
		builder.append(", lat=");
		builder.append(lat);
		builder.append(", longi=");
		builder.append(longi);
		builder.append(", storeHours=");
		builder.append(storeHours);
		builder.append("]");
		return builder.toString();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((addr == null) ? 0 : addr.hashCode());
		result = prime * result + id;
		result = prime * result + lanCode;
		result = (int) (prime * result + lat);
		result = (int) (prime * result + longi);
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((storeHours == null) ? 0 : storeHours.hashCode());
		result = prime * result + ((tel == null) ? 0 : tel.hashCode());
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
		Store other = (Store) obj;
		if (addr == null) {
			if (other.addr != null)
				return false;
		} else if (!addr.equals(other.addr))
			return false;
		if (id != other.id)
			return false;
		if (lanCode != other.lanCode)
			return false;
		if (lat != other.lat)
			return false;
		if (longi != other.longi)
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (storeHours == null) {
			if (other.storeHours != null)
				return false;
		} else if (!storeHours.equals(other.storeHours))
			return false;
		if (tel == null) {
			if (other.tel != null)
				return false;
		} else if (!tel.equals(other.tel))
			return false;
		return true;
	}

}
