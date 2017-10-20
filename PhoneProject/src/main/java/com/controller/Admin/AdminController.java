package com.controller.Admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dto.admin.MemberMngPageDTO;
import com.dto.cart.SalesDTO;
import com.dto.qna.QNAPageDTO;
import com.service.admin.AdminService;

@Controller
public class AdminController {

	
	@Autowired
	AdminService service;

	@RequestMapping("chartForm")
	public String chartFrom() {

		return "chart";
	}

	@RequestMapping("chartData")
	public String chartdata(@RequestParam Map<String, String> map, Model m) {
		System.out.println(map.get("start"));
		List<SalesDTO> list = service.getSalesChartDatas(map);
		m.addAttribute("list", list);
		return "chart/chart";
	}

	@RequestMapping("memberMng")
	public String memberManger(@RequestParam Map<String, String> map, Model m) {
		String curPage = map.get("curPage");
		String curIdx = map.get("curIdx");
		String perPage = map.get("perPage");

		String searchName = map.get("searchName");
		String searchValue = map.get("searchValue");
		if (curPage == null || curPage.equals("")) {
			curPage = "1";
		}
		if (perPage == null || curPage.equals("")) {
			perPage = "3";
		}
		if (curIdx == null || curIdx.equals("")) {
			curIdx = "0";
		}
		HashMap<String, String> h_map = new HashMap<>();
		h_map.put("curPage", curPage);
		h_map.put("perPage", perPage);
		h_map.put("curIdx", curIdx);
		h_map.put("searchName", searchName);
		h_map.put("searchValue", searchValue);
		MemberMngPageDTO mmpdto = service.page(h_map);
		m.addAttribute("membermanagepage", mmpdto);
		return "membermanagepage";

	}

	@RequestMapping(value = "/memberMngDelete", method = RequestMethod.GET)
	public String memberMngDelete(@RequestParam String num, @RequestParam Map<String, String> map, Model m) {
		String[] nums = num.split("/");
		String curPage = map.get("curPage");
		String curIdx = map.get("curIdx");
		String perPage = map.get("perPage");
		String searchName = map.get("searchName");
		String searchValue = map.get("searchValue");
		if (curPage == null || curPage.equals("")) {
			curPage = "1";
		}
		if (perPage == null || curPage.equals("")) {
			perPage = "3";
		}
		if (curIdx == null || curIdx.equals("")) {
			curIdx = "0";
		}
		HashMap<String, String> h_map = new HashMap<>();
		h_map.put("curPage", curPage);
		h_map.put("perPage", perPage);
		h_map.put("curIdx", curIdx);
		h_map.put("searchName", searchName);
		h_map.put("searchValue", searchValue);
		MemberMngPageDTO mmpdto = service.membersDelete(nums, h_map);
		m.addAttribute("membermanagepage", mmpdto);
		return "admin/membermanagepage";

	}

	@RequestMapping(value = "/memberMngUpdate", method = RequestMethod.GET)
	public @ResponseBody String memberMngUpdate(@RequestParam Map<String, String> map, Model m) {

		String curPage = map.get("curPage");
		String curIdx = map.get("curIdx");
		String perPage = map.get("perPage");
		String searchName = map.get("searchName");
		String searchValue = map.get("searchValue");
		if (curPage == null || curPage.equals("")) {
			curPage = "1";
		}
		if (perPage == null || curPage.equals("")) {
			perPage = "3";
		}
		if (curIdx == null || curIdx.equals("")) {
			curIdx = "0";
		}
		HashMap<String, String> h_map = new HashMap<>();
		h_map.put("curPage", curPage);
		h_map.put("perPage", perPage);
		h_map.put("curIdx", curIdx);
		h_map.put("searchName", searchName);
		h_map.put("searchValue", searchValue);

		MemberMngPageDTO mmpdto = service.memberUpdate(map, h_map);
		m.addAttribute("membermanagepage", mmpdto);
		return "admin/membermanagepage";

	}

	@RequestMapping(value="/QNAResponseForm", method = RequestMethod.GET)
	public String QNAResponse(@RequestParam Map<String, String> map, Model m) {
		String searchName = map.get("searchName");
		String searchValue = map.get("searchValue");
		String curPage = map.get("curPage");
		String perPage = map.get("perPage");
		String curIdx = "";
		if (map.get("curIdx") != null)
			curIdx = map.get("curIdx");
		else
			curIdx = "0";
		if (curPage == null) {
			curPage = "1";
		}

		if (perPage == null) {
			perPage = "3";
		}
		
		Map<String,String> hmap = new HashMap<>();
		hmap.put("searchName", searchName);
		hmap.put("searchValue", searchValue);
		hmap.put("curPage", curPage);
		hmap.put("perPage", perPage);
		hmap.put("curIdx", curIdx);
		QNAPageDTO dto = service.qnapage(hmap);

		m.addAttribute("page", dto);
		m.addAttribute("perPage", perPage);

		return "qnaResponse";
	}
	@RequestMapping(value="/response_window/num/{num}", method = RequestMethod.GET)
	public String responsewindow(@PathVariable String num ,@RequestParam Map<String, String> map, Model m) {
		m.addAttribute("num",num);
		return "admin/response_window";
	}
	@RequestMapping(value="/aaa",method=RequestMethod.GET)
	public String aaaa() {
		System.out.println("come in");
	
		return "qnaRetrieve";
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
		
		String searchName = map.get("searchName");
		String searchValue = map.get("searchValue");
		String curPage = map.get("curPage");
		String perPage = map.get("perPage");
		String curIdx = "";
		if (map.get("curIdx") != null)
			curIdx = map.get("curIdx");
		else
			curIdx = "0";
		if (curPage == null) {
			curPage = "1";
		}

		if (perPage == null) {
			perPage = "3";
		}
		
		Map<String,String> hmap = new HashMap<>();
		hmap.put("searchName", searchName);
		hmap.put("searchValue", searchValue);
		hmap.put("curPage", curPage);
		hmap.put("perPage", perPage);
		hmap.put("curIdx", curIdx);
		QNAPageDTO dto = service.qnapage(hmap);

		m.addAttribute("page", dto);
		m.addAttribute("perPage", perPage);
		return "qnaResponse";
	}
}
