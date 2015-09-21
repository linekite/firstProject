<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Selectillnesses.aspx.cs"
    Inherits="Chm.Web.Admin.CrowdGroup.Selectillnesses" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link type="text/css" rel="Stylesheet" href="/CSS/main.css" />
    <link type="text/css" rel="Stylesheet" href="/CSS/common.css" />
    <link type="text/css" rel="Stylesheet" href="/CSS/control.css" />
    <link type="text/css" rel="Stylesheet" href="CSS/jquery-ui-1.8.11.custom.css" />
    <script src="/Js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="/Js/sdmenu.js" type="text/javascript"></script>
    <script src="/Js/jquery-ui-1.8.11.custom.min.js" type="text/javascript"></script>
    <script src="/Js/jquery.bgiframe.js" type="text/javascript"></script>
    <script src="/Js/common-<%=System.Threading.Thread.CurrentThread.CurrentUICulture.Name %>.js"
        type="text/javascript"></script>
    <script src="/Js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="/Js/jquery.metadata.js" type="text/javascript"></script>
    <script type="text/javascript">
        function GetRightListBoxValue() {
            var gv = document.getElementById("<%=gvCheckItem.ClientID %>");
            var Inputs = gv.getElementsByTagName("Input");
            for (i = 0; i < Inputs.length; i++) {
                if (Inputs.item(i).type == "radio") {
                    if (Inputs.item(i).checked) {
                        return Inputs.item(i).parentNode.parentNode.childNodes[2].innerHTML;
                    }
                }
            }
            return "-1";
        }

        function returnValue() {
            var obj = GetRightListBoxValue();
            parent.setValue(obj);
        }

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
    </script>
    <style type="text/css">
        .hidden{display:none;}
    </style>
</head>
<body class="noauto">
    <form id="form1" runat="server">
    <div id="tagContent">
        <div class="tagContent selectTag" id="tagContent0">
            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr>
                    <td class="label">
                        <Chy:XLabel ID="lblIllTypeName" runat="server"></Chy:XLabel>
                    </td>
                    <td class="input">
                        <Chy:XDropDownList ID="ddlIllTypeName" runat="server" CssClass="secltwidth">
                        </Chy:XDropDownList>
                    </td>
                    <td class="label">
                        <Chy:XLabel ID="lblillName" runat="server"></Chy:XLabel>
                    </td>
                    <td class="input">
                        <Chy:XTextBox ID="txtillName" runat="server" class="inputtext" MaxLength="32"></Chy:XTextBox>
                    </td>
                    <td class="input">
                        <Chy:XButton ID="btnSearch" runat="server" Text="查询" CssClass="button" OnClick="btnSearch_Click" />
                    </td>
                </tr>
            </table>
            </br>
            <table width="98%" cellpadding="0" cellspacing="0" align="center">
                <tr>
                    <td>
                        <Chy:XGridView ID="gvCheckItem" runat="server" CssClass="zebratable" AllowPaging="true"
                            DataKeyNames="IllnessID" AutoGenerateColumns="False" PagerSettings-PageButtonCount="8"
                            PageSize="5" Width="100%" OnBindCstm="gvCheckItem_BindCstm">
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                       选择
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:RadioButton ID="rbtSelItem" runat="server" onclick="Select(this)" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="IllnessType" HeaderText="疾病分类"></asp:BoundField>
                                <asp:BoundField DataField="IllnessName" HeaderText="疾病名称"></asp:BoundField>
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
                <input id="btnAdd" type="button" value='确定'
                    onclick="returnValue();" class="button" />
                <input name="取消" id="btnClose" class="button" type="button" value='返回'
                    onclick="parent.$('div').dialog('close');" />
            </td>
        </tr>
    </table>
    </form>
</body>
