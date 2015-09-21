<%@ Page Language="C#" MasterPageFile="~/MainContent.Master" AutoEventWireup="true" CodeBehind="DiseaseGroupSet.aspx.cs" Inherits="Chm.Web.DiseaseGroupSet" %>
<%@ Import Namespace="Chy.Web" %>
<%@ Register Assembly="Chy.UI.Controls" Namespace="Chy.UI.Controls" TagPrefix="Chy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <script src="/Js/DatePicker/WdatePicker.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
<table cellpadding="0" cellspacing="0" class="formcontainer" style="margin-left:5px">
    <tr>
        <td class="warn"><span class="red">*</span></td>
					<td class="label">类别：</td>
					<td class="input" colspan="3">
                     <select id="SelMode">
                       <option value="1">体检</option>
                       <option value="2">住院</option>
                     </select>
             </td>
			</tr>
    <tr>
    <td class="warn"><span class="red">*</span></td>
					<td class="label">目标群组：</td>
					<td class="input" colspan="3">
			        <div class="hy_jb" style="width:112px;">
                                <input style="width:80px;" class="inputtext" value="请选择" type="text" id="txtToOrg" readonly="readonly" runat="server" onclick="OpenDialgToOrg();"/>
                                <img alt="请选择会员分组" id="ImgItemName" src="../../Image/search.png"
                                style="cursor: hand" onclick="OpenDialgToOrg();" title="请选择会员分组"/>
<%--                                <div class="hy_sel">
                                  <input type="button" value="选择" class="hy_sel_bd" onclick="OpenDialgToOrg();"/>
                                </div>--%>
                            </div>
					</td>
					
			</tr>
	<tr>
    <td class="warn"><span class="red">*</span></td>
					<td class="label">开始日期：</td>
					<td class="input"> 
                     <Chy:XDatePicker ID="dpStartTime" runat="server" Enabled="false"></Chy:XDatePicker>
                    </td>
			         <td class="label" >结束日期：</td>
                     <td class="input">
                     <Chy:XDatePicker ID="dpEndTime" runat="server" Enabled="false"></Chy:XDatePicker>  
                     </td>
				</tr>
    <tr>
    <td class="warn"><span class="red">*</span></td>
					<td class="label">源会员分组：</td>
					<td class="input" colspan="3">
			        <div class="hy_jb" style="width:112px;">
                                <input style="width:80px;" class="inputtext" value="请选择" type="text" id="txtFromOrg" readonly="readonly" runat="server" onclick="OpenDialgFromOrg();"/>
                                <img alt="请选择会员分组" id="Img2" src="../../Image/search.png"
                                style="cursor: hand" onclick="OpenDialgFromOrg();" title="请选择会员分组"/>
<%--                                <div class="hy_sel">
                                  <input type="button" value="选择" class="hy_sel_bd" onclick="OpenDialgFromOrg();"/>
                                </div>--%>
                            </div>
                  </td>
					
			</tr>
    <tr>
    <td class="warn"><span class="red">&nbsp;</span></td>
					<td class="label">源疾病分组：</td>
					<td class="input" colspan="3">
			        <div class="hy_jb" style="width:112px;">
                                <input style="width:80px;" class="inputtext" value="请选择" type="text" id="txtDisease" readonly="readonly" runat="server" onclick="OpenDialgDisease();"/>
                                <img alt="请选择疾病" id="Img1" src="../../Image/search.png"
                                style="cursor: hand" onclick="OpenDialgDisease();" title="请选择疾病"/>
