<%@ Page Language="C#" MasterPageFile="~/AmMainContent.Master" AutoEventWireup="true"
    CodeBehind="CheckUpReportMemPrint.aspx.cs" EnableEventValidation = "false"  Inherits="Chm.Web.Admin.Checkup.CheckUpReportMemPrint" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link type="text/css"  href="../../Styles/Common.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainlaceHolder" runat="server">
    <Chy:XTextBox ID="txtType" runat="server" Style="display: none"></Chy:XTextBox>
    <Chy:XTextBox ID="txtHtml" runat="server" Style="display: none"></Chy:XTextBox>
    <div id="Print">
        <div>
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
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
                        <asp:Label ID="Label1" runat="server" Text="姓名" Font-Size="12px"></asp:Label>
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
            <table border="0" cellpadding="0" cellspacing="0" class="zebratable" width="100%"
                style="table-layout: fixed">
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
                        <%= Chy.Web.Resource.GetString("HM_0035") + Chy.Web.Resource.GetString("Remp_Colon")%>
                    </td>
                    <td style="text-align: left; color: #717171; font-size: 12px;">
                        <asp:Label ID="lblDocName" runat="server" Text=""></asp:Label>&nbsp;&nbsp;
                    </td>
                </tr>
                <tr>
                    <td width="15%">
                        <%= Chy.Web.Resource.GetString("HM_0100") + Chy.Web.Resource.GetString("Remp_Colon")%>
                    </td>
                    <td width="85%" style="text-align: left; color: #717171; font-size: 12px;word-wrap:break-word;word-break:break-all;">
                        <label id="lblSummarize" runat="server" text="" style="word-wrap: break-word">
                        </label>
                        &nbsp;&nbsp;
                    </td>
                </tr>
                <tr>
                    <td width="15%">
                        <%= Chy.Web.Resource.GetString("HM_0063") + Chy.Web.Resource.GetString("Remp_Colon")%>
                    </td>
                    <td width="85%" style="text-align: left; color: #717171; font-size: 12px;word-wrap:break-word;word-break:break-all;">
                        <label id="lblAdvice" runat="server" text="" style="word-wrap: break-word">
                        </label>
                        &nbsp;&nbsp;
                    </td>
                </tr>
            </table>
        </div>
        <div style="page-break-before: always">
        </div>
        <div>
            <asp:Panel ID="UpdatePanel2" runat="server" UpdateMode="Conditional" CssClass="demolargetable">
                <table width="100%" border="0px" cellspacing="0" cellpadding="0px">
                    <asp:Repeater ID="rptCheckClassRecord" runat="server" OnItemDataBound="rptCheckClassRecord_ItemDataBound">
                        <HeaderTemplate>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr align="center">
                    <%--            <th style="display: none" colspan="2">
                                    <asp:HiddenField ID="TEst" runat="server" Value="" />
                                    <%# Eval("classRecID")%>
                                </th>
                                <th style="display: none" colspan="2">
                                    <%# Eval("checkRptID")%>
                                </th>--%>
                                <th style="width: 50%; height: 30px; line-height: 30px" colspan="2">
                                    <span style="font-weight: bold; text-align: center; color: #006699;word-wrap:break-word;word-break:break-all;">
                                        <%# Eval("ClassName")%></span>
                                </th>
                                <th style="width: 50%; height: 30px; line-height: 30px" colspan="5">
                                    <span style="font-weight: bold; text-align: center; color: #006699">
                                        <%= Chy.Web.Resource.GetString("HM_0046")+ Chy.Web.Resource.GetString("Remp_Colon")%>&nbsp;</span><span
                                            style="font-weight: bold; text-align: center; color: #006699"><%# Eval("doctor")%></span>
                                </th>
                            </tr>
                            <tr>
                                <td colspan="7">
                                    <table width="100%" border="1px" cellspacing="1px" cellpadding="3px" class="zebratable">
                                        <asp:Repeater ID="rptProject" runat="server" OnItemDataBound="rptProject_ItemDataBound">
                                            <HeaderTemplate>
                                                <tr class="header" align="center">
                                                 <%--   <th style="display: none">
                                                        <%# Eval("itemRecordID")%>
                                                    </th>
                                                    <th style="display: none">
                                                        <%# Eval("ClassRecID")%>
                                                    </th>--%>
                                                    <th style="width: 80px; word-wrap: break-word; word-break: break-all;">
                                                        <%= Chy.Web.Resource.GetString("HM_0002")%>
                                                    </th>
                                                    <th style="width: 80px; word-wrap: break-word; word-break: break-all;">
                                                        <%= Chy.Web.Resource.GetString("HM_0048")%>
                                                    </th>
                                                    <th style="width: 80px; word-wrap: break-word; word-break: break-all;">
                                                        <%= Chy.Web.Resource.GetString("HM_0006")%>
                                                    </th>
                                                    <th style="width: 150px; word-wrap: break-word; word-break: break-all;">
                                                        <%= Chy.Web.Resource.GetString("HM_0049")%>
                                                    </th>
                                                    <th style="width: 80px; word-wrap: break-word; word-break: break-all;" colspan="3">
                                                        <%= Chy.Web.Resource.GetString("HM_0018")%>
                                                    </th>
                                                </tr>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr class="normal" align="center">
                                                  <%--  <td style="display: none">
                                                        <%# Eval("itemRecordID")%>&nbsp;
                                                    </td>
                                                    <td style="display: none">
                                                        <%# Eval("ClassRecID")%>&nbsp;
                                                    </td>--%>
                                                    <td style="width: 280px; word-wrap:break-word;word-break:break-all;">
                                                        <%# Eval("ItemName")%>&nbsp;
                                                    </td>
                                                    <td style="width: 150px; word-wrap:break-word;word-break:break-all;">
                                                        <%# Eval("Result")%>&nbsp;
                                                    </td>
                                                    <td style="width: 80px; word-wrap: break-word; word-break: break-all;">
                                                        <%# Eval("Unit")%>&nbsp;
                                                    </td>
                                                    <td style="width: 150px; word-wrap: break-word; word-break: break-all;">
                                                        <%# Eval("reRange")%>&nbsp;
                                                    </td>
                                                    <td style="width: 80px; word-wrap: break-word; word-break: break-all;" colspan="3">
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
                                <th style="width: 100%; height: 40px;" colspan="7">
                                    <table width="100%" style="table-layout: fixed">
                                        <tr>
                                            <td width="10%" valign="top" class="msgbox_summary_left" style="font-size: 12px;">
                                                <%= Chy.Web.Resource.GetString("HM_0050") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                            </td>
                                            <td width="94%" class="msgbox_alignment_left" style="font-size: 12px;word-wrap:break-word;word-break:break-all;">
                                                <label id="lblSummarize" width="94%" style="word-wrap: break-word">
                                                    <%# Eval("summary")%></label>
                                                &nbsp;
                                            </td>
                                            <td style="width: 10%">
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </th>
                            </tr>
                            <tr>
                                <td height="20px" colspan="7">
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
    <table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tr>
            <td align="center">
                <input id="btnPrint" type="button" value='<%= Chy.Web.Resource.GetString("HM_0058")%>'
                    class="button" onclick="PrintReport();" />
                <span class="space"></span>
                <asp:Button ID="btnAduit" CssClass="long_l_button" runat="server" Text="生成评估报告" OnClick="btnAduit_Click"
                            OnClientClick="return comfirmAudit('<%=btnAduit.UniqueID %>')"  />
                <span class="space"></span>
                <input id="btnBack" type="button" value='<%= Chy.Web.Resource.GetString("HM_0011")%>'
                    class="button" onclick="BackLoad();" />
                <input runat="server" type="hidden" id="returntValue" />
                <input runat="server" type="hidden" id="RefreshID" />
                <input runat="server" type="hidden" id="hdfPatientID" />
            </td>
        </tr>
    </table>
    <script type="text/javascript">

        document.getElementById("<%=txtHtml.ClientID %>").value = document.getElementById("Print").innerHTML.replace(/</g, "&lg;").replace(/>/g, "&lt;");

        if (document.getElementById("<%=txtType.ClientID %>").value != "Print") {
            document.getElementById("btnPrint").style.display = "none";
        }

        function PrintReport() {
            var innerHtml = window.document.body.innerHTML;
            window.document.body.innerHTML = document.getElementById("Print").innerHTML;
            pagesetup_null();
            window.print();
            window.document.body.innerHTML = innerHtml;
            window.close();
        }

        function BackLoad() {
            if (document.getElementById("<%=returntValue.ClientID %>").value == "R") {
                window.location = "../../Member/Assess/HealthStatusReport.aspx?_pi=" + $("#<%=hdfPatientID.ClientID %>").val();
            }
            else if (document.getElementById("<%=returntValue.ClientID %>").value == "risk") {
                parent.CloseWindow(document.getElementById("<%=RefreshID.ClientID %>").value);
            }
            else if (document.getElementById("<%=txtType.ClientID %>").value == "Audit") {
                window.location = "CheckupReportList.aspx?_pi="+ $("#<%=hdfPatientID.ClientID %>").val();
            }
            else if (document.getElementById("<%=txtType.ClientID %>").value == "Print") {
                //window.location = "CheckupReport.aspx?_pi=" + $("#<%=hdfPatientID.ClientID %>").val();
                window.location = "CheckupReportRecordMember.aspx?_pi=" + $("#<%=hdfPatientID.ClientID %>").val();
            }
            else {
               // window.location = "CheckupReportMemerList.aspx";
                window.location = "CheckupReportRecordMember.aspx?_pi=" + $("#<%=hdfPatientID.ClientID %>").val();
            }
        }

        //审核提示
        function comfirmAudit(name) {
            return confirmMsg(name, '确定要生成评估报告吗，生成评估报告后就不能修改和删除', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200);
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
