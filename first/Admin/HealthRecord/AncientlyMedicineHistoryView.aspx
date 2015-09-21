<%@ Page Language="C#" MasterPageFile="~/MainContent.Master" AutoEventWireup="true"
    CodeBehind="AncientlyMedicineHistoryView.aspx.cs" Inherits="Chm.Web.Admin.HealthRecord.AncientlyMedicineHistoryView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link href="../../Styles/adminwordbreak.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
    <%--<table border="0" cellspacing="0" cellpadding="0" align="center">
        <tr>
            <td>
                <div class="con">
                    <div id="tagContent">
                        <div class="tagContent" id="tagContent0">
                        </div>
                        <div class="tagContent selectTag" id="tagContent1">--%>
    <colgroup>
        <col style="width: 15%;"></col> 
        <col style=" width:85%;" />
    </colgroup>
    <table border="0" cellspacing="0" cellpadding="0" class="formcontainer">
        <tr>
            <td class="label">
                <Chy:xlabel id="lblPatientNameTitle" runat="server" text="姓名" />
            </td>
            <td class="tbtb">
                <Chy:xlabel id="lblPatientName" runat="server">
                                        </Chy:xlabel>
            </td>
        </tr>
        <tr>
            <td class="label">
                <Chy:xlabel id="lblIllNameTitle" runat="server" text="疾病名称" />
            </td>
            <td class="tbtb">
                <Chy:xlabel id="lblIllName" runat="server">
                                        </Chy:xlabel>
            </td>
        </tr>
        <tr>
            <td class="label">
                <Chy:xlabel id="lblMedicineNameTitle" runat="server" text="药物名称" />
            </td>
            <td class="tbtb">
                <Chy:xlabel id="lblMedicineName" runat="server" >
                                        </Chy:xlabel>
            </td>
        </tr>
        <tr>
            <td class="label">
                <Chy:xlabel id="lblHospitalTitle" runat="server" text="医院名称" />
            </td>
            <td class="tbtb">
                <Chy:xlabel id="lblHospital" runat="server" >
                                        </Chy:xlabel>
            </td>
        </tr>
        <tr>
            <td class="label">
                <Chy:xlabel id="lblDoctorNameTitle" runat="server" text="主治医生" />
            </td>
            <td class="tbtb">
                <Chy:xlabel id="lblDoctorName" runat="server">
                                        </Chy:xlabel>
            </td>
        </tr>
        <tr>
            <td class="label">
                <Chy:xlabel id="lblDoseTitle" runat="server" text="用药剂量" />
            </td>
            <td class="tbtb">
                <Chy:xlabel id="lblDose" runat="server">
                                        </Chy:xlabel>
            </td>
        </tr>
        <tr>
            <td class="label">
                <Chy:xlabel id="lblMedicineUnitTitle" runat="server" text="用药单位" />
            </td>
            <td class="tbtb">
                <Chy:xlabel id="lblMedicineUnit" runat="server">
                                        </Chy:xlabel>
            </td>
        </tr>
        <tr>
            <td class="label">
                <Chy:xlabel id="lblFrequency" text="" runat="server" />
            </td>
            <td class="tbtb">
                <Chy:xlabel id="txtFrequency" runat="server">
                                        </Chy:xlabel>
            </td>
        </tr>
        <tr>
            <td class="label">
                <Chy:xlabel id="lblMedicineTime" text="" runat="server" />
            </td>
            <td class="tbtb">
                <Chy:xlabel id="txtMedicineTime" runat="server">
                                        </Chy:xlabel>
            </td>
        </tr>
        <tr>
            <td class="label">
                <Chy:xlabel id="lblUsage" text="" runat="server" />
            </td>
            <td class="tbtb">
                <Chy:xlabel id="txtUsage" runat="server">
                                        </Chy:xlabel>
            </td>
        </tr>
        <tr>
            <td class="label">
                <Chy:xlabel id="lblStartTime" runat="server" text="" />
            </td>
            <td class="tbtb">
                <Chy:xlabel id="dpStartTime" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="label">
                <Chy:xlabel id="lblEndTime" runat="server" text="" />
            </td>
            <td class="tbtb">
                <Chy:xlabel id="dpEndTime" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="label">
                <Chy:xlabel id="lblReactionTitle" runat="server" text="主要不良反应" />
            </td>
            <td class="tbtb">
                <Chy:xlabel id="lblReaction" name="主要不良反应" runat="server">
                                        </Chy:xlabel>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <Chy:xbutton id="btnReturn" runat="server" text="返回" cssclass="button" onclick="btnReturn_Click"
                    causesvalidation="False" />
            </td>
        </tr>
    </table>
   <%-- <table border="0" width="99%" cellspacing="0" cellpadding="0" class="addformcontainer">
        
    </table>--%>
    <%--   </div>
                    </div>
                </div>
            </td>
        </tr>
    </table>--%>
</asp:Content>
