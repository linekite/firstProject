<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MainContent.Master"
    CodeBehind="HealthPlanPersonDetail.aspx.cs" Inherits="Chm.Web.Admin.HealthPlan.HealthPlanPersonDetail" %>

<%@ Import Namespace="Chy.UI.Framework" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/CSS/skin.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../Scripts/layout.js"></script>
    <script src="/Js/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="../../Scripts/MultiLineLength.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">

        $(function() {
            if ($("#<%=clickType.ClientID %>").val() == "tagContent0") {
                $('#ASMSPlan').click();
            }
            if ($("#<%=clickType.ClientID %>").val() == "tagContent1") {
                $('#AmailPlan').click();
            }
            if ($("#<%=clickType.ClientID %>").val() == "tagContent2") {
                $('#AfollowPlan').click();
            }
        });
        String.prototype.replaceAll = function (s1, s2) {
            return this.replace(new RegExp(s1, "gm"), s2);
        }
        function ShowMessage(info, day, time, type) {
            var content = info.replaceAll("<br/>", "\r\n");
            $('#MessageContent').val(content);
            $('#SendTimeDay').val(day);
            if (parseInt(type) == 1) {
                $('#SendTime').val(time);
            } else {
                $('#SendTime').val(time);
            }
            showDiv();
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

      
        //关闭随访计划
        function closeFollowup() {
            $("#divFollowUpMessage").dialog('close');
        }
        //查看随访计划
        function ShowFollowUp(Folid) {
            var obj = "查看随访计划";
            GetFollowInfo(Folid);
            $("#divFollowUpMessage").dialog({ autoOpen: true, width: 550, height: 400, showTitle: true, modal: true, title: obj });
        }
        ///焦点落到“主要健康问题”时，焦点转移。
        function OtherControlfocus() {
            document.getElementById("btnClose").focus();
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
                            $("#<%=txtSummarize.ClientID %>").html(hfp[5]);
                            $("#<%=txtFollowAim.ClientID %>").val(hfp[6]);
                            $("#<%=txtFollowResult.ClientID %>").val(hfp[7]);
                        }
                    }
                }
            });
        }

        function showDiv() {
            $("#ShowMessage").dialog({ autoOpen: true, width: 500, height: 270, showTitle: true, modal: true, title: '查看信息' });
        }
        function closeDiv() {
            $("#ShowMessage").dialog('close');
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
<div class="jhck_tab">
<span id="spanTitle" runat="server">保健计划</span>
&gt;&gt; 查看个人保健计划
</div>
<div class="hy_sj">

                            <table cellpadding="0" cellspacing="0" class="formcontainer" id="topInfo">
                                  <tr>
                                    <td >
                                        &nbsp;
                                    </td>
                                    <td class="label">
                                        计划标题：
                                    </td>
                                    <td colspan="4" class="input">
  
                                        <Chy:xlabel id="txtTitle" runat="server"></Chy:xlabel>
                                    </td>
                                </tr>
                                <tr>
                                     <td >
                                        &nbsp;
                                    </td>
                                    <td class="label">
                                        开始日期：
                                    </td>
                                    <td class="input">
                                        
                                        <Chy:xlabel id="tpStartTime" runat="server"></Chy:xlabel>
                                    </td>
                                    <td class="red">
                                        &nbsp;
                                    </td>
                                    <td class="label">
                                        结束日期：
                                    </td>
                                    <td class="input">
                                        
                                         <Chy:xlabel id="tpEndTime" runat="server"></Chy:xlabel>
                                    </td>
                                </tr>
                              
                                <tr>
                                    <td class="input">
                                    </td>
                                </tr>
                            </table>
                            <div class="con" style="margin-top: 10px;">

                                <ul id="tags" class="clearfix mb_10 tags">
                                    <li class="selectTag"><a id="ASMSPlan" onclick="selectTag('tagContent0',this);return false;" href="javascript:void(0)">
                                        短信计划</a> </li>
                                    <li><a id="AmailPlan" onclick="selectTag('tagContent1',this);return false;" href="javascript:void(0)">邮件计划</a>
                                    </li>
                                    <li  style="display: none"><a id="AfollowPlan" onclick="selectTag('tagContent2',this);return false;"
                                        href="javascript:void(0)">随访计划</a></li>
                                </ul>

                                <asp:HiddenField runat="server" ID="clickType" Value="1" />
                                <div id="tagContent">
                                    <%--  短信开始--%>
                                    <div class="tagContent selectTag" id="tagContent0">

                                                <Chy:XGridView ID="gvMessage" runat="server" CssClass="zebratable" AllowPaging="true"
                                                    Width="100%" DataKeyNames="DetailID" AutoGenerateColumns="False" PagerSettings-PageButtonCount="8"
                                                    PageSize="5" OnBindCstm="gvMessage_BindCstm" HorizontalAlign="Center">
                                                    <Columns>
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
                                                                <%#string.IsNullOrEmpty(Eval("WaitTime").ToString())?"": Convert.ToDateTime(Eval("WaitTime")).ToString("yyyy-MM-dd HH:mm")%>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ShowHeader="true" ItemStyle-Width="50px" HeaderText="查看">
                                                            <ItemTemplate>
                                                                <a href="Javascript:void(0);" onclick="ShowMessage('<%#Eval("InfoContent").ToString().Replace("\'", "\"").Replace("\"", "&quot;") %>','<%#string.IsNullOrEmpty(Eval("WaitTime").ToString())?"":Convert.ToDateTime(Eval("WaitTime")).ToString("yyyy-MM-dd") %>','<%#(string.IsNullOrEmpty(Eval("WaitTime").ToString()) ? "" : Convert.ToDateTime(Eval("WaitTime")).ToString("HH:mm"))  %> ',1)">
                                                                    查看</a>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </Chy:XGridView>

                                    </div>
                                    <%-- 短信结束--%>
                                    <%-- 邮件开始--%>
                                    <div class="tagContent" id="tagContent1">

                                                <Chy:XGridView ID="gvEmail" runat="server" CssClass="zebratable" AllowPaging="true"
                                                    Width="99%" DataKeyNames="DetailID" AutoGenerateColumns="False" PagerSettings-PageButtonCount="8"
                                                    PageSize="5" OnBindCstm="gvEmail_BindCstm" HorizontalAlign="Center">
                                                    <Columns>
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
                                                                <%# string.IsNullOrEmpty(Eval("WaitTime").ToString()) ? "" : Convert.ToDateTime(Eval("WaitTime")).ToString("yyyy-MM-dd HH:mm")%>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ShowHeader="true" ItemStyle-Width="50px" HeaderText="查看">
                                                            <ItemTemplate>
                                                                 <a href="Javascript:void(0);" onclick="ShowMessage('<%#Eval("InfoContent").ToString().Replace("\'", "\"").Replace("\"", "&quot;") %>','<%#string.IsNullOrEmpty(Eval("WaitTime").ToString())?"":Convert.ToDateTime(Eval("WaitTime")).ToString("yyyy-MM-dd") %>','<%#(string.IsNullOrEmpty(Eval("WaitTime").ToString()) ? "" : Convert.ToDateTime(Eval("WaitTime")).ToString("HH:mm"))  %> ',2)">
                                                                    查看</a>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </Chy:XGridView>
      
                                    </div>
                                    <%-- 邮件结束--%>
                                    <%-- 随访计划开始 --%>
                                    <div class="tagContent" id="tagContent2">

                                                <Chy:XGridView ID="gvFollowUp" runat="server" CssClass="zebratable" AllowPaging="true"
                                                    Width="99%" DataKeyNames="HealthFUID" AutoGenerateColumns="False" PagerSettings-PageButtonCount="8"
                                                    PageSize="5" HorizontalAlign="Center" OnBindCstm="gvFollowUp_BindCstm">
                                                    <Columns>                                                        
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
                                                               <%-- <%# Convert.ToDateTime( Eval("FollowTime")).ToString("yyyy-MM-dd") %>--%>
                                                                <%#Convert.ToDateTime(Eval("FollowTime")).ToString("yyyy-MM-dd") == "0001-01-01" ? "" : Convert.ToDateTime(Eval("FollowTime")).ToString("yyyy-MM-dd")%>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ShowHeader="true" ItemStyle-Width="50px" HeaderText="查看">
                                                            <ItemTemplate>
                                                                <a href="Javascript:void(0);" onclick='ShowFollowUp(<%# Eval("HealthFUID") %>)' >查看</a>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>                                                        
                                                    </Columns>
                                                </Chy:XGridView>
                                                <asp:HiddenField ID="hidFollowInfo" runat="server" />
                                          
                                    </div>
                                    <%-- 随访计划结束 --%>
                                </div>
                            </div>
                            <table width="99%" border="0" cellspacing="0" cellpadding="0" align="center" class="formcontainer">
                                <tr>
                                   <td width="40%"></td>
                                    <td align="center">
                                        <Chy:XButton ID="btnEdit" Text="修改" runat="server" CssClass="button" OnClick="btnEdit_Click" />
                                        <input type="button" class="button" value="返回" onclick="javascript:document.location.href='HealthPlanPerson.aspx?_pi=<%=MemberManager.SelectedId %>'" />
                                        <asp:HiddenField ID="MessageSendTime" runat="server" />
                                        <asp:HiddenField ID="EmailSendTime" runat="server" />
                                    </td>
                                </tr>
                            </table>

    <div id="ShowMessage" style="display: none; width: 100px;">
        <table border="0" cellspacing="0" cellpadding="0" class="formcontainer" align="center">
            <tr>
                <td valign="top" class="label">
                    正文：
                </td>
                <td class="input">
                    <textarea name="textarea" id="MessageContent" rows="5" class="inputarea" onmouseover="this.className='inputareahover'"
                        onmouseout="this.className='inputarea'" disabled="disabled" style="width: 380px;"></textarea>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <table border="0" cellspacing="0" cellpadding="0" class="formcontainer">
                        <tr>
                            <td class="label">
                                设定发送日期：
                            </td>
                            <td class="input">
                                <input name="SendTimeDay" type="text" class="inputtext" id="SendTimeDay" onmouseover="this.className='inputtexthover'"
                                    onmouseout="this.className='inputtext'" style="width: 100px;" value="" disabled="disabled" />
                            </td>
                            <td class="label">
                                发送时间：
                            </td>
                            <td class="input">
                                <input name="SendTime" type="text" class="inputtext" id="SendTime" onmouseover="this.className='inputtexthover'"
                                    onmouseout="this.className='inputtext'" style="width: 100px;" value="" disabled="disabled" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <table border="0" cellspacing="0" cellpadding="0" align="center">
            <tr>
                <td>
                    <input type="button" class="button" value="确定" onmouseover="this.className='hoverbutton'"
                        onmouseout="this.className='button'" onclick="javascript:closeDiv()" />
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
                        <asp:DropDownList runat="server" ID="dplStatus" Width="130px" disabled="disabled">
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
                        <Chy:XDatePicker ID="dpFollowTime" runat="server" MinDate="%y-%M-%d" disabled="disabled"></Chy:XDatePicker>
                    </td>
                </tr>
                <tr>
                    <td class="warn">
                    </td>
                    <td class="label">
                        随访医生：
                    </td>
                    <td class="input">
                        <Chy:XTextBox ID="txtDoctor" MaxLength="30" runat="server" CssClass="inputtext" Width="130px" disabled="disabled"></Chy:XTextBox>
                    </td>
                    <td class="warn">
                        <span class="red">*</span>
                    </td>
                    <td class="label">
                        计划随访日期：
                    </td>
                    <td class="input">
                        <Chy:XDatePicker ID="dpPlanTime" runat="server" MinDate="%y-%M-%d" disabled="disabled"></Chy:XDatePicker>
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
                            MaxLen="2000" Style="width: 380px; height: 80px" Rows="5" onfocus="OtherControlfocus()"></Chy:XTextBox>
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
                            MaxLen="2000" Style="width: 380px; height: 80px" Rows="5" onfocus="OtherControlfocus()"></Chy:XTextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        <Chy:XLabel ID="labFolID" runat="server" style="display:none"></Chy:XLabel>
                    </td>
                </tr>
            </tbody>
        </table>
        <table border="0" cellspacing="0" cellpadding="0" align="center">
            <tr>
               <td width="30%"></td>
                <td>    
                      <input type="button" id="btnClose" class="button" value="关闭" onmouseover="this.className='hoverbutton'"
                        onmouseout="this.className='button'" onclick="javascript:closeFollowup()" />
                </td>
            </tr>
        </table>
    </div>
    <div id="bg" class="bg" style="display: none;">
    </div>
    <iframe id='popIframe' class='popIframe' frameborder='0'></iframe>
    </div>
</asp:Content>
