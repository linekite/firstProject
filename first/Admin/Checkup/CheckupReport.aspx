<%@ Page Language="C#" MasterPageFile="~/MainContent.Master" AutoEventWireup="true" CodeBehind="CheckupReport.aspx.cs" Inherits="Chm.Web.Admin.Checkup.CheckupReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script src="/Js/DatePicker/WdatePicker.js" type="text/javascript"></script> 
<script language="javascript" type="text/javascript">
    $(document).ready(function () {
        $("#chkSelAll").click(function () {
            $("#<%=gvReport.ClientID %> tr:gt(0) :checkbox").not(":disabled").attr("checked",$(this).attr("checked"))
        });
    });
    //检查结束时间
    function checkTime() { 
        var StartTime = $.trim($("#<%=tpStartTime.ClientID %>").val()).replace(/-/g,'/').split('/');
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
<style type="text/css">
    .hidden { display:none;}       
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
<table width="99%" cellpadding="0" cellspacing="0" class="searchPanel"  align="center">
  <tr >
    <td>
      <table cellpadding="0" cellspacing="0"  border="0" >
        <tr >
            <td class="label"><Chy:XLabel ID="lblHospital" runat="server"></Chy:XLabel></td>
            <td class="input">
            <Chy:XTextBox ID="txtHospital" runat="server" class="inputtext" MaxLength="64"></Chy:XTextBox>
            </td>           
            <td class="label"><Chy:XLabel ID="lblStartTime" runat="server"></Chy:XLabel></td>
            <td class="input">
             <Chy:XDatePicker ID="tpStartTime" runat="server"></Chy:XDatePicker>  
            </td>
            <td class="label"><Chy:XLabel ID="lblEndTime" runat="server"></Chy:XLabel></td>
            <td class="input">
            <Chy:XDatePicker ID="tpEndTime" runat="server"></Chy:XDatePicker>  
            </td>
            <td  class="input">
            <Chy:XButton ID="btnSearch" runat="server" Text="查询" CssClass="button" 
                    onclick="btnSearch_Click"  OnClientClick="return checkTime();"/>            
            </td>
        </tr>
      </table>
    </td>
    <td  class="add">
    
    </td>
  </tr>        
</table>
<table width="99%" cellpadding="0" cellspacing="0" align="center">
  <tr>
    <td>        
        <Chy:XGridView  ID="gvReport" runat="server" CssClass="zebratable"  AllowPaging="true"   DataKeyNames="checkRptID"
        AutoGenerateColumns="False" PagerSettings-PageButtonCount="8" PageSize="10" width="100%"  OnBindCstm="gvReport_BindCstm" OnRowDataBound="gvReport_RowDataBound">
        <Columns>
            <asp:TemplateField ItemStyle-Width="24px" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
                <HeaderTemplate>
                    <%--<asp:CheckBox ID="chkSelAll" runat="server" onclick="selectAll(this,'<%=gvReport.ClientID %>')"/>--%>
                    <input id="chkSelAll" type="checkbox" />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="chkSelItem" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="PatientName" HeaderText="姓名" Visible="false"></asp:BoundField>
            <asp:TemplateField ShowHeader="true"  HeaderText="体检日期" ItemStyle-Width="120px">
                <ItemTemplate> 
                    <%# Convert.ToDateTime(Eval("CheckTime")).ToString("yyyy-MM-dd")%>
                </ItemTemplate>
            </asp:TemplateField> 
            <asp:BoundField DataField="hospital" HeaderText="医院名称"></asp:BoundField>
            <asp:BoundField DataField="doctor" HeaderText="总检医生"></asp:BoundField>             
            <asp:TemplateField ShowHeader="true"  HeaderText="操作" ItemStyle-Width="95px">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnPrint" runat="server" CausesValidation="False" CommandName="itemPrint"
                        CommandArgument='<%# Eval("checkRptID") %>' OnCommand="gvReport_Command" Text="查看报告"></asp:LinkButton>                                          
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        </Chy:XGridView>        
    </td>    
  </tr>
</table>
</asp:Content>
