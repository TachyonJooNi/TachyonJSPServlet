<!-- 
1. 테이블 생성
	a. musthave 계정에 테이블을 생성한다. 
	b.테이블명 : membership
	c. 컬럼구성 : 회원가입폼을 보고 본인이 판단하여 컬럼명, 제약조건 등을 기술한다. 
	d. 단, 아이디는 PK(기본키)로 지정해야 한다.
	e. 마지막 컬럼은 회원가입날짜를 추가한다. 
2. 회원가입 처리
	a. 파일명 : registProcess.jsp
	b. 패키지명 : homework
	c. DTO클래스
		i. 클래스명 : MembershipDTO
		ii. membership 테이블을 참조하여 생성한다. 
	d. DAO클래스
		i. 클래스명 : MembershipDAO
		ii. 메서드명 : memberInsert()
	e. 앞에서 submit 된 폼값을 받아 membership 테이블에 insert 한다. 
	f. 테이블에 입력이 완료되었다면 “가입성공” 이라는 alert를 띄우고 로그인 페이지로 이동한다. 
3. 로그인 처리
	a. memberLogin.jsp 를 실행한다. 
	b. 아이디, 패스워드가 입력되지 않으면 alert를 띄운다. 
	c. loginProcess.jsp 에서 로그인 처리한다. 
		i. 로그인 처리 메서드명 : memberLogin()
	d. 로그인이 완료되면 memberLogin.jsp로 다시 돌아온다. 
		i. XXX님, 로그인 하셨습니다. 
		ii. 로그아웃 버튼이 출력된다. 
