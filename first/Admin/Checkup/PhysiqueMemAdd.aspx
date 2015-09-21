<%@ Page Language="C#" MasterPageFile="~/AmMainContent.Master" AutoEventWireup="true"
    CodeBehind="PhysiqueMemAdd.aspx.cs" Inherits="Chm.Web.Admin.Checkup.PhysiqueMemAdd" %>
<%@ Register TagPrefix="Chy" Namespace="Chy.UI.Controls" Assembly="Chy.UI.Controls" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <link href="../../Styles/wordbreak.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
    function returnGoBack() {
        window.location.href = "PhysiqueMemberList.aspx";
        return false;
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
    <table border="0" cellspacing="0" cellpadding="0">        
        <tr>
           
            <td class="tata">
                <Chy:XLabel ID="lblPatientName" runat="server"></Chy:XLabel>
            </td>
            <td class="tbtb">
                <Chy:XLabel ID="txtPatientName" MaxLength="32" runat="server" >
                </Chy:XLabel>
            </td>
        </tr>
          <tr>
            <td class="tata">
               <Chy:XLabel ID="lblItemRecName" runat="server"></Chy:XLabel> 
            </td>
            <td class="tbtb">
                <span>
                    <Chy:XLabel ID="txtItemRecName" MaxLength="32" runat="server" 
                        AllowEmpty="false" ValidationGroup="DoctorValid" ValidType="String"></Chy:XLabel>
                    <Chy:XTextBox ID="txtItemID" MaxLength="32" runat="server"  AllowEmpty="false"
                        Style="display: none"></Chy:XTextBox>
                </span>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <Chy:XLabel ID="lblID" runat="server" Visible="false"></Chy:XLabel>
            </td>
        </tr>        
        <tr>
            <td class="tata">
                <Chy:XLabel ID="lblCheckUpTime" runat="server"></Chy:XLabel>
            </td>
            <td class="tbtb">
                <Chy:XLabel ID="dpCheckUpTime" runat="server">
                </Chy:XLabel>
            </td>
        </tr>
        <tr>
            <td class="tata">
               <Chy:XLabel ID="lblResult" runat="server"></Chy:XLabel> 
            </td>
            <td class="tbtb">
                <Chy:XLabel ID="txtResult" MaxLength="32" runat="server" >
                </Chy:XLabel>
            </td>
        </tr>
        <tr>
            <td class="tata">
                <Chy:XLabel ID="lblUnit" runat="server"></Chy:XLabel> 
            </td>
            <td class="tbtb">
                <Chy:XLabel ID="txtUnit" MaxLength="8" runat="server" >
                </Chy:XLabel>
            </td>
        </tr>
        <tr>
            <td class="tata">
               <Chy:XLabel ID="lblReUpper" runat="server"></Chy:XLabel>
            </td>
            <td class="tbtb">
                <Chy:XLabel ID="txtReUpper" MaxLength="10" runat="server" >
                </Chy:XLabel>
            </td>
        </tr>
        <tr>
            <td class="tata">
                <Chy:XLabel ID="lblReLower" runat="server"></Chy:XLabel>
            </td>
            <td class="tbtb">
                <Chy:XLabel ID="txtReLower" MaxLength="10" runat="server" >
                </Chy:XLabel>
            </td>
        </tr>
        <tr>
            <td class="tata">
                <Chy:XLabel ID="lblTips" runat="server"></Chy:XLabel>
            </td>
            <td class="tbtb">
                <Chy:XLabel ID="txtTips" Width="99%"  Rows="3" TextMode="MultiLine" MaxLen="512" runat="server">
                </Chy:XLabel>
            </td>
        </tr> 
           <tr>
            <td colspan="2" align="center" class="bt_tab">
                <Chy:xbutton ID="btnReturn" runat="server" Text="返回" CssClass="button" OnClientClick="return returnGoBack();"
                    ValidationGroup="RoleVal" />
            </td>
        </tr>      
    </table>
   <%-- <div class="bt_tab"> 
        <asp:Button ID="btnReturn" runat="server" Text="返回" CssClass="button" OnClientClick="return returnGoBack();" />
    </div>--%>
</asp:Content>
