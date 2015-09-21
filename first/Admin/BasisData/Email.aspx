<%@ Page Language="C#" MasterPageFile="~/MainContent.Master" AutoEventWireup="true" CodeBehind="Email.aspx.cs" Inherits="Chm.Web.Email" %>
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
<%--    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>--%>
    <input type="hidden" id="hdSMSID" runat="server" value="0"/>
    <input type="hidden" id="hdSMSType" runat="server" value="0"/> 
    <input type="hidden" id="hdLbt" runat="server" />
<div class="jtopspace"></div>
<table cellspacing="0" cellpadding="0" border="0" align="center" width="99%">
<tbody>
    <tr>
		<td>
			<div class="con">
			    <ul id="tags">
                   <li><a href="MsgDisease.aspx?groupID=0&MType=2">疾病邮件模板</a> </li>
				   <li class="selectTag"><a href="javascript:void(0)">公共邮件模板</a> </li>				   
			    </ul>
				<div id="tagContent">
					<div id="tagContent0" class="tagContent selectTag">
                        <table cellspacing="0" cellpadding="0" border="0" width="100%">
                            <tbody>
                               <tr>
                                <td width="20%" valign="top">
                                <table cellspacing="0" cellpadding="0" border="0" width="96%" class="cent_set">
                                <tbody><tr>
                                    <td height="31" class="centset_bt">公共模板分类</td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                    <table cellspacing="0" cellpadding="0" align="center" width="96%" class="searchPanel">
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
                                    <table cellspacing="0" cellpadding="0" align="center" width="100%" class="formcontainer">
                                        <tbody><tr>
                                        <td align="left" style="text-indent: 12px;">&nbsp;
                                           <input type="button" onclick="javascript:showDiv9('0')" value="新增" class="button"/>&nbsp;&nbsp;
                                           <input type="button" onclick="javascript:showDiv9('1')" value="修改" class="button"/>&nbsp;&nbsp;
                                           <Chy:XButton ID="btnDelType" runat="server" CssClass="button" onclick="btnDelType_Click" Text="删除" OnClientClick="return chkType();"/>
                                        </td>
                                        </tr>
                                    </tbody></table>
<%--                                    <table cellspacing="0" cellpadding="0" border="0" width="100%" style="margin-top: 10px;" class="fz_template">
                                        <tbody>--%>
                                                  <Chy:XGridView  ID="gvType" runat="server" CssClass="fz_template"  AllowPaging="true"   DataKeyNames="TemplatetypeID"
           AutoGenerateColumns="False" PagerSettings-PageButtonCount="8" PageSize="10" width="100%" OnBindCstm="gvType_BindCstm" OnRowDataBound="gvType_RowDataBound">
                                                                <Columns>
                                                                <asp:TemplateField ShowHeader="false" HeaderStyle-CssClass="hide">                                                                                                                                      
                                                                    <ItemTemplate>
                                                               <asp:LinkButton ID="lbtTypeName" runat="server" CausesValidation="false" CommandName="itemSearch"
                          CommandArgument='<%#Eval("TemplatetypeID")%>' OnCommand="gvType_Command" Text='<%#Eval("Name") %>'><%#Eval("Name") %></asp:LinkButton>                                                                       
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                </Columns>
                                        </Chy:XGridView>                                       

                                   </td>
                                </tr>
                                </tbody>
                                </table>
                                </td>
                                <td align="center" valign="top" width="70%">
                                     <table cellspacing="0" cellpadding="0" border="0" align="right" width="98%" class="cent_set">
                                                        <tbody><tr>
                                                        <td height="31" class="centset_bt" align="left">邮件内容</td>
                                                        </tr>
                                                        <tr>
                                                        <td>
                                                        <table cellspacing="0" cellpadding="0" align="center" width="99%" class="searchPanel">
                                                            <tbody><tr>
                                                                <td>&nbsp;</td>
                                                                <td class="add">  
                                                                   <Chy:XButton ID="btnSearchEmail" runat="server" CssClass="hide"  onclick="btnSearchEmail_Click" Text="查询"/>                                                                   
                                                                    <input type="button" onclick="OpenDialog('0');" value="新增" class="addbutton"/>
                                                                    <span class="input">
                                                                    <Chy:XButton ID="btnDelete" runat="server" CssClass="delbutton" onclick="btnDelete_Click" OnClientClick="return chkItem();" Text="删除"/>
                                                                </span></td>
                                                            </tr>
                                                            </tbody>
                                                         </table> 
                                                       <Chy:XGridView  ID="gvShow" runat="server" CssClass="zebratable"  AllowPaging="true"   DataKeyNames="TemplateID"
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
<table cellspacing="0" cellpadding="0" border="0" class="formcontainer">
		  <tbody><tr>
			<td class="label" colspan="2">
              <Chy:XTextBox CssClass="inputarea" ID="txtSMSContent" runat="server" TextMode="MultiLine" Rows="8" Text="ts"></Chy:XTextBox>			 
			</td>
		   </tr>		   
		  </tbody></table>
 <table cellspacing="0" cellpadding="0" border="0" align="center">
  <tbody><tr>
    <td><br />  
      <Chy:XButton ID="btnSave" runat="server" CssClass="button" onclick="btnSave_Click"  Text="确定"/>
      <span class="space"></span>
	  <input type="button" onclick="javascript:closeDiv('8')" value="取消" class="button"/></td>
  </tr>
