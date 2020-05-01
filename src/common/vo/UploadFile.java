package common.vo;

import com.oreilly.servlet.MultipartRequest;

public class UploadFile {
	
	private boolean isSuccess = false;
	private String originalFileName;
	private String renameFileName;
	private String savePath;
	private MultipartRequest mrequest;
	
	
	
	
	public boolean isSuccess() {
		return isSuccess;
	}
	public void setSuccess(boolean isSuccess) {
		this.isSuccess = isSuccess;
	}
	public String getOrginalFileName() {
		return originalFileName;
	}
	public void setOrginalFileName(String orginalFileName) {
		this.originalFileName = orginalFileName;
	}
	public String getRenameFileName() {
		return renameFileName;
	}
	public void setRenameFileName(String renameFileName) {
		this.renameFileName = renameFileName;
	}
	public String getSavePath() {
		return savePath;
	}
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	public MultipartRequest getMrequest() {
		return mrequest;
	}
	public void setMrequest(MultipartRequest mrequest) {
		this.mrequest = mrequest;
	}
	
	
	

}
