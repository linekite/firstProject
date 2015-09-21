<%@ Page Language="C#" MasterPageFile="~/MainContent.Master" AutoEventWireup="true" CodeBehind="EmailDisease.aspx.cs" Inherits="Chm.Web.EmailDisease" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Styles/commonhp2.css" rel="stylesheet" type="text/css" />
    <link href="../../Styles/fz.css" rel="stylesheet" type="text/css" />
    <link type="text/css" rel="Stylesheet" href="/CSS/skin.css" />
<script type="text/javascript" src="../../Scripts/layout.js"></script>
<style>
    .hide
    {
        display:none;        
        }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <input type="hidden" id="hdSMSID" runat="server" value="0"/>
    <input type="hidden" id="hdGroupID" runat="server" value="0"/> 
    <input type="hidden" id="hdSMSType" runat="server" value="0"/>    
<div class="jtopspace"></div>
<table cellspacing="0" cellpadding="0" border="0" align="center" width="99%">
<tbody>
    <tr>
		<td>
			<div class="con">
			    <ul id="tags">
				   <li><a href="Email.aspx">公共邮件模板</a> </li>
				   <li class="selectTag"><a href="javascript:void(0)">疾病邮件模板</a> </li>
			    </ul>
				<div id="tagContent">
					<div id="tagContent0" class="tagContent selectTag">
                        <table cellspacing="0" cellpadding="0" border="0" width="100%">
                            <tbody>
                               <tr>
                                <td width="15%" valign="top">
                                <table cellspacing="0" cellpadding="0" border="0" width="96%" class="cent_set">
                                <tbody><tr>
                                    <td height="31" class="centset_bt">邮件分类</td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                    <table cellspacing="0" cellpadding="0" align="center" width="100%" class="searchPanel" style="display:none">
                                    <tbody><tr>
                                        <td><table cellspacing="0" cellpadding="0">
                                            <tbody><tr>
                                            <td class="input">
                                              <Chy:XTextBox ID="txtName" MaxLength="50" runat="server" CssClass="inputtext"></Chy:XTextBox>                                             
                                            </td>
                                            <td class="input">
                                               <Chy:XButton ID="btnSearch" runat="server" CssClass="button"  onclick="btnSearch_Click" Text="查询"/> 
                                            </td>
                                            </tr>
                                        </tbody></table></td>
                                        <td height="42" class="add">&nbsp;</td>
                                    </tr>
                                    </tbody></table> 
                <Chy:XTreeView ID="tvDisease"   CollapseImageToolTip="" ExpandImageToolTip=""   runat="server"  ExpandDepth="0" RelationType="ABitFullChanged"  ShowLines="true" EnableViewState="false">
                </Chy:XTreeView>
                                   </td>
                                </tr>
                                </tbody>
                                </table>
                                </td>
                                <td align="center" valign="top" width="85%">
                                     <table cellspacing="0" cellpadding="0" border="0" align="right" width="98%" class="cent_set">
                                                        <tbody><tr>
                                                        <td height="31" class="centset_bt"><Chy:XLabel ID="lblType" runat="server"></Chy:XLabel></td>
                                                        </tr>
                                                        <tr>
                                                        <td>
                                                        <table cellspacing="0" cellpadding="0" align="center" width="99%" class="searchPanel">
                                                            <tbody><tr>
                                                                <td>&nbsp;</td>
                                                                <td class="add">                                                                    
                                                                    <input type="button" onclick="OpenDialog();" value="新增" class="addbutton"/>
                                                                    <span class="input">
                                                                    <Chy:XButton ID="btnDelete" runat="server" CssClass="delbutton" onclick="btnDelete_Click" OnClientClick="return chkItem();" Text="删除"/>
                                                                </span></td>
                                                            </tr>
                                                            </tbody>
                                                         </table> 
                                                       <Chy:XGridView  ID="gvShow" runat="server" CssClass="zebratable"  AllowPaging="true"   DataKeyNames="TismsgID"
           AutoGenerateColumns="False" PagerSettings-PageButtonCount="8" PageSize="10" width="100%" OnRowDataBound="gvShow_RowDataBound" OnBindCstm="gvShow_BindCstm">
                                                                <Columns>
                                                                <asp:TemplateField HeaderStyle-CssClass="check" ItemStyle-Width="24px" ItemStyle-CssClass="check">
                                                                    <HeaderTemplate>
                                                                        <input type="checkbox" id="chkSelAll" />                    
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:CheckBox ID="chkSelItem" runat="server" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>  
                                                                <asp:BoundField DataField="Content" HeaderText="建议内容"/> 
