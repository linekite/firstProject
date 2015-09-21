<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserGroupTree.aspx.cs" Inherits="Chm.Web.UserGroupTree" Title="会员分组"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <meta http-equiv="Expires" content="0"/>
    <meta http-equiv="Cache-Control" content="no-cache"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <link href="/hc/Styles/Common.css" rel="stylesheet" type="text/css" />
    <link href="/hc/zTree-3.0/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css" />
    <script src="/hc/zTree-3.0/js/jquery-1.4.4.min.js" type="text/javascript"></script>
    <script src="/hc/zTree-3.0/js/jquery.ztree.all-3.0.min.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        var orgsetting = {
            async: {
                enable: true, // 是异步加载
                type: 'get', // 加载类型为get
                autoParam: ["id"], // 传递参数为 id 对应的值                
                url: getorgAsyncUrl 
            },
            view: {
                dblClickExpand: false
            },
            callback: {
                onAsyncSuccess: onorgAsyncSuccess,
                onAsyncError: onorgAsyncError,
                onClick: zTreeOnClick
            }
        };
        var orgtypecount = 0;
        var orgzTree; // 定义左边树全部项记录
        var year;
        // 得到左边菜单路径
        function getorgAsyncUrl() {
            return "GetOrgTree.ashx?orgId=<%=OrgId%>&SelectMode=<%=SelectMode %>&drId=<%=DrId %>";
        };
        // 第一次读取异步树失败，此异步函数只执行一次
        function onorgAsyncError(event, treeId, treeNode, XMLHttpRequest, textStatus, errorThrown) {
            orgtypecount = 1;
        };
        // 第一次读取异步树成功，此异步函数只执行一次
        function onorgAsyncSuccess(event, treeId, treeNode, msg) {
            if (typeof (treeNode) === "undefined") {
                if (msg == "[]") {
                    $("#ztree").html("没有会员分组!");
                    //alert('没有会员分组!');
                }
            }      
            orgtypecount = 1;            
        };
        function zTreeOnClick(event, treeId, node) {          
            var orgType = CheckOrgType(node.id);
            if ("<%=IsShow %>" == "0") {
                if (orgType != 2) {
                    alert('只能选会员分组!');
                    //alertMsg('只能选会员分组!', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
                    return false;
                }
            }
            SubmitOrg(node.id, node.name);
        };

        $(function () {
            $.fn.zTree.init($("#ztree"), orgsetting); // 绑定树
            orgzTree = $.fn.zTree.getZTreeObj("ztree"); // 给全局变量赋值
//            $('#btnOK').click(function () {
//                var node = orgzTree.getSelectedNodes()[0];
//                if (typeof (node) == "undefined") {
//                    $("#ztree").html("没有分组");
//                }
//                else {
//                    var orgType = CheckOrgType(node.id);
//                    if ("<%=IsShow %>" == "0") {
//                        if (orgType != 2) {
//                            alert('只能选会员分组!');
//                            //alertMsg('只能选会员分组!', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
//                            return false;
//                        }
//                    }
//                    if (node) {
//                        SubmitOrg(node.id, node.name);
//                    } else {
//                        alert('请选择');
//                        //alertMsg('请选择!', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
//                    }
//                }
//            });
        });
    </script>
    <style type="text/css">
        .button
        {
            background-image: url(../../images/adm_bg.gif);
            background-repeat: no-repeat;
            background-position: 0 -192px;
            height: 22px;
            border: #3375a1 1px solid;
            padding: 2px 10px;
            overflow: visible;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <ul id="ztree" class="ztree" style="height: 350px;">
    </ul>
    <div style="position: fixed; bottom: 10px; right: 10px; width: 150px; text-align: right">
        <%--<input id="btnOK" type="button" class="button" value="确定" />  --%>     
    </div>
    </form>
</body>
</html>
<script language="javascript" type="text/javascript">
    function SubmitOrg(id, name) {
        if ('<%=FromType %>' == '1') {
            var groupType = '<%=SelectMode%>';
            var sDate = "";
            var eDate = "";
            var suc;
            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: "/hc/Common/RmomsDiret.asmx/GetGroupRule",
                data: "{groupId:'" + id + "'}",
                dataType: 'json',
                success: function (result, status) {
                    suc = status;
                    if (result.d.length > 0) {
                        var array = result.d.split('|');
                        for (var i = 0; i < array.length; i++) {
                            if (i == 0)
                                sDate = array[i];
                            else
                                eDate = array[i];
                        }
                        parent.GetToOrg(id, name, sDate, eDate);
                    }
                }
            });
            if (suc != "success") {
                parent.GetToOrg(id, name, sDate, eDate);
            }
        }
        else {
            parent.GetOrg(id, name);        
        } 
        parent.CloseDialg();
    }

    function CheckOrgType(id) {       
            var suc=-1;
            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: "/hc/Common/RmomsDiret.asmx/GetOrgType",
                data: "{groupId:'" + id + "'}",
                dataType: 'json',
                async: false,
                success: function (result, status) {                   
                    suc = result.d;
                }
            });                
            return suc;
    }     
</script>


