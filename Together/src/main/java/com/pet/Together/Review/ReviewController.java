package com.pet.Together.Review;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReviewController {
	@Autowired
	private ReviewService service;

	@GetMapping(value = "/Review/reviewForm")
	public void reviewForm() {

	}

	@RequestMapping(value = "/Review/reviewList")
	public ModelAndView allList() {
		ModelAndView mav = new ModelAndView("Review/reviewList");
		ArrayList<Review> list = (ArrayList<Review>) service.selectAll();
		mav.addObject("list", list);

		return mav;
	}

	private static final String PATH = "C:\\together\\img\\Review\\";

	public void saveImg(int num, MultipartFile file) {
		String fileName = file.getOriginalFilename();
		if (fileName != null && !fileName.equals("")) {
			File dir = new File(PATH + num);
			if (!dir.exists()) { // 같은 이름이 존재하지 않을 경우
				dir.mkdirs(); // 폴더생성
			}

			File f = new File(PATH + num + "\\" + fileName);

			try {
				file.transferTo(f);
			} catch (IllegalStateException e) {
				System.out.println(e);
			} catch (IOException e) {
				System.out.println(e);
			}
		}
	}

	@RequestMapping(value = "/Review/review")
	public String review(Review r) {
		int num = service.getNum();
		r.setNum(num);
		service.addReview(r);
		saveImg(num, r.getFile1());
		saveImg(num, r.getFile2());
		saveImg(num, r.getFile3());

		return "redirect:/Review/reviewList";
	}

	@RequestMapping(value = "/Review/reviewDetail")
	public ModelAndView reviewDetail(@RequestParam(value = "num") int num) {
		ModelAndView mav = new ModelAndView("Review/reviewDetail");
		Review r = service.getReviewByNum(num);
		String path = PATH + r.getNum() + "\\";
		File imgDir = new File(path);

		if (imgDir.exists()) {
			String[] files = imgDir.list();
			for (int j = 0; j < files.length; j++) {
				mav.addObject("file" + j, files[j]);
			}
		}

		mav.addObject("r", r);
		return mav;
	}

	@RequestMapping(value = "/img")
	public ResponseEntity<byte[]> getImg(String fname, int num) {
		String path = PATH + num + "\\" + fname;
		File f = new File(path);
		HttpHeaders header = new HttpHeaders();
		ResponseEntity<byte[]> result = null;
		try {
			header.add("Content-Type", Files.probeContentType(f.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(f), header, HttpStatus.OK);
		} catch (IOException e) {
			System.out.println(e);
		}

		return result;
	}

}
