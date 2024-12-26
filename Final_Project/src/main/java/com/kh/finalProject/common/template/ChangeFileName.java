package com.kh.finalProject.common.template;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

// 필요한 경우 다른 메소드 정의해서 사용할 것
public class ChangeFileName {
	
	// 이 메소드는 수정 금지!!!!!
	
	// 회원 프로필 사진 이름 변경 메소드
	public String changeProfileFileName(MultipartFile upFile, HttpSession session) throws Exception {
		
		String originName = upFile.getOriginalFilename();
		
		String date = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		int randomNum = (int)(Math.random() * 90000 + 10000);
		
		String exp = originName.substring(originName.lastIndexOf("."));
				
		String changeFileName = randomNum  + "KH" +  date + exp;
		
		String savePath = session.getServletContext().getRealPath("/resources/userProfileImg/");
		
		upFile.transferTo(new File(savePath + changeFileName));
		
		return changeFileName;
		
	}
	
	// 제품 사진 이름 변경 메소드
	public String changeProductFileName(MultipartFile upFile, HttpSession session) throws Exception {
		
		String originName = upFile.getOriginalFilename();
		
		String date = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		int randomNum = (int)(Math.random() * 90000 + 10000);
		
		String exp = originName.substring(originName.lastIndexOf("."));
				
		String changeFileName = randomNum  + "PB" +  date + exp;
		
		String savePath = session.getServletContext().getRealPath("/resources/productImgFiles/");
		
		upFile.transferTo(new File(savePath + changeFileName));
		
		return changeFileName;
		
	}

}
