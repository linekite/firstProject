<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HealthPlanEdit.aspx.cs"
    MasterPageFile="~/MainContent.Master" Inherits="Chm.Web.Admin.HealthPlan.HealthPlanEdit" %>

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

        var dateNow = new Date();
        var dateNowDay = dateNow.getFullYear() + "-" + pad((dateNow.getMonth()) + 1,2) + "-" + pad(dateNow.getDate(),2);
       
       

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

        $(function () {
            InitEvent();
//            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
//            function EndRequestHandler(sender, args) {
//                InitEvent();
//            }
        });

        //字符串转换时间
        function ConvertDateTime(obj) {
            var StartTime = $.trim(obj).replace(/-/g, '/').split('/');
            if (StartTime.length != 0) {
                return new Date(StartTime[0], StartTime[1] - 1, StartTime[2]);
            }
            return null;
        }

        function InitEvent() {

            $('#MessageContent').keyup(function () {
                var length = parseInt($(this).attr('maxLen'));
                var info = $(this).val();
                if (info.Length > length) {
                    $(this).val(info.substring(0, length));
                }
            });
            var urlObj = getarg("type");
            if (parseInt(urlObj) == 2) {
                $("#<%=clickType.ClientID %>").val("tagContent1")
            }
            if (parseInt(urlObj) == 1) {
                $("#<%=clickType.ClientID %>").val("tagContent0")
            }

            if ($("#<%=clickType.ClientID %>").val() == "tagContent0") {
                $('#MessagePlan').click();
            }
            if ($("#<%=clickType.ClientID %>").val() == "tagContent1") {
                $('#EmailPlan').click();
            }
            if ($("#<%=clickType.ClientID %>").val() == "tagContent2") {
                $('#AfollowPlan').click();
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


        function CheckForm() {
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

            return true;
        }

        String.prototype.replaceAll = function (s1, s2) {
            return this.replace(new RegExp(s1, "gm"), s2);
        }

        function ShowMessage(info, day, time, type) {
            var content = info.replaceAll("<br/>", "\r\n");
            $('#MessageContent').val(content);
            $('#<%=SendTimeDay.ClientID%>').val(day);
            if (parseInt(type) == 1) {
                $('#<%=SendTime.ClientID %>').val(time);
            } else {
                $('#<%=SendTime.ClientID %>').val(time);
            }
            $('#MessageContent').attr('disabled', 'disabled');
            $('#<%=SendTimeDay.ClientID%>').attr('disabled', 'disabled');
            $('#<%=SendTime.ClientID%>').attr('disabled', 'disabled');
            $('#btnEdit').hide();
            $('#btnDetails').show();
            showDiv('查看信息');
        }


        function EditMessage(info, day, time, type, id) {
            var content = info.replaceAll("<br/>", "\r\n");
            $('#MessageContent').val(content);
            $('#<%=SendTimeDay.ClientID%>').val(day);
            if (parseInt(type) == 1) {
                $('#<%=SendTime.ClientID %>').val(time);
            } else {
                $('#<%=SendTime.ClientID %>').val(time);
            }
            $('#MessageContent').attr('disabled', '');
            $('#<%=SendTimeDay.ClientID%>').attr('disabled', '');
            $('#<%=SendTime.ClientID%>').attr('disabled', '');
            $('#btnEdit').show();
            $('#btnDetails').hide();
            $('#hidDetailId').val(id);
            $('#hidDetailType').val(type);
            showDiv('修改信息');
        }

        function SaveMessage() {
            var info = $.trim($('#MessageContent').val());
            var day = $.trim($('#<%=SendTimeDay.ClientID%>').val());
            var id = $.trim($('#hidDetailId').val());
            var type = $.trim($('#hidDetailType').val());
            var time = $.trim($('#<%=SendTime.ClientID %>').val());
            var planStartTime = $.trim($('#<%=tpStartTime.ClientID %>').val());
            var planEndTime = $.trim($('#<%=tpEndTime.ClientID %>').val());
            if (info == "") {
                alert('信息内容不能为空!');
                return false;
            }
            if (day == "") {
                alert('发送日期不能为空!');
                return false;
            }
            if (time == "") {
                alert('发送时间不能为空!');
                return false;
            }

            if (ConvertDateTime(day) < ConvertDateTime(planStartTime)) {
                alert('发送日期不能小于保健计划的开始日期!');
                return false;
            }
            if (ConvertDateTime(day) > ConvertDateTime(planEndTime)) {
                alert('发送日期不能大于保健计划的结束日期!');
                return false;
            }
            $.ajax({
                type: "POST",
                url: "SaveMessage.ashx?type=" + type + "&id=" + id + "&day=" + day + "&time=" + time,
                data: { "info": encodeURI(info) },
                dataType: 'json',
                cache: false,
                success: function (msg) {
                    var obj = eval(msg);
                    if (msg[0].Result) {
                        closeDiv();
                        switch (parseInt(type)) {
                            case 1:
                                $('#<%=SubMsgRefresh.ClientID %>').click();
                                break;
                            case 2:
                                $('#<%=SubEmailRefresh.ClientID %>').click();
                                break;
                        }
                    }
                    alert(msgmsg[0].Info);
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    var result = eval(XMLHttpRequest.responseText);
                    if (result[0].Result) {
                        closeDiv();
                        switch (parseInt(type)) {
                            case 1:
                                $('#<%=SubMsgRefresh.ClientID %>').click();
                                break;
                            case 2:
                                $('#<%=SubEmailRefresh.ClientID %>').click();
                                break;
                        }
                    }
                    alert(result[0].Info);
                }
            });
            if ($('#<%=hidPlanType.ClientID %>').val() == "0") {
                followPlanState(true);
            }
            else {
                followPlanState(false);
            }
        }


        function AddMessage(type) {
            if (type == 3) {
                var title = "新增随访计划";
                var planId = $('#<%=PlanId.ClientID %>').val();
                var url = "FollowUPAdd.aspx?pi=1&Mode=1&PlanID=" + planId + '&_pi=<%=MemberManager.SelectedId%>';
                location.href = url;
            }
            else {
                var planStartTime = $.trim($('#<%=tpStartTime.ClientID %>').val());
                if (planStartTime == "") {
                    alert('计划开始时间不能为空！');
                    return false;
                }
                var planEndTime = $.trim($('#<%=tpEndTime.ClientID %>').val());
                if (planEndTime == "") {
                    alert('计划结束时间不能为空！');
                    return false;
                } 
                var currentTime = new Date().toLocaleDateString();
                var maxMsgTime = $.trim($('#<%=gvMessage.ClientID %> tr td:eq(3)').last().html());
                if (maxMsgTime != "") {
                    maxMsgTime = maxMsgTime.split(' ')[0];
                    if (ValidTime(dateNowDay, maxMsgTime)) {
                        var EndTime = $.trim(maxMsgTime).replace(/-/g, '/').split('/');
                        if (EndTime.length != 0) {
                            var dateSt = new Date(EndTime[0], EndTime[1] - 1, EndTime[2]);
                            dateSt.setDate(dateSt.getDate() + 1);
                            maxMsgTime = dateSt.getFullYear() + "-" + pad((dateSt.getMonth() + 1), 2) + "-" + pad(dateSt.getDate(), 2);
                        } 
                    }
                    else {
                        maxMsgTime = dateNowDay;
                    }
                } 
                else {
                    //                    maxMsgTime = currentTime.replace('年', '-').replace('月', '-').replace('日', '');
                    if (ValidTime(dateNowDay, planStartTime)) {
                        maxMsgTime = planStartTime;
                    }
                    else {
                        maxMsgTime = dateNowDay;
                    }
                }

                var maxEmailTime = $.trim($('#<%=gvEmail.ClientID %> tr td:eq(3)').last().html());
                if (maxEmailTime != "") {
                    maxEmailTime = maxEmailTime.split(' ')[0];
                    if (ValidTime(dateNowDay, maxEmailTime)) {
                        var EndTime = $.trim(maxEmailTime).replace(/-/g, '/').split('/');
                        if (EndTime.length != 0) {
                            var dateSt = new Date(EndTime[0], EndTime[1] - 1, EndTime[2]);
                            dateSt.setDate(dateSt.getDate() + 1);
                            maxEmailTime = dateSt.getFullYear() + "-" + pad((dateSt.getMonth() + 1), 2) + "-" + pad(dateSt.getDate(), 2);
                        }
                    }
                    else {
                        maxEmailTime = dateNowDay;
                    }
                } else {
                    //                    maxEmailTime = currentTime.replace('年', '-').replace('月', '-').replace('日', '');
                    if (ValidTime(dateNowDay, planStartTime)) {
                        maxEmailTime = planStartTime;
                    }
                    else {
                        maxEmailTime = dateNowDay;
                    }
               
                }
                var planId = $('#<%=PlanId.ClientID %>').val();
                var planType = $('#<%=hidPlanType.ClientID %>').val();
                var title = "新增" + (type == 1 ? "短信" : "邮件") + "信息";
                //需要传递的参数为：planType:计划类型,type:信息类型,planId:计划ID,planEndTime：计划结束时间,maxMsgTime:短信发送的最后日期,maxEmailTime:邮件发送的最后日期
                var url = "MessageAdd.aspx?pi=1&Mode=1&planType=" + planType + "&type=" + type + "&planId=" + planId + "&planEndTime=" + planEndTime + "&maxMsgTime=" + maxMsgTime + "&maxEmailTime=" + maxEmailTime + '&_pi=<%=MemberManager.SelectedId%>' + '&HMResource=' + $('#<%=flag.ClientID %>').val();
                location.href = url;
            }
        }



        function DeleteCheck(type) {
            var checkedCK;
            if (type == 1) {
                checkedCK = $("#<%=gvMessage.ClientID %> input[type=checkbox]:checked").not(":disabled").not('[id=chkSelAll]');
            } else if (type == 2) {
                checkedCK = $("#<%=gvEmail.ClientID %> input[type=checkbox]:checked").not(":disabled").not('[id=chkSelAll]');
            }
            else if (type == 3) {
                checkedCK = $("#<%=gvFollowUp.ClientID %> input[type=checkbox]:checked").not(":disabled").not('[id=chkSelAll]');
            }
            if (checkedCK.length < 1) {
                alert('请选择一条需要删除的数据!')
                return false;
            }
            return confirm('您确定要删除选定的数据吗？');
        }


        function SelectAll(gvId, obj) {
            $("#" + gvId + " :checkbox").not(":disabled").attr("checked", $(obj).attr("checked"));
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

            $("#<%=clickType.ClientID %>").val(showContent);
        }

        function showDiv(obj) {
            $("#ShowMessage").dialog({ autoOpen: true, width: 500, height: 270, showTitle: true, modal: true, title: obj });
        }
        function closeDiv() {
            $("#ShowMessage").dialog('close');
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
     <div class="pf_tab">
      <span id="spanTitle" runat="server">保健计划</span>
      &gt;&gt; <span id="spanTitleDetail" runat="server">修改个人保健计划</span>
    </div>
     <div class="hy_sj">
       
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
                        <Chy:XTextBox ID="txtLevel" runat="server"   Width="115"  >
                        </Chy:XTextBox>
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
                    <%-- <div class="hy_jb" style=" width:355px">--%>
                        <Chy:XTextBox ID="txtUserName1" runat="server" class="inputtext"  Width="355">
                        </Chy:XTextBox>
                       <%-- <div class="hy_sel">
                        <input type="button" onmousedown="this.className='hy_sel_bd_h'"
                                        onmouseout="this.className='hy_sel_bd'" class="hy_sel_bd" id="btnView" value="查看"/>
                                        </div>
                          </div>--%>
                           <img alt="查看" id="btnView" src="../../Image/search.png"
                                style="cursor: hand"  title="查看"/>
                    </td>
                   </tr>
             </table>
             

      </div>
      <div  class="hy_sj">
         <asp:UpdatePanel runat="server" ID="UpdatePanel3"><ContentTemplate>
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
                        <Chy:XDatePicker ID="tpStartTime" runat="server" DateFmt="yyyy-MM-dd" MinDate="%y-%M-%d">
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
                    <td colspan="9" align="center">
                        <Chy:XButton ID="btnSave" runat="server" Text='保存' CssClass="button" OnClick="btnSave_Click"
                            OnClientClick="return CheckForm();" />
                        <span class="space"></span>
                        <input type="button" class="button" value="返回" onclick="Canncel()" />
                    </td>
                 </tr>                     
                <tr>
                    <td class="input">
                    <asp:HiddenField ID="flag" Value="tagContent0" runat="server" />
                    </td>
                </tr>
            </table>
            </ContentTemplate></asp:UpdatePanel>
       </div> 
        <div class="sf_con">
                <ul id="tags" class="tags">
                    <li class="selectTag"><a id="MessagePlan" onclick="selectTag('tagContent0',this);return false;"
                        href="javascript:void(0)">短信计划</a> </li>
                    <li><a id="EmailPlan" onclick="selectTag('tagContent1',this);return false;" href="javascript:void(0)">
                        邮件计划</a> </li>
                    <li id="followPlan" style="display: none"><a id="AfollowPlan" onclick="selectTag('tagContent2',this);return false;"
                        href="javascript:void(0)">随访计划</a></li>
                </ul>
                <asp:HiddenField runat="server" ID="clickType" Value="1" />
                <div id="tagContent">
                    <%--  短信开始--%>
                    <div class="tagContent selectTag" id="tagContent0">
                        <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 10px 0px;">
                            <tr>
                                <td>
                                    <input type="button" class="addbutton" value="新增" onclick="AddMessage(1)" />
                                    <Chy:XButton ID="btnMsgDel" runat="server" CssClass="delbutton" Text="删除" OnClientClick="return DeleteCheck(1);"
                                        OnClick="btnMsgDel_Click" />
                                </td>
                            </tr>
                        </table>
                                <Chy:XGridView ID="gvMessage" runat="server" CssClass="zebratable" AllowPaging="true"
                                    Width="99%" DataKeyNames="DetailID" AutoGenerateColumns="False" PagerSettings-PageButtonCount="8"
                                    PageSize="5" OnBindCstm="gvMessage_BindCstm" HorizontalAlign="Center" OnRowDataBound="gvMessage_RowDataBound">
                                    <Columns>
                                        <asp:TemplateField HeaderStyle-CssClass="check" ItemStyle-Width="24px" ItemStyle-CssClass="check">
                                            <HeaderTemplate>
                                                <input id="chkSelAll" type="checkbox" onclick="SelectAll('<%=gvMessage.ClientID %>',this)" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkSelItem" name='chk' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <%--<asp:TemplateField ShowHeader="true" ItemStyle-Width="100px" HeaderText="收件人">
                                            <ItemTemplate>
                                                <span name="receiver"></span>
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>
                                        <asp:TemplateField ShowHeader="true" HeaderText="短信内容">
                                            <ItemTemplate>
                                               <%#ShowInfoContent(Eval("InfoContent"))%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ShowHeader="true" HeaderText="发送状态" ItemStyle-Width="100px">
                                            <ItemTemplate>
                                                 <%# ShowSendStaus(Eval("Status"))%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ShowHeader="true" HeaderText="发送时间" ItemStyle-Width="120px">
                                            <ItemTemplate>
                                                <%#string.IsNullOrEmpty(Eval("WaitTime").ToString()) ? "" : Convert.ToDateTime(Eval("WaitTime")).ToString("yyyy-MM-dd HH:mm")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ShowHeader="true" ItemStyle-Width="50px" HeaderText="查看">
                                            <ItemTemplate>
                                                <a href="Javascript:void(0);" onclick="ShowMessage('<%#Eval("InfoContent").ToString().Replace("\'", "\"").Replace("\"", "&quot;") %>','<%#string.IsNullOrEmpty(Eval("WaitTime").ToString())?"":Convert.ToDateTime(Eval("WaitTime")).ToString("yyyy-MM-dd") %>','<%#(string.IsNullOrEmpty(Eval("WaitTime").ToString()) ? "" : Convert.ToDateTime(Eval("WaitTime")).ToString("HH:mm"))  %> ',1)">
                                                    查看</a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ShowHeader="true" ItemStyle-Width="50px" HeaderText="修改">
                                            <ItemTemplate>
                                                <%#Eval("Status").ToString() == "0" ? "<a href=\"Javascript:void(0);\" onclick=\"EditMessage('" + Eval("InfoContent").ToString().Replace("\'", "\"").Replace("\"", "&quot;") + "','" + (string.IsNullOrEmpty(Eval("WaitTime").ToString()) ? "" : Convert.ToDateTime(Eval("WaitTime")).ToString("yyyy-MM-dd")) + "','" + (string.IsNullOrEmpty(Eval("WaitTime").ToString()) ? "" : Convert.ToDateTime(Eval("WaitTime")).ToString("HH:mm")) + "',1," + Eval("DetailID") + ")\"> 修改</a>" : "<span style=\"color:#ccc\">修改</span>"%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </Chy:XGridView>
                                <Chy:XButton ID="SubMsgRefresh" runat="server" CssClass="delbutton" OnClick="SubMsgRefresh_Click"
                                    Style="display: none;" />
                                    
                    </div>
                    <%-- 短信结束--%>
                    <%-- 邮件开始--%>
                    <div class="tagContent" id="tagContent1">
                        <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 10px 0px;">
                            <tr>
                                <td>
                                    <input type="button" class="addbutton" value="新增" onclick="AddMessage(2)" />
                                    <Chy:XButton ID="btnEmailDel" runat="server" CssClass="delbutton" Text="删除" OnClientClick="return DeleteCheck(2);"
                                        OnClick="btnEmailDel_Click" />
                                </td>
                            </tr>
                        </table>

                                <Chy:XGridView ID="gvEmail" runat="server" CssClass="zebratable" AllowPaging="true"
                                    Width="99%" DataKeyNames="DetailID" AutoGenerateColumns="False" PagerSettings-PageButtonCount="8"
                                    PageSize="5" OnBindCstm="gvEmail_BindCstm" HorizontalAlign="Center" OnRowDataBound="gvEmail_RowDataBound">
                                    <Columns>
                                        <asp:TemplateField HeaderStyle-CssClass="check" ItemStyle-Width="24px" ItemStyle-CssClass="check">
                                            <HeaderTemplate>
                                                <input id="chkSelAll" type="checkbox" onclick="SelectAll('<%=gvEmail.ClientID %>',this)" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkSelItem" name='chk' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <%-- <asp:TemplateField ShowHeader="true" ItemStyle-Width="100px" HeaderText="收件人">
                                            <ItemTemplate>
                                                <span name="receiver"></span>
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>
                                        <asp:TemplateField ShowHeader="true" HeaderText="邮件内容">
                                            <ItemTemplate>
                                                <%#ShowInfoContent(Eval("InfoContent"))%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ShowHeader="true" HeaderText="发送状态" ItemStyle-Width="100px">
                                            <ItemTemplate>
                                                  <%# ShowSendStaus(Eval("Status"))%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ShowHeader="true" HeaderText="发送时间" ItemStyle-Width="120px">
                                            <ItemTemplate>
                                                <%#string.IsNullOrEmpty(Eval("WaitTime").ToString()) ? "" : Convert.ToDateTime(Eval("WaitTime")).ToString("yyyy-MM-dd HH:mm")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ShowHeader="true" ItemStyle-Width="50px" HeaderText="查看">
                                            <ItemTemplate>
                                                <a href="Javascript:void(0);" onclick="ShowMessage('<%#Eval("InfoContent").ToString().Replace("\'", "\"").Replace("\"", "&quot;") %>','<%#string.IsNullOrEmpty(Eval("WaitTime").ToString())?"":Convert.ToDateTime(Eval("WaitTime")).ToString("yyyy-MM-dd") %>','<%#(string.IsNullOrEmpty(Eval("WaitTime").ToString()) ? "" : Convert.ToDateTime(Eval("WaitTime")).ToString("HH:mm"))  %> ',2)">
                                                    查看</a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ShowHeader="true" ItemStyle-Width="50px" HeaderText="修改">
                                            <ItemTemplate>
                                                <%#Eval("Status").ToString() == "0" ? "<a href=\"Javascript:void(0);\" onclick=\"EditMessage('" + Eval("InfoContent").ToString().Replace("\'", "\"").Replace("\"", "&quot;") + "','" + (string.IsNullOrEmpty(Eval("WaitTime").ToString()) ? "" : Convert.ToDateTime(Eval("WaitTime")).ToString("yyyy-MM-dd")) + "','" + (string.IsNullOrEmpty(Eval("WaitTime").ToString()) ? "" : Convert.ToDateTime(Eval("WaitTime")).ToString("HH:mm")) + "',2," + Eval("DetailID") + ")\"> 修改</a>" : "<span style=\"color:#ccc\">修改</span>"%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </Chy:XGridView>
                                <Chy:XButton ID="SubEmailRefresh" runat="server" CssClass="delbutton" OnClick="SubEmailRefresh_Click"
                                    Style="display: none;" />
                          
                    </div>
                    <%-- 邮件结束--%>
                    <%-- 随访计划开始 --%>
                    <div class="tagContent" id="tagContent2">
                        <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin: 10px 0px;">
                            <tr>
                                <td>
                                    <input type="button" class="addbutton" value="新增" onclick="AddMessage(3)" />
                                    <Chy:XButton ID="btnFolPlanDel" runat="server" CssClass="delbutton" Text="删除" OnClientClick="return DeleteCheck(3);"
                                        OnClick="btnFolPlanDel_Click" />
                                </td>
                            </tr>
                        </table>

                                <Chy:XGridView ID="gvFollowUp" runat="server" CssClass="zebratable" AllowPaging="true"
                                    Width="99%" DataKeyNames="HealthFUID" AutoGenerateColumns="False" PagerSettings-PageButtonCount="8"
                                    PageSize="5" HorizontalAlign="Center" OnBindCstm="gvFollowUp_BindCstm" OnRowDataBound="gvFollowUp_RowDataBound">
                                    <Columns>
                                        <asp:TemplateField HeaderStyle-CssClass="check" ItemStyle-Width="24px" ItemStyle-CssClass="check">
                                            <HeaderTemplate>
                                                <input id="chkSelAll" type="checkbox" onclick="SelectAll('<%=gvFollowUp.ClientID %>',this)" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkSelItem" name='chk' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="FollowDoctorName" HeaderText="随访医生"></asp:BoundField>
                                        <asp:TemplateField ShowHeader="true" HeaderText="随访目的">
                                            <ItemTemplate>
                                                <%# Eval("FollowAim").ToString().Length > 30 ? Eval("FollowAim").ToString().Substring(0,30) + "..." : Eval("FollowAim").ToString() %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ShowHeader="true" HeaderText="状态" ItemStyle-Width="100px">
                                            <ItemTemplate>
                                                <%#Convert.ToInt32(Eval("STATUS")) == 0 ? "计划" : (Convert.ToInt32(Eval("STATUS")) == 1 ? "已完成" : "取消")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ShowHeader="true" HeaderText="随访日期" ItemStyle-Width="100px">
                                            <ItemTemplate>
                                                <%--<%# Convert.ToDateTime( Eval("FollowTime")).ToString("yyyy-MM-dd") %>--%>
                                                <%#Convert.ToDateTime(Eval("FollowTime")).ToString("yyyy-MM-dd") == "0001-01-01" ? "" : Convert.ToDateTime(Eval("FollowTime")).ToString("yyyy-MM-dd")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ShowHeader="true" ItemStyle-Width="50px" HeaderText="查看">
                                            <ItemTemplate>
                                                <a href="Javascript:void(0);" onclick='ShowFollowUp(<%# Eval("HealthFUID") %>)'>查看</a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ShowHeader="true" ItemStyle-Width="50px" HeaderText="修改">
                                            <ItemTemplate>
                                                <%# "<a href=\"Javascript:void(0);\" onclick=\"EditFollowup('" + Eval("HealthFUID") + "')\"> 修改</a>" %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </Chy:XGridView>
                                <asp:HiddenField ID="hidFollowInfo" runat="server" />
                                            
                    </div>
                    <%-- 随访计划结束 --%>
                </div>
            </div>
                    
                <%--短信发送时间--%>
                <asp:HiddenField ID="MessageSendTime" runat="server" />
                <%--邮件发送时间--%>
                <asp:HiddenField ID="EmailSendTime" runat="server" />
                <%--计划ID--%>
                <asp:HiddenField ID="PlanId" runat="server" />
                <%--计划类型--%>
                <asp:HiddenField ID="hidPlanType" runat="server" />
        
    <div id="ShowMessage" style="display: none; width: 470px;">
        <table border="0" cellspacing="0" cellpadding="0" class="formcontainer" align="center">
            <tr>
                <td valign="top">
                    <span style="color: red">*</span>
                </td>
                <td valign="top" class="label">
                    正文：
                </td>
                <td class="input">
                    <textarea name="textarea" id="MessageContent" rows="8" class="inputarea" onmouseover="this.className='inputareahover'"
                        onmouseout="this.className='inputarea'" style="width: 380px;" MaxLen="2000"></textarea>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td colspan="2">
                    <table border="0" cellspacing="0" cellpadding="0" class="formcontainer">
                        <tr>
                            <td>
                                <span style="color: red">*</span>
                            </td>
                            <td class="label">
                                设定发送日期：
                            </td>
                            <td class="input">
                                <Chy:XDatePicker ID="SendTimeDay" runat="server" DateFmt="yyyy-MM-dd" MinDate="%y-%M-%d"></Chy:XDatePicker>
                            </td>
                            <td style=" width:20;">&nbsp;</td>
                            <td>
                                <span style="color: red">*</span>
                            </td>
                            <td class="label">
                                发送时间：
                            </td>
                            <td class="input">
                                <Chy:XTextBox ID="SendTime" runat="server" Width="100px" class="inputtext" MaxLength="15"
                                    onClick="WdatePicker({dateFmt:'HH:mm'})"></Chy:XTextBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <table border="0" cellspacing="0" cellpadding="0" align="center">
            <tr>
                <td>
                    <input type="button" id="btnDetails" class="button" value="确定" onmouseover="this.className='hoverbutton'"
                        onmouseout="this.className='button'" onclick="javascript:closeDiv()" />
                    <input type="button" id="btnEdit" class="button" value="确定" onmouseover="this.className='hoverbutton'"
                        onmouseout="this.className='button'" onclick="javascript:SaveMessage()" />
                    <input id="hidDetailId" type="hidden" value="" />
                    <input id="hidDetailType" type="hidden" value="" />
                </td>
            </tr>
        </table>
    </div>
    <div id="divFollowUpMessage" style="display: none; width: 520px;">
        <table border="0" cellspacing="0" cellpadding="0" class="formcontainer" align="center">
            <tbody>
                <tr>
                    <td class="warn">
                    </td>
                    <td class="label">
                        完成状态：
                    </td>
                    <td class="input">
                        <asp:DropDownList runat="server" ID="dplStatus" Width="130px">
                            <asp:ListItem Value="0">计划</asp:ListItem>
                            <asp:ListItem Value="1">已完成</asp:ListItem>
                            <asp:ListItem Value="2">取消</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="warn">
                    </td>
                    <td class="label">
                        随访日期：
                    </td>
                    <td class="input">
                        <Chy:XDatePicker ID="dpFollowTime" runat="server"></Chy:XDatePicker>
                    </td>
                </tr>
                <tr>
                    <td class="warn">
                    </td>
                    <td class="label">
                        随访医生：
                    </td>
                    <td class="input">
                        <Chy:XTextBox ID="txtDoctor" MaxLength="30" runat="server" CssClass="inputtext" Width="130px"></Chy:XTextBox>
                    </td>
                    <td class="warn">
                        <span class="red">*</span>
                    </td>
                    <td class="label">
                        计划随访日期：
                    </td>
                    <td class="input">
                        <Chy:XDatePicker ID="dpPlanTime" runat="server"></Chy:XDatePicker>
                    </td>
                </tr>
                <tr>
                    <td class="warn">
                    </td>
                    <td class="label" valign="top">
                        主要健康问题：
                    </td>
                    <td class="input" valign="top" colspan="4">
                        <asp:TextBox ID="txtSummarize" Rows="5" TextMode="MultiLine" runat="server" MaxLen="2048"
                            Width="380px" CssClass="inputarea" onfocus="OtherControlfocus()" Text=""></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="warn">
                    </td>
                    <td class="label" valign="top">
                        随访目的：
                    </td>
                    <td class="input" valign="top" colspan="4">
                        <Chy:XTextBox ID="txtFollowAim" runat="server" CssClass="inputarea" TextMode="MultiLine"
                            MaxLen="2000" Style="width: 380px; height: 80px" Rows="5"></Chy:XTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="warn">
                    </td>
                    <td class="label" valign="top">
                        随访结果：
                    </td>
                    <td class="input" valign="top" colspan="4">
                        <Chy:XTextBox ID="txtFollowResult" runat="server" CssClass="inputarea" TextMode="MultiLine"
                            MaxLen="2000" Style="width: 380px; height: 80px" Rows="5"></Chy:XTextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        <Chy:XLabel ID="labFolID" runat="server" Style="display: none"></Chy:XLabel>
                    </td>
                </tr>
            </tbody>
        </table>
        <table border="0" cellspacing="0" cellpadding="0" align="center">
            <tr>
                <td>
                    <input type="button" id="btnSaveFollowUP" class="button" value="确定" onmouseover="this.className='hoverbutton'"
                        onmouseout="this.className='button'" onclick="javascript:SaveFloowUp()" />
                    <input type="button" id="btnClose" class="button" value="关闭" onmouseover="this.className='hoverbutton'"
                        onmouseout="this.className='button'" onclick="javascript:closeFollowup()" />
                </td>
            </tr>
        </table>
    </div>

    <div id="showDialog" title="查看会员"  style=" display:none;">
            <table width="99%" cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td>
                    <asp:UpdatePanel runat="server" ID="UpdatePanel1"><ContentTemplate>
                        <Chy:XGridView ID="gvPatientInfo" runat="server" CssClass="zebratable" AllowPaging="true"
                            DataKeyNames="PatientId" AutoGenerateColumns="False" PagerSettings-PageButtonCount="5"
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

    <script type="text/javascript">
        ///followPlan计划的显示与隐藏，state为false为隐藏，为true为显示；
        function followPlanState(state) {
            if (state && document.getElementById("followPlan").style.display == "none") {
                document.getElementById("followPlan").style.display = "none";
            }
            else if (!state && document.getElementById("followPlan").style.display == "") {
                document.getElementById("followPlan").style.display = "none";
            }
        }

        ///焦点落到“主要健康问题”时，焦点转移。
        function OtherControlfocus() {
            document.getElementById("btnClose").focus();
        }
        //查看随访计划
        function ShowFollowUp(Folid) {
            var obj = "查看随访计划";
            GetFollowInfo(Folid);
            setFollowInfoToLook();
            $("#divFollowUpMessage").dialog({ autoOpen: true, width: 550, height: 430, showTitle: true, modal: true, title: obj });
        }
        //修改随访计划
        function EditFollowup(Folid) {
            var obj = "修改随访计划";
            GetFollowInfo(Folid);
            setFollowInfoToEdit();
            $("#divFollowUpMessage").dialog({ autoOpen: true, width: 550, height: 430, showTitle: true, modal: true, title: obj });
        }
        //关闭随访计划
        function closeFollowup() {
            $("#divFollowUpMessage").dialog('close');
        }
        ///获取当前的随访计划内容
        function GetFollowInfo(Folid) {
            $.ajax({
                type: "POST",
                url: "/hc/Common/RmomsDiret.asmx/GetFollowInfo",
                data: "&FollowID=" + Folid,
                success: function (data, status) {
                    if (status == "success") {
                        //HealthFUID|Status|FollowTime|FollowDoctorName|PlanTime|HealthProblem|FollowAim|FollowResult
                        var hfp = data.text.split("|");
                        if (hfp.length > 0) {
                            $("#<%=labFolID.ClientID%>").val(hfp[0]);
                            $("#<%=dplStatus.ClientID%> option").each(function () {
                                if ($(this).val() == hfp[1])
                                    $(this).attr("selected", "true");
                            });
                            $("#<%=dpFollowTime.ClientID %>").val(hfp[2]);
                            $("#<%=txtDoctor.ClientID %>").val(hfp[3]);
                            $("#<%=dpPlanTime.ClientID %>").val(hfp[4]);
                            $("#<%=txtSummarize.ClientID %>").val(hfp[5]);
                            $("#<%=txtFollowAim.ClientID %>").val(hfp[6]);
                            $("#<%=txtFollowResult.ClientID %>").val(hfp[7]);
                        }
                    }
                }
            });
        }
        //设置查看时随访计划的控件状态
        function setFollowInfoToLook() {
            ///隐藏确定按钮
            $("#btnSaveFollowUP").css("display", "none");
            ///限制input的事件
            $("#divFollowUpMessage table input").each(function () {
                $(this).not("#btnClose").attr("disabled", "disabled");
            });
            ///限制textarea的事件
            $("#divFollowUpMessage table textarea").each(function () {
                $(this).bind("focus", function () {
                    OtherControlfocus();
                });
            });
            ///完成状态的限制
            $("#<%=dplStatus.ClientID%>").attr("disabled", "disabled");
        }
        //设置修改时随访计划的控件状态
        function setFollowInfoToEdit() {
            ///显示确定按钮
            $("#btnSaveFollowUP").css("display", "");
            ///放开input的事件
            $("#divFollowUpMessage table input").each(function () {
                $(this).not("#btnClose").attr("disabled", "");
            });
            ///限制textarea的事件
            $("#divFollowUpMessage table textarea").each(function () {
                $(this).not("#<%=txtSummarize.ClientID %>").unbind();
            });
            ///完成状态的限制
            $("#<%=dplStatus.ClientID%>").attr("disabled", "");
        }
        ///保存随访计划
        function SaveFloowUp() {
            if ($.trim($("#<%=dpPlanTime.ClientID %>").val()) == "") {
                alert("随访计划日期不能为空！");
                return false;
            }

            //HealthFUID|Status|FollowTime|FollowDoctorName|PlanTime|FollowAim|FollowResult
            var htmlArry = new Array();
            htmlArry.push($.trim($("#<%=labFolID.ClientID %>").val()));
            htmlArry.push($.trim($("#<%=dplStatus.ClientID%> option:selected").val()));
            htmlArry.push($.trim($("#<%=dpFollowTime.ClientID %>").val()));
            htmlArry.push($.trim($("#<%=txtDoctor.ClientID %>").val()));
            htmlArry.push($.trim($("#<%=dpPlanTime.ClientID %>").val()));
            htmlArry.push($.trim($("#<%=txtFollowAim.ClientID %>").val()));
            htmlArry.push($.trim($("#<%=txtFollowResult.ClientID %>").val()));
            $("#<%=hidFollowInfo.ClientID%>").val(htmlArry.join("^"));

            if ($("#<%=hidFollowInfo.ClientID%>").val() != "") {
                $.ajax({
                    type: "POST",
                    url: "/hc/Common/RmomsDiret.asmx/EditFollowInfo",
                    data: "&FollowInfo=" + $("#<%=hidFollowInfo.ClientID%>").val(),
                    success: function (data, status) {
                        if (status == "success") {
                            alertMsg('修改成功!');
                            window.location.href = 'HealthPlanEdit.aspx?_pi=<%=MemberManager.SelectedId%>&PlanID=<%=Chm.Web.RmomsUnits.GetRequestParameterToInt32("PlanID") %>&_selectNum=3';
                        }
                    }
                });
            }
        
        }

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
        })
        function Canncel() {
           
          document.location.href = "HealthPlanList.aspx?_pi=<%=MemberManager.SelectedId %>" + "&HMResource=" + $("#<%=flag.ClientID %>").val();
          
        }
    </script>
</asp:Content>
