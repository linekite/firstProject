<%@ Page Language="C#" MasterPageFile="~/MainContent.Master" AutoEventWireup="true" CodeBehind="DiseaseGroupEdit.aspx.cs" Inherits="Chm.Web.DiseaseGroupEdit" %>
<%@ Import Namespace="Chy.Web" %>
<%@ Register Assembly="Chy.UI.Controls" Namespace="Chy.UI.Controls" TagPrefix="Chy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
  
<table width="99%" cellpadding="0" cellspacing="0" align="center">
  <tr>
      <asp:ScriptManager ID="ScriptManager1" runat="server">
      </asp:ScriptManager>
    <td valign="top" width="48%">
    <table width="100%" cellpadding="0" cellspacing="0" class="searchPanel"  align="center">
    	<tr>
        <td>			
			<table cellpadding="0" cellspacing="0" >
				<tr>
                    <td class="label">
                        姓名：
                    </td>
                    <td class="input">
                        <Chy:XTextBox ID="txtPatientName" runat="server" CssClass="inputtext" MaxLength="20">
                        </Chy:XTextBox>
                    </td>
                    <td class="label">
                        会员卡号：
                    </td>
                    <td class="input">
                        <Chy:XTextBox ID="txtMemberID" CssClass="inputtext" runat="server">
                        </Chy:XTextBox>
                    </td>				
					<td  class="label">
				        <Chy:XButton ID="btnSearch" runat="server" CssClass="button" Text="查询" OnClick="btnSearch_Click"/>  
                    </td>
				</tr>
			</table>
	   </td>
        </tr>		
    </table>
    <div class="sf_tit">
    <Chy:XLabel ID="lbGroupName" runat="server"></Chy:XLabel></div>
    <asp:UpdatePanel ID="UpdatePanelOrg" runat="server" UpdateMode="Conditional">
    <Triggers>
      <asp:PostBackTrigger ControlID="btnSearch"/>
      <asp:PostBackTrigger ControlID="btnAdd"/>
      <asp:PostBackTrigger ControlID="btnRemove"/>
    </Triggers>
    <ContentTemplate>    
         <Chy:XGridView  ID="gvShow" runat="server" CssClass="zebratable"  AllowPaging="true"   DataKeyNames="PatientId"
        AutoGenerateColumns="False" PagerSettings-PageButtonCount="8" PageSize="10" width="100%" OnBindCstm="gvShow_BindCstm">
        <Columns>
            <asp:TemplateField HeaderStyle-CssClass="check" ItemStyle-CssClass="check" HeaderStyle-Width="5%" ItemStyle-Width="5%">
                <HeaderTemplate>
                    <input type="checkbox" id="chkSelAll" onclick="return chkAll()"/>                    
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="chkSelItem" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="姓名">
                <ItemTemplate>
                        <%# Eval("PatientName")%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="会员卡号">
                <ItemTemplate>
                     <%#  ComUtils.SubWord(Eval("MemberID"), 15)%>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </Chy:XGridView>
    </ContentTemplate>
    </asp:UpdatePanel>
    </td>
    <td style="width:80px; text-align:center;" valign="middle">
       <br /><br /><br /><br />    
      <Chy:XButton ID="btnAdd" runat="server" CssClass="button" Text=">" OnClick="btnAdd_Click" OnClientClick="return chkItem()"/>
      <br /><br />
      <Chy:XButton ID="btnRemove" runat="server" CssClass="button" Text="<" OnClick="btnRemove_Click" OnClientClick="return chkDiseaseItem()" />      
    </td>
    <td valign="top">
    <table width="100%" cellpadding="0" cellspacing="0" class="searchPanel"  align="center">
    	<tr>
        <td>			
			<table cellpadding="0" cellspacing="0" >
              <tr>
                    <td class="label">
                        姓名：
                    </td>
                    <td class="input">
                        <Chy:XTextBox ID="txtName" runat="server" CssClass="inputtext" MaxLength="20">
                        </Chy:XTextBox>
                    </td>
                    <td class="label">
                        会员卡号：
                    </td>
                    <td class="input">
                        <Chy:XTextBox ID="txtCardNo" CssClass="inputtext" runat="server">
                        </Chy:XTextBox>
                    </td>				
					<td  class="label">
				        <Chy:XButton ID="btnFind" runat="server" CssClass="button" Text="查询" OnClick="btnFind_Click"/>  
                    </td>
                </tr>
			</table>
	   </td>
        </tr>		
    </table>
    <div class="sf_tit"><Chy:XLabel ID="lblDisease" runat="server"></Chy:XLabel></div>
    <asp:UpdatePanel ID="UpdatePanelDisease" runat="server" UpdateMode="Conditional">
    <Triggers>
     <asp:PostBackTrigger ControlID="btnFind"/>
     <asp:PostBackTrigger ControlID="btnAdd"/>
     <asp:PostBackTrigger ControlID="btnRemove"/>
    </Triggers>
    <ContentTemplate> 
       <Chy:XGridView  ID="gvShowDisease" runat="server" CssClass="zebratable"  AllowPaging="true"   DataKeyNames="PatientId"
        AutoGenerateColumns="False" PagerSettings-PageButtonCount="8" PageSize="10" width="100%" OnBindCstm="gvShowDisease_BindCstm">
        <Columns>
            <asp:TemplateField HeaderStyle-CssClass="check" ItemStyle-CssClass="check" HeaderStyle-Width="5%" ItemStyle-Width="5%">
                <HeaderTemplate>
                    <input type="checkbox" id="chkDiseaseSelAll" onclick="chkDiseaseAll()"/>                    
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="chkSelItem" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="姓名">
                <ItemTemplate>
                        <%# Eval("PatientName")%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="会员卡号">
                <ItemTemplate>
                    <%#  ComUtils.SubWord(Eval("MemberID"), 15)%>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </Chy:XGridView>
    </ContentTemplate>
    </asp:UpdatePanel>
    </td>
  </tr>
