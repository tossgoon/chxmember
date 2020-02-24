<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/28 0028
  Time: 21:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
  <head>
    <title>创新会员管理系统登录</title>

    <%@page pageEncoding="UTF-8"%>
    <%
      java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd");
      java.text.SimpleDateFormat timeFormat = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      java.util.Date currDate = new java.util.Date();
      String currentDate = dateFormat.format(currDate);
      String currentTime = timeFormat.format(currDate);
      String contextPath = request.getContextPath();
    %>
    <link rel="stylesheet" href="<%=contextPath%>/static/js/bootstrap/css/bootstrap.min.css" />
    <style type="text/css">
      #loginForm tr td:first-child span {
        float: right;
        width:110px;
        margin-right:10px;
        text-align:right;
      }
    </style>
  </head>
  <body>
  <div class="container" style="width:100%;margin-bottom:160px;">
    <div class="row">
      <div class="col-md-12" style="text-align:center;">
        <div style="margin:0 auto;"><h3 style="font-weight:normal;">创新高级会员管理系统/登陆</h3>
        </div>
      </div>
    </div>
    <hr />
    <div class="row">
      <div class="col-md-12">
        <div class="panel panel-default" style="width:806px;margin:0 auto;">
          <div class="panel-body">
            <form theme="simple" id="loginForm" action="${pageContext.request.contextPath }/user/loginin" method="post">
              <div style="width:600px;overflow:hidden">
                <table id="portolinfo" style="border-collapse:separate; border-spacing:0px 10px;width:100%;">
                  <tbody>
                  <tr>
                    <td><span>用户名</span></td>
                    <td><input value="${user.loginName}" name="loginName" class="form-control" ></td>
                  </tr>
                  <tr>
                    <td><span>密码</span></td>
                    <td><input class="form-control" id="userpass" type="password" value="${user.password}" name="password" ></input></td>
                  </tr>
                  <tr>
                    <td>
                     ${msg}
                    </td>
                  </tr>
                  </tbody>
                </table>
                <button type="submit" class="btn btn-primary"	style="float:right;">点击登陆</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  <hr/>
  <div style="width:100%;background-color:#555555;color:#ffffff;min-width:700px;text-align:center;position:absolute;bottom:0px;font-size:12px;margin:0 atuo;">
    <p style="margin:10px auto;padding:0px;">创新高级会员管理系统</p>
  </div>
  <script type="text/javascript" src="<%=contextPath%>/static/js/jquery/jquery-1.11.2.min.js"></script>
  <script type="text/javascript" src="<%=contextPath%>/static/js/bootstrap/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="<%=contextPath%>/static/js/bootstrap/js/bootstrap-datetimepicker.js"></script>


  </body>
</html>
