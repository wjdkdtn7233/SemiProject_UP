package up.habit.model.vo;

import java.io.Serializable;

public class CurrentState implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -8194574598495468487L;
	private int cStateNo;
	private int cCount;
	private int cCountall;
	private int cPercent;
	private String mId;
	private int hNo;
	public CurrentState() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CurrentState(int cStateNo, int cCount, int cCountall, int cPercent, String mId, int hNo) {
		super();
		this.cStateNo = cStateNo;
		this.cCount = cCount;
		this.cCountall = cCountall;
		this.cPercent = cPercent;
		this.mId = mId;
		this.hNo = hNo;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + cCount;
		result = prime * result + cCountall;
		result = prime * result + cPercent;
		result = prime * result + cStateNo;
		result = prime * result + hNo;
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
		CurrentState other = (CurrentState) obj;
		if (cCount != other.cCount)
			return false;
		if (cCountall != other.cCountall)
			return false;
		if (cPercent != other.cPercent)
			return false;
		if (cStateNo != other.cStateNo)
			return false;
		if (hNo != other.hNo)
			return false;
		if (mId == null) {
			if (other.mId != null)
				return false;
		} else if (!mId.equals(other.mId))
			return false;
		return true;
	}
	public int getcStateNo() {
		return cStateNo;
	}
	public void setcStateNo(int cStateNo) {
		this.cStateNo = cStateNo;
	}
	public int getcCount() {
		return cCount;
	}
	public void setcCount(int cCount) {
		this.cCount = cCount;
	}
	public int getcCountall() {
		return cCountall;
	}
	public void setcCountall(int cCountall) {
		this.cCountall = cCountall;
	}
	public int getcPercent() {
		return cPercent;
	}
	public void setcPercent(int cPercent) {
		this.cPercent = cPercent;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public int gethNo() {
		return hNo;
	}
	public void sethNo(int hNo) {
		this.hNo = hNo;
	}
	@Override
	public String toString() {
		return "CurrentState [cStateNo=" + cStateNo + ", cCount=" + cCount + ", cCountall=" + cCountall + ", cPercent="
				+ cPercent + ", mId=" + mId + ", hNo=" + hNo + "]";
	}
	
	
}