<%--                                                                <asp:TemplateField ShowHeader="true" HeaderText="建议内容">
                                                                    <ItemTemplate>
                                                                        <a href="javascript:void(0)"><%#Eval("Content")%></a>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>--%>
                                                                </Columns>
                                                                </Chy:XGridView>                                                                
                                                        </td>
                                                        </tr>
                                                    </tbody>
                                     </table>
                                </td>
                              </tr>
                            </tbody>
                        </table>                       
					</div> 
                </div>
            </div>                        
        </td>
    </tr>
</tbody>
</table> 
<script language="javascript" type="text/javascript">
    $(document).ready(function () {
        $("#chkSelAll").click(function () {
            $("#<%=gvShow.ClientID %>  :checkbox:enabled[name$=chkSelItem]").attr("checked", this.checked);
        });
        changeBold($("#<%=hdGroupID.ClientID %>").val());
    });
    //选择
    function chkItem() {
        var Items = $("#<%=gvShow.ClientID %>  :checkbox:enabled[name$=chkSelItem]:checked")
        if (Items.length <= 0) {
            alertMsg('<%=Chy.Web.Resource.GetString("HM_ChooseDel")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
            return false;
        }
        else {
            return confirmMsg('<%=btnDelete.UniqueID %>', '<%=Chy.Web.Resource.GetString("HM_ConfirmDel")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200);
        }
    }
    function addSMS(no) {
        alertMsg('<%=Chy.Web.Resource.GetString("Remp_SaveSuccessfull") %>', '<%=Chy.Web.Resource.GetString("Remp_Notice") %>', 400, 200, '');
        closeDiv(no);
    }
    function chkType() {
        if ($("#<%=hdGroupID.ClientID %>").val() == "0") {
            alertMsg('没有数据!', '<%=Chy.Web.Resource.GetString("Remp_Notice") %>', 400, 200, '');
            return false;
        }
        else {
            return confirmMsg('<%=btnDelete.UniqueID %>', '<%=Chy.Web.Resource.GetString("HM_ConfirmDel")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200);
        }
    }

    //关闭选择邮件窗口
    CloseDialg = function () {
        $('div').dialog('close');  
    }
    //得到邮件IDs以，隔开。
    GetGroupID = function () {
       return $("#<%=hdGroupID.ClientID %>").val();
    }

    OpenDialog = function () {
        var id =$("#<%=hdGroupID.ClientID %>").val();        
        if (id == "0" || id == "")          
            alertMsg('请选择疾病类别！', '<%=Chy.Web.Resource.GetString("Remp_Notice") %>', 400, 200, ''); 
        else
            xysShowModal('公共邮件模板库', 'TemplateQuery.aspx?type=2&GroupID=' + id, '1000', '500', '');
    }

    //更新groupID
    function UpateGroupID(id) {
//        $("#<%=hdGroupID.ClientID %>").val(id);              
//        var style="";
//        $("#<%=tvDisease.ClientID %> a").each(function () {
//            style = $(this).attr("style");
//            if (style != null && style.toLowerCase() == "font-weight: bold") {                
//                $(this).removeAttr("style");
//                return false;
//            }
//        })
//        $("#<%=btnSearch.ClientID %>").click();
        window.location.href = "EmailDisease.aspx?groupID=" + id;
    }

    function changeBold(id) {
        $('#a' + id).attr('style', 'font-weight: bold');//选中加粗
        var rootID = $("#<%=tvDisease.ClientID %>").attr("id"); //树根ID
        var $tmp = $('#a' + id).parent().parent().parent().parent().parent().parent();
        $tmp.prev().find("img").click();
        while ($tmp.parent().attr("id") != "" && $tmp.parent().attr("id") != rootID) {
            $tmp = $tmp.parent();
            $tmp.prev().find("img").click();
        }
    }


</script>
</asp:Content>
