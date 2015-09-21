<%@ Page Language="C#" MasterPageFile="~/MainContent.Master" AutoEventWireup="true" CodeBehind="MsgDisease.aspx.cs" Inherits="Chm.Web.MsgDisease" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Styles/commonhp2.css" rel="stylesheet" type="text/css" />
    <link href="../../Styles/fz.css" rel="stylesheet" type="text/css" />
    <link type="text/css" rel="Stylesheet" href="/CSS/skin.css" />
<script type="text/javascript" src="../../Scripts/layout.js"></script>
<script src="../../Scripts/MultiLineLength.js" type="text/javascript"></script>
<style>
    .hide
    {
        display:none;        
        }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
    <input type="hidden" id="hdTID" runat="server" value="0"/>  
    <input type="hidden" id="hdGroupID" runat="server" value="0"/>      
<div class="jtopspace"></div>
<table cellspacing="0" cellpadding="0" border="0" align="center" width="99%">
<tbody>
    <tr>
		<td>
			<div class="con">
			    <ul id="tags">
                   <li class="selectTag"><a href="javascript:void(0)">
                   <%if (MType == 1)
                     { %>
                   疾病短信模板
                   <%}
                     else
                     {%>
                     疾病邮件模板
                   <%} %>
                   </a> </li>
				   <li>
                   <%if (MType == 1)
                     { %>
                   <a href="Message.aspx">公共短信模板</a>
                   <%}
                     else
                     {%>
                     <a href="Email.aspx">公共邮件模板</a>                     
                   <%} %>
                    </li>				   
			    </ul>
				<div id="tagContent">
					<div id="tagContent0" class="tagContent selectTag">
                        <table cellspacing="0" cellpadding="0" border="0" width="100%">
                            <tbody>
                               <tr>
                                <td width="15%" valign="top">
                                <table cellspacing="0" cellpadding="0" border="0" width="96%" class="cent_set">
                                <tbody><tr>
                                    <td height="31" class="centset_bt">疾病分类</td>
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
                <Chy:XTreeView ID="tvDisease"   CollapseImageToolTip="" ExpandImageToolTip=""  runat="server"  ExpandDepth="0" RelationType="ABitFullChanged"  ShowLines="true" EnableViewState="false">
                </Chy:XTreeView>
                                   </td>
                                </tr>
                                </tbody>
                                </table>
                                </td>
                                <td align="center" valign="top" width="85%">
                                     <table cellspacing="0" cellpadding="0" border="0" align="right" width="98%" class="cent_set">
                                                        <tbody><tr>
                                                        <td height="31" class="centset_bt" align="left"><Chy:XLabel ID="lblType" runat="server"></Chy:XLabel></td>
                                                        </tr>
                                                        <tr>
                                                        <td>
                                                        <table cellspacing="0" cellpadding="0" align="center" width="100%" class="searchPanel">
                                                            <tbody><tr>
                                                                <td>&nbsp;</td>
                                                                <td class="add">                                                                    
                                                                    <input type="button" onclick="javascript:showDiv8('0','')" value="新增" class="addbutton"/>
                                                                    <span class="input">
                                                                    <Chy:XButton ID="btnDelete" runat="server" CssClass="delbutton" onclick="btnDelete_Click" OnClientClick="return chkItem();" Text="删除"/>
                                                                </span></td>
                                                            </tr>
                                                            </tbody>
                                                         </table> 
                                                       <Chy:XGridView  ID="gvShow" runat="server" CssClass="zebratable"  AllowPaging="true"   DataKeyNames="TID"
           AutoGenerateColumns="False" PagerSettings-PageButtonCount="8" PageSize="10" width="100%" OnBindCstm="gvShow_BindCstm" OnRowDataBound="gvShow_RowDataBound">
                                                                <Columns>
                                                                <asp:TemplateField HeaderStyle-CssClass="check" ItemStyle-Width="24px" ItemStyle-CssClass="check">
                                                                    <HeaderTemplate>
                                                                        <input type="checkbox" id="chkSelAll" />                    
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:CheckBox ID="chkSelItem" runat="server" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                             <%--   <asp:BoundField DataField="TContent" HeaderText="建议内容"/> --%>
                                                                <asp:TemplateField ShowHeader="true" HeaderText="建议内容">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="lbtContent" runat="server"></asp:LinkButton>                                                                        
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
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
<div style="display: none;"  id="popDiv8">
<input id="ltrMtype" type="hidden" value="" runat="server" />
<table cellspacing="0" cellpadding="0" border="0" class="formcontainer">
		  <tbody><tr>
			<td class="label" colspan="2">
              <Chy:XTextBox CssClass="inputarea" ID="txtSMSContent" runat="server" TextMode="MultiLine" Rows="8" MaxLen="256" Text="test"></Chy:XTextBox>			 
			</td>
		   </tr>		   
		  </tbody></table>
 <table cellspacing="0" cellpadding="0" border="0" align="center">
  <tbody><tr>
    <td><br />    
      <Chy:XButton ID="btnSave" runat="server" CssClass="button" onclick="btnSave_Click"  Text="确定" OnClientClick="return chkContentEmpty();"/>
      <span class="space"></span>
	  <input type="button" onclick="CloseDialg()" value="取消" class="button"/></td>
  </tr>
