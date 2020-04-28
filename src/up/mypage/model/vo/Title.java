package up.mypage.model.vo;

import java.io.Serializable;

//Ÿ��Ʋ 
public class Title implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 225237288261572118L;

	// 타이틀 코드
	private int tCode;

	// 타이틀 이름
	private String tName;

	// 타이틀 코멘트
	private String tComment;

	// 타이틀 조건
	private String tCondition;
	
	//타이틀 컬러
	private String tColor;
	
	public Title() {
		// TODO Auto-generated constructor stub
	}
	

	public Title(int tCode, String tName, String tComment, String tCondition,String tColor) {
		super();
		this.tCode = tCode;
		this.tName = tName;
		this.tComment = tComment;
		this.tCondition = tCondition;
		this.tColor = tColor;
	}

	
	public int getTCode() {
		return tCode;
	}

	public void setTCode(int tCode) {
		this.tCode = tCode;
	}

	public String getTName() {
		return tName;
	}

	public void setTName(String tName) {
		this.tName = tName;
	}

	public String getTComment() {
		return tComment;
	}

	public void setTComment(String tComment) {
		this.tComment = tComment;
	}

	public String getTCondition() {
		return tCondition;
	}

	public void setTCondition(String tCondition) {
		this.tCondition = tCondition;
	}

	

	public String getTColor() {
		return tColor;
	}


	public void setTColor(String tColor) {
		this.tColor = tColor;
	}


	@Override
	public String toString() {
		return "Title [tCode=" + tCode + ", tName=" + tName + ", tComment=" + tComment + ", tCondition=" + tCondition
				+ ", tColor=" + tColor + "]";
	}

	

	
	
}