</tbody></table>    
 </div>
 <div style="display: none; " id="popDiv9">

<table cellspacing="0" cellpadding="0" border="0" class="formcontainer">
		  <tbody><tr>
			<td class="label" colspan="2">
              <Chy:XTextBox ID="txtTypeName" MaxLength="50" runat="server" CssClass="inputtext" Text="test"></Chy:XTextBox>			 
			</td>
		   </tr>		   
		  </tbody></table>
 <table cellspacing="0" cellpadding="0" border="0" align="center">
  <tbody><tr>
    <td><br />      
      <Chy:XButton ID="btnSaveType" runat="server" CssClass="button" onclick="btnSaveType_Click"  Text="确定" OnClientClick="return chkEmpty();"/>
      <span class="space"></span>
	  <input type="button" onclick="javascript:closeDiv('9')" value="取消" class="button"/></td>
  </tr>
</tbody></table>    
 </div>
 <div id="bg" class="bg" style="display:none;"></div>
<div id='popIframe' class='popIframe'></div>   
<script language="javascript" type="text/javascript">
    $(document).ready(function () {
        $("#chkSelAll").click(function () {
            $("#<%=gvShow.ClientID %>  :checkbox:enabled[name$=chkSelItem]").attr("checked", this.checked);
        })
        delGoPage();

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

        $("#popDiv9").dialog({
            bgiframe: true,
            draggable: false,
            autoOpen: false,
            modal: true,
            width: 350,
            autoHeight: true,
            closeOnEscape: false
        });

        $("#popDiv9").parent().appendTo($("form:first"));
    });
    //去掉转到翻页
    function delGoPage() {
        $("#<%=gvType.ClientID %>").attr("border", "0");
        var td = $("#<%=gvType.ClientID %> table tr").html();
        if (td != null) {
            var index = td.indexOf("&nbsp;&nbsp;转到");
            td = td.substring(0, index) + "</TD>";
            $("#<%=gvType.ClientID %> table tr").children().remove();
            $("#<%=gvType.ClientID %> table tr").append(td);
        }
    }
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
        if ($("#<%=hdSMSType.ClientID %>").val() == "0") {
            alertMsg('没有数据!', '<%=Chy.Web.Resource.GetString("Remp_Notice") %>', 400, 200, '');
            return false;
        }
        else {
            return confirmMsg('<%=btnDelete.UniqueID %>', '确认要删除已选类别及其下的模版信息吗？', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200);
        }            
    }

    function showDiv8(smsid,content) {        
        $("#<%=hdSMSID.ClientID %>").val(smsid);
        if (smsid != "0")
            $("#<%=txtSMSContent.ClientID %>").val(content);
        else
            $("#<%=txtSMSContent.ClientID %>").val("");
        $("#popDiv8").dialog({ autoOpen: true, width: 350, height: 250, showTitle: true, modal: true, title: "编辑邮件" }); 
//        document.getElementById('popDiv8').style.display = 'block';
//        document.getElementById('popIframe').style.display = 'block';
//        document.getElementById('bg').style.display = 'block';
    }
    var tmpTypeName;
    var SMSType;
    function showDiv9(smsid) {
        tmpTypeName = $("#<%=txtTypeName.ClientID %>").val();
        SMSType = $("#<%=hdSMSType.ClientID %>").val();
        if (smsid == "1") {
            if ($("#<%=hdSMSType.ClientID %>").val() == "0") {
                alertMsg('没有数据!', '<%=Chy.Web.Resource.GetString("Remp_Notice") %>', 400, 200, '');
                return false;
            }
        }
        else {
            $("#<%=txtTypeName.ClientID %>").val("");
            $("#<%=hdSMSType.ClientID %>").val("0");
        }
        $("#popDiv9").dialog({ autoOpen: true, width: 350, height: 150, showTitle: true, modal: true, title: "编辑邮件类别" }); 
//        document.getElementById('popDiv9').style.display = 'block';
//        document.getElementById('popIframe').style.display = 'block';
//        document.getElementById('bg').style.display = 'block';
    }
    function closeDiv(no) {
        if (no == "9") {
            $("#<%=txtTypeName.ClientID %>").val(tmpTypeName);
            $("#<%=hdSMSType.ClientID %>").val(SMSType);
            $("#<%=txtTypeName.ClientID %>").next().remove();
        }
        else {
            $("#<%=txtSMSContent.ClientID %>").next().remove();
        }
        $("#popDiv9").dialog('close');
        $("#popDiv8").dialog('close'); 
//        document.getElementById('popDiv'+no).style.display = 'none';
//        document.getElementById('bg').style.display = 'none';
//        document.getElementById('popIframe').style.display = 'none';
    }

    function delColor(id) {    
        $("#<%=gvType.ClientID %> tr").each(function () {
            var style = $(this).children().find("a").attr("style");
            if (style != null && style.toLowerCase() == "font-weight: bold") {
              $(this).children().find("a").removeAttr("style");                
            }
      });     
      $("#" + id).attr("style", "font-weight:bold");      
  }

  //关闭选择邮件窗口
  CloseDialg = function (id) {
      $('div').dialog('close');
      if (typeof (id) != "undefined" && id != "") {         
          javascript: __doPostBack(id, '');
      }
  }
  OpenDialog = function (id) {
      if ($("#<%=hdSMSType.ClientID %>").val() == "0") {
          alertMsg('没有类别!', '<%=Chy.Web.Resource.GetString("Remp_Notice") %>', 400, 200, '');
          return;
      }  
      xysShowModal('编辑邮件模版', 'EmailEdit.aspx?id=' + id + "&typeID=" + $("#<%=hdSMSType.ClientID %>").val() + "&refreshID=" + $("#<%=hdLbt.ClientID %>").val(), '440', '300', '');
  }
  function chkEmpty() {
      $("#<%=txtTypeName.ClientID %>").val($("#<%=txtTypeName.ClientID %>").val().replace(/^\s+|\s+$/g, ""));
      if ($("#<%=txtTypeName.ClientID %>").val() == "") {
          alertMsg('不能为空!', '<%=Chy.Web.Resource.GetString("Remp_Notice") %>', 400, 200, '');
          return false;
      }
      else {
          return true;
      }
  }
</script>
</asp:Content>
