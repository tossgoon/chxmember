<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="cr" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>采购管理</title>
</head>
<body>

<%@ include file="../basic/headmodal.jsp" %>
<link rel="stylesheet" href="<%=contextPath%>/static/js/bootstrap/css/bootstrap-table.min.css"></link>
<div class="container" style="width:100%;margin-bottom:160px;margin-top: 50px;">
    <div class="row"><p style="text-align: center;font-size: 16px;color: #002a80">采购单列表（总店）</p></div>
    <div class="row" style="margin-bottom:20px;margin-top: 20px;">
        <div class="col-md-12">
            <div class="panel panel-info">
                <div class="panel-heading">总店采购单
                </div>
                <table class="table table-hover" data-unique-id="id"  data-single-select="true"  data-click-to-select="true"  data-toggle="table" id="tb_main_pur">
                    <thead>
                    <tr align="center" style="text-align: center">
                        <th data-field="id"></th>
                        <th  data-field="billnum" >单号</th>
                        <th  data-field="years" width="50">年</th>
                        <th  data-field="month" width="50">月</th>
                        <th  data-field="flag" width="50">状态</th>
                        <th  data-field="createdate" >创建日期</th>
<%--                        <th  data-field="sumMoney" >总额（元）</th>--%>
                        <th >操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <cr:forEach var="bill" items="${bills}">
                        <tr class="text-c">
                            <td>${bill.id}</td>
                            <td>${bill.billnum}</td>
                            <td>${bill.years}</td>
                            <td>${bill.month}</td>
                            <td> <cr:choose><cr:when test="${bill.flag eq 0}">初始</cr:when><cr:otherwise>完成</cr:otherwise> </cr:choose> </td>
                            <td><fmt:formatDate value="${bill.createdate}" pattern="yyyy-MM-dd HH:mm"/></td>
<%--                            <td>${bill.sumMoney}</td>--%>
                            <td> <a href="${pageContext.request.contextPath }/pur/getpursbybid?bid=${bill.id}&billnum=${bill.billnum}">查看详细</a> &nbsp;&nbsp;
                                 <a href="javascript:void(0)" onclick="DelPurBill(${bill.id})">删除</a>
                                <a id="finish" <cr:if test="${bill.flag eq 1}">style="display: none"</cr:if> href="javascript:void(0)" onclick="UpdatePurBillStatus(${bill.id},1)">设为完成</a>
                                 <a id="unfinish" <cr:if test="${bill.flag eq 0}">style="display: none"</cr:if> href="javascript:void(0)" onclick="UpdatePurBillStatus(${bill.id},0)">设为未完成</a>
                            </td>
                        </tr>
                    </cr:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <p>
        ${msg}
    </p>
    <%@ include file="../basic/footmodal.jsp" %>
    <script type="text/javascript" src="<%=contextPath%>/static/js/bootstrap/js/bootstrap-table.min.js"></script>
    <script type="text/javascript" src="<%=contextPath%>/static/js/bootstrap/js/bootstrap-table-zh-CN.js"></script>
    <script type="text/javascript">
        var purindex;
        $(function () {
            //初始化日期控件
            $("#tb_main_pur").on("click-cell.bs.table", function ($event, field, value, row, target) {
                purindex = target[0].parentElement.rowIndex;
            });
            //
            $("#tb_main_pur").bootstrapTable('hideColumn', "id"); //隐藏ID列
            $("#cgli").addClass('active');
        });
        var iseidt=false;
        function DelPurBill(id) {
            var r = confirm("确定删除吗？");
            if (r == true) {
                $.ajax({
                    type: "POST",//请求方式
                    url: "${pageContext.request.contextPath }/updateStatus",//请求url
                    //dataType:"json",//返回数据类型
                    async: false,//设置为同步请求
                    cache: false,//设置不从浏览器缓存加载信息
                    success: function (data) {
                        location.reload();
                    }
                });
            }
        }
        function UpdatePurBillStatus(id,status){
            var r = confirm("确定标记为已完成吗？");
            if (r == true) {
                $.ajax({
                    type: "POST",//请求方式
                    url: "${pageContext.request.contextPath }/purbill/updateStatus",//请求url
                    //dataType:"json",//返回数据类型
                    data: {
                        id: id,
                        status:status
                    },
                    async: false,//设置为同步请求
                    cache: false,//设置不从浏览器缓存加载信息
                    success: function (data) {
                       if(data=="1"){
                           if(status==1){
                               $("#tb_main_pur").bootstrapTable('updateCellByUniqueId', {id: id, field: 'flag', value: '完成'});
                               $("#finish").css('display','none');
                               $("#unfinish").css('display','block');
                           }
                            else{
                               $("#tb_main_pur").bootstrapTable('updateCellByUniqueId', {id: id, field: 'flag', value: '初始'});
                               $("#finish").css('display','block');
                               $("#unfinish").css('display','none');
                            }
                       }
                    }
                });
            }
        }
        function searchSpxxByName() {
            var spname=$('#spname').val();
            $.ajax({
                type: "Get",
                url: "${pageContext.request.contextPath}/pur/spxx/getSpxxByName",
                data: {
                    spname: spname
                },
                dataType: "Json",
                success: function (splist) {
                    $('#tbspxx').bootstrapTable('load', splist);
                }
            });
        }
        function btn_add_pur() {
            var bts= $("#tbspxx").bootstrapTable('getAllSelections');
            if(bts!=null&&bts!=undefined){
                if(iseidt==true){
                    $("#tb_main_pur").bootstrapTable('updateRow', {index: purindex-1, row:$.parseJSON(JSON.stringify(bts[0])) });
                }
                else{
                    $("#tb_main_pur").bootstrapTable('append', bts);
                }
            }
            $('#modalPur').modal('hide');
        }
        //新增药品
        function btn_insert_click() {
            iseidt=false;
        }
        //删除药品
        function btn_delete_click() {
            $("#tb_main_pur").bootstrapTable('updateRow', {
                index: 1,
                row: {
                    bm:'hehe',
                    mc:'111'
                }
            });
        }
        //编辑药品
        function btn_edit_click() {
            iseidt=true;
            $('#modalPur').modal('show');
        }
    </script>
</body>
</html>
