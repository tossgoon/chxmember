<%-- Created by IntelliJ IDEA. User: Administrator Date: 2018/3/20 Time: 10:31 To change this template use File | Settings | File Templates. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="cr" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><title>编辑用户</title>
    <meta charset="UTF-8"/>
    <style type="text/css">
        #tbuser tr td:first-child span {
            float: right;
            width: 110px;
            margin-right: 10px;
            text-align: right;
        }</style>
</head>
<body>
<%@ include file="../basic/headmodal.jsp" %>
<div class="container" style="width:100%;margin-bottom:160px;">
    <div class="row">
        <div class="col-md-12" style="text-align:center;">
            <div style="margin:0 auto;"><h3 style="font-weight:normal;float:left;">用户管理&gt;&gt;编辑</h3></div>
        </div>
    </div>
    <hr/>
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default" style="width:600px;margin:0 auto;">
                <div class="panel-body">
                    <form action="editSave" method="post" role="form">
                        <table style="border-collapse:separate; border-spacing:0px 10px;width:100%;" id="tbuser">
                            <tbody>
                            <tr>
                                <td><span>用户ID(*)</span></td>
                                <td><input type="text" name="id" id="id" value="${user.id}"
                                           class="form-control" readonly="readonly" required="true"/></td>
                            </tr>
                            <tr>
                                <td><span>登录名(*)</span></td>
                                <td><input type="text" name="loginName" id="loginName" value="${user.loginName}"
                                           class="form-control" disabled="true" required="true"/></td>
                            </tr>
                            <tr>
                                <td><span>店码(*)</span></td>
                                <td><input type="text" name="shopcode" id="shopcode" value="${user.shopcode}"
                                           class="form-control" required="true"/></td>

                            </tr>
                            <tr>
                                <td><span>状态（1为可用，0为不可用）</span></td>
                                <td><input type="text" name="state" id="state" value="${user.state}" class="form-control"/>
                                </td>
                            </tr>
                            <tr>
                                <td><span>创建日期</span></td>
                                <td>
                                    <div class="input-group date form_date"	data-date-format="yyyy-mm-dd">
                                        <input type="text" name="createTime" disabled="true" value="<fmt:formatDate value="${user.createTime}" pattern="yyyy-MM-dd"/>"
                                               id="createTime" class="form-control disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="submit" value="提交数据" class="btn btn-primary" style="float:right;height:32px;"/>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            ${msg}
        </div>
    </div>
</div>
<%@ include file="../basic/footmodal.jsp" %>
</body>
</html>