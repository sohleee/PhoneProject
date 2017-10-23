package com.controller.phone;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dto.phone.PhoneFileDTO;
import com.dto.phone.PhoneDTO;
import com.service.phone.PhoneService;

@Controller
public class PhoneList {
	
	@Autowired
	PhoneService service;
	
	@RequestMapping("/home")
	public String home() {
		return "home";
	}
	
	
	@RequestMapping("/phoneList")
	public ModelAndView phoneList() {
		List<PhoneDTO> list = service.PhoneList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("phoneList");
		return mav;
	}
	@RequestMapping("/List")
	public ModelAndView List(@RequestParam String telecom) {
		List<PhoneDTO> dto = service.phoneModelList(telecom);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", dto);
		mav.setViewName("phoneList");
		return mav;
	}
	@RequestMapping("/PhoneRetrieve")
	public ModelAndView PhoneRetrieve(@RequestParam String telecom_num) {
		PhoneDTO dto = service.phoneRetrieve(telecom_num);
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", dto);
		mav.setViewName("phoneRetrieve");
		return mav;
	}
	@RequestMapping("/updateForm")
	public ModelAndView updateForm(@RequestParam String telecom_num) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("updateForm");
		mav.addObject("telecom_num", telecom_num);
		return mav;
	}
	@RequestMapping("/PhoneUpdate")
	public ModelAndView PhoneUpdate(@RequestParam HashMap<String, String>map) {
		service.phoneUpdate(map);
		List<PhoneDTO> list = service.PhoneList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("phoneList");
		return mav;
	}
	@RequestMapping("/phoneAddForm")
	public String phoneAddForm() {
		return "phoneAddForm";
	}
	@RequestMapping(value="/AddFile",method=RequestMethod.POST)
	public String AddFile(PhoneFileDTO dto) {
		
		CommonsMultipartFile theFile = dto.getPhone_image();
		String originalFilename = theFile.getOriginalFilename();
		String phone_image = theFile.getName();
		long size = theFile.getSize();
		
		System.out.println(">>>>>>>>>>>>>"+phone_image+"\t"+originalFilename);
		System.out.println(dto.getPhone_content()+"\t"+dto.getPhone_model_num());
		    
		//실제 저장
		File f = new File("C:\\springStudy\\eclipse\\workspace\\Phone82_Spring\\src\\main\\webapp\\WEB-INF\\images",originalFilename);
		
		try {
            theFile.transferTo(f);
		} catch (Exception e) {
			e.printStackTrace();
		}
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("telecom_num", dto.getTelecom_num());
		map.put("phone_model_num", dto.getPhone_model_num());
		map.put("phone_name", dto.getPhone_name());
		map.put("phone_content", dto.getPhone_content());
		map.put("phone_price", dto.getPhone_price());
		map.put("phone_image", originalFilename);
		map.put("telecom", dto.getTelecom());
		service.PhoneAdd(map);
		
		
		return "home";
	}
	@RequestMapping("/PhoneDelete")
	public String PhoneDelete(@RequestParam String telecom_num) {
		service.phoneDelete(telecom_num);
		return "home";
	}
}
