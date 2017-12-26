package dto;
/**
 * 
 * @author sinseung-yeob
 *
 */
public class Tour {
	private int lanCode;
	private int id;
	private String name;
	private String tourSource;
	
	public Tour() {}
	public Tour(int lanCode, int id, String name, String tourSource) {
		super();
		this.lanCode = lanCode;
		this.id = id;
		this.name = name;
		this.tourSource = tourSource;
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
	public String getTourSource() {
		return tourSource;
	}
	public void setTourSource(String tourSource) {
		this.tourSource = tourSource;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Tour [lanCode=");
		builder.append(lanCode);
		builder.append(", id=");
		builder.append(id);
		builder.append(", name=");
		builder.append(name);
		builder.append(", tourSource=");
		builder.append(tourSource);
		builder.append("]");
		return builder.toString();
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		result = prime * result + lanCode;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((tourSource == null) ? 0 : tourSource.hashCode());
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
		Tour other = (Tour) obj;
		if (id != other.id)
			return false;
		if (lanCode != other.lanCode)
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (tourSource == null) {
			if (other.tourSource != null)
				return false;
		} else if (!tourSource.equals(other.tourSource))
			return false;
		return true;
	}
	
}
