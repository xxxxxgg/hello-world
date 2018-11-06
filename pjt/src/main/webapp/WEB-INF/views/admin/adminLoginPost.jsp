<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Village Admin Login Page</title>
<style type="text/css">
.header-left {
	display : inline-block;
	width : 200px;
	height : 100px;
	margin : 1em;
}
.header-right {
	float : right;
	margin-top : 40px;
}
.header-right ul li {
	display : inline-block;
	margin-right : 20px;
}
body {
	vertical-align : middle;
	text-align : center;
}
div {
	width : 100%;
	height : 100%;
	vertical-align : middle;
}
div form div .ch {
	width : 100%;
	text-align : left;
}
div form div .lo {
	width : 100%;
	text-align : right;
}
</style>
</head>
<body>
<h1>관리자 로그인</h1>
${result }

${adminVO.id }
${adminVO.pw }
${adminVO.name }
${alogin }

<script type="text/javascript">
	self.location = "/admin/adminLogin";
</script>
</body>
</html>