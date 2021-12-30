package com.pet.Together.AddPet;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class AddPetController {
	
	@Autowired
	private AddPetService service;
	
	@RequestMapping(value="/home")
	public void home() {
		
	}
	
	@RequestMapping(value="/AddPet/AddPet")
	public void addPetForm() {
		
	}
	
	@PostMapping(value="/AddPet")
	public String addPet(Pet p) {
		
		
		
		service.addPet(p);
		return "";
	}

	private static final String PATH="C:\\together\\img";
	/* 
	 * 이미지를 폼에서 받아, C:\\together\\img\\pet\\petId번호 폴더에 'file번호'파일로 저장한다.
	 */ 
	public void saveImg(MultipartFile file, int petId, int fileNum) {
		/* message를 print 한다. */
		String message="이미지파일을 C:\\together\\img\\pet\\petId"+petId+"폴더에 'file"+fileNum+"'로 저장합니다.";
				
		String originalFileName=file.getOriginalFilename();
		
		/* 파일이 있으면 저장한다. */
		if(originalFileName!=null && !originalFileName.equals("") ) {
			/* 파일 형식을 fileFormat으로 저장한다. */
			String fileFormat=originalFileName.split("\\.")[1];
		
			/* path 디렉토리가 없다면 디렉토리를 만든다. */
			String dirName=PATH+"\\pet\\petId"+petId;
			File dir=new File(dirName);
			if( !dir.exists() ) {
				dir.mkdir();				
			}
			
			/* 이미 파일명이 존재한다면 파일을 저장하지 않는다.*/
			boolean fileExist=false;
			
			String fileName="file"+fileNum;
			String[] files=dir.list();
			for(String f:files) {
				String fname=f.split("\\.")[0];
				if(fname.equals(fileName) ) {
					fileExist=true;
					message="저장 실패.	C:\\together\\img\\pet\\petId"+petId+"폴더에 file"+fileNum+"이 이미 존재하여 저장하지 않았습니다.";
				}
			}			
			
			/* 경로에 파일을 만든다. */
			if( !fileExist ) {
				File f=new File(dirName+"\\"+fileName+"."+fileFormat);
				try {
					file.transferTo(f);
				}catch(IllegalStateException e) {
					e.printStackTrace();
				}catch(IOException e) {
					e.printStackTrace();
				}
			}
			
			System.out.println(message);
						
		}
		
		
	}
	
	
}
