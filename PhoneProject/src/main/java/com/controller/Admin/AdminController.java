package com.controller.Admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.MatrixVariable;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dto.admin.MemberMngPageDTO;
import com.dto.cart.SalesDTO;
import com.dto.qna.QNAPageDTO;
import com.service.admin.AdminService;

@Controller
public class AdminController {

	
	@Autowired
	AdminService service;

	@RequestMapping("chartForm")
	public String chartFrom( Model m) {

		m.addAttribute("today",service.getTodaySales());
		m.addAttribute("month",service.getMonthSales());
		System.out.println(service.getTodaySales()+":"+service.getMonthSales());
		return "chart";
	}

	@RequestMapping("/chartData")
	public String chartdata(@RequestParam Map<String, String> map, Model m) {
		System.out.println(map.get("start"));
		List<SalesDTO> list = service.getSalesChartDatas(map);
		m.addAttribute("list", list);
	
		return "chart/chart";
	}

	@RequestMapping("memberMng")
	public String memberManger(@RequestParam Map<String, String> map, Model m) {
	
		MemberMngPageDTO mmpdto = service.page(init_page(map));
		m.addAttribute("membermanagepage", mmpdto);
		return "membermanagepage";

	}

	@RequestMapping(value="/memberMngDelete", method = RequestMethod.GET)
	@ResponseBody
	public void memberMngDelete(@RequestParam String num, @RequestParam Map<String, String> map) {
		String[] nums = num.split("/");
		service.membersDelete(nums);
	}

	@RequestMapping(value = "/memberMngUpdate", method = RequestMethod.GET)
	public @ResponseBody ModelAndView memberMngUpdate(@RequestParam Map<String, String> map) {

	
		
		MemberMngPageDTO mmpdto = service.memberUpdate(map, init_page(map));
		ModelAndView mav = new ModelAndView();
		mav.addObject("membermanagepage", mmpdto);
		//mav.setViewName("admin/membermanagepage");
		return mav;
	}

	@RequestMapping(value="/QNAResponseForm", method = RequestMethod.GET)
	public String QNAResponse(@RequestParam Map<String, String> map, Model m) {
	
		QNAPageDTO dto = service.qnapage(init_page(map));

		m.addAttribute("page", dto);

		return "qnaResponse";
	}
	@RequestMapping(value="/response_window/num/{num}", method = RequestMethod.GET)
	public String responsewindow(@PathVariable String num ,@RequestParam Map<String, String> map, Model m) {
		m.addAttribute("num",num);
		return "admin/response_window";
	}
	@RequestMapping(value="/qnaDeleteData/num/{num}",method=RequestMethod.DELETE)
	@ResponseBody
	public void qnaDelete(@PathVariable String num ) {
		service.qnaDelete(Integer.parseInt(num));
	}
	@RequestMapping(value="/QNARequestMng/title/{title}/content/{content}/num/{num}",method=RequestMethod.GET)
	public String QNARequestMng(@PathVariable String title,@PathVariable String content,@PathVariable String num,Model m ) {
		System.out.println("come in");
		Map<String,String> map = new HashMap<>();
		map.put("title", title);
		map.put("content", content);
		map.put("num", num);
		Set<String> set = map.keySet();
		for (String key : set) {
			System.out.println(key+":"+map.get(key));
		}
		
		service.qnaMngretrieve(map);
		
	
		QNAPageDTO dto = service.qnapage(init_page(map));

		m.addAttribute("page", dto);
		return "qnaResponse";
	}
	Map<String,String> init_page(Map<String,String> map){
		String searchName = map.get("searchName");
		String searchValue = map.get("searchValue");
		String curPage = map.get("curPage");
		String perPage = map.get("perPage");
		String curIdx = "";
		if (map.get("curIdx") != null)
			curIdx = map.get("curIdx");
		else
			curIdx = "0";
		if (curPage == null|| curPage.equals("")) {
			curPage = "1";
		}

		if (perPage == null|| perPage.equals("")) {
			perPage = "10";
		}
		Map<String,String> hmap = new HashMap<>();
		hmap.put("searchName", searchName);
		hmap.put("searchValue", searchValue);
		hmap.put("curPage", curPage);
		hmap.put("perPage", perPage);
		hmap.put("curIdx", curIdx);
		return hmap;
	}
}
