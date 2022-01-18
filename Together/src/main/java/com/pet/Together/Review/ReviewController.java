package com.pet.Together.Review;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

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

import com.pet.Together.ReviewReply.ReviewReply;
import com.pet.Together.ReviewReply.ReviewReplyService;

@Controller
public class ReviewController {
	@Autowired
	private ReviewService service;
	@Autowired
	private ReviewReplyService reviewReply_service;
	@Autowired
	private HttpSession session;

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

	public void saveImg(MultipartFile file,int num, int fileNum) {
		String fileName = file.getOriginalFilename();
		
		// 확장자 추출
		int idx = fileName.lastIndexOf(".");
		String ext = fileName.substring(idx);
		
		if (fileName != null && !fileName.equals("")) {
			File dir = new File(PATH + num);
			if (!dir.exists()) { // 같은 이름이 존재하지 않을 경우
				dir.mkdirs(); // 폴더생성
			}

			File f = new File(PATH + num + "\\" + fileNum+ ext);

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
		
		
		MultipartFile[] files = { r.getFile1(), r.getFile2(), r.getFile3() };
		
		for (int i = 0; i < files.length; i++) {
			if (!files[i].isEmpty()) {
				saveImg(files[i], num, i + 1);
			}
		}
		
		service.addReview(r);

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
		/*
		 * ArrayList<ReviewReply>
		 * reply_list=reviewReply_service.getReplyListByBoard_num(num);
		 * mav.addObject("replys", reply_list);
		 * 
		 * ArrayList<ReviewReply> childReply_list =
		 * reviewReply_service.getListByParent_reply_num(num); mav.addObject("c_replys",
		 * childReply_list);
		 */
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
	
	@RequestMapping(value="/Review/myBoardList")
	public ModelAndView myBoardList() {
		ModelAndView mav = new ModelAndView("Review/myBoardList");
		String w_writer = (String) session.getAttribute("nickname");
		ArrayList<Review> myBoard_list = (ArrayList<Review>) service.getReviewByNickname(w_writer);
		mav.addObject("myBoard_list", myBoard_list);
		
		return mav;
	}
	
	@RequestMapping(value="/Review/editReviewForm")
	public ModelAndView editreviewForm(@RequestParam(value="num") int num) {
		ModelAndView mav = new ModelAndView("Review/editReviewForm");
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
	
	@RequestMapping(value="/Review/edit")
	public String edit(Review r) {
		service.editReview(r);
		
		return "redirect:/Review/reviewDetail?num=" + r.getNum();
	}
	
	@RequestMapping(value="/Review/delete")
	public String delete(@RequestParam(value="num") int num) {
		service.delReview(num);
		String path = PATH + num + "\\";
		File imgDir = new File(path);
		
		if (imgDir.exists()) {
			String[] files = imgDir.list();
			for (int j = 0; j < files.length; j++) {
				File f = new File(path + files[j]);
				f.delete();
			}
		}
		imgDir.delete();
		
		return "redirect:/Review/reviewList";
	}

}