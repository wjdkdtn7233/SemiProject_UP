package common.util;


import java.io.File;
import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;

import common.vo.UploadFile;

public class FileUtil {

	public UploadFile fileUpload(String uploadFolder, HttpServletRequest request) {
		UploadFile uploadFile = new UploadFile();
		int maxSize = 1024 * 1024 * 10;
		String originFileName = "";
		String renameFileName = "";

		String root = request.getServletContext().getRealPath("/");
		String savePath = root + uploadFolder;
		MultipartRequest mrequest = null;
		try {
			mrequest = new MultipartRequest(request, savePath, maxSize);
			originFileName = mrequest.getFilesystemName("profile");
			System.out.println(originFileName);
			if (originFileName != null) {
				//
				String fileName = String.valueOf(new Date().getTime());
				renameFileName = fileName + originFileName.substring(originFileName.lastIndexOf("."));
				System.out.println(renameFileName);
				File originFile = new File(savePath + "\\" + originFileName);
				File renameFile = new File(savePath + "\\" + renameFileName);

				originFile.renameTo(renameFile);
			}

			uploadFile.setSuccess(true);
			uploadFile.setOrginalFileName(originFileName);
			uploadFile.setRenameFileName(renameFileName);
			uploadFile.setSavePath(savePath);
			uploadFile.setMrequest(mrequest);

		} catch (IOException e) {
			e.printStackTrace();
			uploadFile.setSuccess(false);
			uploadFile.setOrginalFileName(originFileName);
		}

		return uploadFile;
	}

	
}