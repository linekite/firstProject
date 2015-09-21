<%@ Page Language="C#" MasterPageFile="~/AmMainContent.Master" AutoEventWireup="true"
    CodeBehind="CompareAnalyze.aspx.cs" Inherits="Chm.Web.Admin.Checkup.CompareAnalyze" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function OpenChartAnalyze(reportIds, checkItemId) {
            var url = "ChartAnalysis.aspx?reportIds=" + reportIds + "&checkItemId=" + checkItemId;
            OpenWindow(url);
        }
    </script>
    <style>
        .hid
        {
            display: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
    <div>
        <table cellspacing="0" cellpadding="0" width="98%" border="0" align="center">
            <tr>
                <td>
                    <asp:GridView ID="MyShow" runat="server" CssClass="zebratable" Width="100%" AutoGenerateColumns="False"
                        OnRowDataBound="MyShow_RowDataBound">
                        <EmptyDataTemplate>
                            <table width="100%" cellpadding="0" cellspacing="0" class="GridViewNoData">
                                <tr align="center">
                                    <td style="height: 40px;">
                                        <b>
                                           暂时没有数据
                                    </td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <HeaderStyle CssClass="header" />
                        <RowStyle CssClass="odd" />
                        <Columns>
                            <%--体检项目ID--%>
                            <asp:TemplateField HeaderStyle-Font-Size="12px">
                                <HeaderTemplate>
                                    <%= Chy.Web.Resource.GetString("HM_0069")%>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%# Eval("ItemName")%>&nbsp;
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="result1" HeaderText="第一次体检" ItemStyle-HorizontalAlign="Center"
                                HeaderStyle-Font-Size="12px">
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="result2" HeaderText="第二次体检" ItemStyle-HorizontalAlign="Center"
                                HeaderStyle-Font-Size="12px">
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="result3" HeaderText="第三次体检" ItemStyle-HorizontalAlign="Center"
                                HeaderStyle-Font-Size="12px">
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="result4" HeaderText="第四次体检" ItemStyle-HorizontalAlign="Center"
                                HeaderStyle-Font-Size="12px">
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="unit" HeaderText="单位" ItemStyle-HorizontalAlign="Center"
                                HeaderStyle-Font-Size="12px">
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </div>
    <div>
        &nbsp;</div>
    <div style="text-align: center">
        <input id="btnBack" class="button" type="button" onclick="window.location='CheckupReportRecordMember.aspx';"
            value="返回" /></div>
    <div>
        &nbsp;</div>
</asp:Content>
