<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MainContent.Master"
    CodeBehind="HealthStatusReport.aspx.cs" Inherits="Chm.Web.Admin.Assess.HealthStatusReport" %>

<%@ Register TagPrefix="Chy" Namespace="Chy.UI.Controls" Assembly="Chy.UI.Controls" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> </asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
    <table width="99%" cellpadding="0" cellspacing="0" class="searchPanel" align="center">
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <td class="label">
                            <Chy:XLabel ID="lblCheckRptNO" runat="server" Text="体检编号:">
                            </Chy:XLabel>
                        </td>
                        <td class="input">
                            <Chy:XTextBox ID="txtCheckRptNO" runat="server" class="inputtext" />
                        </td>
                        <td class="label">
                            <Chy:XLabel ID="lblExamTime" runat="server" Text="评估时间从:">
                            </Chy:XLabel>
                        </td>
                        <td class="input">
                            <Chy:XDatePicker ID="dpStartTime" runat="server" />&nbsp;&nbsp;&nbsp;<%= Chy.Web.Resource.GetString("HM_To")%><%= Chy.Web.Resource.GetString("Remp_Colon")%>&nbsp;
                            <Chy:XDatePicker ID="dpEndTime" runat="server" />
                        </td>
                        <td class="input" rowspan="2">
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <Chy:XButton ID="btnSearch" runat="server" Text='' CssClass="button" OnClick="btnSearch_Click"
                                OnClientClick="return checkTime();" />
                            <Chy:XTextBox ID="txtPatientName" Visible="false" runat="server" class="inputtext">
                            </Chy:XTextBox>
                            <Chy:XTextBox ID="txtPatientID" Visible="false" runat="server" class="inputtext">
                            </Chy:XTextBox>
                        </td>
                    </tr>
                </table>
            </td>
            <td class="add" nowrap>
                <Chy:XButton ID="btnAdd" runat="server" Text='' CssClass="addbutton" OnClick="btnAdd_Click" />
                <Chy:XButton ID="btnDelete" runat="server" Text='' CssClass="delbutton" OnClick="btnDelete_Click" />
            </td>
        </tr>
    </table>
    <table width="99%" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td>
                <Chy:XGridView ID="gvVisit" runat="server" CssClass="zebratable" AllowPaging="true"
                    DataKeyNames="HealthStatusRptID" AutoGenerateColumns="False" PagerSettings-PageButtonCount="8"
                    PageSize="10" Width="100%" OnRowDataBound="gv_RowDataBound">
                    <columns>
                        <asp:TemplateField HeaderStyle-CssClass="check" ItemStyle-Width="24px" ItemStyle-CssClass="check">
                            <HeaderTemplate>
                                <input type="checkbox" id="selectAll" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSelItem" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText='体检编号' >
                           <%-- <ItemTemplate>
                                <asp:LinkButton ID="lbtCheckRpt" runat="server" Text='<%# Bind("CheckRptNO") %>' CausesValidation="False" CommandName="itemCheckRpt"
                                    CommandArgument='<%# Eval("CheckRptID") %>' OnCommand="gvList_Command"></asp:LinkButton>
                            </ItemTemplate>--%>
                            <ItemTemplate>
                            <a href="javascript:void(0)" onclick="OpenWindow('../../Admin/Checkup/CheckUpReportPrint.aspx?Type=Detail&RPT=R&CheckRepID=<%#Eval("CheckRptID") %>&_pi=<%=Chy.UI.Framework.MemberManager.SelectedId%>')"><%# Eval("CheckRptNO")%></a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText='体检日期' ItemStyle-Width="120px">
                            <ItemTemplate>
                                <%#Eval("CheckTime") == null ? "" : Convert.ToDateTime(Eval("CheckTime")).ToString("yyyy-MM-dd")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText='评估日期' ItemStyle-Width="120px">
                            <ItemTemplate>
                                <%#Eval("CreateTime") == null ? "" : Convert.ToDateTime(Eval("CreateTime")).ToString("yyyy-MM-dd")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="IsAudit" HeaderText='报告状态' ItemStyle-Width="95px"></asp:BoundField>
                        <asp:TemplateField ShowHeader="true" HeaderText='查看' ItemStyle-Width="55px">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtLook" runat="server" CausesValidation="False" CommandName="itemLook"
                                    CommandArgument='<%# Eval("HealthStatusRptID") %>' OnCommand="gvList_Command" Text=''></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="true" HeaderText='修改' ItemStyle-Width="55px">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtUpdate" runat="server" CausesValidation="False" CommandName="itemEdit"
                                    CommandArgument='<%# Eval("HealthStatusRptID") %>' OnCommand="gvList_Command" Text=''></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
            <asp:TemplateField ShowHeader="true" ItemStyle-Width="55px">
                <ItemTemplate>
                     <asp:LinkButton ID="lbtAudit" runat="server"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="true"  HeaderText="导出" ItemStyle-Width="55px" ControlStyle-CssClass="ReportField">
                <ItemTemplate>
                <asp:LinkButton ID="lbtExport" runat="server">导出</asp:LinkButton>
                <asp:HiddenField ID="hdFileName" runat="server" Value='<%#Eval("FileName") %>'/>                   
                </ItemTemplate>
            </asp:TemplateField>
                    </columns>
                </Chy:XGridView>
            </td>
        </tr>
    </table>
    <div id="ExportDiv">
        <input type="hidden" id="hdFileName" />
        <table class="formcontainer">
            <tr>
                <td>
                    <asp:RadioButtonList RepeatDirection="Vertical" runat="server" ID="exportType">
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    <a id="btnExport" href="javascript:void(0);">
                         <input id="Button1" type="button" class="button" value='确定' /></a> &nbsp;&nbsp;
                    <input id="btnClose1" type="button" class="button" value='关闭' />
                </td>
            </tr>
        </table>
    </div>
    <script src="/Js/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#selectAll").click(function () {
                $("#<%=gvVisit.ClientID %> tr:gt(0) :checkbox").not(":disabled").attr("checked", $(this).attr("checked"))
            });
            //showdialog
            $("#ExportDiv").dialog({
                bgiframe: true,
                draggable: true,
                autoOpen: false,
                title: '<%=Chy.Web.Resource.GetString("HM_ExportType")%>',
                modal: true,
                closeOnEscape: false,
                autoHeight: true,
                width: 260
            });
            $("#btnClose1").click(function () {
                $("#ExportDiv").dialog("close");
            });

            $("#<%=exportType.ClientID %> :radio").click(function () {
                if ($("#hdFileName").val() != "") {
                    var url = $("#hdFileName").val() + $(this).val();
                    //                    $("#btnExport").attr("href", url);
                    $("#Button1").click(function () { window.location = url; });
                }
            });

        });

        function chkExport(fileName) {
            if (fileName != "") {
                $("#ExportDiv").dialog("open");
                $("#hdFileName").val(fileName);
                $("#<%=exportType.ClientID %> :radio:first").click();
                //$("#btnExport").attr("href", fileName + ".pdf");
            }
            else {
                alertMsg('<%=Chy.Web.Resource.GetString("HM_NotExistFile")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
            }
        }
        //判断是GridView是否选择,选择了是否要删除
        function checkdelete(gvID) {
            var express = "#" + gvID + " :checkbox[checked]";
            var selected = $(express).length;
            if (selected == 0) {
                alertMsg('<%=Chy.Web.Resource.GetString("HM_ChooseDel")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
                return false;
            }
            else {
                return confirmMsg('<%=btnDelete.UniqueID %>', '<%=Chy.Web.Resource.GetString("HM_ConfirmDel")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200);
            }
            return true;
        }
        //审核提示
        function comfirmAudit(name) {
            return confirmMsg(name, '<%=Chy.Web.Resource.GetString("HM_ConfirmAudit")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200);
        }
        //检查结束时间
        function checkTime() {
            var StartTime = $.trim($("#<%=dpStartTime.ClientID %>").val()).replace(/-/g, '/').split('/');
            var EndTime = $.trim($("#<%=dpEndTime.ClientID %>").val()).replace(/-/g, '/').split('/');

            if (EndTime.length != 0 && StartTime.length != 0) {
                var dateSt = new Date(StartTime[0], StartTime[1] - 1, StartTime[2]);
                var dateEd = new Date(EndTime[0], EndTime[1] - 1, EndTime[2]);
                if (dateSt > dateEd) {
                    alertMsg('<%=Chy.Web.Resource.GetString("HM_From_To_Time")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
                    return false;
                }
            }
            return true;
        }

        function refush() {
            window.location = window.location;
        }
    </script>
</asp:Content>
