package dto;

import java.util.Date;

public class Reporting {
	private int seq;
	private String email;	//manager의 email
	private int sratNum;
	private int pratNum;
	private String memail;	//member의 email
	private Date repDate;
	
	public Reporting() {}

	public Reporting(int seq, String email, int sratNum, int pratNum, String memail, Date repDate) {
		super();
		this.seq = seq;
		this.email = email;
		this.sratNum = sratNum;
		this.pratNum = pratNum;
		this.memail = memail;
		this.repDate = repDate;
	}

	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getSratNum() {
		return sratNum;
	}
	public void setSratNum(int sratNum) {
		this.sratNum = sratNum;
	}
	public int getPratNum() {
		return pratNum;
	}
	public void setPratNum(int pratNum) {
		this.pratNum = pratNum;
	}
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	public Date getRepDate() {
		return repDate;
	}
	public void setRepDate(Date repDate) {
		this.repDate = repDate;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Reporting [seq=");
		builder.append(seq);
		builder.append(", email=");
		builder.append(email);
		builder.append(", sratNum=");
		builder.append(sratNum);
		builder.append(", pratNum=");
		builder.append(pratNum);
		builder.append(", memail=");
		builder.append(memail);
		builder.append(", repDate=");
		builder.append(repDate);
		builder.append("]");
		return builder.toString();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((memail == null) ? 0 : memail.hashCode());
		result = prime * result + pratNum;
		result = prime * result + ((repDate == null) ? 0 : repDate.hashCode());
		result = prime * result + seq;
		result = prime * result + sratNum;
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
		Reporting other = (Reporting) obj;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (memail == null) {
			if (other.memail != null)
				return false;
		} else if (!memail.equals(other.memail))
			return false;
		if (pratNum != other.pratNum)
			return false;
		if (repDate == null) {
			if (other.repDate != null)
				return false;
		} else if (!repDate.equals(other.repDate))
			return false;
		if (seq != other.seq)
			return false;
		if (sratNum != other.sratNum)
			return false;
		return true;
	}
}
