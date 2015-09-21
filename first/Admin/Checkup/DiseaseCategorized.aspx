<%@ Page Title="" Language="C#" MasterPageFile="~/MainContent.Master" AutoEventWireup="true"
    CodeBehind="DiseaseCategorized.aspx.cs" Inherits="Chm.Web.Admin.Checkup.DiseaseCategorized" %>

<%@ Import Namespace="Chm.Web" %>
<%@ Import Namespace="Chy.Web" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script language="javascript" type="text/javascript">
        var patientId = '<%=PatientId%>';
        var urlParam = "?PatientId=" + patientId + "&RefreshID=<%=btnRefresh.UniqueID %>"; ;

        function showDiv() {
            var url = "DiseaseCategorizedAdd.aspx" + urlParam;
            OpenWindow(url);
            return false;
        }
        $(document).ready(function () {
            $("#liCheckUp").bind('click', function () { location.href = "CheckUpCategorized.aspx" + urlParam; });
            $("#liDisease").bind('click', function () { location.href = "DiseaseCategorized.aspx" + urlParam; });

            $("#<%=btnDel.ClientID %>").click(function () {
                var pleaseSelect = '<%=Resource.GetString("Remp_PleaseSelectItemToOperate")%>';
                var confirmComplete = '<%=Resource.GetString("Remp_ConfirmDelete")%>';
                var alertTitle = '<%=HMCommon.GetLanguage("HM_AlertTilte") %>';
                if (checkIsSelected('<%=gvDisease.ClientID %>', pleaseSelect)) {
                    return confirmMsg('<%=btnDel.UniqueID %>', confirmComplete, alertTitle, 400, 0);
                }
                else {
                    return false;
                }
            });

            if (parent.parent.document.all("IFRAME1") != null) {
                parent.parent.document.all("IFRAME1").height = document.body.scrollHeight || document.documentElement.clientHeight
            }

            $("#<%=btnReturn.ClientID %>").click(function () {
                parent.CloseWindow();
            });

            $("span[id$='lblReportId']").each(function () {
                var reportId = $("#" + this.id).text();
                var chkId = "chkselect" + reportId
                if (reportId != "0")//系统导入的隐藏checkbox，不能删除和修改
                    $("input[id='" + chkId + "']").each(function () {
                        $(this).attr('disabled',true);
                    });
            });
        });
        function fn_LinkAddPage(resultId, patientId) {
            var url = "DiseaseCategorizedAdd.aspx?ResultId=" + resultId + "&PatientId=" + patientId;
            OpenWindow(url);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
    <table width="100%" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td style="padding-top: 10px; padding-bottom: 10px">
                <%= HMCommon.GetLanguage("HM_PatientCategorized")%><%= Chy.Web.Resource.GetString("Remp_Colon")%><Chy:XLabel
                    runat="server" ID="lbalPatientName"></Chy:XLabel>
            </td>
        </tr>
        <tr>
            <td>
                <div class="con">
                    <ul id="tags" class="clearfix mb_10">
                        <li id="liCheckUp"><a>
                            <%= HMCommon.GetLanguage("HM_CheckUpUnusualCategorized")%>
                        </a></li>
                        <li id="liDisease" class="selectTag"><a>
                            <%= HMCommon.GetLanguage("HM_DiseaseCategorized")%></a></li>
                    </ul>
                </div>
                <div id="tagContent" class="mb_10">
                    <div style="width: 100%; margin: 4px auto">
                        <table width="100%" cellpadding="0" cellspacing="0" class="searchPanel" align="center">
                            <tr>
                                <td width="80%">
                                    &nbsp;
                                </td>
                                <td class="add">
                                    <Chy:XButton ID="btnAdd" runat="server" CssClass="addbutton" OnClientClick="return showDiv();" />
                                    <Chy:XButton ID="btnDel" runat="server" CssClass="delbutton" OnClick="btnDel_Click" />
                                </td>
                            </tr>
                        </table>
                                    <Chy:XGridView ID="gvDisease" runat="server" CssClass="zebratable" AllowPaging="true"
                                        AutoGenerateColumns="False" PagerSettings-PageButtonCount="8" PageSize="10" Width="100%"
                                        OnRowDataBound="gvDisease_RowDataBound">
                                        <Columns>
                                            <asp:TemplateField HeaderStyle-CssClass="check" ItemStyle-CssClass="check" HeaderStyle-Width="3%"
                                                ItemStyle-Width="3%">
                                                <HeaderTemplate>
                                                    <input id="chkSelAll" type="checkbox" onclick="selectAll(this,'<%=gvDisease.ClientID %>')" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <input id="chkselect<%# Eval("ReportId") %>" name="chk" type="checkbox" value="<%# Eval("ResultId") %>" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <Columns>
                                            <asp:BoundField DataField="CategoryName"></asp:BoundField>
                                            <asp:BoundField DataField="TimeInGroup" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundField>
                                            <asp:BoundField DataField="ReportTime" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <%# GetReportSourceType(Eval("ReportSource").ToString())%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblReportId" Style="display: none" runat="server" Text='<%#Eval("ReportId").ToString()%>'></asp:Label>
                                                    &nbsp;&nbsp;<%#GetDataSourceType(Eval("ReportId").ToString())%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField Visible="false">
                                                <ItemTemplate>
                                                    &nbsp;&nbsp;<asp:LinkButton ID="lbtnEdit" runat="server"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbtnResult" Visible="false" Text='<%# Eval("ResultId") %>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </Chy:XGridView>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td align="center">
                <Chy:XButton ID="btnReturn" runat="server" CssClass="button" />
            </td>
        </tr>
    </table>
    <asp:Button ID="btnRefresh" runat="server" Style="display: none" OnClick="btnRefresh_Click" />
</asp:Content>
