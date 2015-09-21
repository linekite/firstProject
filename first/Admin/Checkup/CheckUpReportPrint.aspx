<%@ Page Language="C#" MasterPageFile="~/MainContent.Master" AutoEventWireup="true"
    CodeBehind="CheckUpReportPrint.aspx.cs" Inherits="Chm.Web.Admin.Checkup.CheckUpReportPrint" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Styles/Common.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
    
    <div id="Print">
        <div id="Div1" width="100%"  style=" display:none" >        
            <table cellspacing="0" cellpadding="0" width="99%" border="0">
                <tr>
                    <td align="center" valign="middle" style="line-height:200%; font-size:22px; font-weight:bold;">                        
                            <%= Chy.Web.Resource.GetString("HM_0296")%>
                    </td>
                </tr>
            </table>        
        </div>
        <div class="report_msgbox">
            <Chy:XTextBox ID="txtType" runat="server" Style="display: none"></Chy:XTextBox>
            <Chy:XTextBox ID="txtHtml" runat="server" Style="display: none"></Chy:XTextBox>
            <table border="0" cellpadding="0" cellspacing="0" width="99%">
                <colgroup>
                    <col style="width: 10%;"></col>
                    <col style="width: 15%;"></col>
                    <col style="width: 10%;"></col>
                    <col style="width: 15%;"></col>
                    <col style="width: 10%;"></col>
                    <col style="width: 10%;"></col>
                    <col style="width: 15%;"></col>
                    <col style="width: 15%;"></col>
                </colgroup>
                <tr>
                    <td class="left">
                        &nbsp;&nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Text="姓名" Font-Size="12px"></asp:Label>
                    </td>
                    <td class="right">
                        <asp:Label ID="lblPatientName" runat="server" Text="" Font-Size="12px" Font-Bold="true"></asp:Label>
                    </td>
                    <td class="left">
                        <asp:Label ID="Label2" runat="server" Text="性别" Font-Size="12px"></asp:Label>
                    </td>
                    <td class="right">
                        <asp:Label ID="lblPatientSex" runat="server" Text="" Font-Size="12px" Font-Bold="true"></asp:Label>
                    </td>
                    <td class="left">
                        <asp:Label ID="Label3" runat="server" Text="年龄" Font-Size="12px"></asp:Label>
                    </td>
                    <td class="right">
                        <asp:Label ID="lblPatientAge" runat="server" Text="" Font-Size="12px" Font-Bold="true"></asp:Label>
                    </td>
                    <td class="left">
                        <asp:Label ID="Label4" runat="server" Text="体检时间" Font-Size="12px"></asp:Label>
                    </td>
                    <td class="right">
                        <asp:Label ID="lblCheckTime" runat="server" Text="" Font-Size="12px" Font-Bold="true"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
        <table border="0" cellpadding="0" cellspacing="0" class="zebratable" width="99%"
            align="center" style="table-layout: fixed">
            <colgroup>
                <col style="width: 15%;"></col>
                <col style="width: 85%;"></col>
            </colgroup>
            <tr class="header">
                <td colspan="2">
                    <%= Chy.Web.Resource.GetString("HM_0062")%>
                </td>
            </tr>
            <tr>
                <td width="15%">
                    <asp:Label ID="lblDocName2" runat="server" Text=""></asp:Label>
                </td>
                <td style="text-align: left; color: #717171; font-size: 12px;">
                    <asp:Label ID="lblDocName" runat="server" Text="" Style="word-wrap: break-word">&nbsp;</asp:Label>
                </td>
            </tr>
            <tr>
                <td width="15%">
                    <asp:Label ID="lblSummarize2" runat="server" Text=""></asp:Label>
                </td>
                <td width="85%" style="text-align: left; color: #717171; font-size: 12px;word-wrap:break-word;word-break:break-all;">
                    <label id="lblSummarize" runat="server" text="" style="word-wrap: break-word">&nbsp;
                    </label>
                </td>
            </tr>
            <tr>
                <td width="15%">
                    <asp:Label ID="lblAdvice2" runat="server" Text=""></asp:Label>
                </td>
                <td width="85%" style="text-align: left; color: #717171; font-size: 12px;word-wrap:break-word;word-break:break-all;">
                    <label id="lblAdvice" runat="server" text="" style="word-wrap: break-word">&nbsp;
                    </label>
                </td>
            </tr>
        </table>
        
        <div align="center">
            <asp:Panel ID="UpdatePanel2" runat="server" UpdateMode="Conditional" CssClass="demolargetable">
                <table width="99%" border="0px" cellspacing="0" cellpadding="0px" class="msgbox_alignment">
                    <asp:Repeater ID="rptCheckClassRecord" runat="server" OnItemDataBound="rptCheckClassRecord_ItemDataBound">
                        <HeaderTemplate>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr align="center">
                                <th style="display: none" colspan="2">
                                    <asp:HiddenField ID="TEst" runat="server" Value="" />
                                    <%# Eval("classRecID")%>&nbsp;
                                </th>
                                <th style="display: none" colspan="2">
                                    <%# Eval("checkRptID")%>&nbsp;
                                </th>
                                <th width="55%" class="msgbox_alignment_left" colspan="2">
                                    <span style="font-weight: bold; text-align: center; color: #006699;word-wrap:break-word;word-break:break-all;">
                                        <%# Eval("ClassName")%></span>&nbsp;
                                </th>
                                <th width="45%" align="right" class="msgbox_alignment_right" colspan="1">
                                    <span style="font-weight: bold; text-align: center; color: #006699">
                                        <%= Chy.Web.Resource.GetString("HM_0046") + Chy.Web.Resource.GetString("Remp_Colon")%></span><span
                                            style="font-weight: bold; text-align: center; color: #006699"><%# Eval("doctor")%></span>
                                </th>
                            </tr>
                            <tr align="center">
                                <td colspan="5">
                                    <table width="100%" border="1px" cellspacing="1px" cellpadding="3px" class="zebratable">
                                        <asp:Repeater ID="rptProject" runat="server" OnItemDataBound="rptProject_ItemDataBound">
                                            <HeaderTemplate>
                                                <tr class="header" align="center">
                                                    <th style="display: none">
                                                        <%# Eval("itemRecordID")%>
                                                    </th>
                                                    <th style="display: none">
                                                        <%# Eval("ClassRecID")%>
                                                    </th>
                                                    <th style="width: 30%;word-wrap:break-word;word-break:break-all;">
                                                        <%= Chy.Web.Resource.GetString("HM_0002")%>
                                                    </th>
                                                    <th style="width: 30%;word-wrap:break-word;word-break:break-all;">
                                                        <%= Chy.Web.Resource.GetString("HM_0048")%>
                                                    </th>
                                                    <th style="width: 15%;word-wrap:break-word;word-break:break-all;">
                                                        <%= Chy.Web.Resource.GetString("HM_0006")%>
                                                    </th>
                                                    <th style="width: 15%;word-wrap:break-word;word-break:break-all;">
                                                        <%= Chy.Web.Resource.GetString("HM_0049")%>
                                                    </th>
                                                    <th style="width: 10%;word-wrap:break-word;word-break:break-all;">
                                                        <%= Chy.Web.Resource.GetString("HM_0018")%>
                                                    </th>
                                                </tr>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr class="normal" align="center">
                                                    <td style="display: none">
                                                        <%# Eval("itemRecordID")%>&nbsp; 
                                                    </td>
                                                    <td style="display: none">
                                                        <%# Eval("ClassRecID")%>&nbsp;
                                                    </td>
                                                    <td style="width: 30%;word-wrap:break-word;word-break:break-all;">
                                                        <%# Eval("ItemName")%>&nbsp;
                                                    </td>
                                                    <td style="width: 30%;word-wrap:break-word;word-break:break-all;">
                                                        <%# Eval("Result")%>&nbsp;
                                                    </td>
                                                    <td style="width: 15%;word-wrap:break-word;word-break:break-all;">
                                                        <%# Eval("Unit")%>&nbsp;
                                                    </td>
                                                    <td style="width: 15%;word-wrap:break-word;word-break:break-all;">
                                                        <%# Eval("reRange")%>&nbsp;
                                                    </td>
                                                    <td style="width: 10%;word-wrap:break-word;word-break:break-all;">
                                                        <%# Eval("tips")%>&nbsp;
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                            </FooterTemplate>
                                        </asp:Repeater>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <th style="width: 100%; height: 40px;" colspan="6">
                                    <table width="100%"  style="table-layout: fixed">
                                        <tr>
                                            <td width="6%" valign="top" class="msgbox_summary_left"  style="font-size: 12px;">
                                                <%= Chy.Web.Resource.GetString("HM_0050") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                            </td>
                                            <td width="94%" class="msgbox_alignment_left" style="font-size: 12px;word-wrap:break-word;word-break:break-all;">
                                                <label id="lblSummarize" width="94%" style="word-wrap: break-word"><%# Eval("summary")%></label> &nbsp;
                                            </td>
                                            <td style="width: 10%">
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </th>
                            </tr>
                            <tr>
                                <td height="20px" colspan="6">
                                </td>
                            </tr>
                            <!---->
                        </ItemTemplate>
                        <FooterTemplate>
                            <%if (rptCheckClassRecord.Items.Count == 0)
                              { %>
                            <tr align="center">
                                <td align="center" class="GridViewNoData" colspan="2">
                                   <%= Chy.Web.Resource.GetString("HM_0039") %>
                                </td>
                            </tr>
                            <%} %>
                        </FooterTemplate>
                    </asp:Repeater>
                </table>
            </asp:Panel>
        </div>
    </div>
    <div class="tablecontainer" id="DivOperation" runat="server">
        <div class="searchPanel">
            <table cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr>
                    <td align="center">
                        <input id="btnPrint" type="button" value='<%= Chy.Web.Resource.GetString("HM_0058")%>'
                            class="button" onclick="PrintReport();" />
                        <span class="space"></span>
                        <asp:Button ID="btnAduit" CssClass="button" runat="server" Text="审核" OnClick="btnAduit_Click"
                            OnClientClick="return comfirmAudit('<%=btnAduit.UniqueID %>')" />
                        <span class="space"></span>
                        <input id="btnBack" type="button" value='<%= Chy.Web.Resource.GetString("HM_0011")%>'
                            class="button" onclick="BackLoad();" />
                        <input runat="server" type="hidden" id="returntValue" />
                        <input runat="server" type="hidden" id="RefreshID" />
                         <input runat="server" type="hidden" id="hideServiceID" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <script type="text/javascript">

        document.getElementById("<%=txtHtml.ClientID %>").value = document.getElementById("Print").innerHTML.replace(/</g, "&lg;").replace(/>/g, "&lt;");

        if (document.getElementById("<%=txtType.ClientID %>").value != "Print") {
            document.getElementById("btnPrint").style.display = "none";
        }

        function PrintReport() {
            pagesetup_null();
            var innerHtml = window.document.body.innerHTML;
            document.getElementById("Div1").style.display = "";
            window.document.body.innerHTML = document.getElementById("Print").innerHTML;            
            window.print();
            window.document.body.innerHTML = innerHtml;
            document.getElementById("Div1").style.display = "none";
            window.close();
        }

        function BackLoad() {
            if (document.getElementById("<%=returntValue.ClientID %>").value == "R") {
                window.location = "../../Admin/Assess/HealthStatusReport.aspx?_pi=<%=Chy.UI.Framework. MemberManager. SelectedId%>";
            }
            else if (document.getElementById("<%=returntValue.ClientID %>").value == "risk") {
                parent.CloseWindow(document.getElementById("<%=RefreshID.ClientID %>").value);
            }
            else if (document.getElementById("<%=returntValue.ClientID %>").value == "K") {
                //window.location = "../CrowdGroup/DiseasePrevalenceCrow.aspx?_pi=<%=Chy.UI.Framework. MemberManager. SelectedId%>";
                window.close();
            }
            else if (document.getElementById("<%=returntValue.ClientID %>").value == "Service") {
                window.location = "../../Admin/Service/MedicalServiceView.aspx?_pi=<%=Chy.UI.Framework.MemberManager.SelectedId%>&SID=" + document.getElementById("<%=hideServiceID.ClientID %>").value;
            }
            else if (document.getElementById("<%=txtType.ClientID %>").value == "Audit") {
                window.location = "CheckupReportList.aspx?_pi=<%=Chy.UI.Framework. MemberManager. SelectedId%>";
            }
            else if (document.getElementById("<%=txtType.ClientID %>").value == "Print") {
                window.location = "CheckupReport.aspx?_pi=<%=Chy.UI.Framework. MemberManager. SelectedId%>";
            } 
            else {
                window.location = "CheckupReportMemerList.aspx?_pi=<%=Chy.UI.Framework. MemberManager. SelectedId%>";
            }
        }

        //审核提示
        function comfirmAudit(name) {
            return confirmMsg(name, '<%=Chy.Web.Resource.GetString("HM_ConfirmAudit")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200);
        }

        var hkey_root, hkey_path, hkey_key
        hkey_root = "HKEY_CURRENT_USER"
        hkey_path = "\\Software\\Microsoft\\Internet Explorer\\PageSetup\\"
        //设置网页打印的页眉页脚为空,打印背景色
        function pagesetup_null() {
            try {
                var RegWsh = new ActiveXObject("WScript.Shell")
                hkey_key = "header"
                RegWsh.RegWrite(hkey_root + hkey_path + hkey_key, "")

                hkey_key = "footer"
                RegWsh.RegWrite(hkey_root + hkey_path + hkey_key, "")

                hkey_key = "Print_Background"
                RegWsh.RegWrite(hkey_root + hkey_path + hkey_key, "yes")

                hkey_key = "margin_top"; //注册表中的0.75对应于网页的19.05
                RegWsh.RegWrite(hkey_root + hkey_path + hkey_key, "0.40");

                hkey_key = "margin_bottom"; //注册表中的0.75对应于网页的19.05
                RegWsh.RegWrite(hkey_root + hkey_path + hkey_key, "0.31");

                hkey_key = "margin_left"; //注册表中的0.75对应于网页的19.05
                RegWsh.RegWrite(hkey_root + hkey_path + hkey_key, "0.79");

                hkey_key = "margin_right"; //注册表中的0.75对应于网页的19.05
                RegWsh.RegWrite(hkey_root + hkey_path + hkey_key, "0.40");


            } catch (e) { }
        }
    </script>
</asp:Content>
