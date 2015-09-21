<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckupItemSelect.aspx.cs"
    Inherits="Chm.Web.Admin.Checkup.CheckupItemSelect" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link type="text/css" rel="Stylesheet" href="/CSS/common.css" />
    <link type="text/css" rel="Stylesheet" href="/CSS/control.css" />
    <link type="text/css" rel="Stylesheet" href="CSS/jquery-ui-1.8.11.custom.css" />
    <script src="/Js/jquery-1.4.1.min.js" type="text/javascript"></script>  
    <script src="/Js/jquery-ui-1.8.11.custom.min.js" type="text/javascript"></script>

    <script src="/Js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="/Js/common.js" type="text/javascript"></script>
    <script src="/Js/resouces-<%=System.Threading.Thread.CurrentThread.CurrentUICulture.Name %>.js"
        type="text/javascript"></script> 
    <script language="javascript" type="text/javascript">
        function BackToFill() {
            parent.CloseItemDialg();
        }
    </script>
</head>
<body style="background:#fff">
    <form id="form1" runat="server">
      <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" >
        <tr>
            <td>
                <div class="topspace">
                </div>
                <table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
                    <tr>
                        <td>
                            <div class="con">
                                <ul id="tags">
                                    <li class="selectTag"><a onclick="selectTag('tagContent0',this)">
                                        选择小项</a> </li>
                                    <li><a onclick="selectTag('tagContent1',this)">
                                        新增小项</a></li>
                                </ul>
                                <div id="tagContent">
                                    <div class="tagContent selectTag" id="tagContent0">
                                        <table cellpadding="0" cellspacing="0" border="0" width="350px">
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
                                                        PageSize="5" Width="100%" OnBindCstm="gvCheckItem_BindCstm">
                                                        <Columns>
                                                            <asp:TemplateField HeaderStyle-CssClass="check" ItemStyle-Width="24px" ItemStyle-CssClass="check">
                                                                <HeaderTemplate>
                                                                    <input id="chkSelAll" type="checkbox" />                                                                    
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="chkSelItem" runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="ItemName" HeaderText="项目名称"></asp:BoundField>
                                                            <asp:TemplateField ShowHeader="true" HeaderText="项目类型">
                                                                <ItemTemplate>
                                                                    <%# Eval("itemType") == null ? "数字型" : (Eval("itemType").ToString() == "1" ? "数字型" : "字符型")%>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="unit" HeaderText="单位"></asp:BoundField>
                                                            <asp:BoundField DataField="reUpper" HeaderText="参考上限"></asp:BoundField>
                                                            <asp:BoundField DataField="reLower" HeaderText="参考下限"></asp:BoundField>
                                                        </Columns>
                                                    </Chy:XGridView>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="tagContent" id="tagContent1">
                                        <table border="0" cellspacing="0" cellpadding="0" class="formcontainer">
                                            <tr>
                                                <td class="warn">
                                                    <span class="red">*</span>
                                                </td>
                                                <td class="label">
                                                    <Chy:XLabel ID="lblItemRecName" runat="server"></Chy:XLabel>
                                                </td>
                                                <td class="input">
                                                    <Chy:XTextBox ID="txtItemRecName" MaxLength="32" runat="server" CssClass="inputtext" ></Chy:XTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="warn">
                                                    <span class="red">*</span>
                                                </td>
                                                <td class="label">
                                                    <Chy:XLabel ID="lblitemType" runat="server"></Chy:XLabel>
                                                </td>
                                                <td class="input">
                                                    <Chy:XDropDownList ID="ddlitemType" runat="server" >
                                                        <asp:ListItem Selected="True" Text="" Value="-1"></asp:ListItem>
                                                        <asp:ListItem Text="数字型" Value="0"></asp:ListItem>
                                                        <asp:ListItem Text="字符型" Value="1"></asp:ListItem>
                                                    </Chy:XDropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="warn">
                                                    <span class="red">*</span>
                                                </td>
                                                <td class="label">
                                                    <Chy:XLabel ID="lblResult" runat="server"></Chy:XLabel>
                                                </td>
                                                <td class="input">
                                                    <Chy:XTextBox ID="txtResult" MaxLength="32" runat="server" CssClass="inputtext"></Chy:XTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="warn">
                                                </td>
                                                <td class="label">
                                                    <Chy:XLabel ID="lblUnit" runat="server"></Chy:XLabel>
                                                </td>
                                                <td class="input">
                                                    <Chy:XTextBox ID="txtUnit" MaxLength="8" runat="server" CssClass="inputtext"></Chy:XTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="warn">
                                                </td>
                                                <td class="label">
                                                    <Chy:XLabel ID="lblreRange" runat="server"></Chy:XLabel>
                                                </td>
                                                <td class="input">
                                                    <Chy:XTextBox ID="txtreRange" MaxLength="32" runat="server" CssClass="inputtext"></Chy:XTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="warn">
                                                </td>
                                                <td class="label">
                                                    <Chy:XLabel ID="lblTips" runat="server"></Chy:XLabel>
                                                </td>
                                                <td class="input">
                                                    <Chy:XTextBox ID="txtTips" MaxLength="32" runat="server" CssClass="inputtext"></Chy:XTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="warn">
                                                </td>
                                                <td class="label">
                                                    <Chy:XLabel ID="lblOrderNo" runat="server"></Chy:XLabel>
                                                </td>
                                                <td class="input">
                                                    <Chy:XTextBox ID="txtOrderNo" MaxLength="32" runat="server" CssClass="inputtext"></Chy:XTextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <table width="99%" border="0" cellspacing="0" cellpadding="0" align="center" class="formcontainer">
                                        <tr>
                                            <td align="center">
                                                <asp:TextBox ID="txtType" runat="server" Text="" Style="display: none"></asp:TextBox>
                                                <asp:Label ID="lblcheckRptID" runat="server" Style="display: none"></asp:Label>
                                                <input id="Button1" type="button" value="保存"
                                                    class="button" onclick="VaildSave()" />
                                                <Chy:XButton ID="btnSave" runat="server" Text="保存" CssClass="button" OnClick="btnSave_Click"
                                                    Style="display: none" />
                                                <span class="space"></span>
                                                <input id="btnBack" type="button" value="返回"
                                                    class="button" onclick="parent.$('div').dialog('close');" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <script type="text/javascript">
         var currentTagIndex=0;//当前选项卡的索引
        function selectTag(showContent, selfObj) {
            // 操作标签
            var tag = document.getElementById("tags").getElementsByTagName("li");
            var taglength = tag.length;
            for (i = 0; i < taglength; i++) {
                tag[i].className = "";
            }
            selfObj.parentNode.className = "selectTag";
            // 操作内容
            for (i = 0; j = document.getElementById("tagContent" + i); i++) {
                j.style.display = "none";
            }
            document.getElementById(showContent).style.display = "block";
            document.getElementById("<%=txtType.ClientID %>").value = showContent;
        }

        $("#chkSelAll").click(function () {
            $("#<%=gvCheckItem.ClientID %> tr:gt(0) :checkbox").not(":disabled").attr("checked", $(this).attr("checked"))
        });    

        function VaildSave() {
            var Vaild = false;
            if (document.getElementById("<%=txtType.ClientID %>").value == "tagContent0" || document.getElementById("<%=txtType.ClientID %>").value == "") {
                var tag = document.getElementById("<%=gvCheckItem.ClientID %>").getElementsByTagName("input");
                for (var i = 0; i < tag.length; i++) {
                    if (tag[i].type == "checkbox") {
                        if (tag[i].checked) {
                            Vaild = true;
                            break;
                        }
                    }
                }
                if (Vaild == false) {
                    alertMsg('排序号必须是数字', '提示', 400, 200, "");
                    return;
                }
            }
            else {
                if ($("#<%=txtItemRecName.ClientID %>")[0].value == "") {
                    alertMsg('请填写项目名称', '提示', 400, 200, "");
                    return;
                }else if ($("#<%=ddlitemType.ClientID %>")[0][$("#<%=ddlitemType.ClientID %>")[0].selectedIndex].value == "-1") {
                    alertMsg('请选择项目类型', '提示', 400, 200, "");
                    return;
                }
                else if ($("#ddlitemType")[0][$("#ddlitemType")[0].selectedIndex].value == "0") {
                    if (isNaN($("#txtResult")[0].value) || $("#<%=txtResult.ClientID %>")[0].value == "") {
                        alertMsg('<%=Chy.Web.Resource.GetString("HM_0495") %>', '提示', 400, 200, "");
                        return;
                    }
                    else if (isNaN($("#<%=txtOrderNo.ClientID %>")[0].value) && $("#<%=txtOrderNo.ClientID %>")[0].value != "") {
                        alertMsg('<%=Chy.Web.Resource.GetString("HM_0022") %>', '提示', 400, 200, "");
                        return;
                    }
                } else if ($("#ddlitemType")[0][$("#ddlitemType")[0].selectedIndex].value == "1") {
                    if ($("#<%=txtResult.ClientID %>")[0].value == "") {
                        alertMsg('<%=Chy.Web.Resource.GetString("HM5_1033") %>', '提示', 400, 200, "");
                        return;
                    }
                }
            }
            $("#<%=btnSave.ClientID %>").click();
            //alertMsg('保存成功', '提示', 400, 200, "");
            parent.refushWindow();
        }
    </script>
    </form>
</body>
