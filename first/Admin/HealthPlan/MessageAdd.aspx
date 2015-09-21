<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MessageAdd.aspx.cs" MasterPageFile="~/MainContent.Master"
    Inherits="Chm.Web.Admin.HealthPlan.MessageAdd" %>

<%@ Import Namespace="Chy.UI.Framework" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <link href="/CSS/skin.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../Scripts/layout.js"></script>
    <script src="/Js/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="../../Scripts/MultiLineLength.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">

        function pad(num, n) {
            var len = num.toString().length;
            while (len < n) {
                num = "0" + num;
                len++;
            }
            return num;
        }

        function ValidTime(firstdate, seconddate) {
            //验证时间
            var StartTime = $.trim(firstdate).replace(/-/g, '/').split('/');
            var EndTime = $.trim(seconddate).replace(/-/g, '/').split('/');
            if (EndTime.length != 0 && StartTime.length != 0) {
                var dateSt = new Date(StartTime[0], StartTime[1] - 1, StartTime[2]);
                var dateEd = new Date(EndTime[0], EndTime[1] - 1, EndTime[2]);
                if (dateSt > dateEd) {
                    return false;
                }
            }
            return true;
        }

        //将时间格式的字符串转换成时间对象
        function ConvertStringToDateTime(obj) {
            var list = new Array();
            list = obj.split("-");
            var time = new Date(list[0], list[1], list[2]);
            return time
        }
        //检查结束时间
        function checkForm() {

            var strvalue = false;
            var strMsg = false;
            var strEmail = false;
            $("textarea[id^='MsgContent']").each(function (i) {
                var str = $(this).val();
                if (str != "" && str != "尊敬的[XX]:") {
                    strvalue = true;
                    strMsg = true;
                }
            });

            $("textarea[id^='EmailContent']").each(function (i) {
                var str = $(this).val();
                if (str != "" && str != "尊敬的[XX]:") {
                    strvalue = true;
                    strEmail = true;
                }
            });


            if (!strvalue) {
                alert('短信和邮件不能全部为空');
                return false;
            }


            //对短信发送的验证
            var day = 1000 * 60 * 60 * 24;
            var dateNow = new Date();
            var dateNowDay = dateNow.getFullYear() + "-" + pad((dateNow.getMonth() + 1), 2) + "-" + pad(dateNow.getDate(), 2);
            var CheckTime = pad(dateNow.getHours(), 2) + ":" + pad(dateNow.getMinutes(), 2);

            //短信发送时间
            var msgSendTime = $.trim($('#<%=txtMsgSendtime.ClientID %>').val()) != "" ? $('#<%=txtMsgSendtime.ClientID %>').val() : "";
            //短信发送间隔
            var msgDays = $.trim($('#<%=txtMsgDays.ClientID %>').val()) != "" ? parseInt($('#<%=txtMsgDays.ClientID %>').val()) : 0;
            //发送短信数量
            var msgTotal = parseInt($('#<%=MsgTotal.ClientID %>').val());

            //邮件发送时间
            var emailSendTime = $.trim($('#<%=txtEmailSendtime.ClientID %>').val()) != "" ? $('#<%=txtEmailSendtime.ClientID %>').val() : "";
            //邮件发送间隔
            var emailDays = $.trim($('#<%=txtEmailDays.ClientID %>').val()) != "" ? parseInt($('#<%=txtEmailDays.ClientID %>').val()) : 0;
            //发送邮件数量
            var emailTotal = parseInt($('#<%=EmailTotal.ClientID %>').val());

            //保健计划的结束时间
            var planEndTime = ConvertStringToDateTime($('#<%=hidPlanEndTime.ClientID %>').val());

            //短信发送开始时间
            var msgStartTime = ConvertStringToDateTime($('#<%=hidMaxMsgTime.ClientID %>').val());
            //邮件发送开始时间
            var emailStartTime = ConvertStringToDateTime($('#<%=hidMaxEmailTime.ClientID %>').val());

            if (strEmail) {
                if (emailStartTime > planEndTime) {
                    alert('邮件发送日期不能大于保健计划结束日期,请修改结束日期!');
                    return false;
                }
            }

            if (strMsg) {
                if (msgStartTime > planEndTime) {
                    alert('短信发送日期不能大于保健计划结束日期,请修改结束日期!');
                    return false;
                }
            }

            var myDate = new Date();
            //            myDate.setMinutes(myDate.getMinutes() + 30);

            var straValue = pad(myDate.getHours(), 2) + ":" + pad(myDate.getMinutes(), 2);

            if (ValidTime($('#<%=hidMaxMsgTime.ClientID %>').val(), dateNowDay)) {
                if (daysBetween(msgSendTime, CheckTime)) {
                    if (strMsg) {
                        if (confirm("请注意:您所制定的短信计划发送日期为今天,当前时间已超过发送时间.\n点击【确认】系统将即时发送今日的短信,点击【取消】请手动进行修改.")) {
                            $("#<%=txtMsgSendtime.ClientID %>").val(straValue);
                        }
                        else {
                            return false;
                        }
                    }

                }
            }
            if (ValidTime($('#<%=hidMaxEmailTime.ClientID %>').val(), dateNowDay)) {
                if (daysBetween(emailSendTime, CheckTime)) {
                    if (strEmail) {
                        if (confirm("请注意:您所制定的邮件计划发送日期为今天,当前时间已超过发送时间.\n点击【确认】系统将即时发送今日的邮件,点击【取消】请手动进行修改.")) {
                            $("#<%=txtEmailSendtime.ClientID %>").val(straValue);
                        }
                        else {
                            return false;
                        }
                    }
                }
            }
 
           

            //保健计划新增短信发送有效期
            var msgLifeTime = parseInt((planEndTime - msgStartTime+1) / day+1);

            //保健计划新增邮件发送有效期
            var emailLiftTime = parseInt((planEndTime - emailStartTime+1) / day+1);

            var returnEmailStr = "";
            var returnMsgStr = "";
//            var dateNow = new Date();
//            var CheckTime = pad(dateNow.getHours(), 2) + ":" + pad(dateNow.getMinutes(),2);
//            if (msgSendTime != "" && msgDays > 0 && msgTotal > 0) {
//                //如果发送时间大于当前操作时间则延至第二天发送
//                if (daysBetween(msgSendTime, CheckTime)) {
//                    if (msgTotal * msgDays > (msgLifeTime - 1)) {
//                        returnMsgStr = "短信发送时间跨度(发送间隔X短信总数)>保健计划时间跨度(结束时间-开始时间)。";
//                    }
//                }
//                else {
                    if (msgTotal * msgDays > msgLifeTime) {
                        returnMsgStr = "短信发送时间跨度(发送间隔X短信总数)>保健计划时间跨度(结束时间-开始时间)。";
                    }
//                }
//            }

//            if (emailSendTime != "" && emailDays > 0 && emailTotal > 0) {
//                //如果发送时间大于当前操作时间则延至第二天发送
//                if (daysBetween(emailSendTime, CheckTime)) {
//                    if (emailTotal * emailDays > (emailLiftTime - 1)) {
//                        returnEmailStr = "邮件发送时间跨度(发送间隔X短信总数)>保健计划时间跨度(结束时间-开始时间)。";
//                    }
//                }
//                else {
                    if (emailTotal * emailDays > emailLiftTime) {
                        returnEmailStr = "邮件发送时间跨度(发送间隔X短信总数)>保健计划时间跨度(结束时间-开始时间)。";
                    }
//                }
//            }

            if (returnMsgStr != "" || returnEmailStr != "") {
                if (confirm(returnMsgStr + "\n" + returnEmailStr + "\n 点击“确定”系统将自动进行修改，点击“取消”请手动进行修改！")) {
                    $('#<%=btnSave.ClientID %>').click();
                }
            } else {
                $('#<%=btnSave.ClientID %>').click();
            }
        }

        function daysBetween(dateOne, dateTwo) {
            var OneArray = dateOne.split(":");
            var TwoArray = dateTwo.split(":");
            if (parseInt(OneArray[0]) < parseInt(TwoArray[0])) {
                return true;
            }
            if (parseInt(OneArray[0]) == parseInt(TwoArray[0])) {
                return parseInt(OneArray[1]) < parseInt(TwoArray[1]);
            }
            return false;
        }

        function selectTag(showContent, selfObj) {
            // 操作标签
            var tag = document.getElementById("tags").getElementsByTagName("li");
            var taglength = tag.length;
            for (i = 0; i < taglength; i++) {
                tag[i].className = "";
            }
            selfObj.parentNode.className = "selectTag";
            // 操作内容
            for (i = 0; j = document.getElementById("tagContent" + i); i++) {
                j.style.display = "none";
            }
            document.getElementById(showContent).style.display = "block";


        }

        //创建信息/邮件模板
        function getMessageTemplateHtml(obj, label, type) {
            var htmlArry = new Array();
            var inputId = type == 1 ? "MsgContent" + obj : "EmailContent" + obj;
            var maxlen = type == 1 ? 250 : (type == 2 ? 1500 : 2000);
            htmlArry.push(" <table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" name=\"MsgTemplate\">");
            htmlArry.push(" <tr><td class=\"label\" style=\"vertical-align: top\" >" + label + "</td>");
            htmlArry.push(" <td  class=\"input\"><textarea id=\"" + inputId + "\"  name=\"" + inputId + "\" rows=\"6\" class=\"inputarea\" cols=\"\" style=\"width: 370px;height:130px\" maxlen=\"" + maxlen + "\">尊敬[XX]：</textarea>");
            htmlArry.push(" </td><td valign=\"top\"><table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"margin-left: 10px;\"> <tr><td>");
            htmlArry.push(" <input type=\"button\" name=\"btnCallTemp\" style=\"width: 100px;margin-top: 10px;\" class=\"button\" value=\"调用模板\" infotype=\"" + type + "\"/></td></tr><tr>");
            htmlArry.push(" <td><input type=\"button\" name=\"btnSaveAs\" style=\"width: 100px;margin-top: 5px;\" class=\"button\" value=\"另存\"  infotype=\"" + type + "\"/></td></tr><tr>");
            htmlArry.push(" <td><input type=\"button\" name=\"btnReset\" style=\"width: 100px;margin-top: 5px;\" class=\"button\" value=\"　重置　\" /></td></tr><tr>");
            htmlArry.push(" <td><input type=\"button\" name=\"btnRemove\" style=\"width: 100px;margin-top: 5px;\" class=\"button\" value=\"　移除　\" /></td></tr></table>");
            htmlArry.push(" </td></tr></table>");
            return htmlArry.join(" ");
        }

        $(function () {
            InitEvents();
            buttonEvents();
//            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
//            function EndRequestHandler(sender, args) {
//                InitEvents();
//                buttonEvents();
//            }
        });


        function InitEvents() {
            //给新增短信/邮件 按钮绑定事件
            $('.addbutton').click(function () {

//                var name = $(this).val().substring(2) + "：";
                var name = $(this).attr('InfoTypeName') + "："; 
                //设置控件索引
                var index = parseInt($(this).next().val()) + parseInt(1);
                $(this).next().val(index)

                //设置信息总量
                var total = parseInt($(this).siblings().last().val()) + parseInt(1);
                $(this).siblings().last().val(total);

                //设置信息类型
                var type = $(this).attr('InfoType');

                //生成信息html
                var html = getMessageTemplateHtml(index, name, type);

                $(this).parentsUntil('.formcontainer').find('table[name=MsgTemplate]').last().after(html);
                buttonEvents();
                clientUnity.resizeFrame(parent.document.getElementById("mainFrame"));
            });


            var urlObj = getarg("type");
            if (parseInt(urlObj) == 2) {
                $('#EmailPlan').click();
            }
        }

        function buttonEvents() {
            $('textarea').each(function () {


                $(this).keyup(function () {
                    var length = parseInt($(this).attr('maxLen'));
                    var info = $(this).val();
                    if (info.length > length) {
                        $(this).val(info.substring(0, length));
                    }
                });


                //隐藏所有模板按钮
                $(this).parent().parent().parent().parent().find('input[type=button]').each(function () {
                    $(this).hide();
                });

                //获取焦点显示模板按钮，失去焦点隐藏按钮
                $(this).parent().parent().parent().parent().hover(
                    function () {
                        $(this).find('input[type=button]').each(function () {
                            $(this).show();
                        });
                    },
                    function () {
                        $(this).find('input[type=button]').each(function () {
                            $(this).hide();
                        });
                    }
                );
            });
            //给调用模板按钮绑定事件
            $('input[name=btnCallTemp]').click(function () {
                showDiv($(this).attr('infoType'));
                $('#FocusInput').val($(this).parentsUntil('table[name=MsgTemplate]').find('textarea').attr('id'));
            });

            //给另存为模板按钮绑定事件
            $('input[name=btnSaveAs]').click(function () {
                var info = $(this).parentsUntil('table[name=MsgTemplate]').find('textarea').val();
                if ($.trim(info) == "" || $.trim(info) == "尊敬的[XX]:") {
                    alert('信息内容不能为空！');
                    return false;
                }
                $('#TemplateInfo').val(info);
                SaveTemplate($(this).attr('infoType'));
            });
            //给重置按钮绑定事件
            $('input[name=btnReset]').click(function () {
                $(this).parentsUntil('table[name=MsgTemplate]').find('textarea').val("尊敬的[XX]:");
            });
            //给移除按钮绑定事件
            $('input[name=btnRemove]').click(function () {
                //                debugger;
                var hidtotal = $(this).parentsUntil('.formcontainer').find('input[type=hidden]').last();
                var total = hidtotal.val();
                hidtotal.val(parseInt(total) - 1);
                $(this).parentsUntil('table[name=MsgTemplate]').remove();
            });
        }

        function SaveTemplate(obj) {
            var title = "保存信息模板";
            var url = "SaveTemplate.aspx?pi=1&type=" + obj;
            var height = 500;
            var width = 600;
            $("<div style='width:100%;height:550px' id='divchooseFrame'><iframe  scrolling='auto' width='98%' height='98%'  frameborder=0  id='ChooseFrame' src='" + url + "' /></div>").dialog({ autoOpen: true, width: width, height: height, showTitle: false, modal: true, title: title });

        }

        function showDiv(obj) {
            var url = 'CallTemplate.aspx?type=' + obj;
            $("<div style='width:100%;height:600px' ><iframe  scrolling='auto' width='98%' height='98%'  frameborder=0   src='" + url + "' /></div>").dialog({ autoOpen: true, width: 700, height: 550, showTitle: false, modal: true, title: '调用信息模板' });
        }
        function closeDiv() {
            $("div").dialog('close');
        }


        function CloseSelect(title, id, name, sex) {
            $('div').dialog('close');
        }

        function CloseSaveTemplate() {
            $('div').dialog('close');
        }



        function Canncel() {
            if (getarg("Mode") != "" && getarg("Mode") == "0") {
                location.href = "HealthPlanPersonEdit.aspx?type=" + getarg("type") + "&_pi=<%=MemberManager.SelectedId %>&PlanID=" + $('#<%=hidPlanId.ClientID %>').val() + "&HMResource=" + $("#<%=flag.ClientID %>").val();
            }
            if (getarg("Mode") != "" && getarg("Mode") == "1") {
                location.href = "HealthPlanEdit.aspx?type=" + getarg("type") + "&_pi=<%=MemberManager.SelectedId %>&PlanID=" + $('#<%=hidPlanId.ClientID %>').val() + "&HMResource=" + $("#<%=flag.ClientID %>").val();
            }
        }

        //获取url参数
        function getarg(name) {
            var url = unescape(window.location.href);
            var allargs = url.split("?")[1];
            var args = allargs.split("&");
            for (var i = 0; i < args.length; i++) {
                var arg = args[i].split("=");
                if (arg[0] == name) {
                    return arg[1];
                }
            }
        }

        function DelNoNumber(obj) {
            $(obj).val(($(obj).val().replace(/[^0-9]/g, '')));
        }

        function GetMsgContent() {
            return ($("#TemplateInfo").val()).replace('尊敬的[XX]:', '');
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="main_tab">
        <tr>
            <td>
                <div class="jtopspace">
                </div>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
                            <tr>
                                <td>
                                    <div class="con" style="margin-top: 10px;">
                                        <ul id="tags" class="tags">
                                            <li class="selectTag"><a id="MessagePlan" onclick="selectTag('tagContent0',this)"
                                                href="javascript:void(0)">短信计划</a> </li>
                                            <li><a id="EmailPlan" onclick="selectTag('tagContent1',this)" href="javascript:void(0)">
                                                邮件计划</a> </li>
                                        </ul>
                                        <div id="tagContent">
                                            <%--  短信开始--%>
                                            <div class="tagContent selectTag" id="tagContent0">
                                                <table cellpadding="0" cellspacing="0" class="formcontainer">
                                                    <tr>
                                                        <td class="label">
                                                            发送时间：
                                                        </td>
                                                        <td class="input">
                                                            <Chy:XTextBox ID="txtMsgSendtime" runat="server" class="inputtext" MaxLength="15"
                                                                Text="14:30" Width="120" onClick="WdatePicker({dateFmt:'HH:mm'})"></Chy:XTextBox>
                                                        </td>
                                                        <td class="label">
                                                            间隔天数：
                                                        </td>
                                                        <td class="input">
                                                            <Chy:XTextBox ID="txtMsgDays" runat="server" class="inputtext" MaxLength="3" Width="120"
                                                                Text="1" onkeyup="DelNoNumber(this)"></Chy:XTextBox>
                                                        </td>
                                                        <td class="label">
                                                             &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                        </td>
                                                        <td class="input" width="120">
                                                           &nbsp; &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="6" valign="top" class="input">
                                                            <table border="0" cellspacing="0" cellpadding="0" name="MsgTemplate">
                                                                <tr>
                                                                    <td class="label" style="vertical-align: top">
                                                                        短信内容：
                                                                    </td>
                                                                    <td class="input">
                                                                        <textarea name="MsgContent1" id="MsgContent1" rows="6" class="inputarea" cols=""
                                                                            style="width: 370px; height: 130px" maxlen="250">尊敬的[XX]:</textarea>
                                                                        <%--记录当前信息的类型--%>
                                                                    </td>
                                                                    <td valign="top">
                                                                        <table border="0" cellspacing="0" cellpadding="0" style="margin-left: 10px;">
                                                                            <tr>
                                                                                <td>
                                                                                    <input type="button" name="btnCallTemp" style="width: 100px;margin-top:10px" class="button" value="调用模板"
                                                                                        infotype="1" />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <input type="button" name="btnSaveAs" style="width: 100px;margin-top:5px" class="button" value="另存"
                                                                                        infotype="1" />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <input type="button" name="btnReset" style="width: 100px;margin-top:5px" class="button" value="　重置　" />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <input type="button" name="btnRemove" style="width: 100px;margin-top:5px" class="button" value="　移除　" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="input">
                                                        </td>
                                                        <td class="input">
                                                            <input type="button" class="addbutton" value="新增" id="btnAddMsg" infotype="1" infotypeName="短信内容" />
                                                            <%--记录当前页面短信的索引--%>
                                                            <input type="hidden" id="hidMsgIndex" name="hidMsgIndex" value="1" />
                                                            <%--记录当前信息的数量--%>
                                                            <input type="hidden" id="MsgTotal" runat="server" value="1" />
                                                        </td>
                                                        
                                                    </tr>
                                                </table>
                                            </div>
                                            <%-- 短信结束--%>
                                            <%-- 邮件开始--%>
                                            <div class="tagContent" id="tagContent1">
                                                <table cellpadding="0" cellspacing="0" class="formcontainer">
                                                    <tr>
                                                        <td class="label">
                                                            发送时间：
                                                        </td>
                                                        <td class="input">
                                                            <Chy:XTextBox ID="txtEmailSendtime" runat="server" class="inputtext" MaxLength="15"
                                                                Text="14:30" Width="120" onClick="WdatePicker({dateFmt:'HH:mm'})"></Chy:XTextBox>
                                                        </td>
                                                        <td class="label">
                                                            间隔天数：
                                                        </td>
                                                        <td class="input">
                                                            <Chy:XTextBox ID="txtEmailDays" runat="server" class="inputtext" MaxLength="3" Width="120"
                                                                Text="1" onkeyup="DelNoNumber(this)"></Chy:XTextBox>
                                                        </td>
                                                        <td class="label">
                                                             &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                        </td>
                                                        <td class="input" width="120">
                                                           &nbsp; &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="6" valign="top" class="input">
                                                            <table border="0" cellspacing="0" cellpadding="0" name="MsgTemplate">
                                                                <tr>
                                                                    <td class="label" style="vertical-align: top" >
                                                                        邮件内容：
                                                                    </td>
                                                                    <td  class="input">
                                                                        <textarea name="EmailContent1" id="EmailContent1" rows="6" class="inputarea" cols=""
                                                                            style="width: 370px; height: 130px" maxlen="1500">尊敬的[XX]:</textarea>
                                                                    </td>
                                                                    <td valign="top">
                                                                        <table border="0" cellspacing="0" cellpadding="0" style="margin-left: 10px;">
                                                                            <tr>
                                                                                <td>
                                                                                    <input type="button" name="btnCallTemp" style="width: 100px;margin-top:10px" class="button" value="调用模板"
                                                                                        infotype="2" />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <input type="button" name="btnSaveAs" style="width: 100px;margin-top:5px" class="button" value="另存"
                                                                                        infotype="2" />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <input type="button" name="btnReset" style="width: 100px;margin-top:5px" class="button" value="　重置　" />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <input type="button" name="btnRemove" style="width: 100px;margin-top:5px" class="button" value="　移除　" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="input">
                                                        </td>
                                                        <td class="input">
                                                            <input type="button" class="addbutton" value="新增" id="btnAddEamil" infotype="2" infotypeName="邮件内容"/>
                                                            <%--记录当前页面邮件的索引--%>
                                                            <input type="hidden" id="hidEmailIndex" name="hidEmailIndex" value="1" />
                                                            <%--记录当前邮件的数量--%>
                                                            <input type="hidden" id="EmailTotal" runat="server" value="1" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <%-- 邮件结束--%>
                                        </div>
                                    </div>
                                    <table width="99%" border="0" cellspacing="0" cellpadding="0" align="center" class="formcontainer">
                                        <tr>
                                        <td width="40%"><span style="color: red">'尊敬的[XX]'会根据具体的会员替换为'尊敬的女士或先生'</span></td>
                                            <td align="left">
                                                <input id="SubSave" type="button" value="保存" class="button" onclick="return checkForm();" />
                                                <Chy:XButton ID="btnSave" runat="server" Text='保存' CssClass="button" Style="display: none"
                                                    OnClick="btnSave_Click" />
                                                <span class="space"></span>
                                                <input type="button" class="button" value="返回" onclick="Canncel()" />
                                                <%--设置当前选择模板的input控件id--%>
                                                <input type="hidden" id="FocusInput" name="FocusInput" value="" />
                                                <%--保存弹出框选择项ID--%>
                                                <input type="hidden" id="SelectNodeID" name="SelectNodeID" value="" />
                                                <%--保存另存为模板时文本框信息--%>
                                                <input type="hidden" id="TemplateInfo" value="" />

                                                 <asp:HiddenField ID="flag" Value="tagContent0" runat="server" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:HiddenField ID="hidPlanType" runat="server" Value="0"/>
                <asp:HiddenField ID="hidType" runat="server" />
                <asp:HiddenField ID="hidPlanId" runat="server" />
                <asp:HiddenField ID="hidPlanEndTime" runat="server" />
                <asp:HiddenField ID="hidMaxMsgTime" runat="server" />
                <asp:HiddenField ID="hidMaxEmailTime" runat="server" />
            </td>
        </tr>
    </table>

</asp:Content>
