<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddFilter.aspx.cs" Inherits="Chm.Web.Admin.CrowdGroup.AddFilter" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="/CSS/main.css" rel="stylesheet" type="text/css" />
    <link href="../../Styles/Common.css" rel="stylesheet" type="text/css" />
    <link type="text/css" rel="Stylesheet" href="/CSS/common.css" />
    <link type="text/css" rel="Stylesheet" href="/CSS/control.css" />
    <link type="text/css" rel="Stylesheet" href="/CSS/jquery-ui-1.8.11.custom.css" />
    <script src="/Js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="/Js/sdmenu.js" type="text/javascript"></script>
    <script src="/Js/jquery-ui-1.8.11.custom.min.js" type="text/javascript"></script>
    <script src="/Js/jquery.bgiframe.js" type="text/javascript"></script>
    <script src="/Js/common-<%=System.Threading.Thread.CurrentThread.CurrentUICulture.Name %>.js"
        type="text/javascript"></script>
    <script src="/Js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="/Js/jquery.metadata.js" type="text/javascript"></script>
    <style type="text/css">
        .hidden
        {
            display: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 4px;
        padding: 4px;">
        <tr>
            <td width="25%" valign="top">
                <asp:HiddenField ID="hdnConditionTypeName" runat="server" />
                <asp:HiddenField ID="hdnType" runat="server" />
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="main_tab">
                    <tr>
                        <td width="19%" valign="top">
                            <div class="list_tit_crowd">
                                <%=Chy.Web.Resource.GetString("HM5_0959")%></div>
                            <table width="98%" cellpadding="0" cellspacing="0" class="searchPanel" align="center">
                                <tr>
                                    <td align="right">
                                        <input type="button" id="btnUpdateName" runat="server" value="" class="addbutton"
                                            onclick="UpdateTypeName()" />
                                        <Chy:XButton ID="btnUpdateTypeName" Style="display: none;" runat="server" OnClick="btnUpdateTypeName_Click" />&nbsp;
                                        <Chy:XButton ID="btnDeleteTypeName" CssClass="delbutton" runat="server" Text="" OnClick="btnDeleteTypeName_Click" />
                                    </td>
                                </tr>
                            </table>
                            <div class="dtree" style="margin: 10 6px 6px 6px;overflow-x:scroll;width:200px"   >
                                <Chy:XTreeView ID="xtvGropCrow" ShowLines="false" BorderColor="Transparent" BackColor="Transparent"
                                    SelectedNodeStyle-BackColor="Cyan" runat="server" OnSelectedNodeChanged="xtvGropCrow_SelectedNodeChanged">
                                </Chy:XTreeView>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
            <td width="75%" valign="top">
                <table width="99%" border="0" cellspacing="0" cellpadding="0" class="main_tab">
                    <tr>
                        <td width="80%">
                            <div class="list_tit_crowd">
                                <%=Chy.Web.Resource.GetString("HM5_0269")%></div>
                            <table width="99%" cellpadding="0" cellspacing="0" class="searchPanel" align="center">
                                <tr>
                                    <td>
                                        <table cellpadding="0" cellspacing="0" border="0">
                                            <tr>
                                                <td class="label" nowrap>
                                                    <Chy:XLabel ID="lblCheckItem" runat="server" Text=""></Chy:XLabel>
                                                </td>
                                                <td class="label" nowrap>
                                                    <%--<Chy:XTextBox ID="txtCheckItem" MaxLength="32" runat="server" onkeyup="IsValue()"></Chy:XTextBox>--%>
                                                    <input id="txtCheckItem" runat="server" onclick="ChooseMember()" />
                                                    <asp:HiddenField ID="hdnName" runat="server" />
                                                    <span style="text-decoration: underline">
                                                        <img alt="" runat="server" id="imgSearchDoctor" src="../../Image/search.png" style="cursor: hand"
                                                            onclick="ChooseMember()" /></span>
                                                    <asp:HiddenField ID="hdnID" runat="server" />
                                                    <asp:HiddenField ID="hdnUnit" runat="server" />
                                                </td>
                                                <td class="label" nowrap>
                                                    <Chy:XDropDownList ID="ddlCondition" runat="server">
                                                    </Chy:XDropDownList>
                                                </td>
                                                <td class="label" nowrap>
                                                    <Chy:XLabel ID="lblPositiveConditionResult" runat="server" Text="" />
                                                </td>
                                                <td class="input">
                                                    <Chy:XTextBox ID="txtPositiveConditionResult" MaxLength="32" runat="server" onblur="test(this)" onkeyup="numkey(this)"></Chy:XTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="label" nowrap>
                                                    <Chy:XLabel ID="lblRelationShip" runat="server"></Chy:XLabel>
                                                </td>
                                                <td class="input">
                                                    <asp:RadioButtonList ID="rdoRelationShip" RepeatDirection="Horizontal" runat="server"
                                                        OnSelectedIndexChanged="rdoRelationShip_SelectedIndexChanged">
                                                    </asp:RadioButtonList>
                                                </td>
                                                <td class="label">
                                                    &nbsp;
                                                </td>
                                                <td class="input" nowrap>
                                                    <Chy:XButton ID="btnAdd" runat="server" Text="" Enabled="false" CssClass="button"
                                                        OnClick="btnAdd_Click" />
                                                </td>
                                                <td class="input" nowrap>
                                                    <%--  <Chy:XButton ID="btnAnd" runat="server" Text="" CssClass="button" OnClick="btnAnd_Click" />
               <Chy:XButton ID="btnOr" runat="server" Text="" CssClass="button" OnClick="btnOr_Click" />--%>
                                                    <Chy:XButton ID="btnDelete" runat="server" Text="" CssClass="button" OnClick="btnDelete_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                            <table width="100%" cellpadding="0" cellspacing="0" align="center" nowrap>
                                <tr>
                                    <td nowrap>
                                        <Chy:XGridView ID="gvFilterCondition" runat="server" CssClass="zebratable" AllowPaging="false"
                                            DataKeyNames="ConditionID" AutoGenerateColumns="False" PagerSettings-PageButtonCount="8"
                                            PageSize="6" Width="99%">
                                            <Columns>
                                                <asp:TemplateField HeaderStyle-CssClass="check" ItemStyle-Width="24px" ItemStyle-CssClass="check">
                                                    <HeaderTemplate>
                                                        <asp:CheckBox ID="selectAll" runat="server" onclick="SelectAllBox(this,'chkSelItem')" />
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkSelItem" runat="server" onclick="CheckOne(this)" />
                                                        <%--  <asp:Label ID="lblRelationShip" Text='<%#Eval("Relationship")%>' runat="server" Style="display: none;" /><asp:Label
                                    ID="lblItemName" runat="server" Text='<%# Eval("ItemName") %>' Style="display: none" /><asp:Label
                                        ID="lblCondition" runat="server" Text='<%#Eval("Condition")%>' Style="display: none;" /><asp:Label
                                            runat="server" ID="lblResult" Text='<%# Eval("Result") %>' Style="display: none" /><asp:Label
                                                ID="lblUnit" runat="server" Text='<%# Eval("Unit")%>' Style="display: none;" />--%>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="check"></HeaderStyle>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="" ItemStyle-Width="120px">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblRelationShip" Text=' <%#Eval("RelationShip")%>' runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblConcatCondition" Text='<%# ConcatCondition(Eval("ItemName"),Eval("Condition"),Eval("Result"))%>'
                                                            runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="" ItemStyle-Width="120px">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblUnit" Text='<%# Eval("Unit") %>' runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
                                                    <ItemTemplate>
                                                        <asp:Label ID="ItemName" Text='<%# Eval("ItemName")%>' runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
                                                    <ItemTemplate>
                                                        <asp:Label ID="ItemId" Text='<%# Eval("ItemID") %>' runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Condition" Text='<%# Eval("Condition") %>' runat="server" Style="display: none;"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Result" Text='<%# Eval("Result") %>' runat="server" Style="display: none;"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </Chy:XGridView>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="buttons" colspan="2" style="text-align: center">
                                        <input type="button" id="btnSetTypeName" class="button" runat="server" onclick="ShowFilterType()" />
                                        <Chy:XButton ID="btnSave" runat="server" Text="" CssClass="button" Style="display: none;"
                                            OnClick="btnSave_Click" />&nbsp;
                                        <Chy:XButton ID="btnSubmit" runat="server" Text="" CssClass="button" OnClientClick="back()" />&nbsp;
                                        <%-- <Chy:XButton ID="btnReturn" runat="server" Text="" CssClass="button" OnClick="btnReturn_Click" />--%>
                                        <input id="btnReturn" value='返回' onclick="parent.$('div').dialog('close');"
                                            type="button" class="button" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <script language="javascript" type="text/javascript">
        ChooseMember = function () {
            $("<div style='width:100%;height:380px' id='divchooseFrame'><iframe  scrolling='auto' width='100%' height='100%'  frameborder=0  id='ChooseFrame' src='../Checkup/PhysiqueItemSelect.aspx' /></div>").dialog({ autoOpen: true, width: 600, height: 380, showTitle: false, modal: true, title: '<%= Chy.Web.Resource.GetString("HM5_0288")%>' });
        }

        ShowFilterType = function () {
            var thisForm = document.forms['aspnetForm'];
            if (!thisForm) {
                thisForm = document.forms;
            }
            var id = "<%=xtvGropCrow.ClientID%>" + "_SelectedNode";
            var selectedNodeId = document.getElementById(id).value;
            if (selectedNodeId == "") {
                $("<div style='width:100%;height:200px' id='divchooseFrame'><iframe  scrolling='auto' width='100%' height='100%'  frameborder=0  id='ChooseFrame' src='FilterTypeName.aspx' /></div>").dialog({ autoOpen: true, width: 500, height: 200, showTitle: false, modal: true, title: '<%= Chy.Web.Resource.GetString("HM5_0292")%>' });
            } else {
                document.getElementById("<%=btnSave.ClientID %>").click();
                back();
            }
        }

        function back() {
            var s = "["
            $("#<%=gvFilterCondition.ClientID %>").find("tr:gt(0)").each(function () {
                if ($(":checkbox", this).attr("checked")) {
                    s = s + "{\"Relationship\":" + "\"" + $(this).children("td").eq(1).text() + "\"" + ",\"Unit\":" + "\"" + $(this).children("td").eq(3).text() + "\"" + ",\"ItemName\":" + "\"" + $(this).children("td").eq(4).text() + "\"" + ",\"Condition\":" + "\"" + $(this).children("td").eq(6).text() + "\"" + ",\"Result\":" + "\"" + $(this).children("td").eq(7).text() + "\"},";
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

        UpdateTypeName = function () {
            //            debugger;
            var thisForm = document.forms['aspnetForm'];
            if (!thisForm) {
                thisForm = document.forms;
            }
            var id = "<%=xtvGropCrow.ClientID%>" + "_SelectedNode";
            var selectedNodeId = document.getElementById(id).value;
            //alert(v);
            // var selectedNodeId = thisForm.elements["<%=xtvGropCrow.ClientID%>_SelectedNode"].value;
            if (selectedNodeId != "") {
                var selectedName = document.getElementById(selectedNodeId).innerText;
                //alert(selectedName);
                $("<div style='width:100%;height:200px' id='divchooseFrame'><iframe  scrolling='auto' width='100%' height='100%'  frameborder=0  id='ChooseFrame' src='FilterTypeName.aspx?name=" + escape(selectedName) + "' /></div>").dialog({ autoOpen: true, width: 600, height: 200, showTitle: false, modal: true, title: '<%= Chy.Web.Resource.GetString("HM5_0291")%>' });
            } else {
                return alertMsg('<%=Chy.Web.Resource.GetString("HM5_0318") %>', '提示', 300, 200, '');
            }

        }

        function SetValue(name, type) {
            $("#<%=hdnType.ClientID %>").val(type);
            $("#<%=hdnConditionTypeName.ClientID %>").val(name);
            $('div').dialog('close');
            if (type == "Add") {
                document.getElementById("<%=btnSave.ClientID %>").click();
            } else if (type = "Update") {
                document.getElementById("<%=btnUpdateTypeName.ClientID %>").click();
            }
            back();
        }

        function GetItemInfo(obj) {
            $("#<%= hdnName.ClientID%>").val(obj.ItemName);
            $("#<%= txtCheckItem.ClientID%>").val(obj.ItemName);
            $("#<%= hdnID.ClientID %>").val(obj.ItemID);
            $("#<%= hdnUnit.ClientID%>").val(obj.Unit);
            $('div').dialog('close');
        }

        function IsValue() {
            var item = document.getElementById("<%=txtCheckItem.ClientID %>").value;
            var result = document.getElementById("<%=txtPositiveConditionResult.ClientID %>").value;
            if (item != "" && result != "") {
                $("#<%=btnAdd.ClientID %>").attr("disabled", false);

            }

        }

        function test(obj) {
            var patt1 = new RegExp(/^\.|[.]+$|[.]{2,}/g); //匹配正整数
            if (patt1.test(obj.value)) {
                return alertMsg('<%=Chy.Web.Resource.GetString("HM5_0993")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 300, 200, '');
                obj.value = "";
                return;
            }
        };


        function numkey(obj) {
            var dropdownlist = document.getElementById("<%=ddlCondition.ClientID %>");
            var dropDownListValue = dropdownlist.options[dropdownlist.selectedIndex].value;
            if (dropDownListValue != "2") {
                obj.value = obj.value.replace(/[^\d.]/g, "");
            }
            var item = document.getElementById("<%=txtCheckItem.ClientID %>").value;
            var result = document.getElementById("<%=txtPositiveConditionResult.ClientID %>").value;
            if (result != "" && item != "") {
                $("#<%=btnAdd.ClientID %>").attr("disabled", false);
            }
        }
        $(document).ready(function () {
            $("#btnDelete").click(function () {
                var msg = '<%=Chy.Web.Resource.GetString("HM5_0289") %>';
                var gridID = '<%=gvFilterCondition.ClientID %>';
                var express = "#" + gridID + " :checkbox[Checked]";
                var selected = $(express).length;
                if (selected == 0) {
                    return alertMsg('<%=Chy.Web.Resource.GetString("HM_ChooseDel")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
                } else {
                    return confirmMsg('<%=btnDelete.UniqueID %>', '<%=Chy.Web.Resource.GetString("HM_ConfirmDel")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
                }
            });
        });

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
                $("#<%=gvFilterCondition.ClientID %> tr :checkbox[id*='selectAll']")[0].checked = false;
                return;
            } else {
                var o = $("#<%=gvFilterCondition.ClientID %> tr:gt(0) :checkbox");
                for (i = 0; i < o.length; i++) {
                    if (o[i].checked == false) {
                        $("#<%=gvFilterCondition.ClientID %> :checkbox[id*='selectAll']")[0].checked = false;
                        return;
                    }
                }
            }
            $("#<%=gvFilterCondition.ClientID %> tr :checkbox[id*='selectAll']")[0].checked = true;
        }
    </script>
    </form>
</body>
</html>
