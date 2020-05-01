package up.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Member implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5623337228851502397L;
	
	private String userId;
	private String userPwd;
	private String userName;
	private String userNickName;
	private String userEmail;
	private int userTitleCode;
	private int userLoginCnt;
	private Date userJoinDate;
	private String userLeaveYN;
	private String originFile;
	private String renameFile;
	
	public Member() {
		
	}

	

	public Member(String userId, String userPwd, String userName, String userNickName, String userEmail,
			int userTitleCode, int userLoginCnt, Date userJoinDate, String userLeaveYN, String originFile,
			String renameFile) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.userNickName = userNickName;
		this.userEmail = userEmail;
		this.userTitleCode = userTitleCode;
		this.userLoginCnt = userLoginCnt;
		this.userJoinDate = userJoinDate;
		this.userLeaveYN = userLeaveYN;
		this.originFile = originFile;
		this.renameFile = renameFile;
	}



	

	public String getUserId() {
		return userId;
	}



	public void setUserId(String userId) {
		this.userId = userId;
	}



	public String getUserPwd() {
		return userPwd;
	}



	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}



	public String getUserName() {
		return userName;
	}



	public void setUserName(String userName) {
		this.userName = userName;
	}



	public String getUserNickName() {
		return userNickName;
	}



	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}



	public String getUserEmail() {
		return userEmail;
	}



	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}



	public int getUserTitleCode() {
		return userTitleCode;
	}



	public void setUserTitleCode(int userTitleCode) {
		this.userTitleCode = userTitleCode;
	}



	public int getUserLoginCnt() {
		return userLoginCnt;
	}



	public void setUserLoginCnt(int userLoginCnt) {
		this.userLoginCnt = userLoginCnt;
	}



	public Date getUserJoinDate() {
		return userJoinDate;
	}



	public void setUserJoinDate(Date userJoinDate) {
		this.userJoinDate = userJoinDate;
	}



	public String getUserLeaveYN() {
		return userLeaveYN;
	}



	public void setUserLeaveYN(String userLeaveYN) {
		this.userLeaveYN = userLeaveYN;
	}



	public String getOriginFile() {
		return originFile;
	}



	public void setOriginFile(String originFile) {
		this.originFile = originFile;
	}



	public String getRenameFile() {
		return renameFile;
	}



	public void setRenameFile(String renameFile) {
		this.renameFile = renameFile;
	}



	@Override
	public String toString() {
		return "Member [userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName + ", userNickName="
				+ userNickName + ", userEmail=" + userEmail + ", userTitleCode=" + userTitleCode + ", userLoginCnt="
				+ userLoginCnt + ", userJoinDate=" + userJoinDate + ", userLeaveYN=" + userLeaveYN + ", originFile="
				+ originFile + ", renameFile=" + renameFile + "]";
	}



	
	
}