<%--                                <div class="hy_sel">
                                  <input type="button" value="选择" class="hy_sel_bd" onclick="OpenDialgDisease();"/>
                                </div>--%>
                            </div>
                                         </td>
					
			</tr>
    <tr>
    <td class="warn"><span class="red">&nbsp;</span></td>
					<td class="label">星级服务：</td>
					<td class="input" colspan="3">
                            <Chy:XCategoryList CssClass="secltwidth" ID="dropStarServiceLevel" runat="server"
                                CategoryId="46">
                            </Chy:XCategoryList>
                   </td>
					
			</tr>
    <tr style="display:none">
        <td class="warn"><span class="red">&nbsp;</span></td>
					<td class="label">处理方式：</td>
					<td class="input" colspan="3">
                    <Chy:XDropDownList ID="ddlApproach" runat="server">
                        <asp:ListItem Value="1">移动</asp:ListItem>
                        <asp:ListItem Value="2" Selected="True">复制</asp:ListItem>
                    </Chy:XDropDownList>
             </td>
			</tr>
            
	<tr>
		<td class="input" colspan="4">
          <span class="space"></span><span class="space"></span>
			<Chy:XButton ID="btnSave" runat="server"  CssClass="button" onclick="btnSave_Click" Text="确定" OnClientClick="return chkData()"/>
            <span class="space"></span>
		<input type="button" class="button" value="取消" onclick="parent.CloseWindow()" />
        </td>
	</tr>
