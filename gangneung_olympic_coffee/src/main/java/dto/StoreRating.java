package dto;

import java.util.Date;

public class StoreRating {
	private int rat_num;
	private String email;
	private int lanCode;
	private int id;
	private int interior;
	private int ratAccess;
	private int costEffect;
	private String ratComment;
	private Date ratDate;
	
	public StoreRating() {}

	public StoreRating(int rat_num, String email, int lanCode, int id, int interior, int ratAccess, int costEffect,
			String ratComment, Date ratDate) {
		this.rat_num = rat_num;
		this.email = email;
		this.lanCode = lanCode;
		this.id = id;
		this.interior = interior;
		this.ratAccess = ratAccess;
		this.costEffect = costEffect;
		this.ratComment = ratComment;
		this.ratDate = ratDate;
	}

	public int getRat_num() {
		return rat_num;
	}

	public void setRat_num(int rat_num) {
		this.rat_num = rat_num;
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

	public int getInterior() {
		return interior;
	}

	public void setInterior(int interior) {
		this.interior = interior;
	}

	public int getRatAccess() {
		return ratAccess;
	}

	public void setRatAccess(int ratAccess) {
		this.ratAccess = ratAccess;
	}

	public int getCostEffect() {
		return costEffect;
	}

	public void setCostEffect(int costEffect) {
		this.costEffect = costEffect;
	}

	public String getRatComment() {
		return ratComment;
	}

	public void setRatComment(String ratComment) {
		this.ratComment = ratComment;
	}

	public Date getRatDate() {
		return ratDate;
	}

	public void setRatDate(Date ratDate) {
		this.ratDate = ratDate;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("StoreRating [rat_num=");
		builder.append(rat_num);
		builder.append(", email=");
		builder.append(email);
		builder.append(", lanCode=");
		builder.append(lanCode);
		builder.append(", id=");
		builder.append(id);
		builder.append(", interior=");
		builder.append(interior);
		builder.append(", ratAccess=");
		builder.append(ratAccess);
		builder.append(", costEffect=");
		builder.append(costEffect);
		builder.append(", ratComment=");
		builder.append(ratComment);
		builder.append(", ratDate=");
		builder.append(ratDate);
		builder.append("]");
		return builder.toString();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + costEffect;
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + id;
		result = prime * result + interior;
		result = prime * result + lanCode;
		result = prime * result + ratAccess;
		result = prime * result + ((ratComment == null) ? 0 : ratComment.hashCode());
		result = prime * result + ((ratDate == null) ? 0 : ratDate.hashCode());
		result = prime * result + rat_num;
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
		StoreRating other = (StoreRating) obj;
		if (costEffect != other.costEffect)
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (id != other.id)
			return false;
		if (interior != other.interior)
			return false;
		if (lanCode != other.lanCode)
			return false;
		if (ratAccess != other.ratAccess)
			return false;
		if (ratComment == null) {
			if (other.ratComment != null)
				return false;
		} else if (!ratComment.equals(other.ratComment))
			return false;
		if (ratDate == null) {
			if (other.ratDate != null)
				return false;
		} else if (!ratDate.equals(other.ratDate))
			return false;
		if (rat_num != other.rat_num)
			return false;
		return true;
	}
	
}
