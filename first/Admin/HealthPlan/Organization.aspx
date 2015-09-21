<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Organization.aspx.cs" Inherits="Chm.Web.Admin.HealthPlan.Organization" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="Expires" content="0" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../Styles/Common.css" rel="stylesheet" type="text/css" />
    <link href="../../zTree-3.0/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css" />
    <script src="../../zTree-3.0/js/jquery-1.4.4.min.js" type="text/javascript"></script>
    <script src="../../zTree-3.0/js/jquery.ztree.all-3.0.min.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">

        // 定义的全局变量
        var orgtypecount = 0;
        var orgzTree; // 定义左边树全部项记录
        var typecount = 0; //为0读取第一个节点，第一个节点固定为人民医院，且只会读取一次；为其他值则异步读取数据
        var curname = ''; // 记录当前修改节点名，如果不修改节点，在zTree控件中，需要重新把它赋值进当前节点
        var pageParams = {}; // 读取右边项（人列表参数）
        var rMenu; // 定义左边树全部项记录
        var year = '2012';
        var childid = '-1';

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
                beforeClick: zTreeBeforeClick,
                beforeExpand: zTreeBeforeExpand
            }
        };


        // 得到左边菜单路径
        function getorgAsyncUrl() {
            var type = parseInt($('#<%=hidType.ClientID %>').val());
            if (type == 2) {
                return "/hc/ajax/crowdgroup/getrempgroup.ashx?type=" + orgtypecount + "&year=" + year;
            } else {

                return "/hc/ajax/crowdgroup/get.ashx?_pi=0&rd=" + Math.random() + "&type=" + typecount + '&year=' + year + '&childid=' + childid + '&deptid=' + pageParams.deptid;
            }

        }
        // 第一次读取异步树失败，此异步函数只执行一次
        function onorgAsyncError(event, treeId, treeNode, XMLHttpRequest, textStatus, errorThrown) {
            orgtypecount = 1;
        }
        // 第一次读取异步树成功，此异步函数只执行一次
        function onorgAsyncSuccess(event, treeId, treeNode, msg) {
            orgtypecount = 1;
        }

        function zTreeBeforeClick(treeId, treeNode, clickFlag) {

            var type = parseInt($('#<%=hidType.ClientID %>').val());
            if (type == 2) {
                return;
            }

            if (treeNode.id != '1') {
                var node = treeNode;
                while (node.parentTId != null) { // 表示不是根节点
                    year = node.name.substring(0, node.name.indexOf("("));
                    node = orgzTree.getNodeByTId(node.parentTId); // 重新赋值为父亲节点信息
                }
            } else {
                year = "0";
            }

            pageParams.id = treeNode.id;

            // 如果是疾病组，则需要得到它的上级不是疾病的部门
            if (parseInt(treeNode.id) > 1 && parseInt(treeNode.id) < 1000) {
                var node = treeNode;
                var ff = true;
                while (ff) { // 表示不是根节点
                    if (node) {
                        if (parseInt(node.id) >= 1000) {
                            ff = false;
                            pageParams.deptid = node.id;
                        } else {
                            node = orgzTree.getNodeByTId(node.parentTId); // 重新赋值为父亲节点信息
                        }
                    } else {
                        ff = false;
                    }
                }
            } else {
                pageParams.deptid = 0;
            }
        };



        function zTreeBeforeExpand(treeId, treeNode) {
            var type = parseInt($('#<%=hidType.ClientID %>').val());
            if (type == 2) {
                return;
            }


            if (treeNode.id != '1') {
                var node = treeNode;
                while (node.parentTId != null) { // 表示不是根节点
                    year = node.name.substring(0, node.name.indexOf("("));
                    node = orgzTree.getNodeByTId(node.parentTId); // 重新赋值为父亲节点信息
                }
            } else {
                year = "0";
            }
            childid = treeNode.childid;
            pageParams.id = treeNode.id;

            // 如果是疾病组，则需要得到它的上级不是疾病的部门
            if (parseInt(treeNode.id) > 1 && parseInt(treeNode.id) < 1000) {
                var node = treeNode;
                var ff = true;
                while (ff) { // 表示不是根节点
                    if (node) {
                        if (parseInt(node.id) >= 1000) {
                            ff = false;
                            pageParams.deptid = node.id;
                        } else {
                            node = orgzTree.getNodeByTId(node.parentTId); // 重新赋值为父亲节点信息
                        }
                    } else {
                        ff = false;
                    }
                }
            } else {
                pageParams.deptid = 0;
            }
        };

        $(function () {
            $.fn.zTree.init($("#ztree"), orgsetting); // 绑定树
            orgzTree = $.fn.zTree.getZTreeObj("ztree"); // 给全局变量赋值


            $('#btnOK').click(function () {
                if (orgzTree.getSelectedNodes().length < 1) {
                    alert('请至少选择一项数据');
                    return false;
                }
                var type = parseInt($('#<%=hidType.ClientID %>').val());
                if (type == 2) {
                    var node = orgzTree.getSelectedNodes()[0];
                    parent.window.SetSelectNodeValue(0, 0);
                    parent.window.CloseSelect(node.name, node.id, "", "");
                } else {
                    addnewplan();
                }

            });
        });


        function addnewplan() {
            var z = $.fn.zTree.getZTreeObj("ztree"); // 给全局变量赋值
            var nodes = z.getSelectedNodes();
            var id = 0;
            var deptid = 0;
            var tyear = 0;
            var typeid = 0;
            if (nodes.length > 0) {
                // 只要疾病组 --> 修改为
                // 年份id year;组织id deptid;疾病id:typeid  
                // 如果只选择了组织  那么疾病id和组织id一样  如果只选择了年份  那么组织Id和疾病id都为0
                var node = nodes[0];
                if (parseInt(node.id) == 1) {
                    // 选择根节点
                    deptid = 1;
                    tyear = 0;
                    typeid = 0;

                } else if (parseInt(node.id) > 999) {
                    // 选择年份
                    var node11 = z.getNodeByTId(node.parentTId);
                    if (node11.parentTId == null) {
                        if (confirm('该年份下疾病人员过多可能会导致短信或邮件无法及时送达，是否精确到特定组织或疾病进行保健计划的制定？')) {
                            return false;
                        } else {
                            deptid = node.id;
                            tyear = node.name.substring(0, node.name.indexOf("("));
                            typeid = 0;
                        }

                    } else {
                        // 选择一般组
                        deptid = node.id; // id
                        typeid = deptid;
                        while (node.parentTId != null) { // 表示不是根节点
                            tyear = node.name.substring(0, node.name.indexOf("(")); // 年份id
                            node = z.getNodeByTId(node.parentTId); // 重新赋值为父亲节点信息
                        }
                    }

                } else if (1 < parseInt(node.id) && parseInt(node.id) < 1000) {
                    // 选择了疾病
                    typeid = node.id; // 疾病id

                    while (node.parentTId != null) { // 表示不是根节点
                        tyear = node.name.substring(0, node.name.indexOf("(")); // 年份id
                        node = z.getNodeByTId(node.parentTId); // 重新赋值为父亲节点信息
                    }

                    // 如果是疾病组，则需要得到它的上级不是疾病的部门
                    var node1 = nodes[0];
                    var ff = true;
                    while (ff) { // 表示不是根节点
                        if (node) {
                            if (parseInt(node1.id) >= 1000) {
                                ff = false;
                                deptid = node1.id;
                            } else {
                                node1 = z.getNodeByTId(node1.parentTId); // 重新赋值为父亲节点信息
                            }
                        } else {
                            ff = false;
                        }
                    }
                }

            } else {
                deptid = 0;
            }
            parent.window.SetSelectNodeValue(tyear, deptid);
            var node = nodes[0];
            parent.window.CloseSelect(node.name.substring(0, node.name.indexOf("(")), node.id, "", "");
        }


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
    <div style="width: 98%; height: 300px; overflow: auto;">
        <ul id="ztree" class="ztree" style="height: 290px;">
        </ul>
    </div>
    <div style="width: 98%; height: 30; text-align: right; padding-top: 5px">
        <input id="btnOK" type="button" class="button" value="确定" />
        <input id="hidType" runat="server" type="hidden" />
    </div>
    </form>
</body>
</html>
