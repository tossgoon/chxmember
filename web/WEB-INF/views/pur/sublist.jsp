<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="cr" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<% String[] shopList = {"000", "001", "002", "003", "004", "005", "006", "007", "008"};
    pageContext.setAttribute("shopList", shopList);
%>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>采购管理(分店)</title>
</head>
<body>

<%@ include file="../basic/headmodal.jsp" %>
<link rel="stylesheet" href="<%=contextPath%>/static/js/bootstrap/css/bootstrap-table.min.css"></link>
<div class="container" style="width:100%;margin-bottom:160px;margin-top: 50px;">
    <div class="row"><p style="text-align: center;font-size: 16px;color: #002a80">采购清单（分店）</p></div>
    <div class="row">
        <div class="col-md-12" style="text-align:center;padding-left: 120px;">
            【单号:${param.billnum}】
        </div>
    </div>
    <div class="row" style="margin-bottom:20px;margin-top: 20px;">
        <div class="col-md-12">
            <div class="panel panel-info">
                <div class="panel-heading">药品采购清单【店码:${param.dm}】
                    <a href="#" data-toggle="modal" onclick="btn_export_click()"
                       style="float: right;margin-right: 20px;">
                        导出数据
                    </a>
                </div>
                <table class="table table-hover" data-unique-id="id" data-single-select="true"
                       data-click-to-select="true" data-toggle="table" id="tb_main_pur">
                    <thead>
                    <tr align="center" style="text-align: center">
                        <th data-radio="true"></th>
                        <th data-field="id" width="40">ID</th>
                        <th data-field="bm" width="50">编码</th>
                        <th data-field="mc" width="150">名称</th>
                        <th data-field="gg" width="50">规格</th>
                        <th data-field="sccj" width="150">生产厂家</th>
                        <th data-field="jhdw" width="50">单位</th>
                        <th  data-field="zzsl" width="80">合计</th>
                    </tr>
                    </thead>
                    <tbody>
                    <cr:forEach var="pur" items="${purs}">
                        <tr class="text-c">
                            <td></td>
                            <td>${pur.id}</td>
                            <td>【${pur.bm}】</td>
                            <td>${pur.mc}</td>
                            <td>${pur.gg}</td>
                            <td>${pur.sccj}</td>
                            <td>${pur.jhdw}</td>
                                <%--<td>${pur.remark}</td>--%>
<%--                            <td>${pur.yssl}</td>--%>
                            <td>${pur.zzsl}</td>
<%--                            <td><fmt:formatDate value="${pur.createdate}" pattern="yyyy-MM-dd"/></td>--%>
                        </tr>
                    </cr:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <%@ include file="../basic/footmodal.jsp" %>
    <script type="text/javascript" src="<%=contextPath%>/static/js/bootstrap/js/bootstrap-table.min.js"></script>
    <script type="text/javascript" src="<%=contextPath%>/static/js/bootstrap/js/bootstrap-table-zh-CN.js"></script>
    <script type="text/javascript" src="<%=contextPath%>/static/js/bootstrap/js/bootstrap-table-export.js"></script>
    <script type="text/javascript" src="<%=contextPath%>/static/js/bootstrap/js/tableExport.js"></script>
    <script type="text/javascript" src="<%=contextPath%>/static/js/bootstrap/js/jquery.base64.js"></script>
    <script type="text/javascript">
        var purindex;//当前编辑商品行数索引
        var purid;//当前编辑ID
        var current_pur;//当前编辑的行
        var iseidt = false;
        var subpurindex;//分店表索引
        var subpurid;//当前编辑分店ID
        $(function () {
            //添加导出按钮
            $("#tb_main_pur").bootstrapTable('destroy').bootstrapTable({
                    exportDataType:'all',//'basic':当前页的数据, 'all':全部的数据, 'selected':选中的数据
                    showExport: true,  //是否显示导出按钮
                    buttonsAlign:"right",  //按钮位置
                    exportTypes:['excel'],  //导出文件类型，[ 'csv', 'txt', 'sql', 'doc', 'excel', 'xlsx', 'pdf']
                    exportOptions:{
                        ignoreColumn: [0,7],  //忽略某一列的索引
                        fileName: new Date().getTime(),  //文件名称设置
                        excelstyles: ['background-color', 'color', 'font-size', 'font-weight']
                    }
                });
            //隐藏ID列
            $("#tb_main_pur").bootstrapTable('hideColumn', "id"); //隐藏ID列
            $("#fdcgli").addClass('active');
        });
       function btn_export_click(){
           $('#tb_main_pur').tableExport({type:'excel', fileName: new Date().getTime(), escape:'false', ignoreColumn:[0,7]});
       }
        function DoOnMsoNumberFormat(cell, row, col) {
            var result = "";
            if (row > 0 && col == 0)
                result = "\\@";
            return result;
        }
    </script>
</body>
</html>