package up.mypage.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class History implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8189386267839666466L;


	//히스토리 번호
	private int hisNo;

	// 습관 서브카테고리
	private String hisSubcategory;

	// 습관 시작 날
	private Date hisStartdate;

	//습관 끝난 날
	private Date hisEndDate;

	// 습관 달성률
	private int hisPercent;

	// 습관 카테고리 이름
	private String cName;

	// 유저 아이디
	private String mId;

	// 습관 번호
	private int hNo;

	public History() {
		// TODO Auto-generated constructor stub
	}

	public History(int hisNo, String hisSubcategory, Date hisStartdate, Date hisEndDate, int hisPercent, String cName,
			String mId, int hNo) {
		super();
		this.hisNo = hisNo;
		this.hisSubcategory = hisSubcategory;
		this.hisStartdate = hisStartdate;
		this.hisEndDate = hisEndDate;
		this.hisPercent = hisPercent;
		this.cName = cName;
		this.mId = mId;
		this.hNo = hNo;
	}

	public int getHisNo() {
		return hisNo;
	}

	public void setHisNo(int hisNo) {
		this.hisNo = hisNo;
	}

	public String getHisSubcategory() {
		return hisSubcategory;
	}

	public void setHisSubcategory(String hisSubcategory) {
		this.hisSubcategory = hisSubcategory;
	}

	public Date getHisStartdate() {
		return hisStartdate;
	}

	public void setHisStartdate(Date hisStartdate) {
		this.hisStartdate = hisStartdate;
	}

	public Date getHisEndDate() {
		return hisEndDate;
	}

	public void setHisEndDate(Date hisEndDate) {
		this.hisEndDate = hisEndDate;
	}

	public int getHisPercent() {
		return hisPercent;
	}

	public void setHisPercent(int hisPercent) {
		this.hisPercent = hisPercent;
	}

	public String getCName() {
		return cName;
	}

	public void setCName(String cName) {
		this.cName = cName;
	}

	public String getMId() {
		return mId;
	}

	public void setMId(String mId) {
		this.mId = mId;
	}

	public int getHNo() {
		return hNo;
	}

	public void setHNo(int hNo) {
		this.hNo = hNo;
	}

	@Override
	public String toString() {
		return "History [hisNo=" + hisNo + ", hisSubcategory=" + hisSubcategory + ", hisStartdate=" + hisStartdate
				+ ", hisEndDate=" + hisEndDate + ", hisPercent=" + hisPercent + ", cName=" + cName + ", mId=" + mId
				+ ", hNo=" + hNo + "]";
	}

}