</tbody></table>    
 </div>
  <div id="bg" class="bg" style="display:none;"></div>
<div id='popIframe' class='popIframe'></div> 
<script language="javascript" type="text/javascript">
    $(document).ready(function () {
        $("#chkSelAll").click(function () {
            $("#<%=gvShow.ClientID %>  :checkbox:enabled[name$=chkSelItem]").attr("checked", this.checked);
        });
        changeBold($("#<%=hdGroupID.ClientID %>").val());


        $("#popDiv8").dialog({
            bgiframe: true,
            draggable: false,
            autoOpen: false,
            modal: true,
            width: 350,
            autoHeight: true,
            closeOnEscape: false
        });

        $("#popDiv8").parent().appendTo($("form:first"));

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

    //关闭选择短信窗口
    CloseDialg = function () {
          $("#<%=txtSMSContent.ClientID %>").next().remove();
          $("#<%=txtSMSContent.ClientID %>").val('test');
          $("#popDiv8").dialog('close');       
//        document.getElementById('popDiv8').style.display = 'none';
//        document.getElementById('bg').style.display = 'none';
//        document.getElementById('popIframe').style.display = 'none';
    }

    String.prototype.replaceAll = function (s1, s2) {
        return this.replace(new RegExp(s1, "gm"), s2);
    }

    function showDiv8(smsid, tmpcontent) {
        var str = $("#<%=ltrMtype.ClientID %>").val();
        var content = tmpcontent.replaceAll("<br/>", "\r\n");   
        $("#<%=hdTID.ClientID %>").val(smsid);
        $("#<%=txtSMSContent.ClientID %>").val(content);
        var id = $("#<%=hdGroupID.ClientID %>").val();
        if (id == "0" || id == "") {
            alertMsg('请选择疾病类别！', '<%=Chy.Web.Resource.GetString("Remp_Notice") %>', 400, 200, '');
        }
        else {
            $("#popDiv8").dialog({ autoOpen: true, width: 350, height: 250, showTitle: true, modal: true, title: str }); 
//            document.getElementById('popDiv8').style.display = 'block';
//            document.getElementById('popIframe').style.display = 'block';
//            document.getElementById('bg').style.display = 'block';
        }
    }
    function chkContentEmpty() {
        $("#<%=txtSMSContent.ClientID %>").val($("#<%=txtSMSContent.ClientID %>").val().replace(/^\s+|\s+$/g, ""));
        if ($("#<%=txtSMSContent.ClientID %>").val() == "") {
            window.top.alertMsg('不能为空!', '<%=Chy.Web.Resource.GetString("Remp_Notice") %>', 400, 200, '');
            return false;
        }
        else {
            return true;
        }
    }


    //更新groupID
    function UpateGroupID(id) {
                $("#<%=hdGroupID.ClientID %>").val(id);              
                var style="";
                $("#<%=tvDisease.ClientID %> a").each(function () {
                    style = $(this).attr("style");
                    if (style != null && style.toLowerCase() == "font-weight: bold") {                
                        $(this).removeAttr("style");
                        return false;
                    }
                })
        window.location.href = "MessageDisease.aspx?groupID=" + id;
    }

    function changeBold(id) {
        $('#a' + id).attr('style', 'font-weight: bold'); //选中加粗
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
