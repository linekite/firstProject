<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PhysiqueItemSelect.aspx.cs"
    Inherits="Chm.Web.Admin.Checkup.PhysiqueItemSelect" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<link type="text/css" rel="Stylesheet" href="/CSS/main.css" />
<link type="text/css" rel="Stylesheet" href="/CSS/common.css" />
<link type="text/css" rel="Stylesheet" href="/CSS/control.css" />
<link type="text/css" rel="Stylesheet" href="/CSS/jquery-ui-1.8.11.custom.css" />
<script src="/Js/jquery-1.4.1.js" type="text/javascript"></script>
<script src="/Js/sdmenu.js" type="text/javascript"></script>
<script src="/Js/common-<%=System.Threading.Thread.CurrentThread.CurrentUICulture.Name %>.js" type="text/javascript"></script>
<script src="/Js/common.js" type="text/javascript"></script>
<script src="/Js/jquery.validate.min.js" type="text/javascript"></script>
<script src="/Js/jquery.metadata.js" type="text/javascript"></script>
<script src="/Js/DatePicker/WdatePicker.js" type="text/javascript"></script>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="tagContent">
        <div class="tagContent selectTag" id="tagContent0">
            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr>
                    <td class="label">
                        <Chy:XLabel ID="lblItemName" runat="server"></Chy:XLabel>
                    </td>
                    <td class="input">
                        <Chy:XTextBox ID="txtItemName" runat="server" class="inputtext" MaxLength="64"></Chy:XTextBox>
                    </td>
                    <td class="input">
                        <Chy:XButton ID="btnSearch" runat="server" Text="查询" CssClass="button" OnClick="btnSearch_Click" />
                    </td>
                </tr>
            </table>
            </br>
            <table width="99%" cellpadding="0" cellspacing="0" align="center">
                <tr>
                    <td>
                        <Chy:XGridView ID="gvCheckItem" runat="server" CssClass="zebratable" AllowPaging="true"
                            DataKeyNames="itemID" AutoGenerateColumns="False" PagerSettings-PageButtonCount="8"
                            PageSize="5" Width="100%" OnBindCstm="gvCheckItem_BindCstm" 
                            onrowdatabound="gvCheckItem_RowDataBound">
                            <Columns>
                                <asp:TemplateField >
                                    <HeaderTemplate>
                                     选择
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:RadioButton ID="rbtSelItem" runat="server" onclick="Select(this)" /><asp:Label ID="LabclassID" runat="server" Text='<%# Eval("itemID") %>' Style="display: none"></asp:Label><asp:Label ID="LabClassName" runat="server" Text='<%# Eval("itemName") %>' Style="display: none"></asp:Label><asp:Label ID="Label1" runat="server" Text='<%# Eval("unit") %>' Style="display: none"></asp:Label><asp:Label ID="Label2" runat="server" Text='<%# Eval("reLower") %>' Style="display: none"></asp:Label><asp:Label ID="Label3" runat="server" Text='<%# Eval("reUpper") %>' Style="display: none"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="ItemName" HeaderText="项目名称"></asp:BoundField>
                                <asp:TemplateField ShowHeader="true" HeaderText="项目类型"  ItemStyle-Width="80px">
                                    <ItemTemplate>
                                        <%# Eval("itemType") == null ? "数字型" : (Eval("itemType").ToString() == "1" ? "数字型" : "字符型")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="unit" HeaderText="单位" ItemStyle-Width="80px"></asp:BoundField>
                                <asp:BoundField DataField="reLower" HeaderText="参考下限" Visible="false"></asp:BoundField>
                                <asp:BoundField DataField="reUpper" HeaderText="参考上限" Visible="false"></asp:BoundField>
                            </Columns>
                        </Chy:XGridView>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    </br>
    <table width="99%" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td class="buttons" colspan="2" style="text-align: center">
                <input id="btnAdd" type="button" value='确定' onclick="returnValue();" class="button" />
                <input name="取消" id="btnClose" class="button" type="button" value='返回' onclick="parent.$('div').dialog('close');" />
            </td>
        </tr>
    </table>
    </form>
    <script language="javascript" type="text/javascript">
        function Select(o) {
            var gv = document.getElementById("<%=gvCheckItem.ClientID %>");
            var Inputs = gv.getElementsByTagName("Input");
            for (i = 0; i < Inputs.length; i++) {
                if (Inputs.item(i).type == "radio") {
                    Inputs.item(i).checked = false;
                }
            }
            o.checked = true;
        }

        function GetRightListBoxValue() {
            var gv = document.getElementById("<%=gvCheckItem.ClientID %>");
            var Inputs = gv.getElementsByTagName("Input");
            for (i = 0; i < Inputs.length; i++) {
                if (Inputs.item(i).type == "radio") {
                    if (Inputs.item(i).checked) {
                        var item = {
                            ItemID: Inputs.item(i).parentNode.childNodes[1].innerText,
                            ItemName: Inputs.item(i).parentNode.childNodes[2].innerText,
                            Unit: Inputs.item(i).parentNode.childNodes[3].innerText,
                            reLower: Inputs.item(i).parentNode.childNodes[4].innerText,
                            reUpper: Inputs.item(i).parentNode.childNodes[5].innerText
                        };
                        return item;
                    }
                }
            }
            return "-1";
        }
        function returnValue() {
            var Item = GetRightListBoxValue();
            if (Item == "-1") {
                alertMsg('请选择要添加的小项','提示', 400, 200, "");
                return;
            }
            else {
                parent.GetItemInfo(Item);
            }
        }
    </script>
</body>
</html>
