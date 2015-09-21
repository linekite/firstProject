<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TemplateQuery.aspx.cs" Inherits="Chm.Web.TemplateQuery" %>

<%@ Register Assembly="Chy.UI.Controls" Namespace="Chy.UI.Controls" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="/CSS/main.css" rel="stylesheet" type="text/css" />
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
        <link href="../../Styles/commonhp.css" rel="stylesheet" type="text/css" />
    <link href="../../Styles/fz.css" rel="stylesheet" type="text/css" />
   <style>
    .hide
    {
        display:none;        
        }
</style>
<script language="javascript" type="text/javascript">
    function delColor(id) {
        //去掉
        $("#<%=gvType.ClientID %> tr").each(function () {
            var style = $(this).children().find("a").attr("style");
            if (style != null && style.toLowerCase() == "font-weight: bold") {
                $(this).children().find("a").removeAttr("style");
            }
        });
        $("#" + id).attr("style", "font-weight:bold");

    }
    $(document).ready(function () {
        $("#chkSelAll").click(function () {
            $("#<%=gvShow.ClientID %>  :checkbox:enabled[name$=chkSelItem]").attr("checked", this.checked);
        })
        delGoPage();
    });
    //去掉转到翻页
    function delGoPage() {
        $("#<%=gvType.ClientID %>").attr("border", "0");
        var td = $("#<%=gvType.ClientID %> table tr").html();
        var index = td.indexOf("转到");
        td = td.substring(0, index) + "</td>";
        $("#<%=gvType.ClientID %> table tr").children().remove();
        $("#<%=gvType.ClientID %> table tr").append(td);
    }
    //选择
    function chkItem() {
        var Items = $("#<%=gvShow.ClientID %>  :checkbox:enabled[name$=chkSelItem]:checked");
        var ids = "";
        if (Items.length <= 0) {
            alertMsg('请选择短信!', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
            return false;
        }
        else {
//            Items.each(function () {
//                ids += $(this).parent().parent().find("td").eq(2).html() + ',';
//            });
            $("#<%=hdGroupID.ClientID %>").val(parent.GetGroupID());
            return true;          
            //parent.CloseDialg();          
        }
    }

    function CloseTemplete() {
        alertMsg('<%=Chy.Web.Resource.GetString("Remp_SaveSuccessfull") %>', '<%=Chy.Web.Resource.GetString("Remp_Notice") %>', 400, 200, '');
        parent.CloseDialg();
        parent.UpateGroupID($("#<%=hdGroupID.ClientID %>").val());
    }
</script>
</head>
<body class="noauto" style="background: #fff;">
    <form id="form1" runat="server">
  <input type="hidden" id="hdType" runat="server" value="1"/>
    <input type="hidden" id="hdGroupID" runat="server" value="0"/> 
    <input type="hidden" id="hdSMSType" runat="server" value="0"/>  
 <div id="popDiv7">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="22%" valign="top">
    <table width="98%" cellpadding="0" cellspacing="0" class="searchPanel"  align="center" style="margin-left:4px;">
          <tr>
            <td><table cellpadding="0" cellspacing="0">
              <tr>
                <td class="input">
                <Chy:XTextBox ID="txtName" MaxLength="50" runat="server" CssClass="inputtext"></Chy:XTextBox>
                </td>
                <td  class="input">
                  <Chy:XButton ID="btnSearch" runat="server" CssClass="button"  onclick="btnSearch_Click" Text="查询"/>
                </td>
              </tr>
            </table></td>
          </tr>
        </table>
        <table cellspacing="0" cellpadding="0" border="0" width="98%" class="cent_set"><tbody><tr><td>
            <Chy:XGridView  ID="gvType" runat="server" CssClass="fz_template"  AllowPaging="true"   DataKeyNames="TemplatetypeID"
           AutoGenerateColumns="False" PagerSettings-PageButtonCount="8" PageSize="5" width="100%" OnBindCstm="gvType_BindCstm" OnRowDataBound="gvType_RowDataBound">
                                                                <Columns>
                                                                <asp:TemplateField ShowHeader="false" HeaderStyle-CssClass="hide">                                                                                                                                      
                                                                    <ItemTemplate>
                                                               <asp:LinkButton ID="lbtTypeName" runat="server" CausesValidation="false" CommandName="itemSearch"
                          CommandArgument='<%#Eval("TemplatetypeID")%>' OnCommand="gvType_Command" Text='<%#Eval("Name") %>'><%#Eval("Name") %></asp:LinkButton>                                                                       
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                </Columns>
                                        </Chy:XGridView>
          </td></tr></tbody>
          </table>
            </td>
    <td align="center" valign="top">
                                                       <Chy:XGridView  ID="gvShow" runat="server" CssClass="zebratable"  AllowPaging="true"   DataKeyNames="TemplateID"
           AutoGenerateColumns="False" PagerSettings-PageButtonCount="8" PageSize="5" width="100%" OnRowDataBound="gvShow_RowDataBound" OnBindCstm="gvShow_BindCstm">
                                                                <Columns>
                                                                <asp:TemplateField HeaderStyle-CssClass="check" ItemStyle-Width="24px" ItemStyle-CssClass="check">
                                                                    <HeaderTemplate>
                                                                        <input type="checkbox" id="chkSelAll" />                    
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:CheckBox ID="chkSelItem" runat="server"/>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField> 
                                                                <asp:BoundField DataField="Content" HeaderText="建议内容"/> 
                                                                <asp:BoundField DataField="TemplateID" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide"/>
                                                                </Columns>
                                                                </Chy:XGridView>   
   </td>
  </tr>
</table>
<br />
 <table border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td>
      <Chy:XButton ID="btnSave" runat="server" CssClass="button" onclick="btnSave_Click"  Text="确定" OnClientClick="return chkItem();"/>
      <span class="space"></span>
	 <input type="button" class="button" value="取消" onclick="parent.CloseDialg();"/>
    </td>
  </tr>
</table>    
 </div>  
    </form>
</body>
</html>

