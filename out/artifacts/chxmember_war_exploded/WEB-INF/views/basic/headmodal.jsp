
<%@page pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<link rel="stylesheet" href="<%=contextPath%>/static/js/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=contextPath%>/static/js/bootstrap/css/bootstrap-datetimepicker.css" />
<link rel="stylesheet" href="<%=contextPath%>/static/css/portal_head_modal.css">
<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#" style="color: #1e90ff">创新高级会员管理系统</a>
		</div>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li><a href="${pageContext.request.contextPath }/chxm/search?shopcode=${sessionScope.shopcode}">会员管理</a></li>
				<cr:if test="${sessionScope.userstate == 9}">
					<li><a href="${pageContext.request.contextPath }/user/list">用户管理</a></li>
				</cr:if>
				<li><a href="${pageContext.request.contextPath }/user/loginout">退出登录</a></li>
			</ul>
		</div><!--/.nav-collapse -->
	</div>
</nav>
<hr/>
