<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="cr" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>高级会员管理</title>
</head>
<body>

<%@ include file="../basic/headmodal.jsp" %>
<div class="container" style="width:100%;margin-bottom:160px;margin-top: 50px;">
    <div class="row"> <p style="text-align: center;font-size: 16px;color: #002a80">高级会员列表</p></div>
    <div class="row">
        <div class="col-md-12" style="text-align:center;">
            <form class="form-inline" action="${pageContext.request.contextPath }/chxm/search">
                <div class="form-group">
                    <span>店码</span>
                    <input id="shopcode" class="form-control need" name="shopcode" value="${sessionScope.shopcode}"
                            <cr:if test="${sessionScope.userstate != 9}">readonly="readonly" </cr:if>>
                    </input>
                    <input type="text" style="width: 300px;" class="form-control" name="searchStr" id="namesearch" placeholder="输入姓名">
                </div>
                <button type="submit" class="btn btn-primary" style="width: 70px;">查询</button>
                <input type="button" value="添加+" class="btn btn-danger"
                       style="margin-left:30px;width: 70px;"
                       onclick="location.href='<cr:url value="/chxm/add?pagecode=${sessionScope.shopcode}"></cr:url>'"/>
            </form>
        </div>
    </div>
    <div class="row" style="margin-bottom:20px;margin-top: 20px;">
        <div class="col-md-12">
            <div class="panel panel-default" style="margin-left:30px;margin-right:30px;">
                <table class="table table-hover">
                    <thead>
                    <tr align="center">
                        <th width="25"><input type="checkbox" id="chbAll"/></th>
                        <th width="40">编号</th>
                        <th width="50">会员名称</th>
                        <th width="50">亲切称呼</th>
                        <th width="50">性别</th>
                        <th width="50">年龄</th>
                        <th width="100">工作单位</th>
                        <th width="70">生日</th>
                        <th width="200">简要病史</th>
                        <th width="90">消费方式</th>
                        <th width="90">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <cr:forEach var="mem" items="${pagemsg.lists}">
                        <tr class="text-c">
                            <td><input name="memId" type="checkbox" value="${mem.memId}"/></td>
                            <td>${mem.cardId}</td>
                            <td>${mem.memName}</td>
                            <td>${mem.kindName}</td>
                            <td>${mem.sex}</td>
                            <td>${mem.age}</td>
                            <td>${mem.workUnit}</td>
                            <td><fmt:formatDate value="${mem.birthDay}" pattern="yyyy-MM-dd"/></td>
                            <td>${mem.medicalHistory}</td>
                            <td>${mem.consumePattern}</td>
                            <td><a href="${pageContext.request.contextPath }/chxm/edit?id=${mem.memId}">详情</a>
                                <a href="javascript:void(0)" onclick="DelChxm(${mem.memId})">删除</a>
                            </td>
                        </tr>
                    </cr:forEach>
                    </tbody>
                </table>
                <div style="margin:10px;">
                    <span>第${requestScope.pagemsg.currPage }/ ${requestScope.pagemsg.totalPage}页</span>
                    <span>总记录数：${requestScope.pagemsg.totalCount }  每页显示:${requestScope.pagemsg.pageSize}</span>
                    <span>
                    <cr:if test="${requestScope.pagemsg.currPage != 1}">
                        <a href="${pageContext.request.contextPath }/chxm/search?currentPage=1&searchStr=${requestScope.pagemsg.searchStr}&shopcode=${requestScope.pagemsg.shopcode}">[首页]</a>
                        <a href="${pageContext.request.contextPath }/chxm/search?currentPage=${requestScope.pagemsg.currPage-1}&searchStr=${requestScope.pagemsg.searchStr}&shopcode=${requestScope.pagemsg.shopcode}">[上一页]</a>
                    </cr:if>

                    <cr:if test="${requestScope.pagemsg.currPage != requestScope.pagemsg.totalPage}">
                        <a href="${pageContext.request.contextPath }/chxm/search?currentPage=${requestScope.pagemsg.currPage+1}&searchStr=${requestScope.pagemsg.searchStr}&shopcode=${requestScope.pagemsg.shopcode}">[下一页]</a>
                        <a href="${pageContext.request.contextPath }/chxm/search?currentPage=${requestScope.pagemsg.totalPage}&searchStr=${requestScope.pagemsg.searchStr}&shopcode=${requestScope.pagemsg.shopcode}">[尾页]</a>
                    </cr:if>
                </span>
                </div>
            </div>
        </div>
    </div>
    <!--_footer 作为公共模版分离出去-->
    <p>
        ${msg}
        ${param.msg}
    </p>

    <%@ include file="../basic/footmodal.jsp" %>
    <script type="text/javascript">
        $(function () {
            $("#hyli").addClass('active');
        });
       function DelChxm(id){
           var r=confirm("确定删除吗？");
           if (r==true)
           {
               $.ajax({
                   type:"POST",//请求方式
                   url:"${pageContext.request.contextPath }/chxm/del/"+id,//请求url
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