4.로그아웃 처리
	a. 로그아웃 되면 3번으로 돌아간다. 
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Registration02.html</title>
    <link rel="stylesheet" href="./common/style.css" />
    <link
      rel="stylesheet"
      href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"
    />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
      $(function () {
        //라디오를 버튼모양으로 바꿔주는 jQuery UI
        $("input[type=radio]").checkboxradio({
          icon: false,
        });
        //날짜선택을 편리하게 - Date Picker
        $("#birthday").datepicker({
          dateFormat: "yy-mm-dd",
          showOn: "both",
          buttonImage: "./images/pick.jpg",
          buttonImageOnly: true,
        });
        $("img.ui-datepicker-trigger").css({
          position: "relative",
          top: "11px",
          width: "33px",
          marginTop: "-5px",
        });
      });
    </script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
      function zipcodeFind() {
        new daum.Postcode({
          oncomplete: function (data) {
            //DAUM 우편번호API가 전달해주는 값을 콘솔에 출력
            console.log("zonecode", data.zonecode);
            console.log("address", data.address);
            //회원 가입폼에 적용
            var f = document.registFrm; //<form>태그의 DOM객체를 변수에 저장
            f.zipcode.value = data.zonecode;
            f.address1.value = data.address;
            f.address2.focus();
          },
        }).open();
      }
    </script>
    <script>
      function registValdidate(form) {
        if (form.userid.value == "") {
          alert("아이디를 입력하세요");
          form.userid.focus();
          return false;
        }

        else if (!form.pass1.value || !form.pass2.value) {
          alert("비밀번호를 입력하세요");
          return false;
        }

        else if (form.pass1.value != form.pass2.value) {
          alert("입력한 비밀번호가 일치하지 않습니다.");
          form.pass1.value = "";
          form.pass2.value = "";
          form.pass1.focus();
          return false;
        }

        else if (form.name.value == "") {
          alert("이름을 입력하세요");
          form.name.focus();
          return false;
        }

        else if (form.birthday.value == "") {
          alert("생년월일을 입력하세요");
          form.birthday.focus();
          return false;
        }

        else if (
          !form.zipcode.value ||
          !form.address1.value ||
          !form.address2.value
        ) {
          alert("주소를 입력하세요");
          return false;
        }

        else if (!form.email1.value || !form.email2.value) {
          alert("이메일을 입력하세요");
          return false;
        }

        else if (!form.mobile1.value || !form.mobile2.value || !form.mobile3.value) {
          alert("휴대폰번호를 입력하세요");
          return false;
        }
        
        if (
              !(8 < form.userid.value.length && form.userid.value.length < 16)
            ) {
              alert("아이디는 8~16자만 가능합니다");
              form.userid.focus();
              return false;
            }

        for (var i = 0; i < form.userid.value.length; i++) {
          if (
            !(
              form.userid.value[i].charCodeAt(0) >= 48 &&
              form.userid.value[i].charCodeAt(0) <= 57
            ) &&
            !(
              form.userid.value[i].charCodeAt(0) >= 65 &&
              form.userid.value[i].charCodeAt(0) <= 90
            ) &&
            !(
              form.userid.value[i].charCodeAt(0) >= 97 &&
              form.userid.value[i].charCodeAt(0) <= 122
            )
          ) {
            alert("아이디는 영문과 숫자만 가능합니다");
            form.userid.focus();
            return false;
          }
        }

        // 영문/숫자/특수문자 조합 6~20자 이상 입력해주세요.
        if (!(6 < form.pass1.value.length && form.userid.pass1.length < 20)) {
          alert("비밀번호는 6~20자만 가능합니다");
          form.pass1.focus();
          return false;
        }

        for (var i = 0; i < form.pass1.value.length; i++) {
          if (
            !(
              form.pass1.value[i].charCodeAt(0) >= 33 &&
              form.pass1.value[i].charCodeAt(0) <= 126
            )
          ) {
            alert("비밀번호는 영문/숫자/특수문자 조합만 가능합니다");
            form.pass1.focus();
            return false;
          }
        }
    }

      function idCheck(form) {
      alert("아이디 중복체크는 하지않습니다.");
    }

      function inputEmail(form) {
      	var email = form.email_domain.value;
      	form.email2.value = email;
    }

      function commonFocusMove(obj, charLen, nextObj) {
      	var n = document.getElementsByName(nextObj);
      	if (charLen == obj.value.length) {
        	n[0].focus();
      	}
    }
      
      function grammarcheck() {
		
	}
    </script>
  </head>
  <body>
    <form
      action="registProcess.jsp"
      method="post"
      name="registFrm"
      onsubmit="return registValdidate(this)"
    >
      <div class="AllWrap">
        <div class="wrap_regiform">
          <p>*필수입력사항</p>
          <table class="regi_table">
            <colgroup>
              <col width="180px" />
              <col width="*" />
            </colgroup>
            <tr>
              <td><span class="red">*</span> 아이디</td>
              <td>
                <input type="text" class="w01" name="userid" value=""/>
                <button type="button" onclick="idCheck(this.form);">
                  중복확인
                </button>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <span class="comment"
                  >※ 8~16자의 영문과 숫자만 가능합니다.</span
                >
              </td>
            </tr>
            <tr>
              <td><span class="red">*</span> 비밀번호</td>
              <td>
                <input type="password" class="w01" name="pass1" value=""/>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <span class="comment">
                  ※ 영문/숫자/특수문자 조합 6~20자 이상 입력해주세요.
                </span>
              </td>
            </tr>
            <tr>
              <td><span class="red">*</span> 비밀번호확인</td>
              <td>
                <input type="password" class="w01" name="pass2" value="" />
              </td>
            </tr>
            <tr>
              <td><span class="red">*</span> 이름</td>
              <td>
                <input type="text" class="w01" name="name" value="" />

                <label for="radio-1">남</label>
                <input
                  type="radio"
                  name="gender"
                  id="radio-1"
                  value="남"
                  checked
                />
                <label for="radio-2">여</label>
                <input type="radio" name="gender" id="radio-2" value="여" />
              </td>
            </tr>
            <tr>
              <td><span class="red">*</span> 생년월일</td>
              <td style="padding: 0px 0 5px 5px">
                <input
                  type="text"
                  class="w02"
                  name="birthday"
                  id="birthday"
                  value=""
                />
                <!-- <img src="./images/pick.jpg" id="pick" class="pick" /> -->
              </td>
            </tr>
            <tr>
              <td><span class="red">*</span> 주소</td>
              <td>
                <input type="text" class="w03" name="zipcode" value="" />
                <button type="button" onclick="zipcodeFind();">
                  우편번호찾기
                </button>
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <input type="text" class="w04" name="address1" value="" />
                <input type="text" class="w04" name="address2" value="" />
              </td>
            </tr>
            <tr>
              <td><span class="red">*</span> 이메일</td>
              <td>
                <input type="text" class="w05" name="email1" value="" />
                @
                <input type="text" class="w05" name="email2" value="" />
                <select
                  name="email_domain"
                  class="s01"
                  onchange="inputEmail(this.form);"
                >
                  <option value="">직접입력</option>
                  <option value="naver.com">naver.com</option>
                  <option value="hanmail.net">hanmail.net</option>
                  <option value="gmail.com">gmail.com</option>
                </select>
              </td>
            </tr>
            <tr>
              <td><span class="red">*</span> 휴대폰번호</td>
              <td>
                <select
                  name="mobile1"
                  class="s02"
                  onchange="commonFocusMove(this, 3, 'mobile2');"
                >
                  <option value=""></option>
                  <option value="010">010</option>
                  <option value="011">011</option>
                  <option value="016">016</option>
                  <option value="017">017</option>
                  <option value="018">018</option>
                  <option value="019">019</option>
                </select>
                -
                <input
                  type="text"
                  class="w06"
                  name="mobile2"
                  maxlength="4"
                  value=""
                  onkeyup="commonFocusMove(this, 4, 'mobile3');"
                />
                -
                <input
                  type="text"
                  class="w06"
                  name="mobile3"
                  maxlength="4"
                  value=""
                  onkeyup="commonFocusMove(this, 4, 'tel1');"
                />
              </td>
            </tr>
            <tr>
              <td>전화번호</td>
              <td>
                <select
                  name="tel1"
                  class="s02"
                  onchange="commonFocusMove(this, 3, 'tel2');"
                >
                  <option value=""></option>
                  <option value="02">02</option>
                  <option value="031">031</option>
                  <option value="032">032</option>
                  <option value="033">033</option>
                </select>
                -
                <input
                  type="text"
                  class="w06"
                  name="tel2"
                  maxlength="4"
                  value=""
                  onkeyup="commonFocusMove(this, 4, 'tel3');"
                />
                -
                <input
                  type="text"
                  class="w06"
                  name="tel3"
                  maxlength="4"
                  value=""
                />
              </td>
            </tr>
          </table>
          <div style="text-align: center; margin-top: 10px">
            <button type="submit" class="btn_search">회원가입</button>
            <button type="reset" class="btn_search">다시쓰기</button>
          </div>
        </div>
      </div>
    </form>
  </body>
</html>