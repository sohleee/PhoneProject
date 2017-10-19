<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<style>
  body {
    margin: 20px;
    font-family: "맑은 고딕";
}
  #image_preview {
    display:none;
}
  </style>

<c:if test="${!empty requestScope.key}">
	<script>
	alert("${requestScope.key}");
	</script>
</c:if>
<c:if test="${!empty requestScope.writenull}">
	<script>
	alert("${requestScope.writenull}");
	</script>
</c:if>


<div align="center">
<form:form action="boardUpdate" modelAttribute="xxx" method="post" enctype="multipart/form-data">
<input type="hidden" name="author" value="${username}">
<input type="hidden" name="boardnum" value="${dto.boardnum}">
<table class="table">
<tr>
<td>제목</td><td><input type="text" name="title" value="${dto.title}" size="50"><br><form:errors path="title"/></td>
</tr>
<tr>
<td>작성자</td><td>${username}</td>
</tr>

<tr>
<td>내용</td><td><textarea rows="30" cols="100" name="content">${dto.content}</textarea><form:errors path="content"/></td>
</tr>
<tr>
	<td>이미지 등록</td><td><input type="file" name="board_image" id="image" />
		<div id="image_preview">
        <img src="#" height="100" width="100"/>
        <br />
        <a href="#">Remove</a>
    </div>
    </td>
</tr>
</table>
<input type="submit" value="쓰기">
<input type="reset" value="취소">

</form:form>
<hr>
<div align="left"><button onclick="boardList()">목록</button></div>
</div>


<script>
	function boardList(){
		location.href="boardList";
	}
	
	
	 /** 
    onchange event handler for the file input field.
    It emplements very basic validation using the file extension.
    If the filename passes validation it will show the image using it's blob URL  
    and will hide the input field and show a delete button to allow the user to remove the image
    */

    $('#image').on('change', function() {
        
        ext = $(this).val().split('.').pop().toLowerCase(); //확장자
        
        //배열에 추출한 확장자가 존재하는지 체크
        if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
            resetFormElement($(this)); //폼 초기화
            window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
        } else {
            file = $('#image').prop("files")[0];
            blobURL = window.URL.createObjectURL(file);
            $('#image_preview img').attr('src', blobURL);
            $('#image_preview').slideDown(); //업로드한 이미지 미리보기 
            $(this).slideUp(); //파일 양식 감춤
        }
    });

    /**
    onclick event handler for the delete button.
    It removes the image, clears and unhides the file input field.
    */
    $('#image_preview a').bind('click', function() {
        resetFormElement($('#image')); //전달한 양식 초기화
        $('#image').slideDown(); //파일 양식 보여줌
        $(this).parent().slideUp(); //미리 보기 영역 감춤
        return false; //기본 이벤트 막음
    });
        

    /** 
    * 폼요소 초기화 
    * Reset form element
    * 
    * @param e jQuery object
    */
    function resetFormElement(e) {
        e.wrap('<form>').closest('form').get(0).reset(); 
        //리셋하려는 폼양식 요소를 폼(<form>) 으로 감싸고 (wrap()) , 
        //요소를 감싸고 있는 가장 가까운 폼( closest('form')) 에서 Dom요소를 반환받고 ( get(0) ),
        //DOM에서 제공하는 초기화 메서드 reset()을 호출
        e.unwrap(); //감싼 <form> 태그를 제거
    }
	
	
</script>



