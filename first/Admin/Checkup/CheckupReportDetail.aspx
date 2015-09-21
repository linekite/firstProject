<%@ Page Language="C#" MasterPageFile="~/MainContent.Master" AutoEventWireup="true"
    CodeBehind="CheckupReportDetail.aspx.cs" Inherits="Chm.Web.Admin.Checkup.CheckupReportDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link href="../../Styles/adminwordbreak.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
    <table border="0" cellspacing="0" cellpadding="0" class="formcontainer" >
        <tr> 
            <td class="label">
                <Chy:XLabel ID="lblName" runat="server"></Chy:XLabel>
            </td>
            <td class="tbtb">
                <Chy:XLabel ID="txtName" MaxLength="64" runat="server" AllowEmpty="false"
                    ValidationGroup="DoctorValid" ValidType="String" ReadOnly="true"></Chy:XLabel>
            </td>
        </tr>
        <tr> 
            <td class="label">
                <Chy:XLabel ID="lblCheckNo" runat="server"></Chy:XLabel>
            </td>
            <td class="tbtb">
                <Chy:XLabel ID="txtCheckNo" runat="server" AllowEmpty="true"
                    MaxLength="32"></Chy:XLabel>
            </td>
        </tr>
        <tr> 
            <td class="label">
                <Chy:XLabel ID="lblRegisterDate" runat="server"></Chy:XLabel>
            </td>
            <td class="tbtb">
                <Chy:XLabel ID="dpRegisterDate" runat="server" AllowEmpty="false" 
                    ValidationGroup="DoctorValid" ValidType="String"></Chy:XLabel>
            </td>
        </tr>
        <tr> 
            <td class="label">
                <Chy:XLabel ID="lblCheckDate" runat="server"></Chy:XLabel>
            </td>
            <td class="tbtb">
                <Chy:XLabel ID="dpCheckDate" runat="server" AllowEmpty="false" 
                    ValidationGroup="DoctorValid" ValidType="String"></Chy:XLabel>
            </td>
        </tr>
        <tr> 
            <td class="label">
                <Chy:XLabel ID="lblHospital" runat="server"></Chy:XLabel>
            </td>
            <td class="tbtb">
                <Chy:XLabel ID="txtHospital" runat="server" ></Chy:XLabel>
            </td>
        </tr>
        <tr> 
            <td class="label">
                <Chy:XLabel ID="lblCheckDoctor" runat="server"></Chy:XLabel>
            </td>
            <td class="tbtb">
                <Chy:XLabel ID="txtCheckDoctor" runat="server" ></Chy:XLabel>
            </td>
        </tr>
        <tr>
            <td  colspan="2" align="center">               
                <Chy:XButton ID="btnCancel" runat="server" Text="返回" CssClass="button" CausesValidation="false"
                    OnClick="btnCancel_Click" />
            </td>
        </tr>
    </table>
   <%-- <table width="99%" border="0" cellspacing="0" cellpadding="0" align="center" class="formcontainer">
        
    </table>--%>
</asp:Content>
