<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %><%-- Created by IntelliJ IDEA. User: Administrator Date: 2018/3/20 Time: 10:31 To change this template use File | Settings | File Templates. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="cr" uri="http://java.sun.com/jsp/jstl/core" %>
<% String[] consumList = {"现金（包含微信、支付宝等）", "市医保", "省医保", "预存"};
    String[] userTypeList = {"夫妻", "儿子", "女儿", "儿媳", "女婿", "其他共用人"};
    String[] incomeList = {"1星", "2星", "3星", "4星", "5星"};
    String[] healthList = {"1特别关注", "2比较", "3不太", "4完全不"};
    String[] priceList = {"1特别关注", "2比较", "3不太", "4完全不"};
    String[] brandList = {"1只愿意购买大品牌", "2只愿意购买自己指定的品牌", "3不太关注品牌", "4完全不关注品牌"};
    String[] acceptList = {"1完全不接受推荐", "2比较反感推荐", "3比较容易接受推荐", "4非常乐意接受推荐", "5不愿意接受推荐商品但乐意学习与聆听相关知识"};
    String[] useList = {"1单独使用", " 2家庭共用"};
    pageContext.setAttribute("consumList", consumList);
    pageContext.setAttribute("userTypeList", userTypeList);
    pageContext.setAttribute("incomeList", incomeList);
    pageContext.setAttribute("healthList", healthList);
    pageContext.setAttribute("priceList", priceList);
    pageContext.setAttribute("brandList", brandList);
    pageContext.setAttribute("acceptList", acceptList);
    pageContext.setAttribute("useList", useList);
%>
<!doctype html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<head><title>添加高级会员</title>
    <meta charset="UTF-8"/>
    <style type="text/css">
        #tbchxm tr td:first-child span {
            float: right;
            width: 110px;
            margin-right: 10px;
            text-align: right;
            font-size: 14px;
        }
    </style>
</head>
<body>
<%@ include file="../basic/headmodal.jsp" %>
<link rel="stylesheet" href="<%=contextPath%>/static/js/bootstrap/css/bootstrap-table.min.css"></link>
<div class="container" style="width:100%;margin-bottom:160px;">
    <div class="row">
        <div class="col-md-12" style="text-align:center;">
            <div style="margin:0 auto;"><h3 style="font-weight:normal;float:left;">会员管理&gt;&gt;会员录入</h3></div>
        </div>
    </div>
    <hr/>
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default" style="width:600px;margin:0 auto;">
                <div class="panel-body">
