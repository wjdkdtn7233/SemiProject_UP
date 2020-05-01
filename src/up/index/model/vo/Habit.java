package up.index.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Habit implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5225500711143046429L;
    private int hNo;
    private String hSubcategory;
    private Date hStartDate;
    private Date hEndDate;
    private String hSelectday;
    private long hMoney;
    private int hTime;
    private int cCode;
    private String mId;
	public Habit() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Habit(int hNo, String hSubcategory, Date hStartDate, Date hEndDate, String hSelectday, long hMoney,
			int hTime, int cCode, String mId) {
		super();
		this.hNo = hNo;
		this.hSubcategory = hSubcategory;
		this.hStartDate = hStartDate;
		this.hEndDate = hEndDate;
		this.hSelectday = hSelectday;
		this.hMoney = hMoney;
		this.hTime = hTime;
		this.cCode = cCode;
		this.mId = mId;
	}
	public int gethNo() {
		return hNo;
	}
	public void sethNo(int hNo) {
		this.hNo = hNo;
	}
	public String gethSubcategory() {
		return hSubcategory;
	}
	public void sethSubcategory(String hSubcategory) {
		this.hSubcategory = hSubcategory;
	}
	public Date gethStartDate() {
		return hStartDate;
	}
	public void sethStartDate(Date hStartDate) {
		this.hStartDate = hStartDate;
	}
	public Date gethEndDate() {
		return hEndDate;
	}
	public void sethEndDate(Date hEndDate) {
		this.hEndDate = hEndDate;
	}
	public String gethSelectday() {
		return hSelectday;
	}
	public void sethSelectday(String hSelectday) {
		this.hSelectday = hSelectday;
	}
	public long gethMoney() {
		return hMoney;
	}
	public void sethMoney(long hMoney) {
		this.hMoney = hMoney;
	}
	public int gethTime() {
		return hTime;
	}
	public void sethTime(int hTime) {
		this.hTime = hTime;
	}
	public int getcCode() {
		return cCode;
	}
	public void setcCode(int cCode) {
		this.cCode = cCode;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + cCode;
		result = prime * result + ((hEndDate == null) ? 0 : hEndDate.hashCode());
		result = prime * result + (int) (hMoney ^ (hMoney >>> 32));
		result = prime * result + hNo;
		result = prime * result + ((hSelectday == null) ? 0 : hSelectday.hashCode());
		result = prime * result + ((hStartDate == null) ? 0 : hStartDate.hashCode());
		result = prime * result + ((hSubcategory == null) ? 0 : hSubcategory.hashCode());
		result = prime * result + hTime;
		result = prime * result + ((mId == null) ? 0 : mId.hashCode());
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
		Habit other = (Habit) obj;
		if (cCode != other.cCode)
			return false;
		if (hEndDate == null) {
			if (other.hEndDate != null)
				return false;
		} else if (!hEndDate.equals(other.hEndDate))
			return false;
		if (hMoney != other.hMoney)
			return false;
		if (hNo != other.hNo)
			return false;
		if (hSelectday == null) {
			if (other.hSelectday != null)
				return false;
		} else if (!hSelectday.equals(other.hSelectday))
			return false;
		if (hStartDate == null) {
			if (other.hStartDate != null)
				return false;
		} else if (!hStartDate.equals(other.hStartDate))
			return false;
		if (hSubcategory == null) {
			if (other.hSubcategory != null)
				return false;
		} else if (!hSubcategory.equals(other.hSubcategory))
			return false;
		if (hTime != other.hTime)
			return false;
		if (mId == null) {
			if (other.mId != null)
				return false;
		} else if (!mId.equals(other.mId))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "Habit [hNo=" + hNo + ", hSubcategory=" + hSubcategory + ", hStartDate=" + hStartDate + ", hEndDate="
				+ hEndDate + ", hSelectday=" + hSelectday + ", hMoney=" + hMoney + ", hTime=" + hTime + ", cCode="
				+ cCode + ", mId=" + mId + "]";
	}
	
}
