package dto;

public class UserGPS {
	private int lanCode;
	private double lat;
	private double longi;
	
	public UserGPS() {}

	public UserGPS(int lanCode, double lat, double longi) {
		this.lanCode = lanCode;
		this.lat = lat;
		this.longi = longi;
	}

	public UserGPS(double lat, double longi) {
		this.lat = lat;
		this.longi = longi;
	}

	public int getLanCode() {
		return lanCode;
	}

	public void setLanCode(int lanCode) {
		this.lanCode = lanCode;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLongi() {
		return longi;
	}

	public void setLongi(double longi) {
		this.longi = longi;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("UserGPS [lanCode=");
		builder.append(lanCode);
		builder.append(", lat=");
		builder.append(lat);
		builder.append(", longi=");
		builder.append(longi);
		builder.append("]");
		return builder.toString();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + lanCode;
		long temp;
		temp = Double.doubleToLongBits(lat);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		temp = Double.doubleToLongBits(longi);
		result = prime * result + (int) (temp ^ (temp >>> 32));
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
		UserGPS other = (UserGPS) obj;
		if (lanCode != other.lanCode)
			return false;
		if (Double.doubleToLongBits(lat) != Double.doubleToLongBits(other.lat))
			return false;
		if (Double.doubleToLongBits(longi) != Double.doubleToLongBits(other.longi))
			return false;
		return true;
	}

}
