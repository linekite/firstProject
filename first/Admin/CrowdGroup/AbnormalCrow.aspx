<%@ Page  Language="C#" MasterPageFile="~/MainContent.Master" AutoEventWireup="true"
    EnableEventValidation="false" CodeBehind="AbnormalCrow.aspx.cs" Inherits="Chm.Web.Admin.CrowdGroup.AbnormalCrow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .hidden{display:none;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
    <asp:HiddenField ID="hdnSelectAll" Value="false" runat="server" />
    <asp:HiddenField ID="hdnResult" runat="server" />
    <asp:HiddenField ID="hdnWinOpen" runat="server" />
    <table width="99%" cellpadding="0" cellspacing="0" class="searchPanel" align="center">
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <td class="label" nowrap>
                            <Chy:XLabel ID="lblPersongRange" runat="server" Text=""></Chy:XLabel>
                        </td>
                        <td nowrap>
                            <Chy:XDropDownList ID="ddlOrganization" runat="server" Width="200px">
                            </Chy:XDropDownList>
                        </td>
                        <td class="input"  nowrap>
                            <input id="btnSetConditon" runat="server"  type="button" class="button" onclick="show()" />&nbsp;
                            <%--<Chy:XButton ID="btnUpdateCondition" runat="server" Text="" CssClass="button"
                                OnClick="btnUpdateCondition_Click" />&nbsp;--%>
                            <Chy:XButton ID="btnSearch" runat="server" Text="" CssClass="button" OnClick="btnSearch_Click" />
                        </td>
                    </tr>
                </table>
            </td>
            <td class="add" nowrap>
                <Chy:XButton ID="btnSelectAll" runat="server" Text="" CssClass="button" 
                    onclick="btnSelectAll_Click" />&nbsp;
                <Chy:XButton ID="btnSMS" CssClass="button" runat="server" Text="" OnClick="btnSMS_Click" />&nbsp;
               <Chy:XButton ID="btnSendMessage" runat="server" Text="" 
                    onclick="btnSendMessage_Click" />&nbsp;
                <Chy:XButton ID="btnExport" runat="server" Text="" CssClass="button" OnClick="btnExport_Click" />
            </td>
        </tr>
    </table>
  <%--  <table width="99%" class="zebratable" id="tbCondition" cellpadding="0" cellspacing="0"
        runat="server" align="center">
        <tr>
            <td nowrap>
                <Chy:XGridView ID="gvCondition" runat="server" CssClass="zebratable" AllowPaging="True"
                    AutoGenerateColumns="False" PagerSettings-PageButtonCount="8" 
                    PageSize="10" Width="100%">
                    <Columns>
                        <asp:BoundField  DataField="Relationship"></asp:BoundField>
                        <asp:BoundField DataField="ItemName" />
                        <asp:BoundField  DataField="Condition" />
                        <asp:BoundField  DataField="Result" />
                        <asp:BoundField  DataField="Unit" />
                    </Columns>
                    <PagerSettings PageButtonCount="8"></PagerSettings>
                </Chy:XGridView>
                <asp:HiddenField ID="HiddenField1" runat="server" />
            </td>
        </tr>
    </table>--%>
    <div style="height: 18px;">
    </div>
    <table width="99%" cellpadding="0" cellspacing="0" align="center" nowrap>
        <tr>
            <td nowrap>
                <Chy:XGridView ID="gvCheckupReport" runat="server" CssClass="zebratable" AllowPaging="True"
                    DataKeyNames="CheckRptID" AutoGenerateColumns="False" PagerSettings-PageButtonCount="8"
                    PageSize="10" Width="100%">
                    <Columns>
                        <asp:TemplateField HeaderStyle-CssClass="check" ItemStyle-Width="24px" ItemStyle-CssClass="check">
                            <HeaderTemplate>
                                <%--<input type="checkbox" id="selectAll" runat="server"/>--%>
                                <asp:CheckBox ID="selectAll" runat="server" onclick="SelectAllBox(this,'chkSelItem')"/>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSelItem" runat="server" onclick="CheckOne(this)"/><asp:Label ID="LabclassID" runat="server"
                                    Text='<%# Eval("PatientID") %>' Style="display: none"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle CssClass="check"></HeaderStyle>
                            <ItemStyle CssClass="check" Width="24px"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Label ID="lblOrgName" runat="server" Text='<%# Eval("OrgName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField >
                            <ItemTemplate>
                                <asp:Label ID="PatientName" Text='<%# Eval("PatientName") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField >
                            <ItemTemplate>
                                <asp:Label ID="lblPatientSex" runat="server" Text='<%# GetSex(Eval("PatientID")) %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField >
                            <ItemTemplate>
                                <asp:Label ID="lblAge" runat="server" Text='<%# GetPhone(Eval("PatientID")) %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="" ItemStyle-Width="120px">
                            <ItemTemplate>
                            <a id='TpNo' href='../Checkup/CheckUpReportPrint.aspx?RPT=K&Type=Detail&CheckRepID=<%# Eval("CheckRptID")%>' title=''  target='_blank'><%# Eval("CheckRptNO")%></a>
                               <%-- <%# Eval("CheckRptNO ")%>--%>
                            </ItemTemplate>
                            <ItemStyle Width="120px"></ItemStyle>
                        </asp:TemplateField>
                       <asp:TemplateField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
                        <ItemTemplate>
                            <asp:Label ID="patientId" Text='<%# Eval("PatientID") %>' runat="server" ></asp:Label>
                        </ItemTemplate>
                       </asp:TemplateField >
                       <asp:TemplateField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
                            <ItemTemplate>
                                <asp:Label ID="lblOrgId" runat="server" Text='<%# Eval("OrgId") %>'></asp:Label>
                            </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
                            <ItemTemplate>
                                <asp:Label ID="lblCheckupReportNo" runat="server" Text='<%# Eval("CheckRptNO") %>'></asp:Label>
                            </ItemTemplate>
                       </asp:TemplateField>
                    </Columns>
                    <PagerSettings PageButtonCount="8"></PagerSettings>
                </Chy:XGridView>
            </td>
        </tr>
    </table>
    <script language="javascript" type="text/javascript">
        function show() {            
            var srcPath = "AddFilter.aspx?WinOpen=" + document.getElementById("<%=hdnWinOpen.ClientID %>").value + "&rnt=" + Math.random();
            $("<div style='width:100%;height:600px' id='divchooseFrame'><iframe  scrolling='auto' width='100%' height='100%'  frameborder=0  id='ChooseFrame' src='" + srcPath + "' /></div>").dialog({ autoOpen: true, width: 800, height: 600, showTitle: false, modal: true, title: '<%=Chy.Web.Resource.GetString("HM5_0269")%>' });
        }

        function SetCheckupItem(s) {
            $("#<%=hdnResult.ClientID %>").val(s);
            $('div').dialog('close');
        }

        /*发送短信*/
        SmsSendHander = function () {
            var gridId = '<%=gvCheckupReport.ClientID %>';
            var express = "#" + gridId + " :checkbox[checked]";
            var selected = $(express).length;
            if (selected == 0) {
                return alertMsg('<%=Chy.Web.Resource.GetString("HM_ChooseDel")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
            }
            else {
                var Inputs = document.getElementById("<%=gvCheckupReport.ClientID %>").getElementsByTagName("Input");
                var patientIds = "";
                for (i = 0; i < Inputs.length; i++) {
                    if (Inputs.item(i).type == "checkbox") {
                        if (Inputs.item(i).checked) {
                            patientIds = Inputs.item(i).parentNode.childNodes[1].innerText + ",";
                        }
                    }
                }
                // $("#mainFrame").attr("src", 'SenSMS.aspx?Ids=' + patientIds);
                $("<div style='width:100%;height:550px' id='divchooseFrame'><iframe  scrolling='auto' width='100%' height='100%'  frameborder=0  id='ChooseFrame' src='SenSMS.aspx?Ids=" + patientIds + "' /></div>").dialog({ autoOpen: true, width: 800, height: 550, showTitle: false, modal: true, title: '发送短信' });
            }
        }

        /*发送消息*/
        InteractionHander = function () {
            var gridId = '<%=gvCheckupReport.ClientID %>';
            var express = "#" + gridId + " :checkbox[checked]";
            var selected = $(express).length;
            if (selected == 0) {
                return alertMsg('<%=Chy.Web.Resource.GetString("HM_ChooseDel")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
            }
            else {
                var Inputs = document.getElementById("<%=gvCheckupReport.ClientID %>").getElementsByTagName("Input");
                var patientIds = "";
                for (i = 0; i < Inputs.length; i++) {
                    if (Inputs.item(i).type == "checkbox") {
                        if (Inputs.item(i).checked) {
                            patientIds = Inputs.item(i).parentNode.childNodes[1].innerText + ",";
                        }
                    }
                }
                $("<div style='width:100%;height:550px' id='divchooseFrame'><iframe  scrolling='auto' width='100%' height='100%'  frameborder=0  id='ChooseFrame' src='SendMessage.aspx?Ids=" + patientIds + "' /></div>").dialog({ autoOpen: true, width: 800, height: 550, showTitle: false, modal: true, title: '群发消息' });
            }
        }

        function SelectAllBox(chbChooseAll, chkChooseID) {
            var o = document.getElementsByTagName("Input");
            for (i = 0; i < o.length; i++) {
                if (o.item(i).type == "checkbox" && o.item(i).name.indexOf(chkChooseID) > 0) {
                    if (chbChooseAll.checked) {
                        o.item(i).checked = true;
                        o.item(i).parentNode.parentNode.parentNode.className = "GridViewItem";
                    }
                    else {
                        o.item(i).checked = false;
                        o.item(i).parentNode.parentNode.parentNode.className = "dataGridItem";
                    }
                }
            }
            document.getElementById("<%=hdnSelectAll.ClientID %>").value = "false";
        }

        function CheckOne(chkChooseID) {
            if (chkChooseID.checked == false) {
                $("#<%=gvCheckupReport.ClientID %> tr :checkbox[id*='selectAll']")[0].checked = false;
                document.getElementById("<%=hdnSelectAll.ClientID %>").value = "false";
                return;
            } else {
                var o = $("#<%=gvCheckupReport.ClientID %> tr:gt(0) :checkbox");
                for (i = 0; i < o.length; i++) {
                    if (o[i].checked == false) {
                        $("#<%=gvCheckupReport.ClientID %> :checkbox[id*='selectAll']")[0].checked = false;
                        document.getElementById("<%=hdnSelectAll.ClientID %>").value = "false";
                        return;
                    }
                }
            }
            $("#<%=gvCheckupReport.ClientID %> tr :checkbox[id*='selectAll']")[0].checked = true;
            document.getElementById("<%=hdnSelectAll.ClientID %>").value = "false";
        }
    </script>
</asp:Content>
