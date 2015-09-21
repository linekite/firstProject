<%@ Page  Language="C#" MasterPageFile="~/MainContent.Master" AutoEventWireup="true" CodeBehind="PhysiqueMemberDetail.aspx.cs" Inherits="Chm.Web.Admin.Checkup.PhysiqueMemberDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script src="/Js/DatePicker/WdatePicker.js" type="text/javascript"></script> 
<link href="../../Styles/adminwordbreak.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
<%-- <div >--%>
        <Chy:XTextBox ID="txtType" runat="server" Style="display: none">
        </Chy:XTextBox>
        <table border="0" cellspacing="0" cellpadding="0" class="formcontainer" >
            <tr>
                <td class="label">
                    <Chy:XLabel ID="lblItemRecName" runat="server"></Chy:XLabel> 
                </td>
                <td class="tbtb">
                    <span>
                        <Chy:XLabel ID="txtItemRecName" MaxLength="32" runat="server"   AllowEmpty="false" ></Chy:XLabel>           
                    </span>
                </td>
            </tr>
            <tr>
                <td class="label">
                     <Chy:XLabel ID="lblUnit" runat="server"></Chy:XLabel> 
                </td>
                <td class="tbtb">
                    <Chy:XLabel ID="txtUnit" MaxLength="8" runat="server" >
                    </Chy:XLabel>
                </td>
            </tr>
            <tr>
                <td class="label">
                    <Chy:XLabel ID="lblCheckUpTime" runat="server"></Chy:XLabel>
                </td>
                <td  class="tbtb">
                    <Chy:XLabel ID="dpCheckUpTime" runat="server" AllowEmpty="false" >
                    </Chy:XLabel>
                </td>
            </tr>
            <tr>
                <td class="label">
                    <Chy:XLabel ID="lblResult" runat="server"></Chy:XLabel>
                </td>
                <td  class="tbtb">
                    <Chy:XLabel ID="txtResult" MaxLength="32" runat="server" >
                    </Chy:XLabel>
                </td>
            </tr>
            <tr>
                <td class="label">
                    <Chy:XLabel ID="lblReUpper" runat="server"></Chy:XLabel>
                </td>
                <td class="tbtb">
                    <Chy:XLabel ID="txtReUpper" MaxLength="10" runat="server" >
                    </Chy:XLabel>
                </td>
            </tr>
            <tr>
                <td class="label">
                    <Chy:XLabel ID="lblReLower" runat="server"></Chy:XLabel>
                </td>
                <td class="tbtb">
                    <Chy:XLabel ID="txtReLower" MaxLength="10" runat="server" >
                    </Chy:XLabel>
                </td>
            </tr>
            <tr>
                <td class="label">
                   <Chy:XLabel ID="lblTips" runat="server"></Chy:XLabel>
                </td>
                <td class="tbtb">
                    <Chy:XLabel ID="txtTips"  
                        runat="server" >
                    </Chy:XLabel>
                </td>
            </tr>
            <tr>
                <td class="label">
                    <Chy:XLabel ID="lblPatientName" runat="server"></Chy:XLabel>
                </td>
                <td class="tbtb">
                    <Chy:XLabel ID="txtPatientName" MaxLength="32" runat="server"  >
                    </Chy:XLabel>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center"> 
                    <Chy:XButton ID="btnCancel" runat="server" Text="取消" CssClass="button" CausesValidation="false"
                        OnClick="btnCancel_Click" />
                </td>
            </tr>
        </table>
    <%--    <table width="99%" border="0" cellspacing="0" cellpadding="0" align="center" class="formcontainer">
            
        </table>--%>
<%--    </div>--%>
</asp:Content>