</table>

 <br />
 <div align="center">
 &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;
 <input type="button" class="button" value="返回" id="btnCancel" runat="server"/>
 </div>

<script language="javascript" type="text/javascript">
//    $(document).ready(function () {
//        $("#chkSelAll").click(function () {
//            $("#<%=gvShow.ClientID %>  :checkbox:enabled[name$=chkSelItem]").attr("checked", this.checked);
//        })
//        $("#chkDiseaseSelAll").click(function () {
//            $("#<%=gvShowDisease.ClientID %>  :checkbox:enabled[name$=chkSelItem]").attr("checked", this.checked);
//        })
//    });

    function chkAll() {       
        var check = $("#chkSelAll").attr("checked");
        $("#<%=gvShow.ClientID %> :checkbox:enabled[name$=chkSelItem]").attr("checked", check);
    }

    function chkDiseaseAll() {
        var check = $("#chkDiseaseSelAll").attr("checked");
        $("#<%=gvShowDisease.ClientID %> :checkbox:enabled[name$=chkSelItem]").attr("checked", check);
    }
    //选择

function chkItem() {
    var Items = $("#<%=gvShow.ClientID %>  :checkbox:enabled[name$=chkSelItem]:checked")
    if (Items.length <= 0) {
        alertMsg('请选择!', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
        return false;
    }
    else {
        return confirmMsg('<%=btnAdd.UniqueID %>', '确认要增加吗?', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200);
    }
}
//选择
function chkDiseaseItem() {
    var Items = $("#<%=gvShowDisease.ClientID %>  :checkbox:enabled[name$=chkSelItem]:checked")
    if (Items.length <= 0) {
        alertMsg('请选择!', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
        return false;
    }
    else {
        return confirmMsg('<%=btnRemove.UniqueID %>', '确认要移除吗?', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200);
    }
}
</script>

</asp:Content>
