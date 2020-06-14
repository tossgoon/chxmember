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
    <title>采购管理</title>
</head>
<body>

<%@ include file="../basic/headmodal.jsp" %>
<link rel="stylesheet" href="<%=contextPath%>/static/js/bootstrap/css/bootstrap-table.min.css"></link>
<div class="container" style="width:100%;margin-bottom:160px;margin-top: 50px;">
    <div class="row"><p style="text-align: center;font-size: 16px;color: #002a80">采购清单（总）</p></div>
    <div class="row">
        <div class="col-md-12" style="text-align:center;padding-left: 120px;">
            【单号:${billnum}】
        </div>
    </div>
    <div class="row" style="margin-bottom:20px;margin-top: 20px;">
        <div class="col-md-9">
            <div class="panel panel-info">
                <div class="panel-heading">药品采购清单（总）
                    <a href="#" data-toggle="modal" onclick="btn_export_click()"
                       style="float: right;margin-right: 20px;">
                        导出数据
                    </a>
                    <a href="#" data-toggle="modal" onclick="btn_insert_click()"
                       style="float: right;margin-right: 20px;"
                       data-target="#modalPur">
                        新增药品+
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
                        <%--<th width="100">备注</th>--%>
<%--                        <th  data-field="yssl" width="80">原始数量</th>--%>
                        <th  data-field="zzsl" width="80">合计</th>
<%--                        <th  data-field="createdate" width="80">创建日期</th>--%>
                        <th  data-field="cz" width="80">操作</th>
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
                            <td><a href="javascript:void(0)" onclick="EditPur(${pur.id})">编辑</a>
                                <a href="javascript:void(0)" onclick="DelPur(${pur.id})">删除</a>
                            </td>
                        </tr>
                    </cr:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="col-md-3">
            <div class="panel panel-success">
                <div class="panel-heading">分店数据
                    <a href="#" data-toggle="modal" onclick="btn_insert_sub_click()"
                       style="float: right;margin-right: 20px;">
                        新增+
                    </a>
                </div>
                <table class="table table-hover" data-unique-id="id" data-single-select="true"
                       data-click-to-select="true" data-toggle="table" id="tbSubPurs">
                    <thead>
                    <tr>
                        <th data-field="id">ID</th>
                        <th data-field="dm">店码</th>
                        <th data-field="yssl">报送数量</th>
                        <th data-field="zzsl">审批数量</th>
