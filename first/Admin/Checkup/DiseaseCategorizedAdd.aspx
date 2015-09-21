<%@ Page Title="" Language="C#" MasterPageFile="~/MainContent.Master" AutoEventWireup="true"
    CodeBehind="DiseaseCategorizedAdd.aspx.cs" Inherits="Chm.Web.Admin.Checkup.DiseaseCategorizedAdd" %>

<%@ Import Namespace="Chy.Web" %>
<%@ Import Namespace="Chm.Web" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/Js/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <link href="../../Styles/orgtree/jquery.treeview.css" rel="stylesheet" type="text/css" />
    <script src="../../Scripts/orgtree/jquery.treeview.js" type="text/javascript"></script>
    <script src="../../Scripts/orgtree/jquery.treeview.edit.js" type="text/javascript"></script>
    <script src="../../Scripts/orgtree/jquery.treeview.async.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        $(document).ready(function () {
            $("#divDiseaseCateg").dialog({
                bgiframe: true,
                draggable: false,
                autoOpen: false,
                title: '<%= HMCommon.GetLanguage("HM_DiseaseCategorized")%>',
                modal: true,
                closeOnEscape: false,
                autoHeight: true,
                zIndex: 9999,
                width: 400,
                height: 500
            });
            $("#img").click(function () { $("#divDiseaseCateg").dialog("open"); $.treeview.resetTree(); });
            $("#<%=btnReturn.ClientID %>").click(function () { parent.CloseWindow(); });
        })
        function funCloseWindow(id) {
            var msg = '保存成功';
            var title = '<%= HMCommon.GetLanguage("HM_AlertTilte")%>';
            top.alertMsg(msg, title, 400, 200, null);
            parent.CloseWindow(id);
        }
        function clickNode(data) {
            $("#<%=hidCategoryId.ClientID%>").val(data.Id); 
            $("#<%=txtDiseaseCateg.ClientID%>").val(data.Text);
            $("#<%=hidTxtDiseaseCateg.ClientID%>").val(data.Text);
            $("#divDiseaseCateg").dialog("close");

        }
        function onTreeToggle() {
        }
        function CheckSave() {
            var diagnoseTime = $("#<%=txtDiagnoseTime.ClientID %>").val();
            var alertTitle = '<%=HMCommon.GetLanguage("HM_AlertTilte") %>';
            //var diagnoseTimeTip = '<%=HMCommon.GetLanguage("HM_DiagnoseTimeNotEmpty") %>';
            var alertInfo = '<%=HMCommon.GetLanguage("HM_FillInfoNotComplete") %>';
            if (diagnoseTime == "") {
                top.alertMsg(alertInfo, alertTitle, 400, 200, '')
                return false;
            }

            var diseaseCategorize = $("#<%=txtDiseaseCateg.ClientID %>").val();
            //var diseaseCategorizeTip = '<%=HMCommon.GetLanguage("HM_DiseaseCategorizedNotEmpty") %>';
            if (diseaseCategorize == "") {
                top.alertMsg(alertInfo, alertTitle, 400, 200, '')
                return false;
            }

            var orgValue = $("#<%=ddlOrgList.ClientID %> option:selected").val();
            //var orgValueTip = '<%=HMCommon.GetLanguage("HM_OrgNodeNotEmpty") %>';
            if (orgValue == "-1") {
                top.alertMsg(alertInfo, alertTitle, 400, 200, '');
                return false;
            }

            var orgTypeValue = $("#<%=orgTypeList.ClientID %> option:selected").val();
            //var orgValueTip = '<%=HMCommon.GetLanguage("HM_OrgNodeNotEmpty") %>';
            if (orgTypeValue == "-1") {
                top.alertMsg(alertInfo, alertTitle, 400, 200, '');
                return false;
            }
        }
        function selcetOrgPath(obj) {
            var groupTypeTip = "";
            var orgListId = obj.id;
            var orgId = $("#" + orgListId + " option:selected").val();
            if (orgId == "-1") {

            }
            else {
                $.ajax({
                    type: "get",
                    url: "../../ajax/SurveyAjax.ashx?actType=getOrgGroupType&orgId=" + encodeURI(orgId),
                    async: false,
                    success: function (data, textStatus) {
                        switch (data) {
                            case "0":
                                groupTypeTip = '<%=HMCommon.GetLanguage("HM_GoupType0") %>';
                                break;
                            case "2":
                                groupTypeTip = '<%=HMCommon.GetLanguage("HM_GoupType2") %>';
                                break;
                            case "3":
                                groupTypeTip = '<%=HMCommon.GetLanguage("HM_GoupType3") %>';
                                break;
                        }
                    }
                });
            }
            $("#<%=lblGroupTypeTip.ClientID %>").text(groupTypeTip);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
    <table cellpadding="0" cellspacing="10" border="0">
        <tr>
            <td style="padding-top: 10px; padding-bottom: 10px">
                <%= HMCommon.GetLanguage("HM_PatientCategorized")%><%= Chy.Web.Resource.GetString("Remp_Colon")%><Chy:XLabel
                    runat="server" ID="lbalPatientName"></Chy:XLabel>
            </td>
        </tr>
        <tr>
            <td class="label">
                <span class="red">*</span><%= HMCommon.GetLanguage("HM_DiagnoseTime")%><%= Resource.GetString("Remp_Colon")%>
            </td>
            <td class="input">
                <Chy:XDatePicker ID="txtDiagnoseTime" name="txt_DateStart" runat="server" Width="200px"></Chy:XDatePicker>
            </td>
        </tr>
        <tr>
            <td class="label">
                <span class="red">*</span><%= HMCommon.GetLanguage("HM_DiseaseCategorized")%><%= Resource.GetString("Remp_Colon")%>
            </td>
            <td class="input">
                <Chy:XTextBox ID="txtDiseaseCateg" ReadOnly="true" runat="server" class="inputtext"
                    MaxLength="30" Width="200px"></Chy:XTextBox>&nbsp;&nbsp;<img src="../../Images/search.png"
                        id="img" alt="" style="cursor: hand" />
            </td>
        </tr>
        <tr>
            <td class="label">
                <span class="red">*</span>医疗活动类型：
            </td>
            <td class="input">
                <asp:DropDownList ID="orgTypeList" runat="server" Width="200px" AutoPostBack="True"
                    OnSelectedIndexChanged="orgTypeList_SelectedIndexChanged">
                    <asp:ListItem Value="-1" Text="请选择"></asp:ListItem>
                    <asp:ListItem Value="1" Text="住院"></asp:ListItem>
                    <asp:ListItem Value="2" Text="门诊"></asp:ListItem>
                    <asp:ListItem Value="3" Text="其他"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td style="color: #6CBCF9; font-weight: bold">
                <%= HMCommon.GetLanguage("HM_CategorizedGfusNote")%>
            </td>
        </tr>
        <tr>
            <td class="label">
                <span class="red">*</span><%= HMCommon.GetLanguage("HM_SelectOrgNode")%><%= Resource.GetString("Remp_Colon")%>
            </td>
            <td class="input">
                <asp:DropDownList ID="ddlOrgList" runat="server" Width="400px"><%--onchange="return selcetOrgPath(this);"--%>
                </asp:DropDownList>
                &nbsp; &nbsp;
                <Chy:XLabel runat="server" ID="lblGroupTypeTip" Style="color: #6CBCF9; font-weight: bold"></Chy:XLabel>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <Chy:XButton ID="btnSave" runat="server" ValidationGroup="DoctorValid" CssClass="button"
                    OnClick="btnSave_Click" OnClientClick="return CheckSave();" />
                &nbsp;
                <Chy:XButton ID="btnReturn" runat="server" CssClass="button" />
            </td>
        </tr>
    </table>
    <div id="divDiseaseCateg">
        <div id="treeViewContainer" runat="server" style="overflow: auto; height: 380px"
            class="distree">
        </div>
    </div>
    <input type="hidden" id="hidCategoryId" runat="server" value="0" />
    <input type="hidden" id="hidTxtDiseaseCateg" runat="server" value="0" />
</asp:Content>
