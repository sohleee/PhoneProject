<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script>
	$(document).ready(function() {

		var userInputId = getCookie("userInputId");
		$("input[name='userid']").val(userInputId);

		if ($("input[name='userid']").val() != "") {
			$("#saveid").attr("checked", true);
		}

		// 체크
		$("#saveid").change(function() {
			if ($("#saveid").is(":checked")) {
				var userInputId = $("input[name='userid']").val();
				setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
			} else { // ID 저장하기 체크 해제 시,
				deleteCookie("userInputId");
			}
		});

		// ID 저장하기를 체크한 상태에서 ID를 입력.
		$("input[name='userid']").keyup(function() {
			if ($("#saveid").is(":checked")) {
				var userInputId = $("input[name='userid']").val();
				setCookie("userInputId", userInputId, 7);
			}
		});
	});

	function setCookie(cookieName, value, exdays) {
		var exdate = new Date();
		exdate.setDate(exdate.getDate() + exdays);
		var cookieValue = escape(value)
				+ ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
		document.cookie = cookieName + "=" + cookieValue;
	}

	function deleteCookie(cookieName) {
		var expireDate = new Date();
		expireDate.setDate(expireDate.getDate() - 1);
		document.cookie = cookieName + "= " + "; expires="
				+ expireDate.toGMTString();
	}

	function getCookie(cookieName) {
		cookieName = cookieName + '=';
		var cookieData = document.cookie;
		var start = cookieData.indexOf(cookieName);
		var cookieValue = '';
		if (start != -1) {
			start += cookieName.length;
			var end = cookieData.indexOf(';', start);
			if (end == -1)
				end = cookieData.length;
			cookieValue = cookieData.substring(start, end);
		}
		return unescape(cookieValue);
	}
</script>

<style>

.form-signin {
  max-width: 330px;
  padding: 15px;
  margin: 0 auto;
}
.form-signin .form-signin-heading,
.form-signin .checkbox {
  margin-bottom: 10px;
}
.form-signin .checkbox {
  font-weight: 400;
}
.form-signin .form-control {
  position: relative;
  box-sizing: border-box;
  height: auto;
  padding: 10px;
  font-size: 16px;
}
.form-signin .form-control:focus {
  z-index: 2;
}
.form-signin input[type="text"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}
.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}

a{text-decoration: none;}

</style>
<div class="container">

      <form class="form-signin" method="post" action="login">
        <h2 class="form-signin-heading">LOGIN</h2>
        <hr width="300px;">
        <label for="inputID" class="sr-only">Email address</label>
        <input type="text" id="inputID" name="userid" class="form-control" placeholder="ID" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="inputPassword" name="passwd" class="form-control" placeholder="Password" required>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me" name="saveid" id="saveid"> 아이디 저장
          </label>
        </div>
        <button type="submit" value="로그인" class="button" style="width: 300px; height: 45.31px; border-radius: 4px;">로그인</button>
      </form>

    </div> <!-- /container -->


<p align="center">
	<a href="memberForm" class="a">회원가입 &nbsp;&nbsp;&nbsp;|</a> <a
		href="findIDForm" class="a">아이디 찾기 &nbsp;&nbsp;&nbsp;|</a> <a
		href="findPasswdForm" class="a"> 비밀번호 찾기</a>
</p>

<br><br>
<div align="center" id="snsLogin">
<!-- 네이버아이디로로그인 버튼 노출 영역 -->
  <div id="naver_id_login" style="width: 500px;"></div>
  <!-- //네이버아이디로로그인 버튼 노출 영역 -->
  <script type="text/javascript">
  	var naver_id_login = new naver_id_login("enhiLrv3z4s1opXjsssY", "http://localhost:8090/phone/callback");
  	
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("green", 3,48);
  	//naver_id_login.setButton("green", 3,50);
  	naver_id_login.setDomain("http://localhost:8090/phone/loginForm");
  	naver_id_login.setState(state);
  	naver_id_login.setPopup();
  	naver_id_login.init_naver_id_login();
  </script>


<!-- 카카오아이디로 로그인 -->
<a id="kakao-login-btn"></a>
<script type='text/javascript'>
    Kakao.init('d885f25283d57c8b4b2b62935fc5cc2d');
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(authObj) {
        Kakao.API.request({
          url: '/v1/user/me',
          success: function(res) {
            var email = res.kaccount_email;
            var snsid = res.id;
            var username = res.properties.nickname;
           location.href ="http://localhost:8090/phone/session?email="+email+"&username="+username
			+"&snsid="+snsid+"&value=kakao"; 

          },
          fail: function(error) {
            alert(JSON.stringify(error));
          }
        });
      },
      fail: function(err) {
        alert(JSON.stringify(err));
      }
    });
</script>

</div>

<!-- 구글로그인 -->
<script src="https://www.gstatic.com/firebasejs/4.2.0/firebase.js"></script>
<script>
  // Initialize Firebase
  // TODO: Replace with your project's customized code snippet
  var config = {
    apiKey: "<API_KEY>",
    authDomain: "<PROJECT_ID>.firebaseapp.com",
    databaseURL: "https://<DATABASE_NAME>.firebaseio.com",
    storageBucket: "<BUCKET>.appspot.com",
    messagingSenderId: "<SENDER_ID>",
  };
  firebase.initializeApp(config);
</script>


