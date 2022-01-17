package com.pet.Together.Ask;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.pet.Together.AddPet.Img;

@Controller
public class AskController {

	@Autowired
	private AskService service;

	@Autowired
	private AnswerService ans_service;

	@RequestMapping(value = "/Ask/AskForm")
	public void askForm() {

	}

	@PostMapping(value = "/Ask/AddAsk")
	public String addAsk(Ask ask, Img imgs) {
		int num = service.makeNum();
		ask.setNum(num);
		ask.setImgs(imgs);

		MultipartFile[] files = { imgs.getFile1(), imgs.getFile2(), imgs.getFile3() };

		for (int i = 0; i < files.length; i++) {
			if (!files[i].isEmpty()) {
				saveImg(files[i], num, i + 1);
			}
		}
		service.addAsk(ask);
		return "redirect:/Member/MyPage"; /* 마이페이지로 연결 */
	}

	@RequestMapping(value = "/Ask/AskList")
	public ModelAndView askList(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("/Ask/AskList");
		ArrayList<Ask> list = new ArrayList<Ask>();

		HttpSession session = request.getSession(false);
		String writer_id = (String) session.getAttribute("id");
		int type = (int) session.getAttribute("type");

		if (type == 1) {
			// 고객의 경우 나의 문의 리스트 저장
			list = service.getAskByWriter(writer_id);

		} else if (type == 2) {
			// 관리자의 경우 전체 문의 리스트 저장
			list = service.getAllAsk();
		}

		// 문의글에 답변이 있는지 확인 후 있다면 저장.
		for (int i = 0; i < list.size(); i++) {
			saveAnswer(list.get(i));
		}
		mav.addObject("list", list);
		return mav;

	}

	@RequestMapping(value = "/Ask/OneAsk")
	public ModelAndView oneAsk(@RequestParam(value = "num") int num, @RequestParam(value = "type") int type) {
		ModelAndView mav = null;
		Ask ask = service.getAsk(num);
		
		if (type == 1) {
			mav = new ModelAndView("/Ask/OneAsk");
			File imgFile = new File(PATH + num);
			if (imgFile.exists()) {
				String[] imgFiles = imgFile.list();
				if (imgFiles != null) {
					for (int i = 0; i < imgFiles.length; i++) {
						// System.out.println(imgFiles[i]);
						mav.addObject("file" + i, imgFiles[i]);
					}
				}
			}
		} else {
			mav = new ModelAndView("/Ask/EditAskForm");
		}
		saveAnswer(ask);
		mav.addObject("ask", ask);
		return mav;
	}

	@PostMapping(value = "/Ask/AddAnswer")
	public ModelAndView addAnswer(Answer answer) {
		ans_service.addAns(answer);
		ModelAndView mav = new ModelAndView("/Ask/Json");
		return mav;
	}

	@RequestMapping(value = "/Ask/getAnswer")
	public ModelAndView getAnswer(@RequestParam(value = "ask_num") int ask_num) {
		Answer answer = ans_service.getAns(ask_num);
		ModelAndView mav = new ModelAndView("/Ask/Answer");
		mav.addObject("a", answer);
		return mav;
	}

	@RequestMapping(value = "/Ask/getImg")
	public ResponseEntity<byte[]> getImg(int ask_num, String fileName) {
		File imgFile = new File(PATH + ask_num);
		// 이미지가 있다면 이미지를 리턴
		if (imgFile.exists()) {
			File f = new File(PATH + ask_num + "/" + fileName);
			if (f.exists()) {
				HttpHeaders header = new HttpHeaders();
				ResponseEntity<byte[]> result = null;
				try {
					header.add("Content-Type", Files.probeContentType(f.toPath()));
					result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(f), header, HttpStatus.OK);
				} catch (IOException e) {
					e.printStackTrace();
				}
				return result;
			}
		}
		return null;
	}

	@RequestMapping(value = "/Ask/DelAsk")
	public ModelAndView delAsk(@RequestParam(value = "num") int num) {
		ModelAndView mav = new ModelAndView("/Ask/Json");
		service.delAsk(num);
		ans_service.delAns(num);
		String path = PATH + num + "/";
		File imgDir = new File(path);
		if (imgDir.exists()) {
			String[] files = imgDir.list();
			for (int j = 0; j < files.length; j++) {
				File f = new File(path + files[j]);
				f.delete();
			}
		}
		imgDir.delete();
		return mav;
	}
	

	@RequestMapping(value = "/Ask/DelAns")
	public ModelAndView delAns(@RequestParam(value = "ask_num") int ask_num) {
		ModelAndView mav = new ModelAndView("/Ask/Json");
		ans_service.delAns(ask_num);
		return mav;
	}
	
	@PostMapping(value="/Ask/updateAsk")
	public String updateAsk(Ask ask) {
		service.editAsk(ask);
		return "redirect:/Ask/AskList";
	}
	
	@RequestMapping(value="/Ask/EditAnswer")
	public ModelAndView editAns(Answer answer) {
		ans_service.editAns(answer);
		ModelAndView mav = new ModelAndView("/Ask/Json");
		return mav;
		
	}

	
		

// 아래 함수

	private static final String PATH = "C:\\together\\img\\ask\\";
	

	/*
	 * 이미지를 폼에서 받아, C:\\together\\img\\ask\\글 번호(num) 폴더에 저장한다.
	 */

	public void saveImg(MultipartFile file, int num, int fileNum) {

		// 파일 이름을 가져온다.
		String originalFileName = file.getOriginalFilename();

		// 확장자 추출
		int idx = originalFileName.lastIndexOf(".");
		String ext = originalFileName.substring(idx);

		/* 파일이 있으면 저장한다. */
		if (originalFileName != null && !originalFileName.equals("")) {

			/* path 디렉토리가 없다면 디렉토리를 만든다. */
			String dirPath = PATH + num;
			File dir = new File(dirPath);
			if (!dir.exists()) {
				dir.mkdirs(); // 상위폴더가 없다면 상위 폴더도 만든다.
			}

			/* 경로에 파일을 만든다. */

			File f = new File(dirPath + "/" + fileNum + ext);
			try {
				file.transferTo(f);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	public void saveAnswer(Ask ask) {
		Answer ans = ans_service.getAns(ask.getNum());
		if (ans != null) {
			ask.setAnswer(ans);
		}
	}

}
