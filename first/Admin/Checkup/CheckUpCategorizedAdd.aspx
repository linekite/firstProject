<%@ Page Title="" Language="C#" MasterPageFile="~/MainContent.Master" AutoEventWireup="true"
    CodeBehind="CheckUpCategorizedAdd.aspx.cs" Inherits="Chm.Web.Admin.Checkup.CheckUpCategorizeAdd" %>

<%@ Import Namespace="Chm.Web" %>
<%@ Import Namespace="Chy.Web" %>
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
                title: '<%= HMCommon.GetLanguage("HM_CheckUpUnusualCategorized")%>',
                modal: true,
                closeOnEscape: false,
                autoHeight: true,
                zIndex: 9999,
                width: 230,
                height: 500
            });
            $("#img").click(function () { $("#divDiseaseCateg").dialog("open"); $.treeview.resetTree(); });

            $("#<%=btnReturn.ClientID %>").click(function () { parent.CloseWindow();});
        })

        function funCloseWindow(id) {
            var msg = '保存成功';
            var title = '<%= HMCommon.GetLanguage("HM_AlertTilte")%>';
            top.alertMsg(msg, title, 400, 200, null);
            parent.CloseWindow(id);
        }
        function clickNode(data) {
            $("#<%=hidDiseaseId.ClientID%>").val(data.Id);
            $("#<%=txtUnusualCateg.ClientID%>").val(data.Text);
            $("#divDiseaseCateg").dialog("close");

        }
        function onTreeToggle() {
        }
        function SaveDisease(id, name) {
            $("#<%=hidDiseaseId.ClientID%>").val(id);
            $("#<%=txtUnusualCateg.ClientID%>").val(name);
            $("#divDiseaseCateg").dialog("close");
        }
        function CheckSave() {
            var checkTime = $("#<%=txtCheckUpTime.ClientID %>").val();
            var alertTitle = '<%=HMCommon.GetLanguage("HM_AlertTilte") %>';
            var alertInfo = '<%=HMCommon.GetLanguage("HM_FillInfoNotComplete") %>';
            var alertTip = '<%=HMCommon.GetLanguage("HM_FillInfoNotComplete") %>';
            if (checkTime == "") {
                top.alertMsg(alertInfo, alertTitle, 400, 200, '')
                return false;
            }

            var checkCategorize = $("#<%=txtUnusualCateg.ClientID %>").val();
            if (checkCategorize == "") {
                top.alertMsg(alertInfo, alertTitle, 400, 200, '')
                return false;
            }

            var orgValue = $("#<%=ddlOrgList.ClientID %> option:selected").val();
            if (orgValue == "-1") {
                top.alertMsg(alertInfo, alertTitle, 400, 200, '');
                return false;
            }


        }
        function selcetReport(obj) {
            var rptId = obj.id;
            var value = $("#" + rptId + " option:selected").val();

            if (value != "-1") {
                $("#<%=hidReportId.ClientID %>").val(value);
                var text = $("#" + rptId + " option:selected").text();
                var date = new Date(text.replace(/-/g, "/"));
                var m = date.getMonth() + 1;
                var time = date.getFullYear() + "-" + (m < 10 ? '0' + m : m) + "-" + date.getDate();
                $("#<%=txtCheckUpTime.ClientID %>").val(time);
            }
            else {
                $("#<%=txtCheckUpTime.ClientID %>").val("");
            }

            //            $("#<%=ddlReportList.ClientID%> option").each(function () {
            //                var length = $("#<%=ddlReportList.ClientID%>").get(0).options.length;
            //                alert(length);
            //                for (var i = 0; i < length; i++) {
            //                    alert($(this).val());
            //                }

            //            });
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
                <span class="red">*</span><%=HMCommon.GetLanguage("HM_CheckUpTime")%><%=Resource.GetString("Remp_Colon")%>
            </td>
            <td class="input">
                <Chy:XDatePicker ID="txtCheckUpTime" name="txt_DateStart" DateFmt="yyyy-MM-dd" runat="server"
                    Width="150px"></Chy:XDatePicker>
                <asp:DropDownList ID="ddlReportList" runat="server" Width="150px" Visible="false" onchange="selcetReport(this);">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="label">
                <span class="red">*</span><%=HMCommon.GetLanguage("HM_CheckUpUnusualCategorized")%><%=Resource.GetString("Remp_Colon")%>
            </td>
            <td class="input">
                <Chy:XTextBox ID="txtUnusualCateg" ReadOnly="true" runat="server" class="inputtext"
                    MaxLength="30" Width="300px"></Chy:XTextBox>&nbsp;&nbsp;<img src="../../Images/search.png"
                        id="img" alt="" style="cursor: hand" />
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td style="color: #6CBCF9; font-weight: bold">
                <%=HMCommon.GetLanguage("HM_CategorizedGfusNote")%>
            </td>
        </tr>
        <tr>
            <td class="label">
                <span class="red">*</span><%=HMCommon.GetLanguage("HM_SelectOrgNode")%><%=Resource.GetString("Remp_Colon")%>
            </td>
            <td class="input">
                <asp:DropDownList ID="ddlOrgList" runat="server" Width="400px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <Chy:XButton ID="btnSave" runat="server" ValidationGroup="DoctorValid" CssClass="button"
                    OnClick="btnSave_Click" OnClientClick="return CheckSave();" />
                &nbsp;
                <Chy:XButton ID="btnReturn" runat="server" CssClass="button"/>
            </td>
        </tr>
    </table>
    <div id="divDiseaseCateg">
        <div id="treeViewContainer" runat="server" style="overflow: auto; height: 380px"
            class="distree">
        </div>
    </div>
    <input type="hidden" id="hidDiseaseId" runat="server" value="0" />
    <input type="hidden" id="hidReportId" runat="server" value="0" />
</asp:Content>
