<%@ Page Language="C#" MasterPageFile="~/MainContent.Master" AutoEventWireup="true" CodeBehind="DiseaseGroupList.aspx.cs" Inherits="Chm.Web.DiseaseGroupList" %>
<%@ Import Namespace="Chy.Web" %>
<%@ Register Assembly="Chy.UI.Controls" Namespace="Chy.UI.Controls" TagPrefix="Chy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
    <asp:HiddenField ID="hidDiseaseId" runat="server"/>
    <asp:HiddenField ID="hidOrgId" runat="server"/>
    <asp:HiddenField ID="hidDiseaseType" runat="server"/>  
    <asp:HiddenField ID="hidSelectMode" runat="server" Value="1"/> 
  <table width="100%" cellpadding="0" cellspacing="0" class="searchPanel"  align="center" style="padding-right:0px">
    	<tr>
        	<td>			
			    <table cellpadding="0" cellspacing="0" >
				<tr>
                	<td class="label">类别：</td>
					<td class="input">
                     <select id="SelMode">
                       <option  value="1">体检</option>
                       <option value="2">住院</option>
                     </select>
                     </td>
					<td class="label">会员分组：</td>
					<td class="input">
			        <div class="hy_jb" style="width:112px;">
                                <input style="width:80px;" class="inputtext" value="请选择" type="text" id="txtOrgName" readonly="readonly" runat="server" onclick="OpenDialg();"/>
                                <img alt="请选择会员分组" id="ImgItemName" src="../../Image/search.png"
                                style="cursor: hand" onclick="OpenDialg();" title="请选择会员分组"/>
<%--                                <div class="hy_sel">                                  
                                 <input type="button" value="选择" class="button" onclick="OpenDialg();"/>
                                </div>--%>
                            </div>  </td>
				<td class="label">疾病分类：</td>
					<td class="input">
			        <div class="hy_jb" style="width:112px;">
                                <input style="width:80px;" class="inputtext" value="请选择" type="text" id="txtDisease" readonly="readonly" runat="server" onclick="OpenDialgDisease();"/>
                                 <img alt="请选择疾病" id="Img1" src="../../Image/search.png"
                                style="cursor: hand" onclick="OpenDialgDisease();" title="请选择疾病"/>
