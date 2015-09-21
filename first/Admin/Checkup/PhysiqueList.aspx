<%@ Page Language="C#" MasterPageFile="~/MainContent.Master" AutoEventWireup="true"
    CodeBehind="PhysiqueList.aspx.cs" Inherits="Chm.Web.Admin.Checkup.PhysiqueList" %>
<%@ Register TagPrefix="Chy" Namespace="Chy.UI.Controls" Assembly="Chy.UI.Controls" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
    <table width="99%" cellpadding="0" cellspacing="0" class="searchPanel" align="center">
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <td class="label">
                            <Chy:XLabel ID="lblItemName" runat="server"></Chy:XLabel>
                        </td>
                        <td class="input">
                            <Chy:XTextBox ID="txtItemName" runat="server" class="inputtext" MaxLength="64"></Chy:XTextBox>
                        </td>
                        <td class="label">
                            <Chy:XLabel ID="lblStartTime" runat="server"></Chy:XLabel>
                        </td>
                        <td class="input">
                            <Chy:XDatePicker ID="tpStartTime" runat="server"></Chy:XDatePicker>
                        </td>
                        <td class="label">
                            <Chy:XLabel ID="lblEndTime" runat="server"></Chy:XLabel>
                        </td>
                        <td class="input">
                            <Chy:XDatePicker ID="tpEndTime" runat="server"></Chy:XDatePicker>
                        </td>
                        <td class="input">
                            <Chy:XButton ID="btnSearch" runat="server" Text="查询" CssClass="button" OnClick="btnSearch_Click"  OnClientClick="return checkTime();" />
                        </td>
                    </tr>
                </table>
            </td>
            <td class="add">
                <Chy:XButton ID="btnAdd" runat="server" Text="新增" CssClass="addbutton" />
                <Chy:XButton ID="btnDelete" runat="server" Text="删除" CssClass="delbutton" OnClick="btnDelete_Click" />
            </td>
        </tr>
    </table>
    <table width="99%" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td>
                <Chy:XGridView ID="gvCheckItem" runat="server" CssClass="zebratable" AllowPaging="true"
                    DataKeyNames="ItemRecordID" AutoGenerateColumns="False" PagerSettings-PageButtonCount="8"
                    PageSize="10" Width="100%" OnBindCstm="gvCheckItem_BindCstm" OnRowDataBound="gvCheckItem_RowDataBound">
                    <Columns>
                        <asp:TemplateField HeaderStyle-CssClass="check" ItemStyle-Width="24px" ItemStyle-CssClass="check">
                            <HeaderTemplate>
                                <input id="chkSelAll" type="checkbox" onclick="ChooseAllChecked('<%=gvCheckItem.ClientID %>',this);" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSelItem" name='chk' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ItemName" HeaderText='项目名称'></asp:BoundField>
                     
                        <asp:BoundField DataField="Result" HeaderText="结果"></asp:BoundField>
                        <asp:BoundField DataField="Unit" HeaderText="单位"></asp:BoundField>
                        <asp:TemplateField ShowHeader="true" HeaderText="检查时间" ItemStyle-Width="120px">
                            <ItemTemplate>
                                <%# Convert.ToDateTime(Eval("CheckupTime")).ToString("yyyy-MM-dd")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ReLower" HeaderText="参考下限"></asp:BoundField>
                        <asp:BoundField DataField="ReUpper" HeaderText="参考上限"></asp:BoundField>  
                        <asp:TemplateField ShowHeader="true" HeaderText='状态'>
                            <ItemTemplate>
                                <%# Convert.ToInt32(Eval("AuditState")) == 0 ? '未审核' : Chy.Web.Resource.GetString("HM_0073") %>
                            </ItemTemplate>
                        </asp:TemplateField>                      
                        <asp:TemplateField ShowHeader="true" HeaderText="查看" ItemStyle-Width="55px">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnDetail" runat="server" CausesValidation="False" CommandName="itemDetail"
                                    CommandArgument='<%# Eval("ItemRecordID") %>' OnCommand="gvReport_Command" Text="查看"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="true" HeaderText="修改" ItemStyle-Width="55px">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnEdit" runat="server" CausesValidation="False" CommandName="itemEdit"
                                    CommandArgument='<%# Eval("ItemRecordID") %>' OnCommand="gvReport_Command" Text="修改"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="true" HeaderText="审核" ItemStyle-Width="55px">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnAudit" runat="server" CausesValidation="False" CommandName="itemAudit"
                                    CommandArgument='<%# Eval("ItemRecordID") %>' OnCommand="gvReport_Command" Text="审核"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="true" HeaderText="对比图" ItemStyle-Width="65px" Visible="false">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnCompare" runat="server" CausesValidation="False" CommandName="itemCompare"
                                    CommandArgument='<%# Eval("ItemID") %>' OnCommand="gvReport_Command" Text="对比图"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </Chy:XGridView>
            </td>
        </tr>
    </table>
    <script src="/Js/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="../../Scripts/MultiLineLength.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        $(document).ready(function () {
            $("#<%=btnAdd.ClientID %>").click(
            function () {
                javascript: document.location.href = 'PhysiqueAdd.aspx?Type=Add';
                return false;
            });
            $("#<%=btnDelete.ClientID %>").click(function () {
                var msg = '<%=Chy.Web.Resource.GetString("HM_0490") %>';
                var gridId = '<%=gvCheckItem.ClientID %>';
                var express = "#" + gridId + " :checkbox[checked]";
                var selected = $(express).length;
                if (selected == 0) {
                    return alertMsg('<%=Chy.Web.Resource.GetString("HM_ChooseDel")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
                }
                else { 
                    return confirmMsg('<%=btnDelete.UniqueID %>', '<%=Chy.Web.Resource.GetString("HM_ConfirmDel")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200);
                }
            });
        });
        //审核提示
        function comfirmAudit(name) {
            return confirmMsg(name, '<%=Chy.Web.Resource.GetString("HM_ConfirmAudit")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200);
        }

        //检查结束时间
        function checkTime() {
            var StartTime = $.trim($("#<%=tpStartTime.ClientID %>").val()).replace(/-/g, '/').split('/');
            var EndTime = $.trim($("#<%=tpEndTime.ClientID %>").val()).replace(/-/g, '/').split('/');

            if (EndTime.length != 0 && StartTime.length != 0) {
                var dateSt = new Date(StartTime[0], StartTime[1]-1, StartTime[2]);
                var dateEd = new Date(EndTime[0], EndTime[1]-1, EndTime[2]);
                if (dateSt > dateEd) {
                    alertMsg('<%=Chy.Web.Resource.GetString("HM_From_To_Time")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
                    return false;
                }
            }
            return true;
        }
    </script>
</asp:Content>
