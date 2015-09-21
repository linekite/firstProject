<%@ Page Language="C#" MasterPageFile="~/MainContent.Master" AutoEventWireup="true"
    CodeBehind="MentalHealthReport.aspx.cs" Inherits="Chm.Web.MentalHealthReportList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/Js/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <link href="../../Styles/MsgBox.css" type="text/css" rel="Stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
    <table width="99%" cellpadding="0" cellspacing="0" class="searchPanel" align="center">
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <td class="label">
                            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                            <Chy:XDropDownList ID="ddlSurveyType" runat="server" CssClass="secltwidth" Width="163px" />
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Literal ID="ltrStatus" runat="server"></asp:Literal>
                            <Chy:XDropDownList ID="ddlStatus" runat="server" CssClass="secltwidth" Width="100px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="label">
                            <asp:Literal ID="ltrDateFrom" runat="server"></asp:Literal>
                            <Chy:XDatePicker ID="dpStartTime" runat="server" Width="100px">
                            </Chy:XDatePicker>
                            <asp:Literal ID="ltrDateTo" runat="server"></asp:Literal>
                            <Chy:XDatePicker ID="dpEndTime" runat="server" Width="100px">
                            </Chy:XDatePicker>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <Chy:XButton ID="btnSearch" runat="server" CssClass="button" OnClick="btnSearch_Click"
                                OnClientClick="return checkSearchTime();" />
                        </td>
                    </tr>
                </table>
            </td>
            <td class="add">
                <Chy:XButton ID="btnAdd" runat="server" CssClass="addbutton" OnClick="btnAdd_Click" />
                <Chy:XButton ID="btnDelete" runat="server" CssClass="delbutton" OnClick="btnDelete_Click"
                    OnClientClick="return chkItem();" />
            </td>
        </tr>
    </table>
    <table width="99%" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td>
                <Chy:XGridView ID="gvShow" runat="server" CssClass="zebratable" AllowPaging="true"
                    DataKeyNames="MentalHealthRptID" AutoGenerateColumns="False" PagerSettings-PageButtonCount="8"
                    PageSize="10" Width="100%" OnRowDataBound="gvShow_RowDataBound">
                    <Columns>
                        <asp:TemplateField HeaderStyle-CssClass="check" ItemStyle-Width="24px" ItemStyle-CssClass="check">
                            <HeaderTemplate>
                                <input type="checkbox" id="chkSelAll" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSelItem" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="true">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtSurveyView" runat="server" CausesValidation="false" CommandName="SurveyView"
                                    CommandArgument='<%#Eval("SurveyRptId")+"$"+Eval("MetalType") %>' OnCommand="gvList_Command"><%=Chy.Web.Resource.GetString("HM_SurveyView")%></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="SubmitTime" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundField>
                        <asp:TemplateField ItemStyle-Width="150px">
                            <ItemTemplate>
                                <Chy:XLabel ID="lblSurveyType" Text='<%# GetMetalTypeText(Eval("MetalType").ToString()) %>'
                                    runat="server"></Chy:XLabel>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="CreateTime" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <Chy:XLabel ID="lblIsAudit" Text='<%# Eval("IsAudit").ToString().Equals("1") ? Chy.Web.Resource.GetString("HM_Audited") : Chy.Web.Resource.GetString("HM_UNAudited")%>'
                                    runat="server"></Chy:XLabel>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="true">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtReportView" runat="server" CausesValidation="false" CommandName="ReportView"
                                    CommandArgument='<%#Eval("MentalHealthRptID")+"$"+Eval("MetalType") %>' OnCommand="gvList_Command"><%=Chy.Web.Resource.GetString("HM_View")%></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--<asp:TemplateField HeaderText='<%=Chy.Web.Resource.GetString("HM_Edit")%>' ShowHeader="true" ItemStyle-Width="45px">
                <ItemTemplate>
                <asp:LinkButton ID="lbtUpdate" runat="server"><%=Chy.Web.Resource.GetString("HM_Edit")%></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>--%>
                        <asp:TemplateField ShowHeader="true">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtAudit" runat="server" CausesValidation="false" CommandName="itemAudit"
                                    CommandArgument='<%#Eval("MentalHealthRptID") %>' OnCommand="gvList_Command"><%=Chy.Web.Resource.GetString("HM_Audit")%><%--<%if (!Chm.Web.HMCommon.IsHos())
                                                                    {%>
                     <%=Chy.Web.Resource.GetString("HM_Audit")%><%}
                                                                    else
                                                                    { %><%=Chy.Web.Resource.GetString("HM5_0989")%><%} %>--%></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="true" ControlStyle-CssClass="ReportField">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtExport" runat="server">导出</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
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
    <div id="q_Msgbox" class="hide">
        <span id="mode_tips_v2" class="qz_msgbox_layer" style="z-index: 10000;"><span class="gtl_ico_clear">
        </span>
            <img alt="" src="../../image/loading.gif" />
            <%=Chy.Web.Resource.GetString("HM_AuditingTip")%>
            <%--    <%if (Chm.Web.HMCommon.IsHos())
      { %>生成word，pdf文档，请稍等...
    <%}
      else
      { %>
    <%=Chy.Web.Resource.GetString("HM_AuditingTip")%>
    <%} %>--%>
            <span class="gtl_end"></span></span>
    </div>
    <script language="javascript" type="text/javascript">
        $(document).ready(function () {
            $("#chkSelAll").click(function () {
                $("#<%=gvShow.ClientID %>  :checkbox:enabled[name$=chkSelItem]").attr("checked", this.checked);
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
                //                    $("#btnExport").attr("href", fileName + ".pdf");
                $("#Button1").click(function () { window.location = fileName + ".pdf"; });
            }
            else {
                alertMsg('<%=Chy.Web.Resource.GetString("HM_NotExistFile")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
            }
        }

        //选择
        function chkItem() {
            var Items = $("#<%=gvShow.ClientID %>  :checkbox:enabled[name$=chkSelItem]:checked")
            if (Items.length <= 0) {
                alertMsg('<%=Chy.Web.Resource.GetString("HM_ChooseDel")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
                return false;
            }
            else {
                return confirmMsg('<%=btnDelete.UniqueID %>', '<%=Chy.Web.Resource.GetString("HM_ConfirmDel")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200);
            }
        }
        //检查结束时间
        function checkSearchTime() {
            var d1 = new Date($("#<%=dpStartTime.ClientID %>").val().replace(/\-/g, "\/"));
            var d2 = new Date($("#<%=dpEndTime.ClientID %>").val().replace(/\-/g, "\/"));
            if (d1 > d2) {
                alertMsg('<%=Chy.Web.Resource.GetString("HM_From_To_Time")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
                return false;
            }
            else {
                return true;
            }
        }
        //审核提示
        function comfirmAudit(name) {
            if (confirmMsg(name, '<%=Chy.Web.Resource.GetString("HM_ConfirmAudit")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200)) {
                $("#q_Msgbox").removeClass("hide").addClass("MsgboxShow");
                return true;
            }
            else {
                return false;
            }
        }
        //审核提示
        function comfirmAuditHos(name) {
            if (confirmMsg(name, '确定要生成文档吗？', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200)) {
                $("#q_Msgbox").removeClass("hide").addClass("MsgboxShow");
                return true;
            }
            else {
                return false;
            }
        }
        function alertEdit() {
            window.top.alertMsg('<%=Chy.Web.Resource.GetString("HM_AlertAudited") %>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte") %>', 400, 200, '');
        }
   
    </script>
</asp:Content>
