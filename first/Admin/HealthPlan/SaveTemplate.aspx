<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SaveTemplate.aspx.cs" Inherits="Chm.Web.Admin.HealthPlan.SaveTemplate" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="../../Styles/Common.css" rel="stylesheet" type="text/css" />
    <link href="../../zTree-3.0/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css" />
    <script src="../../zTree-3.0/js/jquery-1.4.4.min.js" type="text/javascript"></script>
    <script src="../../zTree-3.0/js/jquery.ztree.all-3.0.min.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        var orgsetting = {
            async: {
                enable: true, // 是异步加载
                type: 'get', // 加载类型为get
                autoParam: ["id"], // 传递参数为 id 对应的值
                url: getorgAsyncUrl 
            },
            //            check: {
            //                enable: true,
            //                chkStyle: "checkbox",
            //                chkboxType: { "Y": "", "N": "" }
            //            },
            view: {
                dblClickExpand: false
            },
            callback: {
                onAsyncSuccess: onorgAsyncSuccess,
                onAsyncError: onorgAsyncError
            }
        };
        var orgtypecount = 0;
        var orgzTree; // 定义左边树全部项记录
        var year;
        // 得到左边菜单路径
        function getorgAsyncUrl() {
            return "GetDisease.ashx?orgId="+<%=OrgId%>+"&mode=1";
        }
        // 第一次读取异步树失败，此异步函数只执行一次
        function onorgAsyncError(event, treeId, treeNode, XMLHttpRequest, textStatus, errorThrown) {
            orgtypecount = 1;
        }
        // 第一次读取异步树成功，此异步函数只执行一次
        function onorgAsyncSuccess(event, treeId, treeNode, msg) {
            orgtypecount = 1;
        }
        $(function () {
            $.fn.zTree.init($("#ztree"), orgsetting); // 绑定树
            orgzTree = $.fn.zTree.getZTreeObj("ztree"); // 给全局变量赋值


            $('#btnOK').click(function () {            
                //保存模板信息
                var node = orgzTree.getSelectedNodes()[0];  
                if (node) {
                    var Content=encodeURI(parent.GetMsgContent());
                    $.ajax({
                        type: "POST",
                        url: "SaveTemplate.ashx?type=" + $('#<%=InfoType.ClientID %>').val() + "&id=" + node.id+"&groupId="+node.id+"&groupName="+encodeURI(node.name), 
                        data: {"info": Content},                     
                        dataType: 'json',
                        cache: false,
                        success: function (msg) {
                            var obj = eval(msg);
                            if (msg[0].Result) {
                                alert(msg[0].Info);
                                parent.window.CloseSaveTemplate();
                                return true;
                            }
                            alert(msg.Info);
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            var result = eval(XMLHttpRequest.responseText);
                            if (result[0].Result) {
                                alert(result[0].Info);
                                parent.window.CloseSaveTemplate();
                                return true;
                            }
                            alert(result[0].Info);
                        }
                    });
                } else {
                    alert("请选择一种疾病！");
                }

            });
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
        <input id="btnOK" type="button" class="button" value="确定" />
        <input id="InfoType" type="hidden" runat="server" value="" />
    </div>
    </form>
</body>
</html>