<%--                        <th data-field="createdate">日期</th>--%>
                        <th data-field="bj">编辑</th>
                    </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
    <div class="modal fade" id="modalPur" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">查询药品品种</h4>

                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-7">
                                        <div class="input-group">
                                            <span class="input-group-addon" id="span_sp_name">药品名称</span>
                                            <input type="text" class="form-control" name="spname" id="spname"
                                                   placeholder="输入名称查询..." aria-describedby="span_sp_name">
                                            <span class="input-group-btn">
                                             <button class="btn btn-default" onclick="searchSpxxByName()" type="button">查询</button>
                                            </span>
                                        </div>
                                    </div>
                                    <%--<div class="col-xs-5">
                                        <div class="input-group">
                                            <span class="input-group-addon" id="span_sp_num">最终数量</span>
                                            <input type="text" class="form-control" name="spnum" id="spnum" aria-describedby="span_sp_num"/>
                                        </div>
                                    </div>--%>
                                </div>
                            </div>
                            <div class="panel-body">
                                <table class="table table-hover" data-single-select="true" data-click-to-select="true"
                                       data-toggle="table" id="tbspxx">
                                    <thead>
                                    <tr align="center" style="text-align: center">
                                        <th data-field="state" id="spstate" data-checkbox="true"></th>
                                        <th data-field="bm" width="50">编码</th>
                                        <th data-field="mc" width="180">名称</th>
                                        <th data-field="sccj" width="130">生产厂家</th>
                                        <th data-field="gg" width="150">规格</th>
                                        <th data-field="jhdw" width="50">单位</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button id="ok" type="button" onclick="btnPurOk()" class="btn btn-primary">确定</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="modalSubPur" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel2">分店采购数量
                    </h4>
                    <label>药品编号：</label><label id="selected_sp_bm"></label>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="fddm"
                                   class="col-sm-2 control-label">店码</label>
                            <div class="col-sm-8">
                                <select id="fddm" class="form-control need" name="fddm">
                                    <option value="">请选择</option>
                                    <cr:forEach items="${pageScope.shopList}" var="s">
                                        <option value="${s}">${s}</option>
                                    </cr:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="fdsl"
                                   class="col-sm-2 control-label">数量</label>
                            <div class="col-sm-8">
                                <input class="form-control" id="fdsl">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button id="subok" onclick="btnSubOk()" class="btn btn-primary">确定</button>
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
            $("#tbSubPurs").bootstrapTable('hideColumn', "id"); //隐藏ID列
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
            //主表点击时，设置当前行和id
            $("#tb_main_pur").on("click-cell.bs.table", function ($event, field, value, row, target) {
                purindex = target[0].parentElement.rowIndex;
                purid = isNaN(row.id)?0:Number(row.id);
                current_pur = row;
                //更新分店表
                $.ajax({
                    type: "Get",
                    url: "${pageContext.request.contextPath}/pur/getpurs/"+purid,
                    dataType: "Json",
                    success: function (splist) {
                        for(var index=0;index<splist.length;index++)
                        {
                            splist[index].bj = "<a href='javascript:void(0)' onclick='EditSubPur("+splist[index].id+")'>编辑</a>&nbsp&nbsp<a href='javascript:void(0)' onclick='DelSubPur("+splist[index].id +","+splist[index].zzsl +")'>删除</a>"
                        }
                        $('#tbSubPurs').bootstrapTable('load', splist);
                    }
                });
            });
            $("#cgli").addClass('active');
        });

        //删除采购记录
        function DelPur(id) {
            var r = confirm("确定删除吗？");
            if (r == true) {
                $.ajax({
                    type: "POST",//请求方式
                    url: "${pageContext.request.contextPath }/pur/del/" + id,//请求url
                    //dataType:"json",//返回数据类型
                    async: false,//设置为同步请求
                    //cache: false,//设置不从浏览器缓存加载信息
                    success: function (data) {
                        if (data == "1") {
                            $('#tb_main_pur').bootstrapTable('removeByUniqueId', id);
                        }
                        //location.reload();
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert(XMLHttpRequest.readyState + XMLHttpRequest.status + XMLHttpRequest.responseText);
                    }
                });
            }
        }

        function searchSpxxByName() {
            var spname = $('#spname').val();
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

        function btnPurOk() {
            var bts = $("#tbspxx").bootstrapTable('getAllSelections');
            if (bts != null && bts != undefined && bts.length > 0) {
                var pur = bts[0];
                pur["billid"] = ${billid};
                pur["cglb"]=0;
                if (iseidt != true) {
                    $.ajax({
                        type: 'POST',
                        url: '${pageContext.request.contextPath}/pur/addSave',
                        dataType: 'JSON',//注意使用的是dataType，而不是Content-Type
                        contentType: 'application/json;charset=utf-8',//指定为json类型
                        data: JSON.stringify(pur),
                        success: function (data) {
                            if (data > 0) {
                                pur["id"] = data;
                                pur["bm"]="【"+pur["bm"]+"】";
                                pur["cz"]="<a href='javascript:void(0)' onclick='EditPur("+data+")'>编辑</a>&nbsp&nbsp<a href='javascript:void(0)' onclick='DelPur("+data+")'>删除</a>"
                                $("#tb_main_pur").bootstrapTable('append', pur);
                            } else {
                                alert("新增失败");
                            }
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert(XMLHttpRequest.readyState + XMLHttpRequest.status + XMLHttpRequest.responseText);
                        }
                    });
                } else {
                    pur["id"] = purid;
                    pur["zzsl"] = current_pur.zzsl;
                    $.ajax({
                        type: 'POST',
                        url: '${pageContext.request.contextPath}/pur/editSimpleSave',
                        dataType: 'JSON',//注意使用的是dataType，而不是Content-Type
                        contentType: 'application/json;charset=utf-8',//指定为json类型
                        data: JSON.stringify(pur),
                        success: function (data) {
                            if (data > 0) {
                                pur["bm"]="【"+pur["bm"]+"】";
                                $("#tb_main_pur").bootstrapTable('updateByUniqueId', {
                                    id: purid,
                                    row: $.parseJSON(JSON.stringify(pur))
                                });
                            } else {
                                alert("更新失败");
                            }
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert(XMLHttpRequest.readyState + XMLHttpRequest.status + XMLHttpRequest.responseText);
                        }
                    });
                }
            }
            $('#modalPur').modal('hide');
        }

        //新增药品
        function btn_insert_click() {
            iseidt = false;
        }

        //编辑药品
        function EditPur(pid) {
            iseidt = true;
            purid = pid;
            $('#modalPur').modal('show');
        }
        //编辑分店药品
        function btn_insert_sub_click() {
            if(purid!=null&&purid!=undefined){
                iseidt = false;
                $("#selected_sp_bm").text(current_pur.bm);
                $('#modalSubPur').modal('show');
            }
        }
        //分店数据确认
        function btnSubOk() {
            var pur = {
                dm: $("#fddm ").val(),
                zzsl:isNaN($("#fdsl ").val())?0: Number($("#fdsl ").val()),
                pid:Number(purid)
            };
            if (iseidt != true) {
                $.ajax({
                    type: 'POST',
                    url: '${pageContext.request.contextPath}/pur/addSave',
                    dataType: 'JSON',//注意使用的是dataType，而不是Content-Type
                    contentType: 'application/json;charset=utf-8',//指定为json类型
                    data: JSON.stringify(pur),
                    success: function (data) {
                        if (data > 0) {
                            pur["id"] = data;
                            pur["bj"] = "<a href='javascript:void(0)' onclick='EditSubPur("+data+")'>编辑</a>&nbsp&nbsp<a href='javascript:void(0)' onclick='DelSubPur("+data+","+pur.zzsl+")'>删除</a>"
                            $("#tbSubPurs").bootstrapTable('append', pur);
                            //更新主表数据
                            var thispur=$("#tb_main_pur").bootstrapTable('getRowByUniqueId', purid);
                            var main_zzsl=0;
                            if(!isNaN(thispur.zzsl)){
                                main_zzsl=Number(thispur.zzsl);
                            }
                            var sub_zzsl=0;
                            if(!isNaN(pur.zzsl)){
                                sub_zzsl=Number(pur.zzsl);
                            }
                            $("#tb_main_pur").bootstrapTable('updateCellByUniqueId', {id: purid, field: 'zzsl', value: main_zzsl+sub_zzsl});
                        } else {
                            alert("新增失败");
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert(XMLHttpRequest.readyState + XMLHttpRequest.status + XMLHttpRequest.responseText);
                    }
                });
            }
            else{
                var subOldPur=$("#tbSubPurs").bootstrapTable('getRowByUniqueId', subpurid);//获取旧的分店表数量
                pur.id=subpurid;
                pur.yssl=subOldPur.yssl;
                $.ajax({
                    type: 'POST',
                    url: '${pageContext.request.contextPath}/pur/editSave',
                    dataType: 'JSON',//注意使用的是dataType，而不是Content-Type
                    contentType: 'application/json;charset=utf-8',//指定为json类型
                    data: JSON.stringify(pur),
                    success: function (data) {
                        if (data > 0) {
                            var mainPur=$("#tb_main_pur").bootstrapTable('getRowByUniqueId', purid);//获取主表的数量
                            //更新分店表
                            var mainzzsl=0;//主店的最终数据(原）
                            if(!isNaN(mainPur.zzsl)){
                                mainzzsl=Number(mainPur.zzsl);
                            }
                            var subzzsl_old=0;//分店的最终数据(原）
                            if(!isNaN(subOldPur.zzsl)){
                                subzzsl_old=Number(subOldPur.zzsl);
                            }
                            var subzzsl_new=0;//分店的最终数量（新）
                            if(!isNaN(pur.zzsl)){
                                subzzsl_new=Number(pur.zzsl);
                            }
                            $("#tb_main_pur").bootstrapTable('updateCellByUniqueId', {id: purid, field: 'zzsl', value: mainzzsl-subzzsl_old+subzzsl_new});
                            $("#tbSubPurs").bootstrapTable('updateCellByUniqueId', {id: subpurid, field: 'zzsl', value: subzzsl_new});
                        } else {
                            alert("更新失败");
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert(XMLHttpRequest.readyState + XMLHttpRequest.status + XMLHttpRequest.responseText);
                    }
                });
            }
            $('#modalSubPur').modal('hide');
        }
        //编辑分店数据
        function EditSubPur(subid) {
            iseidt = true;
            subpurid=subid;
            var pur=$('#tbSubPurs').bootstrapTable('getRowByUniqueId', subid);
            $("#fddm ").val(pur.dm);
            $("#fdsl ").val(pur.zzsl);
            $('#modalSubPur').modal('show');
        }
        //删除分店数据
        function DelSubPur(id,zzsl) {
            var r = confirm("确定删除吗？");
            if (r == true) {
                $.ajax({
                    type: "POST",//请求方式
                    url: "${pageContext.request.contextPath }/pur/del/" + id,//请求url
                    //dataType:"json",//返回数据类型
                    async: false,//设置为同步请求
                    //cache: false,//设置不从浏览器缓存加载信息
                    success: function (data) {
                        if (data == "1") {
                            $('#tbSubPurs').bootstrapTable('removeByUniqueId', id);
                            //总店数据更新
                            var mainPur=$("#tb_main_pur").bootstrapTable('getRowByUniqueId', purid);//获取主表的数量
                            var mainzzsl=0;
                            if(!isNaN(mainPur.zzsl)){
                                mainzzsl=Number(mainPur.zzsl);
                            }
                            var subzzsl_old=0;//分店的最终数据(原）
                            if(!isNaN(zzsl)){
                                subzzsl_old=Number(zzsl);
                            }
                            $("#tb_main_pur").bootstrapTable('updateCellByUniqueId', {id: purid, field: 'zzsl', value: mainzzsl-subzzsl_old});
                        }
                        //location.reload();
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert(XMLHttpRequest.readyState + XMLHttpRequest.status + XMLHttpRequest.responseText);
                    }
                });
            }
        }
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