<%--                                <div class="hy_sel">
                                  <input type="button" value="选择" class="hy_sel_bd" onclick="OpenDialgDisease();"/>
                                </div>--%>
                            </div>  </td>
                        <td class="label">
                            姓名：
                        </td>
                        <td class="input">
                            <Chy:XTextBox ID="txtPatientName" runat="server" CssClass="inputtext" MaxLength="20">
                            </Chy:XTextBox>
                        </td>
                        <td class="label">
                            会员卡号：
                        </td>
                        <td class="input">
                            <Chy:XTextBox ID="txtMemberID" CssClass="inputtext" runat="server">
                            </Chy:XTextBox>
                        </td>				
					    <td  class="label">
					<Chy:XButton ID="btnSearch" runat="server" CssClass="button"  onclick="btnSearch_Click" TextKey="Remp_Search" OnClientClick="return chkOrgDisease();"/> 
                    <input type="button" class="button"  value="设置组" onclick="OpenWindow('DiseaseGroupSet.aspx?selectMode=' + selectMode)" runat="server" visible="false"/> 
                    </td>					
				</tr>
			</table>
             </td>
	   <td  class="add" nowrap>
	     <input type="button" class="addbutton"  value="新增" onclick="RedirectAddPage()" id="btnAdd" runat="server"/> 
         <Chy:XButton ID="btnDelete" runat="server" CssClass="delbutton" onclick="btnDelete_Click" Text="删除" OnClientClick="return chkItem();"/>          
	   </td>
        </tr>		
    </table>      
  
        <Chy:XGridView  ID="gvShow" runat="server" CssClass="zebratable"  AllowPaging="true"   DataKeyNames="PatientId"
        AutoGenerateColumns="False" PagerSettings-PageButtonCount="8" PageSize="10" width="100%" OnBindCstm="gvShow_BindCstm">
        <Columns>
            <asp:TemplateField HeaderStyle-CssClass="check" ItemStyle-Width="24px" ItemStyle-CssClass="check">
                <HeaderTemplate>
                    <input type="checkbox" id="chkSelAll" />                    
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="chkSelItem" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="姓名">
                <ItemTemplate>
                        <%# Eval("PatientName")%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="性别">
                <ItemTemplate>
                    <%# MemberHelper.GetPatientSexName(Eval("PatientSex"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="年龄">
                <ItemTemplate>
                    <%# MemberHelper.GetAge((DateTime?)Eval("Birthday"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="会员卡号">
                <ItemTemplate>
                    <%#  ComUtils.SubWord(Eval("MemberID"), 15)%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="联系电话">
                <ItemTemplate>
                 <%#  ComUtils.SubWord(Eval("Phone"), 15)%>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </Chy:XGridView>  


 <script language="javascript" type="text/javascript">
     var selectMode = $("#<%=hidSelectMode.ClientID %>").val();
     $(document).ready(function () {
         $("#chkSelAll").click(function () {
             $("#<%=gvShow.ClientID %>  :checkbox:enabled[name$=chkSelItem]").attr("checked", this.checked);
         })
         $("#SelMode option").each(function () {          
             if ($(this).val() == selectMode) {
                 $(this).attr("selected", "selected");
                 return false;
             }
         })

         $("#SelMode").change(function () {
             selectMode = $(this).val();
             $("#<%=hidSelectMode.ClientID %>").val(selectMode);
             $("#<%=txtOrgName.ClientID %>").val("请选择");
             $("#<%=hidOrgId.ClientID %>").val("");
             $("#<%=hidDiseaseId.ClientID %>").val("");
             $("#<%=txtDisease.ClientID %>").val("请选择");
         })
     });
    //选择
    function chkItem() {
        if (!chkOrgDisease())
            return false;
        var Items = $("#<%=gvShow.ClientID %>  :checkbox:enabled[name$=chkSelItem]:checked")
        if (Items.length <= 0) {
            alertMsg('<%=Chy.Web.Resource.GetString("HM_ChooseDel")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
            return false;
        }
        else {
            return confirmMsg('<%=btnDelete.UniqueID %>', '<%=Chy.Web.Resource.GetString("HM_ConfirmDel")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200);
        }
    }
    function chkOrgDisease() {
        var orgId = $("#<%=hidOrgId.ClientID %>").val();
        var diseaseId = $("#<%=hidDiseaseId.ClientID %>").val();
        if (orgId.length == 0 || diseaseId.length == 0 || orgId=="-1") {
            alertMsg('请选择分组和疾病!', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
            return false;
        }
        else
            return true;
    }

    //关闭
    CloseDialg = function () {
        $('div').dialog('close');
    }
    function OpenDialg() {
        
        //xysShowModal('会员分组', 'UserGroupTree.aspx?selectMode=' + selectMode, '300', '350', '');      
        var title = "会员分组";
        var d = new Date();
        var url = "UserGroupTree.aspx?selectMode=" + selectMode + "&Time=" + d.toUTCString();
        var height = 420;
        var width = 350;
        $("<div style='width:100%;height:420px' ><iframe  scrolling='auto' width='98%' height='98%'  frameborder=0   src='" + url + "' /></div>").dialog({ autoOpen: true, width: width, height: height, showTitle: false, modal: true, title: title });       
    }
    function GetOrg(id,name) {
        $("#<%=hidOrgId.ClientID %>").val(id);
        $("#<%=txtOrgName.ClientID %>").val(name);
        $("#<%=hidDiseaseId.ClientID %>").val("");
        $("#<%=txtDisease.ClientID %>").val("请选择");
    }
    function RedirectAddPage() {
        var orgId = $("#<%=hidOrgId.ClientID %>").val();
        var diseaseId = $("#<%=hidDiseaseId.ClientID %>").val();
        if (orgId.length == 0 || diseaseId.length == 0)
            alertMsg('请选择分组和疾病!', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
        else
            OpenWindow('DiseaseGroupEdit.aspx?RefreshID=<%=btnSearch.UniqueID %>&orgId=' + orgId + '&diseaseId=' + diseaseId + '&selectMode=' + selectMode);
    }
    function OpenDialgDisease() {    
        if (chkOrg()) {
            //xysShowModal('疾病分类', '/hc/admin/query/DiseaseTree.aspx?selectMode=' + selectMode + "&orgId=" + $("#<%=hidOrgId.ClientID %>").val(), '300', '350', '');
            var title = "疾病分类";
            var url = "/hc/admin/query/DiseaseTree.aspx?selectMode=" + selectMode + "&orgId=" + $("#<%=hidOrgId.ClientID %>").val()+"&IsChoose=1";
            var height = 420;
            var width = 350;
            $("<div style='width:100%;height:420px' ><iframe  scrolling='auto' width='98%' height='98%'  frameborder=0   src='" + url + "' /></div>").dialog({ autoOpen: true, width: width, height: height, showTitle: false, modal: true, title: title }); 
        }
    }
    function GetDisease(id, name, type) {
        $("#<%=hidDiseaseId.ClientID %>").val(id);
        $("#<%=txtDisease.ClientID %>").val(name);
        $("#<%=hidDiseaseType.ClientID %>").val(type);
    }

    function chkOrg() {
        var orgId = $("#<%=hidOrgId.ClientID %>").val();
        if (orgId.length == 0 || orgId == "-1") {
            alertMsg('请先选择分组!', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
            return false;
        }
        else
            return true;
    }
    </script>
</asp:Content>
