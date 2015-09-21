<%@ Page Language="C#" MasterPageFile="~/AmMainContent.Master" AutoEventWireup="true" CodeBehind="PhysiqueMemberList.aspx.cs" Inherits="Chm.Web.Admin.Checkup.PhysiqueMemberList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script src="/Js/DatePicker/WdatePicker.js" type="text/javascript"></script> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
<table width="99%" cellpadding="0" cellspacing="0" class="search_tab" align="center">
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <td class="label" style="display:none">
                            <Chy:XLabel ID="lblItemName" runat="server"></Chy:XLabel>
                        </td>
                        <td class="input" style="display:none">
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
                            <Chy:XButton ID="btnSearch" runat="server" Text="查询" CssClass="button" OnClick="btnSearch_Click"  OnClientClick="return checkTime();"/>
                        </td>
                    </tr>
                </table>
            </td>
            <td class="add">
                
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
                       
                        <asp:BoundField DataField="ItemName" HeaderText="项目名称"  HeaderStyle-Width="23%"></asp:BoundField>  
                        <asp:BoundField DataField="Result" HeaderText="结果"  HeaderStyle-Width="25%"></asp:BoundField>  
                        <asp:BoundField DataField="Unit" HeaderText="单位"  HeaderStyle-Width="18%"></asp:BoundField>
                        <asp:TemplateField ShowHeader="true" HeaderText="检查时间">
                            <ItemTemplate>
                                <%# Convert.ToDateTime(Eval("CheckupTime")).ToString("yyyy-MM-dd")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="true" HeaderText="查看" ItemStyle-Width="55px">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnDetail" runat="server" CausesValidation="False" CommandName="itemDetail"
                                    CommandArgument='<%# Eval("ItemRecordID") %>' OnCommand="gvReport_Command" Text="查看"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField ShowHeader="true" HeaderText="对比图" Visible="false">
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
    <script type="text/javascript">
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