</table> 
<input type="hidden" id="hidSDate" runat="server"/>
<input type="hidden" id="hidEDate" runat="server"/>
<input type="hidden" id="hidDiseaseId" runat="server"/>
<input type="hidden" id="hidDiseaseType" runat="server"/>
<div id="hid" style="display:none">
<input type="hidden" id="hidToOrgId" runat="server"/>
<input type="hidden" id="hidFromOrgId" runat="server"/>
</div>
<script language="javascript" type="text/javascript">
    var selectMode = 1;
    $(document).ready(function () {
        $("#SelMode").change(function () {
            selectMode = $(this).val();
            $("#<%=txtFromOrg.ClientID %>").val("请选择");
            $("#<%=hidFromOrgId.ClientID %>").val("");
            $("#<%=txtToOrg.ClientID %>").val("请选择");
            $("#<%=hidToOrgId.ClientID %>").val("");            
            $("#<%=hidSDate.ClientID %>").val("");
            $("#<%=hidEDate.ClientID %>").val("");          
        })
    });
    //关闭
    CloseDialg = function () {
        $('div').dialog('close');
    }
    function OpenDialgFromOrg() {
        if (chkFromOrg()) {
            //xysShowModal('会员分组', 'UserGroupTree.aspx?selectMode=' + selectMode, '300', '350', '');
            var title = "会员分组";
            var d = new Date();
            var url = "UserGroupTree.aspx?selectMode=" + selectMode + "&Time=" + d.toUTCString();
            var height = 420;
            var width = 350;
            $("<div style='width:100%;height:420px' ><iframe  scrolling='auto' width='98%' height='98%'  frameborder=0   src='" + url + "' /></div>").dialog({ autoOpen: true, width: width, height: height, showTitle: false, modal: true, title: title }); 
        }
    }
    function OpenDialgToOrg() {
        //xysShowModal('会员分组', 'UserGroupTree.aspx?FromType=1&selectMode=' + selectMode, '300', '350', '');
        var title = "会员分组";
        var d = new Date();      
        var url = "UserGroupTree.aspx?FromType=1&selectMode=" + selectMode + "&Time=" + d.toUTCString();
        var height = 420;
        var width = 350;
        $("<div style='width:100%;height:420px' ><iframe  scrolling='auto' width='98%' height='98%'  frameborder=0   src='" + url + "' /></div>").dialog({ autoOpen: true, width: width, height: height, showTitle: false, modal: true, title: title }); 
    }
    function GetToOrg(id, name, sDate, eDate) {        
            $("#<%=hidToOrgId.ClientID %>").val(id);
            $("#<%=txtToOrg.ClientID %>").val(name);
            $("#<%=dpStartTime.ClientID %>").val(sDate);
            $("#<%=dpEndTime.ClientID %>").val(eDate);
            $("#<%=hidSDate.ClientID %>").val(sDate);
            $("#<%=hidEDate.ClientID %>").val(eDate);
            $("#<%=txtFromOrg.ClientID %>").val("请选择");
            $("#<%=hidFromOrgId.ClientID %>").val("");
        }

   function GetOrg(id, name) {
       var toOrgId = $("#<%=hidToOrgId.ClientID %>").val();
       var suc = "failure";
       $.ajax({
           type: "POST",
           contentType: "application/json",
           url: "/hc/Common/RmomsDiret.asmx/IsSameUnit",
           async: false,
           data: "{groupId:'" + id + "',toGrouptId:'"+toOrgId+"'}",
           dataType: 'json',
           success: function (result, status) {
               suc = result.d;
           }
       });
       if (suc == "success") {
           $("#<%=hidFromOrgId.ClientID %>").val(id);
           $("#<%=txtFromOrg.ClientID %>").val(name);
       }
       else {
           alertMsg('目标群组与源会员分组的所属单位不相同!', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
       }
    }

    function OpenDialgDisease() {
        if (chkOrg()) {
            //xysShowModal('疾病分类', '/hc/admin/query/DiseaseTree.aspx?selectMode=' + selectMode + "&orgId=" + $("#<%=hidFromOrgId.ClientID %>").val(), '300', '350', '');
            var title = "疾病分类";
            var url = "/hc/admin/query/DiseaseTree.aspx?selectMode=" + selectMode + "&orgId=" + $("#<%=hidFromOrgId.ClientID %>").val();
            var height = 420;
            var width = 350;
            $("<div style='width:100%;height:420px' ><iframe  scrolling='auto' width='98%' height='98%'  frameborder=0   src='" + url + "' /></div>").dialog({ autoOpen: true, width: width, height: height, showTitle: false, modal: true, title: title }); 
        }
    }
    function GetDisease(id, name,type) {
        $("#<%=hidDiseaseId.ClientID %>").val(id);
        $("#<%=txtDisease.ClientID %>").val(name);
        $("#<%=hidDiseaseType.ClientID %>").val(type);
    }
    function chkData() {        
        var StartTime = new Date($("#<%=dpStartTime.ClientID %>").val().replace(/\-/g, "\/"));
        var EndTime = new Date($("#<%=dpEndTime.ClientID %>").val().replace(/\-/g, "\/"));        
        if (StartTime == "NaN" || EndTime== "NaN" || StartTime.length == 0 || EndTime.length == 0 || EndTime < StartTime) {
            alertMsg('开始时间和结束时间输入不对!', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
            return false;
        }
        var flag = true;
        $("#hid :hidden").each(function () {
            if ($(this).val().length == 0) {
                flag = false;
                return false;
            }
        });
        if (flag) {
            if ($("#<%=hidFromOrgId.ClientID %>").val() == $("#<%=hidToOrgId.ClientID %>").val()) {
                alertMsg('目标群组与源会员分组不能相同!', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
                return false;
            }
            else {
                return true;
            }
        }
        else {
            alertMsg('请选择!', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
            return false;
        }

    }
    function chkOrg() {
        var orgId = $("#<%=hidFromOrgId.ClientID %>").val();
        if (orgId.length == 0 || orgId == "-1") {
            alertMsg('请先选择分组!', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
            return false;
        }
        else
            return true;
    }
    function chkFromOrg() {
        var orgId = $("#<%=hidToOrgId.ClientID %>").val();
        var sDate=$("#<%=hidSDate.ClientID %>").val();
        var eDate=$("#<%=hidEDate.ClientID %>").val();
        if (orgId.length == 0 || orgId == "-1") {
            alertMsg('请先选择目标分组!', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
            return false;
        }
        else {
            if (sDate.length == 0 || eDate.length == 0) {
                alertMsg('时间不能为空!', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
                return false;
            }
            else {
                return true;
            }
        }
    }
</script>

</asp:Content>