<%--                    <form action="addSave" method="post" role="form" id="formChxm">--%>
                        <form id="formChxm">
                        <table style="border-collapse:separate; border-spacing:0px 10px;width:100%;" id="tbchxm">
                            <tbody>
                            <tr>
                                <td><span>店码</span></td>
                                <td><input type="text" name="shopCode" id="shopCode"
                                           value="${param.pagecode}" readonly="readonly"
                                           class="form-control"/></td>
                            </tr>
                            <tr>
                                <td><span>会员卡号(*)</span></td>
                                <td><input type="text" name="cardId" id="cardId"
                                           class="form-control" required="true"/></td>
                            </tr>
                            <tr>
                                <td><span>姓名(*)</span></td>
                                <td><input type="text" name="memName" id="memName"
                                           class="form-control" required="true"/></td>

                            </tr>
                            <tr>
                                <td><span>亲切称呼</span></td>
                                <td><input type="text" name="kindName" id="kindName"
                                           class="form-control"/></td>
                            </tr>
                            <tr>
                                <td><span>性别(*)</span></td>
                                <td><input type="radio" name="sex" id="sex1" value="男"/>男
                                    <input type="radio" name="sex" id="sex2" value="女"/>女
                                </td>
                            </tr>
                            <tr>
                                <td><span>年龄</span></td>
                                <td><input type="text" name="age" id="age"  class="form-control"/>
                                </td>
                            </tr>
                            <tr>
                                <td><span>工作单位</span></td>
                                <td><input type="text" name="workUnit" id="workUnit"
                                           class="form-control"/></td>
                            </tr>
                            <tr>
                                <td><span>电话</span></td>
                                <td><input type="phoneNum" name="phoneNum" id="phoneNum"
                                           class="form-control"/></td>
                            </tr>
                            <tr>
                                <td><span>生日（公历）</span></td>
                                <td>
                                    <div class="input-group date form_date" data-date-format="yyyy-mm-dd">
                                        <input type="text" name="birthDay"
                                               value="<fmt:formatDate value="${chxm.birthDay}" pattern="yyyy-MM-dd"/>"
                                               id="birthDay" class="form-control"/>
                                        <span class="input-group-addon"> <span
                                                class="glyphicon glyphicon-calendar"></span>
													</span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td><span>生日（农历）</span></td>
                                <td>

                                    <div class="input-group date form_date" data-date-format="yyyy-mm-dd">
                                        <input type="text" name="birthDayLunar"
                                               value="<fmt:formatDate value="${chxm.birthDayLunar}" pattern="yyyy-MM-dd"/>"
                                               id="birthDayLunar" class="form-control"/>
                                        <span class="input-group-addon"> <span
                                                class="glyphicon glyphicon-calendar"></span>
													</span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td><span>病史</span></td>
                                <td><input type="text" name="medicalHistory" id="medicalHistory"
                                           value="${chxm.medicalHistory}" class="form-control"/></td>
                            </tr>
                            <tr>
                                <td><span>性格</span></td>
                                <td><input type="text" name="nature" id="nature" value="${chxm.nature}"
                                           class="form-control"/></td>
                            </tr>
                            <tr>
                                <td><span>是否愿意交流</span></td>
                                <td><input type="radio" name="talkWilling" id="talkWilling1" value="是"/>是<input
                                        type="radio" name="talkWilling" id="talkWilling2" value="否"/>否
                                </td>
                            </tr>
                            <tr>
                                <td><span>谈话方式</span></td>
                                <td><input type="text" name="talkWay" id="talkWay" value="${chxm.talkWay}"
                                           class="form-control"/></td>
                            </tr>
                            <tr>
                                <td><span>话题</span></td>
                                <td><input type="text" name="talkTopic" id="talkTopic" value="${chxm.talkTopic}"
                                           class="form-control"/></td>
                            </tr>
                            <tr>
                                <td><span>消费方式</span></td>
                                <td>
                                    <select id="consumePattern" class="form-control need" name="consumePattern">
                                        <option value="">请选择</option>
                                        <cr:forEach items="${pageScope.consumList}" var="s">
                                            <option value="${s}"
                                                    <cr:if test="${chxm.consumePattern eq s}">selected</cr:if>>${s}</option>
                                        </cr:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td><span>消费水平</span></td>
                                <td>
                                    <select id="income" class="form-control need" name="income">
                                        <option value="">请选择</option>
                                        <cr:forEach items="${pageScope.incomeList}" var="s">
                                            <option value="${s}">${s}</option>
                                        </cr:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td><span>保健意识</span></td>
                                <td>
                                    <select id="healthFocus" class="form-control need" name="healthFocus">
                                        <option value="">请选择</option>
                                        <cr:forEach items="${pageScope.healthList}" var="s">
                                            <option value="${s}">${s}</option>
                                        </cr:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td><span>商品价格关注</span></td>
                                <td>
                                    <select id="priceFocus" class="form-control need" name="priceFocus">
                                        <option value="">请选择</option>
                                        <cr:forEach items="${pageScope.priceList}" var="s">
                                            <option value="${s}">${s}</option>
                                        </cr:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td><span>品牌关注</span></td>
                                <td>
                                    <select id="brandFocus" class="form-control need" name="brandFocus">
                                        <option value="">请选择</option>
                                        <cr:forEach items="${pageScope.brandList}" var="s">
                                            <option value="${s}">${s}</option>
                                        </cr:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td><span>是否接受推荐</span></td>
                                <td>
                                    <select id="acceptRecommend" class="form-control need" name="acceptRecommend">
                                        <option value="">请选择</option>
                                        <cr:forEach items="${pageScope.acceptList}" var="s">
                                            <option value="${s}">${s}</option>
                                        </cr:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td><span>其他信息</span></td>
                                <td><input type="text" name="otherInfo" id="otherInfo" value="${chxm.otherInfo}"
                                           class="form-control"/></td>
                            </tr>
                            <tr>
                                <td><span>销售总额</span></td>
                                <td><input type="text" name="saleSum" id="saleSum"
                                           class="form-control"/></td>
                            </tr>
                            <tr>
                                <td><span>利润总额</span></td>
                                <td><input type="text" name="profitSum" id="profitSum"
                                           class="form-control"/></td>
                            </tr>
                            <tr>
                                <td><span>最近一次消费日期</span></td>
                                <td>

                                    <div class="input-group date form_date" data-date-format="yyyy-mm-dd">
                                        <input type="text" name="lastSaleDate"
                                               value="<fmt:formatDate value="${chxm.lastSaleDate}" pattern="yyyy-MM-dd"/>"
                                               id="lastSaleDate" class="form-control"/>
                                        <span class="input-group-addon"> <span
                                                class="glyphicon glyphicon-calendar"></span>
													</span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td><span>会员卡公用/单独使用</span></td>
                                <td>
                                    <select id="cardUseType" class="form-control need" name="cardUseType">
                                        <option value="">请选择</option>
                                        <cr:forEach items="${pageScope.useList}" var="s">
                                            <option value="${s}">${s}</option>
                                        </cr:forEach>
                                    </select>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <p>
                            <button type="button" onclick="btnInsert()" class="btn btn-warning" data-toggle="modal"
                                    data-target="#myModal">
                                新增共用人+
                            </button>
                        </p>
                        <table style="font-size: 14px;" id="tbfamily" name="familyList">
                        </table>
                        <p style="margin-top: 10px;">
                            <button onclick="submitChx()"  type="button" class="btn btn-primary"
                                    style="float:right;height:32px;">提交数据</button>
                        </p>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">共用人信息</h4>
            </div>
            <div class="modal-body" style="height:210px;">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label for="userType" class="col-sm-2 control-label">类型</label>
                        <div class="col-sm-10">
                            <select id="userType" class="form-control need">
                                <option value="">请选择</option>
                                <cr:forEach items="${pageScope.userTypeList}" var="s">
                                    <option value="${s}">${s}</option>
                                </cr:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="userName"
                               class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-4">
                            <input class="form-control" id="userName">
                        </div>
                        <label for="familyKindName"
                               class="col-sm-2 control-label">亲切称呼</label>
                        <div class="col-sm-4">
                            <input class="form-control" id="familyKindName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="familyOtherInfo"
                               class="col-sm-2 control-label">其他需要记录</label>
                        <div class="col-sm-10">
                                                    <textarea rows="3" class="form-control" id="familyOtherInfo">
                                                    </textarea>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button id="ok" type="button" onclick="btnOk()" class="btn btn-primary">确定</button>
            </div>
        </div>
    </div>
