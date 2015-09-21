<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MainContent.Master"
    CodeBehind="HealthInformationList.aspx.cs" Inherits="Chm.Web.Admin.HealthInformation.HealthInformationList" %>

<%@ Register TagPrefix="Chy" Namespace="Chy.UI.Controls" Assembly="Chy.UI.Controls" %>
<%@ Import Namespace="Chy.UI.Framework" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/Js/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <link href="../../Styles/base.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="../../Styles/sp4.css" />
    <script language="javascript" type="text/javascript">

        function ddd(obj, sType) {

            var oSpan = document.getElementById(obj);
            if (sType == 'show') { oSpan.style.display = ''; }
            if (sType == 'hide') { oSpan.style.display = 'none'; }
        }

        function showDiv1(jkFileID) {
            var title = "删除提示";
            var url = "DeleteOrEditjkzxFiles.aspx?JkidFile=" + jkFileID + "&type=delete";
            var height = 200;
            var width = 400;
            $("<div style='width:400%;height:220px'  ><iframe scrolling='none'  width='100%' height='100%'  frameborder=0   src='" + url + "' /></div>").dialog({ autoOpen: true, width: width, height: height, showTitle: false, modal: true, title: title });
        }

        function showDiv2(jkFileID) {
            var title = "修改杂志标题";
            var url = "DeleteOrEditjkzxFiles.aspx?JkidFile=" + jkFileID + "&type=edit";
            var height = 220;
            var width = 400;
            $("<div style='width:100%;height:230px' ><iframe  scrolling='auto' width='100%' height='100%'  frameborder=0   src='" + url + "' /></div>").dialog({ autoOpen: true, width: width, height: height, showTitle: false, modal: true, title: title });
        }

        //关闭
        CloseDialg = function () {
            $('div').dialog('close');
        }

        function AddJkz() {
            var title = "新增健康资讯";
            var url = "JKZXAdd.aspx?type=AddJazx";
            var height = 420;
            var width = 550;
            $("<div style='width:100%;height:420px' ><iframe  scrolling='auto' width='98%' height='98%'  frameborder=0   src='" + url + "' /></div>").dialog({ autoOpen: true, width: width, height: height, showTitle: false, modal: true, title: title });

        }

        function AddJkzFiles(jkid, IsAuidt) {
            var title = "添加健康资讯内容";
            var url = "JKZXAdd.aspx?Jkid=" + jkid + "&type=AddJazxFiles&IsAuidt=" + IsAuidt;
            var height = 420;
            var width = 550;
            $("<div style='width:100%;height:420px' ><iframe  scrolling='auto' width='98%' height='98%'  frameborder=0   src='" + url + "' /></div>").dialog({ autoOpen: true, width: width, height: height, showTitle: false, modal: true, title: title });

        }
        $(function () {
            $('#<%=btnDelete.ClientID %>').click(function () {
                return confirmMsg('<%=btnDelete.UniqueID %>', '删除之后会把该期刊下的所有杂志文件删除，您确定要删除吗？', '系统i消息', 400, 200);

            });

            $('#<%=btnPublsh.ClientID %>').click(function () {
                return confirmMsg('<%=btnPublsh.UniqueID %>', '确定要发布选定的健康资讯吗？', '系统i消息', 400, 200);

            });

        });

        function CloseUpLoad() {
            $('div').dialog('close');
            $("#<%=btnrefreshFiles.ClientID %>").click();
            $("#<%=Button1.ClientID %>").click();

        }

        function CloseSave() {
            $('div').dialog('close');
            $("#<%=btnrefreshFiles.ClientID %>").click();
        }


     
    </script>
    <script type="text/javascript">

        function selectTagss(showContent, selfObj) {
            // 操作标签
            var tag = document.getElementById("zzmenu").getElementsByTagName("li");
            var taglength = tag.length;
            for (i = 0; i < taglength; i++) {
                tag[i].className = "";
            }

            selfObj.parentNode.className = "creet";

            var jkzxValue = $(selfObj).attr("value");
            $("#<%=hidJkzxID.ClientID %>").val(jkzxValue);
            $("#<%=btnRefresh.ClientID %>").click();

            return false;
        }
        var day = 1000 * 60 * 60 * 24;
        var dateNow = new Date();
        var CheckTime = dateNow.getHours() + ":" + dateNow.getMinutes();
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

        //检查结束时间
        function checkTime() {
            $("#<%=hidJkzxID.ClientID %>").val("");
            var StartTime = $.trim($("#<%=dpStartTime.ClientID %>").val()).replace(/-/g, '/').split('/');
            var EndTime = $.trim($("#<%=dpEndTime.ClientID %>").val()).replace(/-/g, '/').split('/');

            if (EndTime.length != 0 && StartTime.length != 0) {
                var dateSt = new Date(StartTime[0], StartTime[1], StartTime[2]);
                var dateEd = new Date(EndTime[0], EndTime[1], EndTime[2]);
                if (dateSt > dateEd) {
                    alertMsg('<%=Chy.Web.Resource.GetString("HM_From_To_Time")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
                    return false;
                }
            }

            return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
    <div style="display: none">
        <asp:Button ID="btnRefresh" runat="server" OnClick="btnRefresh_Click" />
        <asp:Button ID="btnrefreshFiles" runat="server" OnClick="Reshfile_Click" />
        <asp:HiddenField ID="hidJkzxID" runat="server" Value="0" />
        <asp:Button ID="Button1" runat="server" OnClick="btnRefreshJkzxKist_Click" />
    </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table width="99%" cellpadding="0" cellspacing="0" class="searchPanel" align="center">
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <%--<td class="label">
                                    健康杂志期数：
                                </td>--%>
                        <td class="input">
                            <Chy:XTextBox ID="txtQs" runat="server" CssClass="inputtext serinput" Visible="false">
                            </Chy:XTextBox>
                        </td>
                        <td class="label">
                            标题：
                        </td>
                        <td class="input">
                            <Chy:XTextBox ID="txtTitle" runat="server" CssClass="inputtext serinput">
                            </Chy:XTextBox>
                        </td>
                        <td class="label">
                            创建时间：
                        </td>
                        <td class="input">
                            <Chy:XDatePicker ID="dpStartTime" Width="120px" runat="server">
                            </Chy:XDatePicker>
                            &nbsp;至&nbsp;
                            <Chy:XDatePicker ID="dpEndTime" Width="120px" runat="server">
                            </Chy:XDatePicker>
                        </td>
                        <td class="label">
                            <Chy:XButton ID="btnSearch" runat="server" Text="查询" CssClass="button" OnClick="btnSearch_Click"
                                OnClientClick="return checkTime();" />
                        </td>
                    </tr>
                </table>
            </td>
            <td class="add" nowrap>
                <input type="button" class="zz_add_button" value="新增杂志" onclick="javascript:AddJkz()" />
            </td>
        </tr>
    </table>
    <table width="99%" border="0" cellspacing="0" cellpadding="0" class="zz_tab">
        <tr>
            <td width="140" class="zz_list" valign="top">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <ul id="zzmenu">
                            <asp:Repeater ID="RTJkzxList" runat="server">
                                <ItemTemplate>
                                    <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("JKZXID") %>' />
                                    <li>
                                        <%# string.Concat(Eval("IsAuidt"),"")=="0"? "<img src='../../Images/df.gif' />":"" %>
                                        <asp:LinkButton ID="lbtnDetail" OnClientClick="return selectTagss(zzcont0,this); "
                                            value='<%# Eval("JKZXID") %>' runat="server" Text='<%# Eval("QS") %>'></asp:LinkButton>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                        <div class="zz_page">
                            <div id="PageInfo" runat="server" class="anpager">
                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
            <td valign="top" id="zzcont">
                <div class="zzcont creet" id="zzcont0">
                    <table cellpadding="0" cellspacing="0" class="zz_detiall" width="100%" align="center">
                        <tr>
                            <td class="label">
                                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                    <ContentTemplate>
                                        创建人：<Chy:XLabel ID="lblCreate" runat="server">
                                        </Chy:XLabel>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                            <td>
                                <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                    <ContentTemplate>
                                        创建时间：<Chy:XLabel ID="lblCreateTime" runat="server">
                                        </Chy:XLabel>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                            <td class="add" rowspan="2">
                                <asp:Button ID="Button2" runat="server" Text="添加杂志内容" CssClass="zz_add_button" OnClick="btnADd_Click" />
                                <asp:Button ID="btnDelete" runat="server" Text="删除本期杂志" CssClass="zz_del_button"
                                    OnClick="btnDelete_Click" />
                                <asp:Button ID="btnPublsh" runat="server" Text="审核发布" CssClass="zz_fb_button" OnClick="btnAuitd_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td class="label">
                                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                    <ContentTemplate>
                                        发布人：<Chy:XLabel ID="lblPulshName" runat="server">
                                        </Chy:XLabel>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                            <td>
                                <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                    <ContentTemplate>
                                        发布时间：<Chy:XLabel ID="lblPulishTime" runat="server">
                                        </Chy:XLabel>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                    <table border="0" cellpadding="2" cellspacing="2" width="100%">
                        <tr>
                            <td>
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <Chy:XGridView ID="gvJkzxFiles" runat="server" CssClass="zebratable" AllowPaging="true"
                                            Width="100%" DataKeyNames="FileID" AutoGenerateColumns="False" PagerSettings-PageButtonCount="8"
                                            PageSize="5" HorizontalAlign="left">
                                            <Columns>
                                                <asp:TemplateField HeaderText="文章" ItemStyle-HorizontalAlign="Left">
                                                    <ItemTemplate>
                                                        <%--<a href="ShowPDF.aspx?JKZXFileID=<%# Eval("FileID") %>&Login=Doctor&IsAuitd=<%# Eval("IsAuidt")%>"
                                                            target="_blank">
                                                            <%# Eval("FileTitle")%></a>--%>
                                                        <a href='<%=System.Configuration.ConfigurationManager.AppSettings["HM_FilePath"]+"/" %><%# Eval("FileName") %>'
                                                            target="_blank">
                                                            <%# Eval("FileTitle")%></a>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="创建时间">
                                                    <ItemTemplate>
                                                        <%#Eval("CreateTime")%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="浏览次数">
                                                    <ItemTemplate>
                                                        <%#Eval("BrowsNum")%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="操作">
                                                    <ItemTemplate>
                                                        <sapn><img src="../../images/fp_edit.gif"  onclick="javascript:showDiv2('<%# Eval("FileID") %>')" />&nbsp;<img src="../../images/fp_del.gif" onclick="javascript:showDiv1(<%# Eval("FileID") %>)"/></sapn>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </Chy:XGridView>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />
                                        <asp:AsyncPostBackTrigger ControlID="btnRefresh" EventName="Click" />
                                        <asp:AsyncPostBackTrigger ControlID="btnrefreshFiles" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
    <script type="text/javascript" language="javascript">

        $(function () {
            var tag = document.getElementById("zzmenu").getElementsByTagName("li");
            if (tag.length > 0) {
                tag[0].className = "creet";
            }
        });
        var jkzxList = document.getElementById("zzmenu").getElementsByTagName("input");

        if (jkzxList.length > 0) {
            $("#<%=hidJkzxID.ClientID %>").val(jkzxList[0].value);
            $("#<%=btnRefresh.ClientID %>").click();
        }
    </script>
</asp:Content>
