<%@ Page Title="" Language="C#" MasterPageFile="~/AmMainContent.Master" AutoEventWireup="true" CodeBehind="ChartAnalysis.aspx.cs" Inherits="Chm.Web.Admin.Checkup.ChartAnalysis" %>
<%@ Register src="../../Controls/UserControls/UCChart.ascx" tagname="UCChart" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
    $(document).ready(function () {
        parent.parent.window.scrollTo(0, 0);
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
    <uc1:UCChart ID="UCChart1" runat="server" />
    <asp:Label ID="lblMsg" runat="server"></asp:Label>
    <input type="button" value="关闭" onclick="javascript:parent.CloseWindow()" class="button" />
</asp:Content>
