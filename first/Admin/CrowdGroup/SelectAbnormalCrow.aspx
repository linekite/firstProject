<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelectAbnormalCrow.aspx.cs"
    Inherits="Chm.Web.Admin.CrowdGroup.SelectAbnormalCrow" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="/CSS/main.css" rel="stylesheet" type="text/css" />
    <link type="text/css" rel="Stylesheet" href="/CSS/common.css" />
    <link type="text/css" rel="Stylesheet" href="/CSS/control.css" />
    <link type="text/css" rel="Stylesheet" href="/CSS/jquery-ui-1.8.11.custom.css" />
    <link href="../../Styles/Common.css" rel="stylesheet" type="text/css" />  
    <script src="/Js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="/Js/sdmenu.js" type="text/javascript"></script>
    <script src="/Js/jquery-ui-1.8.11.custom.min.js" type="text/javascript"></script>
    <script src="/Js/jquery.bgiframe.js" type="text/javascript"></script>
    <script src="/Js/common-<%=System.Threading.Thread.CurrentThread.CurrentUICulture.Name %>.js"
        type="text/javascript"></script>
    <script src="/Js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="/Js/jquery.metadata.js" type="text/javascript"></script>
      <style type="text/css">
        .hidden{display:none;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
  <%--  <asp:HiddenField ID="hdnSelectAll" Value="false" runat="server" />--%>
  <asp:HiddenField ID="hdnResult" runat="server" />
    <table width="99%" cellpadding="0" cellspacing="0" class="searchPanel" align="center">
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <td class="label" nowrap>
                            <Chy:XLabel ID="lblPersongRange" runat="server" Text=""></Chy:XLabel>
                        </td>
                        <td nowrap>
                            <Chy:XDropDownList ID="ddlOrganization" runat="server" Width="250px">
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
                    PageSize="5" Width="100%">
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
                        <asp:BoundField DataField="OrgName" HeaderText="" />
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
                                <asp:Label ID="lblPhone" runat="server" Text='<%# GetPhone(Eval("PatientID")) %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="" ItemStyle-Width="120px">
                            <ItemTemplate>
                             <a id='TpNo' href='../Checkup/CheckUpReportPrint.aspx?RPT=K&Type=Detail&CheckRepID=<%# Eval("CheckRptID")%>' title=''  target='_blank'><%# Eval("CheckRptNO")%></a>
                            </ItemTemplate>
                            <ItemStyle Width="120px"></ItemStyle>
                        </asp:TemplateField>
                       <asp:TemplateField HeaderStyle-CssClass="noShow" ItemStyle-CssClass="noShow">
                        <ItemTemplate>
                            <asp:Label ID="patientId" Text='<%# Eval("PatientID") %>' runat="server" ></asp:Label>
                        </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
                        <ItemTemplate>
                            <asp:Label ID="lblCheckupReportId" Text='<%# Eval("CheckRptID") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                       </asp:TemplateField>
                    </Columns>
                    <PagerSettings PageButtonCount="8"></PagerSettings>
                </Chy:XGridView>
            </td>
        </tr>
        <tr>
            <td align="center">
                <Chy:XButton ID="btnSubmit" Text="" OnClientClick="back()" runat="server" CssClass="button" />&nbsp;
                <%--<Chy:XButton ID="btnReturn" Text="" runat="server" CssClass="button" />--%>
                <input id="btnReturn" onclick="parent.$('div').dialog('close');" type="button" class="button" value='返回'/>
            </td>
        </tr>
    </table>
        

    <script language="javascript" type="text/javascript">
        function show() {
            $("<div style='width:100%;height:550px' id='divchooseFrame'><iframe  scrolling='auto' width='100%' height='100%'  frameborder=0  id='ChooseFrame' src='AddFilter.aspx?WinOpen=new' /></div>").dialog({ autoOpen: true, width: 800, height: 600, showTitle: false, modal: true, title: '<%= Chy.Web.Resource.GetString("HM5_0269")%>' });
        }

        function SetCheckupItem(s) {
            $("#<%=hdnResult.ClientID %>").val(s);
            $('div').dialog('close');
        }

        function back() {
            var s = "["
            $("#<%=gvCheckupReport.ClientID %>").find("tr:gt(0)").each(function () {
                if ($(":checkbox", this).attr("checked")) {
                    s = s + "{\"DepartMent\":" + "\"" + $(this).children("td").eq(1).text() + "\"" + ",\"Name\":" + "\"" + $(this).children("td").eq(2).text() + "\"" + ",\"Sex\":" + "\"" + $(this).children("td").eq(3).text() + "\"" + ",\"Phone\":" + "\"" + $(this).children("td").eq(4).text() + "\"" + ",\"CheckupListNo\":" + "\"" + $(this).children("td").eq(5).text() + "\"" + ",\"CheckupReportId\":" + "\"" + $(this).children("td").eq(7).text() + "\"" + ",\"PatientNo\":" +"\""+$(this).children("td").eq(6).text()+ "\"},";
                }
            });
            s = s.replace(/,*$/g, "");
            s = s + "]";
            try {
                parent.SetCheckupItem(s);
            }
            catch (err) {

            }
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
        }

        function CheckOne(chkChooseID) {
            if (chkChooseID.checked == false) {
                $("#<%=gvCheckupReport.ClientID %> tr :checkbox[id*='selectAll']")[0].checked = false;
                return;
            } else {
                var o = $("#<%=gvCheckupReport.ClientID %> tr:gt(0) :checkbox");
                for (i = 0; i < o.length; i++) {
                    if (o[i].checked == false) {
                        $("#<%=gvCheckupReport.ClientID %> :checkbox[id*='selectAll']")[0].checked = false;
                        return;
                    }
                }
            }
            $("#<%=gvCheckupReport.ClientID %> tr :checkbox[id*='selectAll']")[0].checked = true;
        }
    </script>
    </form>
</body>
</html>
