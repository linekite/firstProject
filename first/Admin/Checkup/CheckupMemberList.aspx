<%@ Page Language="C#" MasterPageFile="~/AmMainContent.Master" AutoEventWireup="true" CodeBehind="CheckupMemberList.aspx.cs" Inherits="Chm.Web.Admin.Checkup.CheckupMemberList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <script src="/Js/DatePicker/WdatePicker.js" type="text/javascript"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
     <table width="99%" cellpadding="0" cellspacing="0" border="0" class="search_tab" align="center">
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" border="0">
                    <tr>   
                        <td class="label">
                            <Chy:XLabel ID="lblCheckupReportNo" runat="server" Text="体检报告编号:"></Chy:XLabel>
                        </td>                     
                        <td class="input">
                            <Chy:XTextBox ID="txtCheckupReportNo" class="inputtext" runat="server" ></Chy:XTextBox>
                        </td>
                        <td class="label">
                            <Chy:XLabel ID="lblStartTime" Text="日期从:" runat="server"></Chy:XLabel>
                        </td>
                        <td class="input">
                            <Chy:XDatePicker ID="tpStartTime" runat="server"></Chy:XDatePicker>
                        </td>
                        <td class="label">
                            <Chy:XLabel ID="lblEndTime" runat="server" Text="至:"></Chy:XLabel>
                        </td>
                        <td class="input">
                            <Chy:XDatePicker ID="tpEndTime" runat="server"></Chy:XDatePicker>
                        </td>
                        <td class="input">
                            <Chy:XButton ID="btnSearch" runat="server" Text="查询" CssClass="button" OnClick="btnSearch_Click"
                                OnClientClick="return checkTime();" />
                        </td>
                        <td class="input">
                            <input type="button" class="button" onclick="javascript:window.location.href='/hc/Member/Assess/HealthReportList.aspx'" value="返回"/>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table width="99%" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td>
                <Chy:XGridView ID="gvReport" runat="server" CssClass="zebratable" AllowPaging="true"
                    DataKeyNames="checkRptID" AutoGenerateColumns="False" PagerSettings-PageButtonCount="8"
                    PageSize="10" Width="100%" OnRowDataBound="gvReport_RowDataBound">
                    <Columns>
                        <asp:TemplateField ShowHeader="true" HeaderText="体检日期">
                            <ItemTemplate>
                                <%# Convert.ToDateTime(Eval("CheckTime")).ToString("yyyy-MM-dd")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:BoundField DataField="CheckRptNO" HeaderText="体检报告编号" ></asp:BoundField>
                        <asp:BoundField DataField="hospital" HeaderText="医院名称" ></asp:BoundField>
                        <asp:BoundField DataField="doctor" HeaderText="总检医生" ></asp:BoundField>
                          <asp:TemplateField  HeaderText="来源"  >
                             <ItemTemplate>
                             <%# string.Concat(Eval("Datasource"),"")=="0"?"自助录入" :"人民医院"%>
                            </ItemTemplate>
                            </asp:TemplateField>

                         <asp:TemplateField ShowHeader="true" HeaderText="打印" Visible="false">
                            <ItemTemplate>
                               <asp:HyperLink ID="lbtnDetail" runat="server" Target="_blank">打印</asp:HyperLink>                   
                            </ItemTemplate>
                        </asp:TemplateField>                     
                           <asp:TemplateField ShowHeader="true" HeaderText="打印" Visible="false">
                            <ItemTemplate>                           
                                    <asp:LinkButton ID="lbtPrint" runat="server" CausesValidation="False" CommandName="itemPrint"
                                    CommandArgument='<%# Eval("checkRptID") %>' OnCommand="gvReport_Command" Text="打印"></asp:LinkButton>                           
                            </ItemTemplate>
                        </asp:TemplateField>
                           <asp:TemplateField ShowHeader="true" HeaderText="修改"  Visible="false">
                             <ItemTemplate>
                                <asp:LinkButton ID="lbtnEdit" runat="server" CausesValidation="False" CommandName="itemEdit" Enabled='<%# string.Concat(Eval("Datasource"),"")!="1"&& string.Concat(Eval("CheckState"),"")!="1" %>'
                                    CommandArgument='<%# Eval("checkRptID") %>' OnCommand="gvReport_Command" Text="修改"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField ShowHeader="true" HeaderText="导出"  Visible="false">
                            <ItemTemplate>
                                    <asp:LinkButton ID="LinkExport" runat="server" CausesValidation="False" CommandName="itemExport"
                                    CommandArgument='<%# Eval("checkRptID") %>' OnCommand="gvReport_Command" Text="导出"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                           <asp:TemplateField ShowHeader="true" HeaderText="对比"  Visible="false">
                            <ItemTemplate>                                 
                                    <asp:LinkButton ID="lbtnBalance" runat="server" CausesValidation="False" CommandName="itemBalance"
                                    CommandArgument='<%# Eval("checkRptID") %>' OnCommand="gvReport_Command" Text="对比"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="true" HeaderText="健康状态报告">
                          <ItemTemplate>
                             <a href="../../Member/Assess/HealthStatusReportView.aspx?checkupRptId=<%# Eval("checkRptID") %>&Type=illStatus"  target="_blank">查看</a>                          
                          </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </Chy:XGridView>
            </td>
        </tr>
    </table>
    <script language="javascript" type="text/javascript">
        //检查结束时间
        function checkTime() {
            var StartTime = $.trim($("#<%=tpStartTime.ClientID %>").val()).replace(/-/g, '/').split('/');
            var EndTime = $.trim($("#<%=tpEndTime.ClientID %>").val()).replace(/-/g, '/').split('/');

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
    </script>
</asp:Content>
