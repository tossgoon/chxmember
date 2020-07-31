<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/28 0028
  Time: 21:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>创新会员管理系统登录</title>

    <%@page pageEncoding="UTF-8" %>
    <%
        java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd");
        java.text.SimpleDateFormat timeFormat = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        java.util.Date currDate = new java.util.Date();
        String currentDate = dateFormat.format(currDate);
        String currentTime = timeFormat.format(currDate);
        String contextPath = request.getContextPath();
    %>
    <link rel="stylesheet" href="<%=contextPath%>/static/js/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="<%=contextPath%>/static/css/loginpage.css"/>
    <style type="text/css">
        #loginForm tr td:first-child span {
            float: right;
            width: 110px;
            margin-right: 10px;
            text-align: right;
        }
    </style>
</head>
<body>
<div class="header">
    <div class="header_link">创新药店管理信息系统</div>
</div>
<div class="container content" >
    <div class="row">
        <div class="col-md-8">
            <p style="text-align: center">山中何事，松花酿酒，春水煎茶。</p>
            <p style="text-align: center">
                <img src="<%=contextPath%>/static/images/loginpage.jpg" style="width:82%;" alt="lgoinpage">
                </p>

        </div>
        <div class="col-md-4">
            <div class="panel panel-info" style="width:304px;height:327px;margin:0 auto;margin-top: 20px;">
              <div class="panel-heading">
                <h3 class="panel-title">用户登录</h3>
              </div>
              <div class="panel-body" style="margin: 10px;">
                    <form theme="simple" id="loginForm" action="${pageContext.request.contextPath }/user/loginin"
                          method="post">
                        <div style="overflow:hidden">
                            <div class="form-group" style="text-align: center">
                                <input value="${user.loginName}" placeholder="输入用户名" name="loginName" class="form-control">
                            </div>
                            <div class="form-group" style="text-align: center">
                                <input  class="form-control"placeholder="输入密码"  id="userpass" type="password"
                                       value="${user.password}" name="password">
                            </div>
                            <div class="form-group" style="text-align: center">
                                <button type="submit" class="btn btn-primary" style="width: 100%;">点击登陆</button>
                            </div>
                            <div class="form-group">
                                <hr>
                                <p>${msg}</p>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="footer">
    <span style="margin:10px auto;padding:0px;">创新药店管理信息系统</span>
</div>
<script type="text/javascript" src="<%=contextPath%>/static/js/jquery/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/static/js/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/static/js/bootstrap/js/bootstrap-datetimepicker.js"></script>


</body>
</html>
