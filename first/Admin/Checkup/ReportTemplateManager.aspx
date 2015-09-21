<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportTemplateManager.aspx.cs"
    MasterPageFile="~/MainContent.Master" Inherits="Chm.Web.Admin.Checkup.ReportTemplateManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/hc/Styles/orgtree/jquery.treeview.css" rel="stylesheet" type="text/css" />
    <link href="/hc/Styles/sp4.css" rel="stylesheet" type="text/css" />
    <script src="/hc/Scripts/orgtree/jquery.treeview.js" type="text/javascript"></script>
    <script src="/hc/Scripts/orgtree/jquery.treeview.async.js" type="text/javascript"></script>
    <script src="/hc/Scripts/orgtree/jquery.treeview.edit.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">
        var Convert = {
            getProperty: function (obj, key) {
                if (obj != null && obj.hasOwnProperty(key)) {
                    return obj[key];
                }
                else {
                    return null;
                }
            },
            toPostData: function (obj) {
                var postData = {},
                    length = obj.length;
                for (var i in obj) {
                    if (obj.hasOwnProperty(i)) {
                        postData[i] = obj[i];
                    }
                }
                return postData;
            },
            toJsonString: function (obj) {
                return this.stringify(obj);
            },
            stringify: function (obj) {
                //如果是IE8+ 浏览器(ff,chrome,safari都支持JSON对象)，使用JSON.stringify()来序列化
                if (window.JSON) {
                    return JSON.stringify(obj);
                }
                var t = typeof (obj);
                if (t != "object" || obj === null) {
                    // simple data type
                    if (t == "string") obj = '"' + obj + '"';
                    return String(obj);
                } else {
                    // recurse array or object
                    var n, v, json = [], arr = (obj && obj.constructor == Array);

                    // fix.
                    var self = arguments.callee;

                    for (n in obj) {
                        v = obj[n];
                        t = typeof (v);
                        if (obj.hasOwnProperty(n)) {
                            if (t == "string") v = '"' + v + '"'; else if (t == "object" && v !== null)
                            // v = jQuery.stringify(v);
                                v = self(v);
                            json.push((arr ? "" : '"' + n + '":') + String(v));
                        }
                    }
                    return (arr ? "[" : "{") + String(json) + (arr ? "]" : "}");
                }
            }
        }

        var SessionRepository = (function () {
            var fn = {};
            var items = [];
            fn.getSession = function (key) {
                var o = null;
                try {
                    o = items[key];
                } catch (e) {
                }
                return o;
            };
            fn.setSession = function (key, obj) {
                this.removeSession(key);
                items[key] = obj;
            }
            fn.removeSession = function (key) {
                delete items[key];
            }
            return fn;
        } ());

        var MessageBox = (function () {
            var fn = {};
            fn.show = function (msg) {
                parent.alertMsg(msg, '通知', 400, 200, '');                
            };
            return fn;
        } ());

        CONSTVALUE = {
            ROOT_ID:<%=RootId%>,
            ERRORIMG:'<img src="/Images/noempty.gif" />'
        };
          var NOTICES = {          
            UPDATE_ERROR:"保存失败",
            UPDATE_SUCCESS:"保存成功"
        };
    </script>
    <script type="text/jscript" language="javascript">
        var _dataSource = {
            //            "1": eval("(" + '<%=CombinationTypeJson %>' + ")"),
            //            "2": eval("(" + '<%=SummaryTypeJson %>' + ")")
            "0": eval("(" + '<%=SummaryTypeJson %>' + ")")
        };
        /*****************************Model*********************/
        function ReportTemplate(json) {
            var obj = eval("(" + json + ")");
            this.OrgId = Convert.getProperty(obj, "OrgId");
            this.TemplateId = Convert.getProperty(obj, "TemplateId");
            this.TemplateName = Convert.getProperty(obj, "TemplateName");
            this.TemplateType = Convert.getProperty(obj, "TemplateType");
        }
        function TemplateMangerRepository() {
            var url = "/hc/admin/checkup/ReportTemplateManagerHandler.ashx";
            this.getReportTemplateByOrgId = function (orgId) {
                var json = null;
                $.ajax({
                    type: "post",
                    url: url,
                    async: false,
                    data: { "action": "getentity", "OrgId": orgId },
                    dataType: 'json',
                    success: function (data, textStatus) {
                        if (data.Status == 200) {
                            json = data.JsonData;
                        }
                    }
                });
                var entity = new ReportTemplate(json);
                return entity;
            };
            this.update = function (postdata) {
                var status = null;
                postdata.action = "updatentity";
                $.ajax({
                    type: "post",
                    url: url,
                    async: false,
                    data: postdata,
                    dataType: 'json',
                    success: function (data, textStatus) {
                        status = data.Status;
                    }
                });
                return status;
            };
        }
        /**************************Controller***************************/
        function TemplateMangerController() {
            this.$btnSave = $("#btnSave");
            this.init = function () {
                this.$btnSave.bind("click", function () {
                    var entity = TemplateMangerView.getTemplateReport();
                    if (entity.TemplateType == -1 && entity.TemplateId != -1) {
                        MessageBox.show("选中模版必须选择小结来源");
                        return;
                    }
                    var currentNode = SessionRepository.getSession("selectedNode");
                    var status = TemplateMangerRepository.update(entity);
                    TemplateMangerView.render(entity);
                    if (status == 200) {
                        if (entity.TemplateId == -1) {
                            editNode(entity.OrgId, true);
                        }
                        else {
                            editNode(entity.OrgId, false);
                        }
                        MessageBox.show(NOTICES.UPDATE_SUCCESS);
                    }
                    else {
                        MessageBox.show(NOTICES.UPDATE_ERROR);
                    }
                });
            };
            this.displayReportTemplate = function () {
                var currentNode = SessionRepository.getSession("selectedNode");
                if (currentNode != null) {
                    var entity = TemplateMangerRepository.getReportTemplateByOrgId(currentNode.id);
                    TemplateMangerView.render(entity);

                    var ddlTemplateReport = $("#ddlTemplateReport");
                    var templateType = $("#<%=templateType.ClientID %>");
                    if (entity.TemplateType == null) {
                        templateType.val(-1);
                        ddlTemplateReport.val(ddlTemplateReport.find("option").first().val());
                        return;
                    }
                    templateType.val(entity.TemplateType);
                    ddlTemplateReport.val(entity.TemplateId);
                }
            };
        }
        /**************************View***************************/
        function TemplateMangerView() {
            this.container = null;
            this.render = function (entity) {
                var fields = this.getField();
                $.each(fields, function (index, obj) {
                    $(obj).html(entity[$(obj).attr("field")]);
                });
                //this.renderValidityPeriod(entity["ValidityPeriod"]);
            };
            this.clear = function () {
                var fields = this.getField();
                $.each(fields, function (index, obj) {
                    $(obj).html("");
                });
            };
            this.init = function () {
                this.container = $("#TemplateSetDisplay");
            };
            this.getField = function () {
                var $fields = this.container.find("td[field]");
                return $fields;
            };
            this.getFieldJson = function () {
                var $fields = this.container.find("[field]"),
                returnObj = {};
                $.each($fields, function (index, obj) {
                    returnObj[$(obj).attr("id")] = $(obj).val();
                });
                var ddlTemplateReport = $("#ddlTemplateReport");
                var tempelateType = $("#<%=templateType.ClientID %>");

                returnObj.OrgId = $("#selectId").val();
                returnObj.TemplateId = ddlTemplateReport.val();
                returnObj.TemplateName = ddlTemplateReport.text();
                returnObj.TemplateType = tempelateType.val();
                return Convert.toJsonString(returnObj);
            };
            this.getTemplateReport = function () {
                var json = this.getFieldJson();
                return new ReportTemplate(json);
            }
        }
        /******************************************************************/
        var TemplateMangerRepository, TemplateMangerView, TemplateMangerController;

        function onTreeToggle() {
            //            window.setTimeout(function () {
            //                clientUnity.resizeOpenWindow();
            //                clientUnity.setMemoryHeight();
            //            }, 1000);
        }

        function clickNode(data) {
            var currentNode = {
                id: data.Id,
                text: data.Text,
                action: ""
            };
            $("#selectId").val(data.Id);
            SessionRepository.setSession("selectedNode", currentNode);
            TemplateMangerController.displayReportTemplate();
            $("#<%=orgName.ClientID %>").html(data.Text);
        }

        $(document).ready(function () {
            TemplateMangerView = new TemplateMangerView();
            TemplateMangerView.init();

            TemplateMangerRepository = new TemplateMangerRepository();

            TemplateMangerController = new TemplateMangerController();
            TemplateMangerController.init();

            BindDropDownList();
            clickNode({
                Id: "<%=RootId %>",
                Text: "<%=RootName %>"
            });
        });

        function selectRdo(obj, type) {
            //BindDropDownList(type);
        }
        //        function BindDropDownList(type) {
        //            var ddlTemplateReport = $("#ddlTemplateReport");
        //            ddlTemplateReport.html("");
        //            var json = _dataSource[type];
        //            ddlTemplateReport.append($("<option></option>").val(-1).html("请选择模板"));
        //            $.each(json, function (i) { ddlTemplateReport.append($("<option></option>").val(json[i].ID).html(json[i].Name)) });
        //        }

        function BindDropDownList() {
            var ddlTemplateReport = $("#ddlTemplateReport");
            ddlTemplateReport.html("");
            var json = _dataSource[0];
            ddlTemplateReport.append($("<option></option>").val(-1).html("请选择"));
            $.each(json, function (i) { ddlTemplateReport.append($("<option></option>").val(json[i].ID).html(json[i].Name)) });
        }

        function onAfterNodeCreated(data, parent) {
            createInvaildImage(data, parent);
        }

        function createInvaildImage(data, parent) {
            if (data.ReportTemp == true) {
                var item = $("<div class='markimage' id='img_" + data.Id + "'></div>").prependTo(parent);
            }
        }
        function editNode(id, valid) {

            if (valid == true) {
                $("#img_" + id).remove();
            }
            else {
                if ($("#img_" + id).length == 0) {
                    var parent = $("#lbl_" + id).parent();
                    var item = $("<div  class='markimage' id='img_" + id + "'></div>").prependTo(parent);
                }
            }
        }
    </script>
    <style type="text/css">
        .errMsg
        {
            color: Red;
            font-style: italic;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
    <table width="99%" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td valign="top" style="width: 240px;">
                <div class="pz_left">
                    <h4>
                        组织结构和会员分组</h4>
                    <div style="height: 512px;overflow: auto;">
                        <div id="treeViewContainer" runat="server">
                        </div>
                    </div>
                </div>
            </td>
            <td valign="top" style="padding-left:15px;">
                <div class="add_tab">
                    <table id="TemplateSetDisplay" cellpadding="0" cellspacing="0" class="addformcontainer">
                        <tr>
                            <td class="label">
                                选中节点：
                            </td>
                            <td>
                                <label runat="server" id="orgName">
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td class="label">
                                小结来源：
                            </td>
                            <td>
                                <asp:DropDownList ID="templateType" runat="server" CssClass="secltwidth">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="label">
                                体检报告模板：
                            </td>
                            <td>
                                <select id="ddlTemplateReport" Class="secltwidth">
                                </select>
                                <input id="selectId" value="" type="hidden" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="input" nowrap>
                                <input type="button" value="保存" id="btnSave" class="button" />
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