</div>
<%@ include file="../basic/footmodal.jsp" %>
<script type="text/javascript" src="<%=contextPath%>/static/js/bootstrap/js/bootstrap-table.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/static/js/bootstrap/js/bootstrap-table-zh-CN.js"></script>
<script type="text/javascript">
    var isAddOrEdit = true;//为true代表新增，false代表编辑
    var currentRowIndex=0;
    $(function () {
        //初始化日期控件
        $('.form_date').datetimepicker({
            language: 'zh-CN',
            weekStart: 1,
            todayBtn: 1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0
        });
        $('#tbfamily').bootstrapTable({
            striped: true, //是否显示行间隔色
            columns: [{
                field: 'userType',
                title: '类型'
            }, {
                field: 'userName',
                title: '姓名'
            }, {
                field: 'kindName',
                title: '亲切称呼'
            }, {
                field: 'remark',
                title: '其他信息'
            },{
                field: 'edit',
                title: '编辑',
                events: editEvents,
                formatter: editFormatter
            },{
                field: 'del',
                title: '删除',
                events: operateEvents,
                formatter: operateFormatter
            }]
        });
    });
     function btnOk () {
        $('#myModal').modal('hide');
        if (isAddOrEdit == true) {
            var count = $('#tbfamily').bootstrapTable('getData').length;
            $('#tbfamily').bootstrapTable('insertRow',
                {
                    index: count,
                    row: {
                        userType: $("#userType").val(),
                        userName: $("#userName").val(),
                        kindName: $("#familyKindName").val(),
                        remark: $("#familyOtherInfo").val()
                    }
                });
        }
        else{
            $('#tbfamily').bootstrapTable('updateRow', {index: currentRowIndex, row:
                    {
                        userType: $("#userType").val(),
                        userName: $("#userName").val(),
                        kindName: $("#familyKindName").val(),
                        remark: $("#familyOtherInfo").val()
                    }
            })
        }
    }
    function editFormatter(value, row, index) {
        return [
            '<a href="javascript:void(0)" id="rowEdit">编辑</a>'
        ].join('');
    };
    window.editEvents = {
        'click #rowEdit': function (e, value, row, index) {
            //var row=$("#tbfamily").bootstrapTable('getSelections');
            $("#userType").val(row.userType);
            $("#userName").val(row.userName);
            $("#familyKindName").val(row.kindName);
            $("#familyOtherInfo").val(row.remark);
            $('#myModal').modal('show');
            currentRowIndex=index;
            isAddOrEdit=false;
        }
    };
    function operateFormatter(value, row, index) {
        return [
            '<a href="javascript:void(0)" id="rowDel">删除</a>'
        ].join('');
    };
    window.operateEvents = {
        'click #rowDel': function (e, value, row, index) {
            row.deleteFlag = "true";
            $('#tbfamily').bootstrapTable('remove',{field:"deleteFlag", values:["true"]});
        }
    };
    function btnInsert() {
         $("#userType").val('');
         $("#userName").val('');
         $("#familyKindName").val('');
         $("#familyOtherInfo").val('');
    }
    function submitChx() {
        var chxmArray=$("#formChxm").serializeArray();
        var chxmJson = {};
        $.each(chxmArray,function(i,v){
            chxmJson[v.name] = v.value;
        });
        chxmJson["familyList"]=$('#tbfamily').bootstrapTable('getData');
        $.ajax({
            type:'post',
            url:'addSave',
            dataType:"json",//注意使用的是dataType，而不是Content-Type
            contentType:'application/json;charset=utf-8',//指定为json类型
            //async: false,
            data:JSON.stringify(chxmJson),
            success:function(data){
                if(data==1){
                    window.location="${pageContext.request.contextPath }/chxm/search?shopcode=${param.pagecode}&msg=填加成功";
                }else{
                    alert("填加失败");
                }
            }
        });
    }
</script>
</body>
</html>