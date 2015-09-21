<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MainContent.Master"
    CodeBehind="HealthPlanPersonAdd.aspx.cs" Inherits="Chm.Web.Admin.HealthPlan.HealthPlanPersonAdd" %>

<%@ Import Namespace="Chy.UI.Framework" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="../../Scripts/layout.js"></script>
    <link href="/CSS/skin.css" rel="stylesheet" type="text/css" />
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

        var day = 1000 * 60 * 60 * 24;
        var dateNow = new Date();
        var dateNowDay = dateNow.getFullYear() + "-" + pad((dateNow.getMonth() + 1), 2) + "-" + pad(dateNow.getDate(),2);
        var CheckTime = pad(dateNow.getHours(), 2) + ":" + pad(dateNow.getMinutes(),2);
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

        function ConvertDateTime(obj) {
            //验证时间
            var StartTime = $.trim(obj).replace(/-/g, '/').split('/');
            if (StartTime.length != 0) {
                return new Date(StartTime[0], StartTime[1] - 1, StartTime[2]);
            }
            return null;
        }

        //检查短信发送日期是否正确
        function CheckMsgSendTime() {
            var StartTime = $.trim($("#<%=tpStartTime.ClientID %>").val());
            var EndTime = $.trim($("#<%=tpEndTime.ClientID %>").val());
            var returnMsgStr = true;
            var planStartTime = ConvertDateTime(StartTime);
            var planEndTime = ConvertDateTime(EndTime);
            //短信发送开始日期
            var msgStartSendTime = $.trim($('#<%=dpMsgSendDay.ClientID %>').val());
            if (msgStartSendTime.length > 0) {
                if (ValidTime(msgStartSendTime, EndTime) == false) {
                    alert('短信发送日期不能大于保健计划结束日期!');
                    return false;
                }

                if (ValidTime(StartTime, msgStartSendTime) == false) {
                    alert('短信发送日期不能小于保健计划开始日期!');
                    return false;
                }

                //短信计划的有效期（天）
                var lifeTime = parseInt((planEndTime - ConvertDateTime(msgStartSendTime) + 1) / day + 1)
                //短信发送时间
                var msgSendTime = $.trim($('#<%=txtMsgSendtime.ClientID %>').val()) != "" ? $('#<%=txtMsgSendtime.ClientID %>').val() : "";
                //短信发送间隔
                var msgDays = $.trim($('#<%=txtMsgDays.ClientID %>').val()) != "" ? parseInt($('#<%=txtMsgDays.ClientID %>').val()) : 0;
                //发送短信数量
                var msgTotal = parseInt($('#<%=MsgTotal.ClientID %>').val());

                if (msgSendTime.length > 0 && msgDays > 0 && msgTotal > 0) {
                    //如果发送时间大于当前操作时间则延至第二天发送
//                    if (ValidTime(msgStartSendTime, dateNowDay)) {
//                        if (daysBetween(msgSendTime, CheckTime)) {
//                            if (msgTotal * msgDays > (lifeTime - 1)) {
//                                returnMsgStr = "短信发送时间跨度(发送间隔X短信总数)>保健计划时间跨度(结束时间-开始时间)。";
//                            }
//                        }
//                        else {
//                            if (msgTotal * msgDays > lifeTime) {
//                                returnMsgStr = "短信发送时间跨度(发送间隔X短信总数)>保健计划时间跨度(结束时间-开始时间)。";
//                            }
//                        }
//                    }
//                    else {
                        if (msgTotal * msgDays > lifeTime) {
                            returnMsgStr = "短信发送时间跨度(发送间隔X短信总数)>保健计划时间跨度(结束时间-开始时间)。";
                        }
//                    }

                }
            }
            return returnMsgStr;
        }
        //检查邮件发送日期是否正确
        function CheckEmailSendTime() {
            var StartTime = $.trim($("#<%=tpStartTime.ClientID %>").val());
            var EndTime = $.trim($("#<%=tpEndTime.ClientID %>").val());
            var returnEmailStr = true;
            var planStartTime = ConvertDateTime(StartTime);
            var planEndTime = ConvertDateTime(EndTime);
            //邮件发送开始日期
            var emailStartSendTime = $.trim($('#<%=dpEmailSendDay.ClientID %>').val());
            if (emailStartSendTime.length > 0) {
                if (ValidTime(emailStartSendTime, EndTime) == false) {
                    alert('邮件发送日期不能大于保健计划结束日期!');
                    return false;
                }

                if (ValidTime(StartTime, emailStartSendTime) == false) {
                    alert('邮件发送日期不能小于保健计划开始日期!');
                    return false;
                }

                //短信计划的有效期（天）
                var lifeTime = parseInt((planEndTime - ConvertDateTime(emailStartSendTime)) / day + 1)
                //邮件发送时间
                var emailSendTime = $.trim($('#<%=txtEmailSendtime.ClientID %>').val()) != "" ? $('#<%=txtEmailSendtime.ClientID %>').val() : "";
                //邮件发送间隔
                var emailDays = $.trim($('#<%=txtEmailDays.ClientID %>').val()) != "" ? parseInt($('#<%=txtEmailDays.ClientID %>').val()) : 0;
                //发送邮件数量
                var emailTotal = parseInt($('#<%=EmailTotal.ClientID %>').val());

                if (emailSendTime.length > 0 && emailDays > 0 && emailTotal > 0) {
                    //如果发送时间大于当前操作时间则延至第二天发送
//                    if (ValidTime(emailStartSendTime, dateNowDay)) {
//                        if (daysBetween(emailSendTime, CheckTime)) {
//                            if (emailTotal * emailDays > (lifeTime - 1)) {
//                                returnEmailStr = "邮件发送时间跨度(发送间隔X短信总数)>保健计划时间跨度(结束时间-开始时间)。";
//                            }
//                        }
//                        else {
//                            if (emailTotal * emailDays > lifeTime) {
//                                returnEmailStr = "邮件发送时间跨度(发送间隔X短信总数)>保健计划时间跨度(结束时间-开始时间)。";
//                            }
//                        }
//                    }
//                    else {
                        if (emailTotal * emailDays > lifeTime) {
                            returnEmailStr = "邮件发送时间跨度(发送间隔X短信总数)>保健计划时间跨度(结束时间-开始时间)。";
                        }
//                    }

                }
            }
            return returnEmailStr;
        }

        //检查结束时间
        function checkForm() {

            if ($.trim($('#<%=txtTitle.ClientID %>').val()) == "") {
                alert('计划标题不能为空！');
                return false;
            }
            var StartTime = $.trim($("#<%=tpStartTime.ClientID %>").val());
            var EndTime = $.trim($("#<%=tpEndTime.ClientID %>").val());
            if (StartTime == "" || EndTime == "") {
                alert('开始时间和结束时间不能为空！');
                return false;
            }

            if (ValidTime(StartTime, EndTime) == false) {
                alert('结束时间不能大于开始时间');
                return false;
            }

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

            var myDate = new Date();
            //            myDate.setMinutes(myDate.getMinutes() + 30);

            var straValue = pad(myDate.getHours(), 2) + ":" + pad(myDate.getMinutes(), 2);

            var strMsgTime = $.trim($("#<%=txtMsgSendtime.ClientID %>").val());
            var strEmailTime = $.trim($("#<%=txtEmailSendtime.ClientID %>").val());
            if (ValidTime($("#<%=tpStartTime.ClientID %>").val(), dateNowDay)) {
                if (daysBetween(strMsgTime, CheckTime)) {
                    if (strMsg) {
                        if (confirm("请注意:您所制定的短信计划发送日期为今天,当前时间已超过发送时间.\n点击【确认】系统将即时发送今日的短信,点击【取消】请手动进行修改.")) {
                            $("#<%=txtMsgSendtime.ClientID %>").val(straValue);
                        }
                        else {
                            return false;
                        }
                    }

                }
                if (daysBetween(strEmailTime, CheckTime)) {
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

            var returnEmailStr = CheckMsgSendTime();
            var returnMsgStr = CheckEmailSendTime();
            var returnFollowStr = "";


            if (returnEmailStr == false || returnMsgStr == false) {
                return false;
            }
            if (returnMsgStr != true && returnEmailStr != true) {
                if (confirm(returnMsgStr + "\n" + returnEmailStr + "\n 点击【确认】系统将自动进行修改，点击【取消】请手动进行修改！")) {
                    $('#<%=btnSave.ClientID %>').click();
                }
                else { return false; }
            }
            else if (returnMsgStr != true && returnEmailStr == true) {
                if (confirm(returnMsgStr + "\n 点击【确认】系统将自动进行修改，点击【取消】请手动进行修改！")) {
                    $('#<%=btnSave.ClientID %>').click();
                }
                else { return false; }
            }
            else if (returnMsgStr == true && returnEmailStr != true) {
                if (confirm(returnEmailStr + "\n 点击【确认】系统将自动进行修改，点击【取消】请手动进行修改！")) {
                    $('#<%=btnSave.ClientID %>').click();
                }
                else { return false; }
            }
            //            if (returnMsgStr != true || returnEmailStr != true) {
            //                if (confirm(returnMsgStr + "\n" + returnEmailStr + "\n 点击【确认】系统将自动进行修改，点击【取消】请手动进行修改！")) {
            //                    $('#<%=btnSave.ClientID %>').click();
            //                }
            //            } 
            else {
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

            clientUnity.resizeFrame(parent.document.getElementById("mainFrame"));
        }

        //创建信息/邮件模板/随访计划模板
        function getMessageTemplateHtml(obj, label, type) {
            var htmlArry = new Array();
            var inputId = type == 1 ? ("MsgContent" + obj) : (type == 2 ? ("EmailContent" + obj) : ("PlanPurpose") + obj);
            var maxlen = type == 1 ? 250 : (type == 2 ? 1500 : 2000);
            var dateId = type == 3 ? "xdpPlanDate" + obj : "";
            if (type == "3") {//随访计划模板<span style="color: red">*</span>
                htmlArry.push("<div name=\"divMsgTemplate\" style=\"BORDER: #d2e2f2 0px solid; padding:1px;  BACKGROUND-COLOR: #fff;zoom:1; overflow:hidden;\"><table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" name=\"MsgTemplate\"><tr><td  style=\"vertical-align: top\" width=\"1\"></td><td><table cellspacing=\"0\" cellpadding=\"0\" name=\"MsgTemplate\" border=\"0px\" style=\"width:100%\"><tr><td class=\"label\" width=\"90\"><span style=\"color:red\">*</span>计划随访日期:</td><td class=\"input\"><input id=\"" + dateId + "\" name=\"" + dateId + "\"  class=\"inputtext\"  style=\"width:370\" onclick=\"WdatePicker()\"></input></td></tr><tr><td class=\"label\" width=\"90\">随访目的:</td><td colspan=\"2\" valign=\"top\" class=\"input\">");
                htmlArry.push("<textarea maxlen=\"2000\" id=\"" + inputId + "\" name=\"" + inputId + "\" rows=\"4\" class=\"inputarea\" cols=\"\" style=\"width: 370px;\"></textarea></td></tr></table></td><td valign=\"top\"><table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"margin-left: 10px;\"><tr><td><input type=\"button\" name=\"btnResetFollow\" style=\"\" class=\"button\" value=\"　重置　\" /></td></tr><tr><td><input type=\"button\" name=\"btnRemoveFollow\" style=\"\" class=\"button\" value=\"　移除　\" /></td></tr></table></td></tr></table></div>");
            }
            else {
                htmlArry.push(" <table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" name=\"MsgTemplate\">");
                htmlArry.push(" <tr><td class=\"label\" style=\"vertical-align: top\" >" + label + "</td>");
                htmlArry.push(" <td class=\"input\"><textarea  maxlen=\"" + maxlen + "\" id=\"" + inputId + "\"  name=\"" + inputId + "\" rows=\"6\" class=\"inputarea\" cols=\"\" style=\"width: 370px;height:130px\">尊敬的[XX]:</textarea>");
                htmlArry.push(" </td><td valign=\"top\"><table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"margin-left: 10px;\"> <tr><td>");
                htmlArry.push(" <input type=\"button\" name=\"btnCallTemp\" style=\"margin-top: 10px;\" class=\"button\" value=\"调用模板\" infotype=\"" + type + "\"/></td></tr><tr>");
                htmlArry.push(" <td><input type=\"button\" name=\"btnSaveAs\" style=\"margin-top: 5px;\" class=\"button\" value=\"另存\"  infotype=\"" + type + "\"/></td></tr><tr>");
                htmlArry.push(" <td><input type=\"button\" name=\"btnReset\" style=\"margin-top: 5px;\" class=\"button\" value=\"　重置　\" /></td></tr><tr>");
                htmlArry.push(" <td><input type=\"button\" name=\"btnRemove\" style=\"margin-top: 5px;\" class=\"button\" value=\"　移除　\" /></td></tr></table>");
                htmlArry.push(" </td></tr></table>");
            }
            return htmlArry.join(" ");
        }

        $(function () {
            InitEvents();
            buttonEvents();
            CloseSelect()//初始化健康随访主要健康问题
//            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
//            function EndRequestHandler(sender, args) {
//                InitEvents();
//                buttonEvents();
//            }
        });


        function InitEvents() {


            //给新增短信/邮件 按钮绑定事件
            $('.addbutton').click(function () {

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
                if (type != "3") {
                    $(this).parentsUntil('.formcontainer').find('table[name=MsgTemplate]').last().after(html);
                }
                else {
                    $(this).parentsUntil('.formcontainer').find('div[name=divMsgTemplate]').last().after(html);
                }

                clientUnity.resizeFrame(parent.document.getElementById("mainFrame"));

                buttonEvents();
            });
        }

        function buttonEvents() {
            $("textarea[id!='<%=txtSummarize.ClientID %>']").each(function () {

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
                ///隐藏随访计划的模板按钮
                $(this).parent().parent().parent().parent().parent().parent().find('input[type=button]').each(function () {
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

                //获取焦点，显示随访计划的模板按钮，失去焦点隐藏随访计划的模板按钮
                $(this).parent().parent().parent().parent().parent().parent().hover(
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
                showDiv($(this).attr('infotype'));
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
            //给保健计划的重置按钮绑定事件
            $('input[name=btnResetFollow]').click(function () {
                $(this).parentsUntil('table[name=MsgTemplate]').find('textarea').val("");
                $(this).parentsUntil('table[name=MsgTemplate]').find('input[name*=xdpPlanDate]').val('');
            });
            //给移除按钮绑定事件
            $('input[name=btnRemove]').click(function () {
                var hidtotal = $(this).parentsUntil('.formcontainer').find('input[type=hidden]').last();
                var total = hidtotal.val();
                hidtotal.val(parseInt(total) - 1);
                $(this).parentsUntil('table[name=MsgTemplate]').remove();
            });
            //给随访计划的移除按钮绑定事件
            $('input[name=btnRemoveFollow]').click(function () {
                var hidtotal = $(this).parentsUntil('.formcontainer').find('input[type=hidden]').last();
                var total = hidtotal.val();
                hidtotal.val(parseInt(total) - 1);
                $(this).parentsUntil('table[name=MsgTemplate]').remove();
               
                resize();
            });
        }

        function SaveTemplate(obj) {
            var title = "保存信息模板";
            var url = "SaveTemplate.aspx?pi=1&type=" + obj;
            var height = 500;
            var width = 600;
            $("<div style='width:100%;height:550px' ><iframe  scrolling='auto' width='98%' height='98%'  frameborder=0   src='" + url + "' /></div>").dialog({ autoOpen: true, width: width, height: height, showTitle: false, modal: true, title: title });
        }

        function showDiv(obj) {
            var url = 'CallTemplate.aspx?type=' + obj;
            $("<div style='width:100%;height:600px' ><iframe  scrolling='auto' width='98%' height='98%'  frameborder=0   src='" + url + "' /></div>").dialog({ autoOpen: true, width: 700, height: 550, showTitle: false, modal: true, title: '调用信息模板' });
        }
        function closeDiv() {
            $("div").dialog('close');
        }


        //初始化健康随访主要健康问题
        function CloseSelect() {
            //sex:1-男；2-女
            //同时获取当前选取人的最新体检综述
            if ($('#hidUserID').val() != "") {
                $.ajax({
                    type: "POST",
                    url: "/hc/Common/RmomsDiret.asmx/GetCheckUpSumm",
                    data: "&PatientID=" + document.getElementById("<%=hidUserID.ClientID %>").value,
                    success: function (data, status) {
                        if (status == "success") {
                            document.getElementById("<%=txtSummarize.ClientID %>").value = data.text;
                        }
                    }
                });
            }

            $('div').dialog('close');
        }


        function CloseSaveTemplate() {
            $('div').dialog('close');
        }
        function DelNoNumber(obj) {
            $(obj).val(($(obj).val().replace(/[^0-9]/g, '')));
        }
        ///焦点落到“主要健康问题”时，焦点转移。
        function OtherControlfocus() {
            document.getElementById("tagContent2").focus();
        }


        //获取url参数
        function QueryString(name) {
            var url = unescape(window.location.href);
            var allargs = url.split("?")[1];
            var args = allargs.split("&");
            for (var i = 0; i < args.length; i++) {
                var arg = args[i].split("=");
                if (arg[0] == name) {
                    return unescape(arg[1]);
                }
            }
            return "";
        }

        function resize() {
            try {
                var obj = parent.document.getElementById('main_iframe');
                if (obj != null) {
                    $(obj).height($(document).height());
                }

            } catch (e) {
            }
        }

        function GetMsgContent() {
            return ($("#TemplateInfo").val()).replace('尊敬的[XX]:', '');
        }

        function changeSendDay() {
            $("#<%=dpMsgSendDay.ClientID %>").val($("#<%=tpStartTime.ClientID %>").val());
            $("#<%=dpEmailSendDay.ClientID %>").val($("#<%=tpStartTime.ClientID %>").val());

//            var myDate = new Date();
//            myDate.setMinutes(myDate.getMinutes() + 30);

//            var straValue = myDate.getHours() + ":" + myDate.getMinutes();

//            var strMsgTime = $.trim($("#<%=txtMsgSendtime.ClientID %>").val());
//            var strEmailTime = $.trim($("#<%=txtEmailSendtime.ClientID %>").val());
//            if (ValidTime($("#<%=tpStartTime.ClientID %>").val(), dateNowDay)) {
//                if (daysBetween(strMsgTime, CheckTime)) {
//                    $("#<%=txtMsgSendtime.ClientID %>").val(straValue);
//                }
//                if (daysBetween(strEmailTime, CheckTime)) {
//                    $("#<%=txtEmailSendtime.ClientID %>").val(straValue);
//                }
//            }
//            else {
//                $("#<%=txtMsgSendtime.ClientID %>").val("14:30");
//                $("#<%=txtEmailSendtime.ClientID %>").val("14:30");
//            }

        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
<div class="jhck_tab">
<span id="spanTitle" runat="server">保健计划</span>
&gt;&gt; 制定个人保健计划
</div>
 <div  class="hy_sj ">
     <table cellpadding="0" cellspacing="0"  align="left" border="0">
                <tr>
                <td>
                    <span style="color: red">*</span>
                </td>
                <td class="label">
                    计划标题：
                </td>
                <td colspan="4" class="input">
                    <Chy:XTextBox ID="txtTitle" runat="server" MaxLength="50" Width="375" CssClass="inputtext">
                    </Chy:XTextBox>
                </td>
            </tr>
            <tr>
                                     
                <td><span style="color: red">*</span></td>
                <td class="label">
                    开始日期：
                </td>
                                            
                <td class="input">
                    <Chy:XDatePicker ID="tpStartTime"  onchange="changeSendDay()" runat="server" DateFmt="yyyy-MM-dd" MinDate="%y-%M-%d">
                    </Chy:XDatePicker>
                </td>
                <td><span style="color: red">*</span></td>
                <td class="label">
                    结束日期：
                </td>
                <td class="input">
                    <Chy:XDatePicker ID="tpEndTime" runat="server" DateFmt="yyyy-MM-dd" MinDate="%y-%M-%d">
                    </Chy:XDatePicker>
                </td>
            </tr>
                                      
            <tr>
                <td class="input">
                </td>
            </tr>
        </table>
 </div>
<div class="sf_con" style="margin-top: 10px;">
    <ul id="tags" class="clearfix mb_10 tags">
        <li class="selectTag"><a id="AMessagePlan" onclick="selectTag('tagContent0',this);return false;"
            href="javascript:void(0)">短信计划</a> </li>
        <li><a onclick="selectTag('tagContent1',this);return false;" href="javascript:void(0)">邮件计划</a>
        </li>
        <li  style="display: none"><a onclick="selectTag('tagContent2',this);return false;"
            href="javascript:void(0)">随访计划</a></li>
    </ul>
    <div id="tagContent">
        <%--  短信开始--%>
        <div class="tagContent selectTag" id="tagContent0">
            <table cellpadding="0" cellspacing="0" class="formcontainer">
                <tr>
                    <td class="label">
                        发送日期：
                    </td>
                    <td class="input">
                        <Chy:XDatePicker ID="dpMsgSendDay" runat="server" DateFmt="yyyy-MM-dd" MinDate="%y-%M-%d">
                        </Chy:XDatePicker>
                    </td>
                    <td class="label">
                        发送时间：
                    </td>
                    <td class="input" >
                        <Chy:XTextBox ID="txtMsgSendtime" runat="server" MaxLength="15"
                            Text="14:30" Width="120" onClick="WdatePicker({dateFmt:'HH:mm'})">
                        </Chy:XTextBox>
                    </td>
                    <td class="label">
                        间隔天数：
                    </td>
                    <td class="input">
                        <Chy:XTextBox ID="txtMsgDays" runat="server"  MaxLength="3" Width="120"
                            Text="1" onkeyup="DelNoNumber(this)">
                        </Chy:XTextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="6" valign="top" class="input">
                        <asp:Literal ID="ltlMsgHtml" runat="server"></asp:Literal>
                    </td>
                </tr>
                <tr>
                    <td class="input">
                    </td>
                    <td class="input">
                        <input type="button" class="addbutton" value="新增" id="btnAddMsg" infotype="1"  InfoTypeName="短信内容"/>
                        <%--记录当前页面短信的索引--%>
                        <asp:HiddenField ID="hidMsgIndex" runat="server" Value="1" />
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
                        发送日期：
                    </td>
                    <td class="input">
                        <Chy:XDatePicker ID="dpEmailSendDay" runat="server" DateFmt="yyyy-MM-dd" MinDate="%y-%M-%d">
                        </Chy:XDatePicker>
                    </td>
                    <td class="label">
                        发送时间：
                    </td>
                    <td class="input">
                        <Chy:XTextBox ID="txtEmailSendtime" runat="server" CssClass="inputtext" MaxLength="15"
                            Text="14:30" Width="120" onClick="WdatePicker({dateFmt:'HH:mm'})">
                        </Chy:XTextBox>
                    </td>
                    <td class="label">
                        间隔天数：
                    </td>
                    <td class="input">
                        <Chy:XTextBox ID="txtEmailDays" runat="server" CssClass="inputtext" MaxLength="3" Width="120"
                            Text="1" onkeyup="DelNoNumber(this)">
                        </Chy:XTextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="6" valign="top" class="input">
                        <asp:Literal ID="ltlEmailHtml" runat="server"></asp:Literal>
                    </td>
                </tr>
                <tr>
                    <td class="input">
                    </td>
                    <td class="input">
                        <input type="button" class="addbutton" value="新增" id="btnAddEamil" infotype="2" InfoTypeName="邮件内容" />
                        <%--记录当前页面邮件的索引--%>
                        <asp:HiddenField ID="hidEmailIndex" runat="server" Value="1" />
                        <%--记录当前邮件的数量--%>
                        <input type="hidden" id="EmailTotal" runat="server" value="1" />
                    </td>
                </tr>
            </table>
        </div>
        <%-- 邮件结束--%>
        <%-- 随访计划开始 --%>
        <div class="tagContent" id="tagContent2">
            <table cellpadding="0" cellspacing="0" class="formcontainer">
                <tr>
                    <td class="label" width="98">
                        主要健康问题:
                    </td>
                    <td colspan="3" class="input">
                        <asp:TextBox ID="txtSummarize" Rows="5" TextMode="MultiLine" runat="server" MaxLen="2048"
                            Width="370px" CssClass="inputarea" onfocus="OtherControlfocus()" Text=""></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" valign="top" class="input">
                        <asp:Literal ID="ltlFollowPlan" runat="server"></asp:Literal>
                    </td>
                </tr>
                <tr>
                    <td class="input">
                    </td>
                    <td class="input">
                        <input type="button" class="addbutton" value="新增" id="btnAddFollow" infotype="3"  InfoTypeName="随访"/>
                        <%--记录当前页面随访计划的索引--%>
                        <input type="hidden" id="hidFollow" name="hidFollow" value="1" />
                        <%--记录当前随访计划的数量--%>
                        <input type="hidden" id="FollowTotal" runat="server" value="1" />
                    </td>
                </tr>
            </table>
        </div>
        <%-- 随访计划结束 --%>
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
            <input type="button" class="button" value="返回" onclick="javascript:document.location.href='HealthPlanPerson.aspx?_pi=<%=MemberManager.SelectedId %>'" />
            <%--设置当前选择模板的input控件id--%>
            <input type="hidden" id="FocusInput" name="FocusInput" value="" />
            <%--保存弹出框选择项ID--%>
            <input type="hidden" id="SelectNodeID" name="SelectNodeID" value="" />
            <%--保存另存为模板时文本框信息--%>
            <input type="hidden" id="TemplateInfo" value="" />
                             
                <asp:HiddenField ID="hidUserID" runat="server" Value="-1" />
        </td>
    </tr>
</table>
                                
    <%-- 短信模板开始--%>
    <%--短信模板结束--%>
</asp:Content>
