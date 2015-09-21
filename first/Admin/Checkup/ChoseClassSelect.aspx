<%@ Page  Language="C#"  AutoEventWireup="true" CodeBehind="ChoseClassSelect.aspx.cs" Inherits="Chm.Web.Admin.Checkup.ChoseClassSelect" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>

     <link href="../../Styles/base.am.css" rel="stylesheet" type="text/css" />
    <link href="../../Styles/Common.css" rel="stylesheet" type="text/css" />
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
    <script language="javascript" type="text/javascript">
     

        function GetVlaue() {
            var checkbox = $("input[type='checkbox']");
            var class1 = "";
            var className = "";
            for (i = 0; i < checkbox.length; i++) {
                if (checkbox[i].checked) {
                    class1 = class1 + $(checkbox[i]).next().html() + "|";
                   className = className + $(checkbox[i]).parent().next().html() + "|";
                }
            }
            if(class1 == "")
                return "-1";
            var Item={
                ClassID: class1,
                ClassName : className
            }
            return Item;
        }

        function reuntVlaue() {            
            var Class = GetVlaue();
            if (Class == "-1") {
                alertMsg('请选择要添加的小项', '提示', 400, 200, "");
                return;
            }
            else {
                parent.GetItemInfo(Class);
                parent.$('div').dialog('close');
            }
        }
    </script>
<style>
            .button {
    background: url("/App_Themes/default/images/sf_sg.gif") no-repeat scroll center top transparent;
    border: 0 none;
    cursor: pointer;
    font-size: 12px;
    height: 25px;
    line-height: 25px;
    width: 54px;
}
</style>
</head>
<body class="noauto" >
    <form id="form1" runat="server">
    </br>
    <table cellpadding="0" cellspacing="0" border="0" width="280" class="formcontainer">
        <tr>
            <td class="label">
                <Chy:XLabel ID="lblCheckClass" runat="server"></Chy:XLabel>
            </td>
            <td class="input">
                <Chy:XTextBox ID="txtCheckClass" runat="server" class="inputtext" MaxLength="64"></Chy:XTextBox>
            </td>
            <td class="input">
                <Chy:XButton ID="btnSearch" runat="server" Text="查询" CssClass="button" OnClick="btnSearch_Click" />
            </td>
        </tr>
    </table> 
    <table width="99%" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td>
                <Chy:XGridView ID="gvCheckClass" runat="server" CssClass="zebratable" AllowPaging="true"
                    DataKeyNames="classID" AutoGenerateColumns="False" PagerSettings-PageButtonCount="5"
                    PageSize="5" Width="100%" OnBindCstm="gvReport_BindCstm">
                    <Columns>
                        <asp:TemplateField ItemStyle-Width="24px" ItemStyle-CssClass="check">
                            <HeaderTemplate>
                               选择
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="cbBox" runat="server"/><asp:Label ID="LabclassID" runat="server" Text='<%# Eval("classID") %>' Style="display: none"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="className" HeaderText="项目名称"></asp:BoundField>
                        <asp:BoundField DataField="depName" HeaderText="科室名称"></asp:BoundField>
                    </Columns>
                </Chy:XGridView>
            </td>
        </tr>
    </table>
    </br>
    <table width="99%" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td class="buttons" colspan="2" style="text-align: center">
                <input  id="btnClose" class="button" type="button" value="确定" onclick="reuntVlaue();"/> 
                <input  id="btnClose" class="button" type="button" value="返回" onclick="parent.$('div').dialog('close');" />
            </td>
        </tr>
    </table>
    </form>
</body>
