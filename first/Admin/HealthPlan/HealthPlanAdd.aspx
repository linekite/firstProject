<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MainContent.Master"
    CodeBehind="HealthPlanAdd.aspx.cs" Inherits="Chm.Web.Admin.HealthPlan.HealthPlanAdd" %>

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

        var day = 1000 * 60 * 60 * 24;
        var dateNow = new Date(); 
        var dateNowDay = dateNow.getFullYear()+"-"+pad((dateNow.getMonth()+1),2)+"-"+pad(dateNow.getDate(),2);
        var CheckTime = pad(dateNow.getHours(),2) + ":" + pad(dateNow.getMinutes(),2);
        
       

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

            if ($.trim($('#<%=hidPlanType.ClientID %>').val()) == "0") {

                if ($.trim($('#<%=txtUserName.ClientID %>').val()) == "") {
                    alert('会员姓名不能为空！');
                    return false;
                }
            }
            else if($.trim($('#<%=hidPlanType.ClientID %>').val()) == "1"){
                if ($.trim($('#<%=txtOrgName1.ClientID %>').val()) == "") {
                    alert('会员分组不能为空！');
                    return false;
                }
                if ($.trim($('#<%=txtUserName1.ClientID %>').val()) == "") {
                    alert('会员姓名不能为空！');
                    return false;
                }
            }

            if ($.trim($('#<%=txtPlanTitle.ClientID %>').val()) == "") {
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

            var straValue = pad(myDate.getHours(), 2) + ":" + pad(myDate.getMinutes(),2);

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
//            else {
//                $("#<%=txtMsgSendtime.ClientID %>").val("14:30");
//                $("#<%=txtEmailSendtime.ClientID %>").val("14:30");
//            }

            var returnEmailStr = CheckMsgSendTime();
            var returnMsgStr = CheckEmailSendTime();
            var returnFollowStr = "";
            //验证随访计划的正确性
            //            if (document.getElementById("followPlan").style.display != "none") {
            //                var FollowDate = $("input[id^='xdpPlanDate']");//随访计划的全部日期
            //                FollowDate.each(function () {
            //                    if ($(this).val() == "") {
            //                        returnFollowStr = "有随访计划的计划随访时间为空！";
            //                    }
            //                });
            //            }

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
                else {return false;}
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

            resizeParentFrame();
        }

        //创建信息/邮件模板/随访计划模板
        function getMessageTemplateHtml(obj, label, type) {
            var htmlArry = new Array();
            var inputId = type == 1 ? ("MsgContent" + obj) : (type == 2 ? ("EmailContent" + obj) : ("PlanPurpose") + obj);
            var maxlen = type == 1 ? 250 : (type == 2 ? 1500 : 2000);
            var dateId = type == 3 ? "xdpPlanDate" + obj : "";
            if (type == "3") {//随访计划模板<span style="color: red">*</span>
                htmlArry.push("<div name=\"divMsgTemplate\" style=\"BORDER: #d2e2f2 0px solid; padding:1px;  BACKGROUND-COLOR: #fff;zoom:1; overflow:hidden;\"><table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" name=\"MsgTemplate\"><tr><td  style=\"vertical-align: top\" width=\"1\"></td><td><table cellspacing=\"0\" cellpadding=\"0\" name=\"MsgTemplate\" border=\"0px\" style=\"width:100%\"><tr><td class=\"label\" width=\"90\"><span style=\"color:red\">*</span>计划随访日期:</td><td class=\"input\"><input id=\"" + dateId + "\" name=\"" + dateId + "\"  class=\"inputtext\"  style=\"width:370\" onclick=\"WdatePicker()\"></input></td></tr><tr><td class=\"label\" width=\"90\">随访目的:</td><td colspan=\"2\" valign=\"top\" class=\"input\">");
                htmlArry.push("<textarea maxlen=\"2000\" id=\"" + inputId + "\" name=\"" + inputId + "\" rows=\"4\" class=\"inputarea\" cols=\"\" style=\"width: 370px;\"></textarea></td></tr></table></td><td valign=\"top\"><table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"margin-left: 10px;\"><tr><td><input type=\"button\" name=\"btnResetFollow\" style=\"width: 100px\" class=\"button\" value=\"　重置　\" /></td></tr><tr><td><input type=\"button\" name=\"btnRemoveFollow\" style=\"width: 100px\" class=\"button\" value=\"　移除　\" /></td></tr></table></td></tr></table></div>");
            }
            else {
                htmlArry.push(" <table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" name=\"MsgTemplate\">");
                htmlArry.push(" <tr><td class=\"label\" style=\"vertical-align: top\">" + label + "</td>");
                htmlArry.push(" <td  class=\"input\"><textarea  maxlen=\"" + maxlen + "\" id=\"" + inputId + "\"  name=\"" + inputId + "\" rows=\"6\" class=\"inputarea\" cols=\"\" style=\"width: 370px;height:130px\">尊敬的[XX]:</textarea>");
                htmlArry.push(" </td><td valign=\"top\"><table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"margin-left: 10px;\"> <tr><td>");
                htmlArry.push(" <input type=\"button\" name=\"btnCallTemp\" style=\"width: 100px;margin-top: 10px;\" class=\"button\" value=\"调用模板\" infotype=\"" + type + "\"/></td></tr><tr>");
                htmlArry.push(" <td><input type=\"button\" name=\"btnSaveAs\" style=\"width: 100px;margin-top: 5px;\" class=\"button\" value=\"另存\"  infotype=\"" + type + "\"/></td></tr><tr>");
                htmlArry.push(" <td><input type=\"button\" name=\"btnReset\" style=\"width: 100px;margin-top: 5px;\" class=\"button\" value=\"　重置　\" /></td></tr><tr>");
                htmlArry.push(" <td><input type=\"button\" name=\"btnRemove\" style=\"width: 100px;margin-top: 5px;\" class=\"button\" value=\"　移除　\" /></td></tr></table>");
                htmlArry.push(" </td></tr></table>");
            }
            return htmlArry.join(" ");
        }

        $(function () {
            InitEvents();
            buttonEvents();
            CloseSelect();//健康随访
//            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
//            function EndRequestHandler(sender, args) {
//                InitEvents();
//                buttonEvents();
//                CloseSelect(); //健康随访
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
                buttonEvents();
                resizeParentFrame();
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
            });
        }

        function SaveTemplate(obj) {
            var title = "保存信息模板";
            var url = "SaveTemplate.aspx?pi=1&type=" + obj;
            var height = 550;
            var width = 600;
            $("<div style='width:100%;height:600px' ><iframe  scrolling='auto' width='98%' height='98%'  frameborder=0   src='" + url + "' /></div>").dialog({ autoOpen: true, width: width, height: height, showTitle: false, modal: true, title: title });
        }

        function showDiv(obj) {
            var url = 'CallTemplate.aspx?type=' + obj;
            $("<div style='width:100%;height:600px' ><iframe  scrolling='auto' width='98%' height='98%'  frameborder=0   src='" + url + "' /></div>").dialog({ autoOpen: true, width: 700, height: 550, showTitle: false, modal: true, title: '调用信息模板' });
        }
        function closeDiv() {
            $("div").dialog('close');
        }

        function CloseSelect() {
            if (document.getElementById('<%=hidPlanType.ClientID %>').value == "0") {
                //同时获取当前选取人的最新体检综述
                $.ajax({
                    type: "POST",
                    url: "/hc/Common/RmomsDiret.asmx/GetCheckUpSumm",
                    data: "&PatientID=" + document.getElementById('<%=hidUserID.ClientID %>').value,
                    success: function (data, status) {
                        if (status == "success") {
                            document.getElementById("<%=txtSummarize.ClientID %>").value = data.text;
                        }
                    }
                });
                followPlanState(true);
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
        ///followPlan计划的显示与隐藏，state为false为隐藏，为true为显示；
        function followPlanState(state) {
            if (state && document.getElementById("followPlan").style.display == "none") {
                document.getElementById("followPlan").style.display = "none";
            }
            else if (!state && document.getElementById("followPlan").style.display == "") {
                document.getElementById("followPlan").style.display = "none";
            }
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

        function returnValue(obj1, obj2, obj3) {
            if (obj2 == "") {
                obj2 = -1;
            }
            $("#<%=txtLevel.ClientID %>").val(obj2);
            $("#<%=txtUserName.ClientID %>").val(obj3);
            $("#<%=hidUserID.ClientID %>").val(obj1);
            $("#PersonSearchDiv1").dialog("close");
            $("#advancedSearchDiv1").dialog("close");
        }
        function Canncel() {
            if ($("#<%=HMResource.ClientID %>").val()!= "0") 
            {

                document.location.href = "HealthPlanList.aspx?_pi=<%=MemberManager.SelectedId %>" + "&HMResource=" + $("#<%=flag.ClientID %>").val();
            }
            else 
            {
                parent.resetParentSizeWindow();
                parent.CloseWindow();
            }
        }

        function GetMsgContent() {
            return ($("#TemplateInfo").val()).replace('尊敬的[XX]:','');
        }
        function changeSendDay() {
            $("#<%=dpMsgSendDay.ClientID %>").val($("#<%=tpStartTime.ClientID %>").val());
            $("#<%=dpEmailSendDay.ClientID %>").val($("#<%=tpStartTime.ClientID %>").val());

            //            dateNow.getHours() + ":" + dateNow.getMinutes();
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


        function resizeParentFrame() {
            if (parent.document.getElementById("mainFrame") != null) {
                // clientUnity.resizeFrame(parent.document.getElementById("mainFrame"));  
                if (!clientUnity.resizeOpenWindow()) {
                    clientUnity.resizeFrame();
                }
            }
            if (window.parent.document.getElementById("IFRAME1") != null) {
                window.parent.reSizeiFrame(window.parent.document.getElementById("IFRAME1"));
                window.parent.parent.reSizeWindow();
            } 
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server"> 
   <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="pf_tab">
      <span id="spanTitle" runat="server">保健计划制定</span>
      &gt;&gt; <span id="spanTitleDetail" runat="server">制定个人保健计划</span>
    </div>
    <div class="hy_sj" >
         <div class="hy_sj_left" >
            <table cellpadding="0" cellspacing="0"  align="left" border="0">
                <tr  runat="server" id="trUserName">
                    <td>
                        <span style="color: red">*</span>
                    </td>
                    <td class="label">
                        会员姓名：
                    </td>
                    <td colspan="4" class="input">
                        <Chy:XTextBox ID="txtUserName" runat="server" Enabled="false" Width="350" >
                        </Chy:XTextBox>
                    </td>
                </tr>
                <tr runat="server" id="trOrgName">
                    <td>
                        <span style="color: red"></span>
                    </td>
                    <td class="label">
                        会员分组：
                    </td>
                    <td colspan="4" class="input">
                        <Chy:XTextBox ID="txtOrgName" runat="server" Enabled="false"  Width="350">
                        </Chy:XTextBox>
                    </td>
                </tr>
                <tr runat="server" id="trOrgName1" style=" display:none;">
                    <td>
                        <span style="color: red">*</span>
                    </td>
                    <td class="label">
                        会员分组：
                    </td>
                    <td colspan="4" class="input">
                        <Chy:XTextBox ID="txtOrgName1" runat="server" Enabled="false" Width="350">
                        </Chy:XTextBox>
                    </td>
                 </tr>
                <tr  runat="server" id="trGroupIll" style=" display:none;">
                    <td>
                        <span style="color: red"></span>
                    </td>
                    <td class="label">
                        疾病分组：
                    </td>
                    <td class="input">
                        <Chy:XTextBox ID="txtGroupName" runat="server" Enabled="false" >
                        </Chy:XTextBox>
                    </td>
                        <td>
                        <span style="color: red"></span>
                    </td>
                    <td class="label">
                        星级服务：
                    </td>
                    <td class="input">
                         <Chy:XCategoryList CssClass="secltwidth" ID="txtLevel" runat="server"
                            CategoryId="46" Enabled="false" Width="115" >
                        </Chy:XCategoryList>
                    </td>
                </tr>
                    <tr runat="server" id="trUserName1" style="display:none;">
                    <td>
                        <span style="color: red"></span>
                    </td>
                    <td class="label">
                        会员姓名：
                    </td>
                    <td colspan="4" class="input">
                    <%--<div class="hy_jb" style=" width:355px">--%>
                        <Chy:XTextBox ID="txtUserName1" runat="server" class="inputtext"  Width="355" Enabled="false" >
                        </Chy:XTextBox>
                        <%--<div class="hy_sel">
                        <input type="button" onmousedown="this.className='hy_sel_bd_h'"
                                        onmouseout="this.className='hy_sel_bd'" class="hy_sel_bd" id="btnView" value="查看" />
                                         </div>
                          </div>--%>
                          <img alt="查看" id="btnView" src="../../Image/search.png"
                                style="cursor: hand"  title="查看"/>
                    </td>
                    </tr>
                 </table>
             </div>

      
            <div class="hy_sj_right" runat="server" id="divCheckPerson">
                <p>
                <span class="or_num">1</span>
                直接输入或者选择查询条件；
                </p>
                <p>
                <span class="or_num">2</span>
                确认"会员姓名"后才能制定保健计划。
                </p>
                <p class="but">
                <input class="qf_but"  type="button" value="重新选择会员" id="btnChoosePatient"  name="btnChoosePatient" style=" cursor:hand;"/>
                </p>
            </div>
       </div>
         
             
        <div  class="hy_sj">
         <div class="hy_sj_left">
           <table  cellpadding="0" cellspacing="0"  align="left" border="0">
                <tr>
                    <td>
                        <span style="color: red">*</span>
                    </td>
                    <td class="label">
                        计划标题：
                    </td>
                    <td colspan="4" class="input">
                        <Chy:XTextBox ID="txtPlanTitle" runat="server" class="inputtext" MaxLength="50" Width="350">
                        </Chy:XTextBox>
                    </td>
                </tr>
                <tr>
                                       
                    <td><span style="color: red">*</span></td>
                    <td class="label">
                        开始日期：
                    </td>
                                            
                    <td class="input">
                        <Chy:XDatePicker ID="tpStartTime" onchange="changeSendDay()" runat="server" DateFmt="yyyy-MM-dd" MinDate="%y-%M-%d">
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
       </div>  
       
                           
        <div  class="sf_con" >
            <ul id="tags" class="tags">
                <li class="selectTag"><a id="AMessagePlan" onclick="selectTag('tagContent0',this);return false;"
                    href="javascript:void(0)">短信计划</a> </li>
                <li><a onclick="selectTag('tagContent1',this);return false;" href="javascript:void(0)">邮件计划</a>
                </li>
                <li id="followPlan" style="display: none"><a onclick="selectTag('tagContent2',this);return false;"
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
                            <td class="input">
                                <Chy:XTextBox ID="txtMsgSendtime" runat="server" class="inputtext" MaxLength="15"
                                    Text="14:30" Width="120" onClick="WdatePicker({dateFmt:'HH:mm'})">
                                </Chy:XTextBox>
                            </td>
                            <td class="label">
                                间隔天数：
                            </td>
                            <td class="input">
                                <Chy:XTextBox ID="txtMsgDays" runat="server" class="inputtext" MaxLength="3" Width="120"
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
                                <Chy:XTextBox ID="txtEmailSendtime" runat="server" class="inputtext" MaxLength="15"
                                    Text="14:30" Width="120" onClick="WdatePicker({dateFmt:'HH:mm'})">
                                </Chy:XTextBox>
                            </td>
                            <td class="label">
                                间隔天数：
                            </td>
                            <td class="input">
                                <Chy:XTextBox ID="txtEmailDays" runat="server" class="inputtext" MaxLength="3" Width="120"
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
                                <input type="button" class="addbutton" value="新增" id="btnAddEamil" infotype="2"  InfoTypeName="邮件内容"/>
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
                            <td class="label" width="90">
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
                        <input type="button" class="button" value="返回" onclick="Canncel();" />
                        <%--设置当前选择模板的input控件id--%>
                        <input type="hidden" id="FocusInput" name="FocusInput" value="" />
                        <div style="display:none">
                        <%--保存另存为模板时文本框信息--%>
                        <input type="hidden" id="TemplateInfo" value="" />
                        <input type="hidden" id="hidPlanType" name="hidPlanType" value="1" runat="server" />
                        <asp:HiddenField ID="hidUserID" runat="server" Value="-1" />
                        <asp:HiddenField ID="hidOrgID" runat="server" Value="1" /><%--会员分组ID--%>
                        <asp:HiddenField ID="hidGroupID" runat="server" Value="-1" /><%--疾病分组ID--%>
                        <asp:HiddenField ID="hidServiceLevel" runat="server" Value="-1" /><%--星级服务--%>
                        <asp:HiddenField ID="hidUserCount" runat="server" Value="0" /><%--公用保健计划人员总数--%>

                        <asp:HiddenField ID="hidpatientName" runat="server" Value="" /><%--会员姓名--%>
                        <asp:HiddenField ID="hidmemberId" runat="server" Value="" /><%--会员卡号--%>
                        <asp:HiddenField ID="hidItemId" runat="server" Value="-1" /><%--监测项目--%>
                        <asp:HiddenField ID="hiddataSource" runat="server" Value="0" /><%--类型 全部：0；体检模式：1；住院模式：2--%>
                        <asp:HiddenField ID="hidStatus" runat="server" Value="-1" /><%--服务状态--%>
                        <asp:HiddenField ID="hidbeginDate" runat="server" Value="" /><%--开始时间--%>
                        <asp:HiddenField ID="hidendDate" runat="server" Value="" /><%--结束时间--%>

                        <asp:HiddenField ID="hidSearchInfo" runat="server" Value="0" /><%--查询条件--%>
                        <asp:HiddenField ID="hidPatientSex" runat="server" Value="-1" /><%--会员性别--%>
                        <asp:HiddenField ID="hidAccount" runat="server" Value="" /><%--会员账号--%>
                        <asp:HiddenField ID="hidIdCard" runat="server" Value="" /><%--会员身份证--%>
                        <asp:HiddenField ID="hidMobile" runat="server" Value="" /><%--会员手机号--%>
                        <asp:HiddenField ID="hidIcdType" runat="server" Value="0" /><%--ICD疾病类型--%>
                        
                        <asp:HiddenField ID="hidICDCode" runat="server" Value="" /><%--ICD编码--%>
                        <asp:HiddenField ID="hidICDTypeCode" runat="server" Value="" /><%--ICD疾病类型编码--%>
                        <asp:HiddenField ID="hidIsIncludeSubNode" runat="server" Value="0" /><%--是否包含子节点，0表示false--%>

                        <asp:HiddenField ID="hidIcdName" runat="server" Value="" /><%--ICD编码名称--%>
                        <asp:HiddenField ID="hidIcdTypeName" runat="server" Value="" /><%--ICD疾病类型编码名称--%>

                        <asp:HiddenField ID="hidDiseaseType" runat="server" Value="1" /><%--体检疾病类别（1-按疾病分类；2-按ICD分类）--%>
                        <asp:HiddenField ID="hidDiseaseCategoryId" runat="server" Value="-1" /><%--疾病分类ID(住院人群或体检人群 疾病分类ID查询条件）--%>
                        <asp:HiddenField ID="hidDiagnoseType" runat="server" Value="1" /><%--门诊人群查询类别（1-按疾病分类；2-按门诊诊断）--%>
                        <asp:HiddenField ID="hidDiagnoseDiseaseName" runat="server" Value="" /><%--门诊诊断疾病名称--%>
                        <asp:HiddenField ID="hidCategoryName" runat="server" Value="" /><%--疾病分类名称（住院人群或体检人群查询条件)门诊人群-追加参数--%>



                         <%--多会员列表选择后的查询条件--%>
    <input type="hidden" id="hidToOrgId1" runat="server" value="1" />
    <input type="hidden" id="hidDiseaseId1" runat="server" value="-1" />
    </div>
                    </td>
                </tr>
                
            </table>
                             
        <div id="showDialog" title="查看会员"  style=" display:none;">
            <table width="99%" cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td>
                     <asp:UpdatePanel runat="server" ID="UpdatePanel1"><ContentTemplate>
                        <Chy:XGridView ID="gvPatientInfo" runat="server" CssClass="zebratable" AllowPaging="true"
                            DataKeyNames="PatientId" OnBindCstm="gvVisit_BindCstm" AutoGenerateColumns="False" PagerSettings-PageButtonCount="8"
                            PageSize="5" Width="100%">
                            <Columns>
                                <asp:TemplateField HeaderText="姓名">
                                    <ItemTemplate>
                                        <asp:Label ID="lblOrgnazation" runat="server" Text='<%#Eval("PatientName").ToString().Length > 14 ? Eval("PatientName").ToString().Substring(0, 14) + "..." : Eval("PatientName").ToString()%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="性别">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPatientName" runat="server" Text='<%# ShowSex(Eval("PatientSex")) %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="年龄">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPatientNo" runat="server" Text='<%# GetAge(Eval("Birthday")) %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="会员卡号">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPhone" runat="server" Text='<%# Eval("MemberID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                               
                            </Columns>
                        </Chy:XGridView>
                        </ContentTemplate>
        
                      </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <input type="button" class="button" id="btnReturn" value="关闭" />
                    </td>
                </tr>
            </table>
        </div>

         <%--多用户查询页面--%>
      <div id="advancedSearchDiv1" title='选择用户'  style=" display:none;">
         <table width="99%" cellpadding="0" cellspacing="0" class="searchPanel" >
            <tr>

                <td class="label" nowrap>
                    <span style="color: red">*</span><Chy:XLabel ID="lblDoctorName" Text="会员分组:" runat="server" />
                </td>
                <td colspan="3"   nowrap  style="width: 400px;">
                   <%--<div class="hy_jb" style="width: 400px;">--%>
                       <Chy:XTextBox ID="txtToOrg" Width="363" runat="server"  AllowEmpty="false" ValidationGroup="CheckGroup" Enabled="false"></Chy:XTextBox>
                      <%-- <div class="hy_sel">
                           <input type="button" value="选择" onmousedown="this.className='hy_sel_bd_h'"
                                        onmouseout="this.className='hy_sel_bd'" class="hy_sel_bd" onclick="OpenDialgFromOrg('1');" />
                       </div>
                   </div>--%>
                   <img alt="请选择会员分组" id="Img1" src="../../Image/search.png"
                                style="cursor: hand" onclick="OpenDialgFromOrg('1');" title="请选择会员分组"/>
                </td>
            </tr>
            <tr>
                <td class="label" nowrap>
                    <Chy:XLabel ID="XLabel1" Text="疾病分组:" runat="server" />
                </td>
                <td  nowrap>
                  <%-- <div class="hy_jb" style="width: 140px;">--%>
                        <Chy:XTextBox ID="txtDisease" runat="server" ></Chy:XTextBox>
                         <%--<div class="hy_sel">
                             <input type="button" value="选择" onmousedown="this.className='hy_sel_bd_h'"
                                            onmouseout="this.className='hy_sel_bd'" class="hy_sel_bd" onclick="OpenDialgDisease('1');" />
                         </div>
                   </div>--%>
                    <img alt="请选择疾病分组" id="Img2" src="../../Image/search.png"
                                style="cursor: hand" onclick="OpenDialgDisease('1');" title="请选择疾病分组"/>
                </td>
                <td class="label" nowrap>
                    <Chy:XLabel ID="XLabel2" Text="星级服务:" runat="server" />
                </td>
                <td>
                    <Chy:XCategoryList CssClass="secltwidth" ID="dropStarServiceLevel" Width="150" runat="server"
                        CategoryId="46">
                    </Chy:XCategoryList>
                </td>
            </tr>
            <tr>
                <td class="label" nowrap>
                    <Chy:XLabel ID="XLabel3" Text="监测项目:" runat="server" />
                </td>
                <td>
                    <Chy:XDropDownList Width="140" ID="ddlProject" runat="server">
                    </Chy:XDropDownList>
                </td>
                <td class="label" nowrap>
                    <Chy:XLabel ID="XLabel4" Text="服务状态:" runat="server" />
                </td>
                <td>
                    <Chy:XCategoryList ID="dropMemberServiceStatus" Width="160" runat="server" CategoryId="23">
                    </Chy:XCategoryList>                    
                </td>

            </tr>
            <tr>
            <td class="label" nowrap>
                <%=Chy.Web.Resource.GetStringColon("Remp_MemberRegisterDate")%>
            </td>
            <td colspan="3">
                <Chy:XDatePicker ID="txtBeginDate" runat="server" AllowEmpty="true" Linkage="BeginDate"
                    Width="85px"></Chy:XDatePicker>
                <%=Chy.Web.Resource.GetString("Remp_To")%>
                <Chy:XDatePicker ID="txtEndDate" runat="server" AllowEmpty="true" Linkage="EndDate"
                    Width="85px"></Chy:XDatePicker> 
                &nbsp; &nbsp; &nbsp; &nbsp;
               <Chy:XButton ID="XButton2" runat="server" Text="查询" CssClass="button" OnClick="btnSearch_Click" ValidationGroup="CheckGroup"/>              
            </td>
        </tr>
        </table>

        <asp:UpdatePanel runat="server" ID="UpdatePanel3"><ContentTemplate>
            <table width="99%" cellpadding="0" cellspacing="0" align="center">
                <tr>
                    <td>
                        <%--<asp:Label ID="lblTip" runat="server" Text="请确认列表中的会员："></asp:Label>--%><span runat="server" id="lblTip">请确认列表中的会员：</span>
                    </td>
                </tr>
                <tr>
                    <td>
                
                        <Chy:XGridView ID="gvInPatient" runat="server" CssClass="zebratable" AllowPaging="true"
                            DataKeyNames="PatientID" OnBindCstm="gvInPatient_BindCstm" AutoGenerateColumns="False" PagerSettings-PageButtonCount="8"
                            PageSize="5" Width="100%">
                            <Columns> 
                                <asp:TemplateField HeaderText="姓名">
                                    <ItemTemplate>
                                        <asp:Label ID="lblName" runat="server" Text='<%#Eval("PatientName").ToString().Length > 14 ? Eval("PatientName").ToString().Substring(0, 14) + "..." : Eval("PatientName").ToString()%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="性别">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSex" runat="server" Text='<%# ShowSex(Eval("PatientSex")) %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="年龄">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAge" runat="server" Text='<%# GetAge(Eval("Birthday")) %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="会员卡号" ItemStyle-Width="120px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPatientCrodNo" runat="server" Text='<%# Eval("MemberID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                           
                            </Columns>
                        </Chy:XGridView>
                             <%--多会员列表查询条件确定查询后的条件--%>
    
                            <input type="hidden" id="hidToOrgName" runat="server" />
                            <input type="hidden" id="hidDiseaseName" runat="server" />
    
                            <input type="hidden" id="hidToOrgId" runat="server" />
                            <input type="hidden" id="hidDiseaseId" runat="server" />
                            <input type="hidden" id="hidStarLevel" runat="server" />
                            <input type="hidden" id="hidItem" runat="server" />
                            <input type="hidden" id="hidServiceStatus" runat="server" />

                            <asp:HiddenField ID="hidcheckdataSource" runat="server" Value="0" />
                            <input type="hidden" id="hidbeginDateCke" runat="server" value="" />
                            <input type="hidden" id="hidendDateCke" runat="server" value="" />
                    </td>
                </tr>
               </table>
            </ContentTemplate>
            <Triggers>
            <asp:AsyncPostBackTrigger ControlID="XButton2"  />
            <%--<asp:AsyncPostBackTrigger ControlID="btnAdvQuery1"  />--%>
            </Triggers>
          </asp:UpdatePanel>
          <table width="99%" cellpadding="0" cellspacing="0" align="center">
            <tr>
                <td align="center"><br />
                    <asp:Button ID="btnAdvQuery1" runat="server" Text="确定" CssClass="button" style=" display:none" OnClick="btnAdvQuery1_Click" />
                   
                    <input id="btnCancel" type="button" class="button" value='<%=Chy.Globalization.RS.GetString("Remp_Close") %>'  />
                </td>
            </tr>
        </table>
        
    </div>

    
   
   
   <%--单用户查询页面--%>
   <div id="PersonSearchDiv1" title='选择用户'  style=" display:none;">
     <table width="99%" cellpadding="0" cellspacing="0" class="searchPanel" align="center">
        <tr>
            <td  class="label" nowrap><asp:Label ID="lblPatientName" runat="server" Text="姓名:"></asp:Label></td>
            <td>
               <Chy:XTextBox runat="server" ID="txtPatientName"  Width="140"></Chy:XTextBox>
            </td>
            <td  class="label" nowrap><asp:Label ID="lblMemberId" runat="server" Text="会员卡号:"></asp:Label></td>
            <td>
               <Chy:XTextBox ID="txtMemberId" runat="server" Width="150"></Chy:XTextBox>
            </td>
        </tr>
       <%--  <tr>
            <td  class="label" nowrap><asp:Label ID="lblSex" runat="server" Text="性别:"></asp:Label></td>
            <td>
               <Chy:XDropDownList ID="ddlSex" runat="server" style=" width:100px;">
                    <asp:ListItem Text=" 请选择 " Value="-1" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="男" Value="1"></asp:ListItem>
                    <asp:ListItem Text="女" Value="2"></asp:ListItem>
                    <asp:ListItem Text="未知" Value="0"></asp:ListItem>
               </Chy:XDropDownList>
            </td>
            <td  class="label" nowrap><asp:Label ID="lblCardNo" runat="server" Text="证件号码:"></asp:Label></td>
            <td>
               <Chy:XTextBox runat="server" ID="txtCradNo"></Chy:XTextBox>
            </td>
           
        </tr>--%>
            <tr>
              
                <td class="label" nowrap>
                    <Chy:XLabel ID="XLabel5" Text="会员分组:" runat="server" />
                </td>
                <td colspan="3"  nowrap>
                   <%-- <div class="hy_jb" style="width: 410px;">--%>
                        <Chy:XTextBox ID="txtPersonOrg" Style="width: 393px;" runat="server"
                            class="inputtext"></Chy:XTextBox>
                      <%--  <div class="hy_sel">
                            <input name="aa" type="button" value="选择" onclick="OpenDialgFromOrg('0');" onmousedown="this.className='hy_sel_bd_h'"
                                        onmouseout="this.className='hy_sel_bd'" class="hy_sel_bd"/>--%>
                                        <img alt="请选择会员分组" id="Img3" src="../../Image/search.png"
                                style="cursor: hand" onclick="OpenDialgFromOrg('0');" title="请选择会员分组"/>
                                <input type="hidden" id="txtPersonOrgID" runat="server" />
                        <%--</div>--%>
                   <%-- </div>--%>
                </td>
            </tr>
            <tr>
                <td class="label" nowrap>
                    <Chy:XLabel ID="XLabel6" Text="疾病分组:" runat="server" />
                </td>
                <td  nowrap>
                   <%-- <div class="hy_jb"  style="width: 140px;">--%>
                        <Chy:XTextBox ID="txtPersonDesease" runat="server" Width="140"></Chy:XTextBox>
                        <%--<div class="hy_sel">
                            <input name="aa" type="button" value="选择" onmousedown="this.className='hy_sel_bd_h'"
                                onmouseout="this.className='hy_sel_bd'" class="hy_sel_bd" onclick="OpenDialgDisease('0');"/>--%>
                            <%--  <img alt='' runat="server" id="ImgClassName" src="../Images/search.png" style="cursor: hand"
                                onclick="OpenClassSelect();" />--%>
                                <img alt="请选择疾病分组" id="Img4" src="../../Image/search.png"
                                style="cursor: hand" onclick="OpenDialgDisease('0');" title="请选择疾病分组"/>
                                 <input type="hidden" id="txtPersonDeseaseID" runat="server"  value="-1"/>
                      <%--  </div>
                    </div>--%>
                </td>
                <td class="label" nowrap>
                    <Chy:XLabel ID="XLabel7" Text="星级服务:" runat="server" />
                </td>
                <td>
                    <Chy:XCategoryList CssClass="secltwidth" Width="160" ID="dropStarLevel" runat="server"
                        CategoryId="46">
                    </Chy:XCategoryList>
                </td>
            </tr>
            <tr>
                <td class="label" nowrap>
                    <Chy:XLabel ID="XLabel8" Text="监测项目:" runat="server" />
                </td>
                <td>
                    <Chy:XDropDownList Width="140" ID="dropItem" runat="server">
                    </Chy:XDropDownList>
                </td>
                <td class="label" nowrap>
                    <Chy:XLabel ID="XLabel9" Text="服务状态:" runat="server" />
                </td>
                <td>
                    <Chy:XCategoryList ID="dropStatus" runat="server" CategoryId="23" Width="160">
                    </Chy:XCategoryList>
                </td>
            </tr>
           <tr>
            <td class="label" nowrap>
                <%=Chy.Web.Resource.GetStringColon("Remp_MemberRegisterDate")%>
            </td>
            <td colspan="3">
                <Chy:XDatePicker ID="txtBeginDateP" runat="server" AllowEmpty="true" Linkage="BeginDate"
                    Width="85px"></Chy:XDatePicker>
                <%=Chy.Web.Resource.GetString("Remp_To")%>
                <Chy:XDatePicker ID="txtEndDateP" runat="server" AllowEmpty="true" Linkage="EndDate"
                    Width="85px"></Chy:XDatePicker>  
                    &nbsp;&nbsp; &nbsp;&nbsp;
                <Chy:XButton ID="XButton1" runat="server" Text="查询" CssClass="button" OnClick="btnPersonSearch_Click" />             
            </td>
        </tr>
        </table>
        <asp:UpdatePanel runat="server" ID="UpdatePanel2"><ContentTemplate>
            <table width="99%" cellpadding="0" cellspacing="0" align="center">
                <tr>
                    <td>
                       <%-- <asp:Label ID="Label1" runat="server" Text="请选择一个会员："></asp:Label>--%>
                       <span  id="Label1" runat="server" >请选择一个会员：</span>
                    </td>
                </tr>
                <tr>
                    <td>
                
                        <Chy:XGridView ID="gvPerson" runat="server" CssClass="zebratable" AllowPaging="true"
                            DataKeyNames="PatientID" OnBindCstm="gvPerson_BindCstm" AutoGenerateColumns="False" PagerSettings-PageButtonCount="8"
                            PageSize="5" Width="100%">
                            <Columns>
                                <%-- <asp:TemplateField ShowHeader="true" HeaderText="选择" ItemStyle-Width="55px">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtAudit" runat="server" CausesValidation="False" CommandName="itemAudit"
                                            CommandArgument='<%# Eval("PatientID")+"|"+Eval("MemberLevel")+"|"+Eval("PatientName") %>' OnCommand="gvList_Command" Text='选择'></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                                <asp:TemplateField HeaderText="姓名">
                                    <ItemTemplate>
                                    <a href="#" onclick="returnValue('<%# Eval("PatientID")%>','<%#Eval("MemberLevel")%>','<%#Eval("PatientName")%>')">
                                       <%#Eval("PatientName").ToString().Length > 14 ? Eval("PatientName").ToString().Substring(0, 14) + "..." : Eval("PatientName").ToString()%>
                                    </a>
                                   
                                    </ItemTemplate>
                                </asp:TemplateField>
                               <%-- <asp:BoundField DataField="PatientName" HeaderText="姓名"></asp:BoundField>--%>
                                <asp:TemplateField HeaderText="性别">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSex" runat="server" Text='<%# ShowSex(Eval("PatientSex")) %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="年龄">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAge" runat="server" Text='<%# GetAge(Eval("Birthday")) %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="会员卡号" ItemStyle-Width="120px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPatientCrodNo" runat="server" Text='<%# Eval("MemberID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                           
                            </Columns>
                        </Chy:XGridView>
                    
                    </td>
                </tr>
                </table>
             </ContentTemplate>
            <Triggers>
            <asp:AsyncPostBackTrigger ControlID="XButton1"  />
            </Triggers>
        </asp:UpdatePanel>
        <table  width="99%" cellpadding="0" cellspacing="0" align="center">
            <tr>
                <td align="center"><br />
                    <input id="PersonClose" type="button" class="button" value='<%=Chy.Globalization.RS.GetString("Remp_Close") %>'  />
                </td>
            </tr>
        </table>
        <asp:HiddenField ID="hidstarlevelPerson" runat="server" />
        <asp:HiddenField ID="HMResource" Value="0" runat="server" />
        <asp:HiddenField ID="flag" Value="tagContent0" runat="server" />
    </div>
   
    <%--短信模板结束--%>

    <script type="text/javascript" language="javascript">

//        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
//        function EndRequestHandler(sender, args) {
//            $("#PersonSearchDiv1").dialog("close");
//        }
        $(document).ready(function () {

            $("#showDialog").dialog({
                bgiframe: true,
                draggable: false,
                autoOpen: false,
                modal: true,
                width: 550,
                autoHeight: true,
                closeOnEscape: false
            });

            $("#showDialog").parent().appendTo($("form:first"));

            $("#btnView").click(function () {
                $("#showDialog").dialog("open");
            });

            $("#btnReturn").click(function () {
                $("#showDialog").dialog("close");
            });

            //公用保健计划-从新选择会员

            //            $("#SelMode1").change(function () {
            //                selectMode1 = $(this).val();
            //                $("#<%=hidcheckdataSource.ClientID %>").val(selectMode1);
            //            })

            $("#btnCancel").click(function () { $("#advancedSearchDiv1").dialog("close"); })

            $("#btnChoosePatient").click(function () {

                if ($("#<%=hidPlanType.ClientID %>").val() == "1") {

                    //                    $("#<%=hidToOrgId1.ClientID %>").val("1");
                    //                    $("#<%=txtToOrg.ClientID %>").val("");

                    $("#<%=hidDiseaseId1.ClientID %>").val("-1");
                    $("#<%=txtDisease.ClientID %>").val("");
                    $("#<%=XButton2.ClientID %>").click();

                    $("#advancedSearchDiv1").dialog("open");
                }
                else if ($("#<%=hidPlanType.ClientID %>").val() == "0") {

                    $("#<%=txtPersonOrgID.ClientID %>").val("");
                    $("#<%=txtPersonOrg.ClientID %>").val("");

                    $("#<%=txtPersonDeseaseID.ClientID %>").val("-1");
                    $("#<%=txtPersonDesease.ClientID %>").val("");
                    $("#<%=XButton1.ClientID %>").click();

                    $("#PersonSearchDiv1").dialog("open");
                }
            });

            //            $("#advancedSearchDiv1").dialog({
            //                bgiframe: true,
            //                draggable: false,
            //                autoOpen: false,
            //                modal: true,
            //                width: 550,
            //                autoHeight: true,
            //                closeOnEscape: false
            //            });

            if ($("#<%=HMResource.ClientID %>").val() == "1") {

                if ($("#<%=hidPlanType.ClientID %>").val() == "0") {
                    $("#advancedSearchDiv1").dialog({
                        bgiframe: true,
                        draggable: false,
                        autoOpen: false,
                        position: 'top',
                        modal: true,
                        width: 550,
                        autoHeight: true,
                        closeOnEscape: false
                    });
                }
                else if ($("#<%=hidPlanType.ClientID %>").val() == "1") {
                    $("#advancedSearchDiv1").dialog({
                        bgiframe: true,
                        draggable: false,
                        autoOpen: true,
                        position: 'top',
                        modal: true,
                        width: 550,
                        autoHeight: true,
                        closeOnEscape: false
                    });
                }
            }
            else {
                $("#advancedSearchDiv1").dialog({
                    bgiframe: true,
                    draggable: false,
                    autoOpen: false,
                    position: 'top',
                    modal: true,
                    width: 550,
                    autoHeight: true,
                    closeOnEscape: false
                });
            }


            $("#advancedSearchDiv1").parent().appendTo($("form:first"));


            $("#<%=btnAdvQuery1.ClientID %>").click(function () {
                
                $("#advancedSearchDiv1").dialog("close");

            });

            $("#<%=XButton1.ClientID %>").click(function () { $("#<%=Label1.ClientID %>").html("<span style='color: red'>查询中，请稍候！</span>"); });


            //个人保健计划-从新选择会员

            //            $("#SelMode").change(function () {
            //                selectMode = $(this).val();
            //                $("#<%=hiddataSource.ClientID %>").val(selectMode);
            //            })

            $("#PersonClose").click(function () { $("#PersonSearchDiv1").dialog("close"); })

            //            $("#PersonClose").click(function () {
            //                $("#PersonSearchDiv1").dialog("open");
            //            });

            if ($("#<%=HMResource.ClientID %>").val() == "1") {

                if ($("#<%=hidPlanType.ClientID %>").val() == "1") {
                    $("#PersonSearchDiv1").dialog({
                        bgiframe: true,
                        draggable: false,
                        autoOpen: false,
                        position: 'top',
                        modal: true,
                        width: 550,
                        autoHeight: true,
                        closeOnEscape: false
                    });
                }
                else if ($("#<%=hidPlanType.ClientID %>").val() == "0") {
                    $("#PersonSearchDiv1").dialog({
                        bgiframe: true,
                        draggable: false,
                        autoOpen: true,
                        position: 'top',
                        modal: true,
                        width: 550,
                        autoHeight: true,
                        closeOnEscape: false
                    });
                }
            }
            else {
                $("#PersonSearchDiv1").dialog({
                    bgiframe: true,
                    draggable: false,
                    autoOpen: false,
                    position: 'top',
                    modal: true,
                    width: 550,
                    autoHeight: true,
                    closeOnEscape: false
                });
            }


            $("#PersonSearchDiv1").parent().appendTo($("form:first"));

            $("#<%=XButton2.ClientID %>").click(function () {
                if ($("#<%=txtToOrg.ClientID %>").val() != "") {
                    $("#<%=lblTip.ClientID %>").html("<span style='color: red'>查询中，请稍候！</span>");
                    $("#<%=btnAdvQuery1.ClientID %>").show();
                }
            });
        })

        function OpenDialgFromOrg(obj) {
            var d = new Date();
            if (obj == "0") {//个人
                hmShowModal('会员分组', '/hc/admin/CrowdGroup/UserGroupTree.aspx?IsShow=1&selectMode=' + $("#<%=hiddataSource.ClientID %>").val() + '&Time=' + d.toUTCString(), '500', '500', '');
            }
            if (obj == "1") {//公用
                hmShowModal('会员分组', '/hc/admin/CrowdGroup/UserGroupTree.aspx?IsShow=1&selectMode=' + $("#<%=hidcheckdataSource.ClientID %>").val() + '&Time=' + d.toUTCString(), '500', '500', '');
            }
//            xysShowModal('会员分组', '/hc/admin/CrowdGroup/UserGroupTree.aspx', '600', '600', '');
//            var url = "/hc/Admin/CrowdGroup/UserGroupTree.aspx";
//            $("<div style='width:100%;height:400px' id='divchooseFrame'><iframe  scrolling='auto' width='100%' height='100%'  frameborder=0  id='ChooseFrame' src='" + url + "' /></div>").dialog({ autoOpen: true, width: 550, height: 380, showTitle: false, modal: true, position: [50, 150], title: '选择会员分组' });
        }

        function OpenDialgDisease(obj) {
            if (obj == "0") {//个人
                if ($("#<%=txtPersonOrgID.ClientID %>").val() == "" || $("#<%=txtPersonOrg.ClientID %>").val() == "") {
                    alertMsg('请先选择会员分组！', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
                }
                else {
                    hmShowModal('疾病分类', '/hc/admin/query/DiseaseTree.aspx?selectMode=' + $("#<%=hiddataSource.ClientID %>").val() + '&orgId=' + $("#<%=txtPersonOrgID.ClientID %>").val(), '500', '500', '');
                }
            }
            if (obj == "1") {//公用
                if ($("#<%=txtToOrg.ClientID %>").val() == "" || $("#<%=hidToOrgId1.ClientID %>").val() == "1") {
                    alertMsg('请先选择会员分组！', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
                }
                else {
                    hmShowModal('疾病分类', '/hc/admin/query/DiseaseTree.aspx?selectMode=' + $("#<%=hidcheckdataSource.ClientID %>").val() + '&orgId=' + $("#<%=hidToOrgId1.ClientID %>").val(), '500', '500', '');
                }
            }
//            xysShowModal('疾病分类', '/hc/admin/query/DiseaseTree.aspx', '600', '600', '');
//            var url = "/hc/Admin/Query/DiseaseTree.aspx";
//            $("<div style='width:100%;height:400px' id='divchooseFrame'><iframe  scrolling='auto' width='100%' height='100%'  frameborder=0  id='ChooseFrame' src='" + url + "' /></div>").dialog({ autoOpen: true, width: 550, height: 380, showTitle: false, modal: true, position: [50, 150], title: '选择疾病分组' });
        }

        function GetOrg(id, name) {
            if ($("#<%=hidPlanType.ClientID %>").val() == "1") {
                $("#<%=hidToOrgId1.ClientID %>").val(id);
                $("#<%=txtToOrg.ClientID %>").val(name);

                $("#<%=hidDiseaseId1.ClientID %>").val("-1");
                $("#<%=txtDisease.ClientID %>").val("");
            }
            else if ($("#<%=hidPlanType.ClientID %>").val() == "0") {
                $("#<%=txtPersonOrgID.ClientID %>").val(id);
                $("#<%=txtPersonOrg.ClientID %>").val(name);

                $("#<%=txtPersonDeseaseID.ClientID %>").val("-1");
                $("#<%=txtPersonDesease.ClientID %>").val("");
            }

        }

        function GetDisease(id, name, type) {
            if ($("#<%=hidPlanType.ClientID %>").val() == "1") {
                
                $("#<%=hidDiseaseId1.ClientID %>").val(id);
                $("#<%=txtDisease.ClientID %>").val(name);
            }
            else if ($("#<%=hidPlanType.ClientID %>").val() == "0") {
                $("#<%=txtPersonDeseaseID.ClientID %>").val(id);
                $("#<%=txtPersonDesease.ClientID %>").val(name);
            }

        }

        //关闭
        CloseDialg = function () {
            if ($("#<%=hidPlanType.ClientID %>").val() == "1") {
                $("div[id!='advancedSearchDiv1']").dialog('close');
            }
            else if($("#<%=hidPlanType.ClientID %>").val() == "0") {
                $("div[id!='PersonSearchDiv1']").dialog('close');
            }
        }

        hmShowModal = function (title, url, width, height, callback) {

            var w_title = title;
            var $browser = $.browser;

            if ($browser.msie)
                $("<div style='width:" + width + "px;height:100%;' id='divchooseFrame'><iframe  scrolling='auto' width='100%' height='100%'  frameborder=0  id='ChooseFrame' src='" + url + "' /></div>").dialog({ autoOpen: true, width: width, height: height || 700, showTitle: false, draggable: false, bgiframe: true, modal: true, title: w_title, close: callback });
            else {
                if (height) {
                    height = height - 180;
                }
                $("<div style='width:100%;' id='divchooseFrame'><iframe  scrolling='auto' width='100%' height='100%'  frameborder=0  id='ChooseFrame' src='" + url + "' /></div>").dialog({ autoOpen: true, width: width, height: height || 500, showTitle: false, draggable: false, bgiframe: true, modal: true, title: w_title, close: callback });
            }
        }
       
    </script>
    <script type="text/javascript" language="javascript">
        resizeParentFrame();
        window.setTimeout("resizeParentFrame()", 700);
    </script>
</asp:Content>
