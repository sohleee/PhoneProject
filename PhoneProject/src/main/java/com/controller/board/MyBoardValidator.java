package com.controller.board;

import java.util.ArrayList;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.dto.board.BoardDTO;
import com.dto.board.FileDTO;

public class MyBoardValidator implements Validator {

	@Override
	public boolean supports(Class<?> arg0) { //유효성검사가 가능한 클래스로 설정
		return FileDTO.class.equals(arg0);
	}

	@Override
	public void validate(Object obj, Errors e) {
		FileDTO dto=(FileDTO) obj;
		if(dto.getTitle().length()==0) {
			e.rejectValue("title","null","제목을 입력하세요");
		}
		if(dto.getContent().length()==0) {
			e.rejectValue("content","null","내용을 입력하세요");
		}else {
			ArrayList<String> list=new ArrayList<String>();
			list.add("바보");
			list.add("멍청이");
				for(String k: list) {
					if (dto.getContent().indexOf(k)>-1) {
						e.rejectValue("content", "keyword","부적절한 키워드를 포함하고 있습니다");
					}
				}

		}
	}
}
