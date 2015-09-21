<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckUpReportToPdf.aspx.cs"
    Inherits="Chm.Web.Admin.Checkup.CheckUpReportToPdf" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">    
    <link href="../../Styles/Common.css" rel="stylesheet" type="text/css" />
    <link type="text/css" rel="Stylesheet" href="/CSS/common.css" />
</head>
<body >
    <form id="form1" runat="server">
    <div class="tablecontainer" id="Div1" runat="server">
        <div class="searchPanel">
             <table cellspacing="0" cellpadding="0" width="99%" border="0">
                <tr>
                    <td align="center" valign="middle" style="font-size:22px; font-weight:bold;">                        
                            <%= Chy.Web.Resource.GetString("HM_0296")%>
                    </td>
                </tr>
            </table> 
        </div>
    </div>
    <div id="Print">
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
        </div>
        <table border="0" cellpadding="0" cellspacing="0" class="zebratable" width="99%"
            align="center" style="table-layout: fixed">
            <colgroup>
                <col style="width: 15%;"></col>
                <col style="width: 85%;"></col>
            </colgroup>
            <tr class="header">
                <td colspan="2">
                    体检概述
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
                <td width="85%" style="text-align: left; color: #717171; font-size:12px; ">
                    <label id="lblSummarize" runat="server" text="" style="word-wrap: break-word">
                        &nbsp;
                    </label>
                </td>
            </tr>
            <tr>
                <td width="15%">
                    <asp:Label ID="lblAdvice2" runat="server" Text=""></asp:Label>
                </td>
                <td width="85%" style="text-align: left; color: #717171; font-size: 12px;">
                    <label id="lblAdvice" runat="server" text="" style="word-wrap: break-word">
                        &nbsp;
                    </label>
                </td>
            </tr>
        </table>
        <div align="center">
            <asp:Panel ID="UpdatePanel2" runat="server" UpdateMode="Conditional" >
                <table width="100%" border="0px" cellspacing="0" cellpadding="0px" class="msgbox_alignment">
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
                                <th width="71%" class="msgbox_alignment_left" colspan="2">
                                    <span style="font-weight: bold; text-align: center; color: #006699">
                                        <%# Eval("ClassName")%></span>&nbsp;
                                </th>
                                <th width="29%" align="right" class="msgbox_alignment_right" colspan="1">
                                    <span style="font-weight: bold; text-align: center; color: #006699">
                                        删除 + Chy.Web.Resource.GetString("Remp_Colon")%></span><span
                                            style="font-weight: bold; text-align: center; color: #006699"><%# Eval("doctor")%></span>
                                </th>
                            </tr>
                            <tr>
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
                                                    <th style="width: 20%">
                                                        项目名称
                                                    </th>
                                                    <th style="width: 20%">
                                                        检查结果
                                                    </th>
                                                    <th style="width: 20%">
                                                        单位
                                                    </th>
                                                    <th style="width: 20%">
                                                        参考范围
                                                    </th>
                                                    <th style="width: 20%">
                                                        提示
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
                                                    <td>
                                                        <%# Eval("ItemName")%>&nbsp;
                                                    </td>
                                                    <td>
                                                        <%# Eval("Result")%>&nbsp;
                                                    </td>
                                                    <td>
                                                        <%# Eval("Unit")%>&nbsp;
                                                    </td>
                                                    <td>
                                                        <%# Eval("reRange")%>&nbsp;
                                                    </td>
                                                    <td>
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
                                <th style="width: 100%;" colspan="6">
                                    <table width="100%" style="table-layout: fixed">
                                        <tr>
                                            <td width="6%" valign="top" class="msgbox_summary_left" style="font-size: 12px;">
                                                <%= 小结 + Chy.Web.Resource.GetString("Remp_Colon")%>
                                            </td>
                                            <td width="94%" class="msgbox_alignment_left" style="font-size: 12px;">
                                                <label id="lblSummarize" width="94%" style="word-wrap: break-word">
                                                    <%# Eval("summary")%></label>
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
                    </asp:Repeater>
                </table>
            </asp:Panel>
        </div>
    </div>
    </form>
</body>
</html>
