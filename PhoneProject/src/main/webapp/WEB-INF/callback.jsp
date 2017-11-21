<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>



	<script type="text/javascript">
		var naver_id_login = new naver_id_login("enhiLrv3z4s1opXjsssY",
				"http://localhost:8090/phone/callback");
		// 접근 토큰 값 출력
		//alert(naver_id_login.oauthParams.access_token);
		// 네이버 사용자 프로필 조회
		naver_id_login.get_naver_userprofile("naverSignInCallback()");
		// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	
		function naverSignInCallback() {
			
			console.log(naver_id_login.getProfileData('email'));
			console.log(naver_id_login.getProfileData('nickname'));
			console.log(naver_id_login.getProfileData('id'));
			
			var email =naver_id_login.getProfileData('email');
			var username =naver_id_login.getProfileData('nickname');
			var snsid =naver_id_login.getProfileData('id');
			var state = naver_id_login.getAccessToken();
	
			//opener.location.href ="http://localhost:8090/phone/snsForm?email='naver_id_login.getProfileData('email')+'&username='+ naver_id_login.getProfileData('nickname')+'&snsid='+naver_id_login.getProfileData('id')";  
			opener.location.href ="http://localhost:8090/phone/session?email="+email+"&username="+username
					+"&snsid="+snsid+"&value=naver";
			
			window.open('about:blank', '_self').self.close();
			
			
		}
	</script>



</body>
</html>
