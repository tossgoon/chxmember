<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="cr" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>用户管理</title>
</head>
<body>

<%@ include file="../basic/headmodal.jsp" %>
<div style="text-align: center;margin-top: 50px;">
    <p align="center">用户管理</p>
    <button type="button" class="btn btn-warning"
            onclick="location.href='${pageContext.request.contextPath }/user/add'">新增用户+
    </button>
</div>

<div class="container" style="width:100%;margin-bottom:160px;">
    <div class="row" style="margin-bottom:20px;">
        <div class="col-md-12">
            <div class="panel panel-default" style="margin:50px;">
                <table class="table table-hover">
                    <thead>
                    <tr align="center">
                        <th width="40">用户ID</th>
                        <th width="50">用户名</th>
                        <th width="50">店码</th>
                        <th width="50">状态</th>
                        <th width="50">创建日期</th>
                        <th width="90">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <cr:forEach var="user" items="${users}">
                        <tr class="text-c">
                            <td>${user.id}</td>
                            <td>${user.loginName}</td>
                            <td>${user.shopcode}</td>
                            <td>${user.state}</td>
                            <td><fmt:formatDate value="${user.createTime}" pattern="yyyy-MM-dd"/></td>
                            <td><a href="${pageContext.request.contextPath }/user/edit?id=${user.id}">详情</a>
                                <a href="javascript:void(0)" onclick="DelUser(${user.id})">删除</a></td>
                        </tr>
                    </cr:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!--_footer 作为公共模版分离出去-->
    <p>
        ${msg}
    </p>
    <%@ include file="../basic/footmodal.jsp" %>
    <script type="text/javascript">
        function DelUser(id){
            var r=confirm("确定删除吗？");
            if (r==true)
            {
                $.ajax({
                    type:"POST",//请求方式
                    url:"${pageContext.request.contextPath }/user/del/"+id,//请求url
                    //dataType:"json",//返回数据类型
                    async:false,//设置为同步请求
                    cache:false,//设置不从浏览器缓存加载信息
                    success:function(data){
                        location.reload();
                    }
                });
            }
        }
    </script>
</body>
</html>
