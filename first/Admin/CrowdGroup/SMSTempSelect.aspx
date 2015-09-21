<%@ Page Language="C#" MasterPageFile="~/MainContent.Master" AutoEventWireup="true" CodeBehind="SMSTempSelect.aspx.cs" Inherits="Chm.Web.Admin.CrowdGroup.SMSTempSelect" %>
<%@ Register src="../../Controls/SMS/SMSTemplateListSelector.ascx" tagname="SMSTemplateListSelector" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
    <uc1:SMSTemplateListSelector ViewMode="control" ID="SMSTemplateListSelector1" runat="server" />
</asp:Content>
