<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.4/css/bulma.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../css/memberManage.css" />
</head>
<body>
	<div id="loadHeader" style="margin-bottom: 50px;"></div>
	
	<section class="hero" style="background-color: #000;">
		  <div class="hero-body">
		    <div class="container">
		      <h1 class="title"  style=" color: #fff">
				블랙리스트 회원 관리
		      </h1>
		      <h2 class="subtitle"  style=" color: #fff">
		        Admin Page
		      </h2>
		    </div>
		  </div>
		</section>

        <table class="table">
            <thead>
                <tr>
                    <th><abbr title="Position">회원번호</abbr></th>
                    <th>회원속성</th>
                    <th>기업회원 이름</th>
                    <th>개인회원 이름</th>
                    <th>이메일</th>
                    <th>전화번호</th>
                    <th>회사번호</th>
                    <th>가입날짜</th>
                    <th>사유</th>
                    <th>차단해제</th>
                </tr>
            </thead>

            <tbody id="tdStart">
           
            </tbody>
        </table>
	
	
	<div id="loadFooter" style="margin-top: 50px;"></div>
</body>

 <script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
 <script src="../js/blackListMember.js"></script>    
</html>