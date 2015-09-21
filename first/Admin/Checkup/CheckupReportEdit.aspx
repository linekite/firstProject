<%@ Page Language="C#" MasterPageFile="~/MainContent.Master" AutoEventWireup="true"
    CodeBehind="CheckupReportEdit.aspx.cs" Inherits="Chm.Web.Admin.Checkup.CheckupReportEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/Js/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <link href="../../Styles/Common.css" rel="stylesheet" type="text/css" />
    <link href="../../Styles/tmmon.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .combination
        {
            margin-top: 6px;
            margin-left: 3px;
            overflow: hidden;
            text-align: left;
            border: #9bb7c3 1px solid;
        }
        .combination td
        {
            text-align: left;
            line-height: 26px;
        }
        .combination td.tsba
        {
            text-align: left;
            padding-left: 12px;
            padding-top: 9px;
        }
        .zc_dxk
        {
            width: 100%;
            height: 100%;
            margin: 0px;
            padding: 0px;
        }
        
        .zc_dxk td
        {
            width: 200px;
            height: 30px;
            line-height: 30px;
            float: left;
        }
        .ut_tit_head
        {
            font-weight: bold;
            padding-left: 10px;
            line-height: 30px;
            margin-top: 16px;
            color: #333333;
            zoom: 1;
            overflow: hidden;
            border-bottom: #9da9b5 1px dashed;
            background-color: #f3fcff;
            text-align: left;
        }
        .con
        {
            margin: 0px auto;
            margin-top:5px;
        }
        #tags
        {
            margin: 0px;
            background-position: 0 -292px;
            padding: 0px;
            height: 27px;
            background-image: url(../../images/top_bg.gif);
        }
        #tags LI
        {
            background-position: 0 -281px;
            float: left;
            list-style-type: none;
            height: 27px;
            margin-right: 1px;
            cursor: pointer;
            background-image: url(../../images/adm_bg.gif);
            background-repeat: no-repeat;
        }
        #tags LI A
        {
            padding-right: 10px;
            padding-left: 10px;
            background-position: right -340px;
            float: left;
            color: #095998;
            line-height: 27px;
            padding-top: 0px;
            height: 27px;
            text-decoration: none;
            font-weight: bold;
        }
        #tags LI.emptyTag
        {
            background: none transparent scroll repeat 0% 0%;
            width: 4px;
        }
        #tags LI.selectTag
        {
            background-position: 0 -254px;
            margin-bottom: -2px;
            position: relative;
            height: 27px;
        }
        #tags LI.selectTag A
        {
            background-position: right -313px;
            color: #383838;
            line-height: 27px;
            height: 27px;
        }
        #tagContent
        {
            border: #d2e2f2 1px solid;
            padding: 1px;
            border-top: 0px;
            background-color: #fff;
            zoom: 1;
            overflow: hidden;
        }
        .tagContent
        {
            display: none;
            padding: 5px;
            background: #fefefe;
            color: #474747;
            overflow: hidden;
            zoom: 1;
        }
        #tagContent DIV.selectTag
        {
            display: block;
            overflow: hidden;
            zoom: 1;
        }
 .buttons {
    background: url("/App_Themes/default/images/sf_sg.gif") no-repeat scroll center top transparent;
    border: 0 none;
    cursor: pointer;
    font-size: 12px;
    height: 25px;
    line-height: 25px;
    width: 54px;
}
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
    <div class="con">
        <ul id="tags">
            <li class="selectTag"><a  href="javascript:void(0)">基本信息</a></li>
            <li><a onclick="TagClick();return false;" href="javascript:void(0)">
                体检组合项</a> </li>
        </ul>
        <div id="tagContent">
            <div class="tagContent selectTag" id="tagContent0">
                <table cellpadding="1" cellspacing="1" class="searchPanel" width="99%">
                    <tr>
                        <td class="label">
                            <span class="red">*</span><Chy:XLabel ID="lblName" runat="server"></Chy:XLabel>
                        </td>
                        <td class="input">
                            <Chy:XTextBox ID="txtName" MaxLength="64" runat="server" CssClass="inputtext" AllowEmpty="false"
                                ValidationGroup="DoctorValid" ValidType="String" ReadOnly="true"></Chy:XTextBox>
                        </td>
                        <td class="label">
                            <Chy:XLabel ID="lblCheckNo" runat="server"></Chy:XLabel>
                        </td>
                        <td class="input">
                            <Chy:XTextBox ID="txtCheckNo" runat="server" CssClass="inputtext" AllowEmpty="true"
                                MaxLength="32"></Chy:XTextBox>
                        </td>
                        <td class="label">
                            <span class="red">*</span><Chy:XLabel ID="lblCheckDate" runat="server"></Chy:XLabel>
                        </td>
                        <td class="label">
                            <span class="input">
                                <Chy:XDatePicker ID="dpCheckDate" runat="server" AllowEmpty="false" ValidationGroup="DoctorValid"
                                    ValidType="String" MaxDate="%y-%M-%d"></Chy:XDatePicker>
                            </span>
                        </td>
                        <td class="label">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="label">
                            <span class="red">*</span><Chy:XLabel ID="lblRegisterDate" runat="server"></Chy:XLabel>
                        </td>
                        <td class="input">
                            <Chy:XDatePicker ID="dpRegisterDate" runat="server" AllowEmpty="false" ValidationGroup="DoctorValid"
                                ValidType="String" MaxDate="%y-%M-%d"></Chy:XDatePicker>
                        </td>
                        <td class="label">
                            <Chy:XLabel ID="lblCheckDoctor" runat="server"></Chy:XLabel>
                        </td>
                        <td class="input">
                            <Chy:XTextBox ID="txtCheckDoctor" runat="server" CssClass="inputtext" AllowEmpty="true"
                                MaxLength="32"></Chy:XTextBox>
                        </td>
                        <td class="label">
                            <Chy:XLabel ID="lblHospital" runat="server"></Chy:XLabel>
                        </td>
                        <td class="input">
                            <Chy:XTextBox ID="txtHospital" runat="server" CssClass="inputtext" AllowEmpty="true"
                                MaxLength="32"></Chy:XTextBox>
                        </td>
                        <td class="label">
                        </td>
                    </tr>
                   <tr style="display:none;">
                        <td class="label">
                            <span class="red">*</span><Chy:XLabel ID="lblOrg" runat="server"></Chy:XLabel>
                        </td>
                        <td class="input" colspan="4">
                          <%--  <Chy:XDropDownList ID="dropOrg" Width="250px" runat="server" AutoPostBack="true">
                            </Chy:XDropDownList>--%>                           
                              <asp:HiddenField ID="hidOrgID" runat="server" Value="1" />
                            <asp:HiddenField ID="hidParentOrgID" runat="server" Value="0" />
                            <Chy:XTextBox ID="txtOrg" runat="server" Text="海思卡尔私人健康管理中心" class="inputtext searchinput searchinput" onclick="OpenDialogOrg();"/>
                            <img title=" 请选择" id="imgSelectOrg" style="cursor: hand;" onclick="OpenDialogOrg();"
                            src="/App_Themes/default/images/search.gif" />                        
                        </td>
                        <td class="label">
                        </td>
                        <td class="input">
                        </td>
                        <td class="label">
                        </td>
                    </tr>
                </table>
                <div class="ut_tit_head" style="width: 99%">
                    <%=Chy.Web.Resource.GetString("HM_0317")%></div>
                <table width="100%" cellspacing="1" cellpadding="1" class="combination">
                    <asp:Repeater ID="RptCheckClass" runat="server" OnItemDataBound="RptCheckClass_ItemDataBound">
                        <ItemTemplate>
                            <tr>
                                <td style="text-align: left; width: 100px">
                                    <span style="font-family: 宋体; font-size: 13px; font-weight: bold; font-style: normal;
                                        text-decoration: none; color: #333333;">
                                        <%# Eval("Ctype").ToString() + Chy.Web.Resource.GetString("Remp_Colon") %></span>
                                </td>
                                <td>
                                    <table width="99%" cellspacing="0" cellpadding="0" class="combination" style="margin-right: 2px">
                                        <tr>
                                            <td>
                                              <asp:Repeater ID="RptMTypeClass" runat="server" >
                                               <ItemTemplate>
                                                  <Chy:XLabel runat="server" id="labelMType" style="font-family: 宋体; font-size: 12px; font-weight: bold; font-style: normal;
                                                     text-decoration: none; color: #333333;"></Chy:XLabel>
                                                  <asp:CheckBoxList ID="CkL" runat="server" CellPadding="0" CellSpacing="0" RepeatDirection="Horizontal"
                                                    CssClass="zc_dxk" RepeatColumns="3">
                                                  </asp:CheckBoxList>
                                                 </ItemTemplate>
                                               </asp:Repeater>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                    <tr valign="top">
                        <td style="text-align: left; width: 100px" rowspan="2">
                            <span style="font-family: 宋体; font-size: 13px; font-weight: bold; font-style: normal;
                                text-decoration: none; color: #333333;">
                                <%= Chy.Web.Resource.GetString("HM_OtherItem") + Chy.Web.Resource.GetString("Remp_Colon")%></span>
                        </td>
                        <td>
                            <table width="99%" cellspacing="0" cellpadding="0" class="combination" style="margin-right: 2px">
                                <tr>
                                    <td>
                                        <asp:CheckBoxList ID="CkLClass" runat="server" CellPadding="0" CellSpacing="0" RepeatDirection="Horizontal"
                                            CssClass="zc_dxk" RepeatColumns="5">
                                        </asp:CheckBoxList>
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span>
                                <asp:TextBox ID="txtClassName" runat="server" CssClass="inputtext" MaxLength="28"></asp:TextBox><asp:TextBox
                                    ID="txtClassID" runat="server" Style="display: none"></asp:TextBox>&nbsp;<asp:ImageButton
                                        ID="btnAdd" runat="server" OnClick="btnAdd_Click" ImageUrl="/Images/addaa.gif"
                                        OnClientClick="return CheckBeforeAdd()" />
                                &nbsp;<img alt='' runat="server" id="ImgClassName" src="../../Image/search.png" style="cursor: hand"
                                    onclick="OpenClassSelect();" /></span><asp:Button ID="btnHiddenAdd" Style="display: none"
                                        runat="server" Text="Button" OnClick="btnAdd_Click" />
                        </td>
                    </tr>
                </table>
                <table width="100%" border="0" cellspacing="2" cellpadding="2">
                    <tr>
                        <td align="center" colspan="3">
                            <asp:CheckBox ID="chkMedicalService" runat="server" Text="就医服务记录"  style=" display:none;" />
                            <Chy:XButton ID="btnSave" runat="server" Text="保存" ValidationGroup="DoctorValid"
                                CssClass="buttons" OnClick="btnSave_Click" OnClientClick="return CheckSave();" />
                            <span class="space"></span>
                            <Chy:XButton ID="btnCancel" runat="server" Text="返回" CssClass="buttons" CausesValidation="false"
                                OnClick="btnCancel_Click" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <script type="text/javascript">

        $(".default_top").click(function () {
            $("#" + this.id + "_").slideToggle(500);
        });
        ///保存前的验证
        function CheckSave() {

            if (!checkTime()) {
                return false;
            }
            else if ($("#<%=dpCheckDate.ClientID %>").val() == "") {
                alertMsg('<%=Chy.Web.Resource.GetString("HM_0304")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
                return false;
            }
            else if ($("#<%=dpRegisterDate.ClientID %>").val() == "") {
                alertMsg('<%=Chy.Web.Resource.GetString("HM_0303")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
                return false;
            }           
            else
                return true;
        }
        ///时间判断
        function checkTime() {
            var StartTime = $.trim($("#<%=dpRegisterDate.ClientID %>").val()).replace(/-/g, '/').split('/');
            var EndTime = $.trim($("#<%=dpCheckDate.ClientID %>").val()).replace(/-/g, '/').split('/');

            if (EndTime.length != 0 && StartTime.length != 0) {
                var dateSt = new Date(StartTime[0], StartTime[1]-1, StartTime[2]);
                var dateEd = new Date(EndTime[0], EndTime[1]-1, EndTime[2]);
                if (dateSt > dateEd) {
                    alertMsg('<%=Chy.Web.Resource.GetString("HM_0305")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
                    return false;
                }
            }
            return true;
        }
        ///选择组合项
        function OpenClassSelect() {
            var url = "ChoseClassSelect.aspx?checkRptID=0";
            $("<div style='width:100%;height:400px' id='divchooseFrame'><iframe  scrolling='auto' width='100%' height='100%'  frameborder=0  id='ChooseFrame' src='" + url + "' /></div>").dialog({ autoOpen: true, width: 660, height: 530, showTitle: false, modal: true, title: '选择组合项目' });
        }
        ///组合项添加小项
        function GetItemInfo(item) {
            ///是否重复
            var checkbox = $("input[type='checkbox']");
            for (i = 0; i < checkbox.length; i++) {
                if ($("#<%= txtClassName.ClientID%>")[0].value == checkbox[i].nextSibling.innerText) {
                    alertMsg('<%=Chy.Web.Resource.GetString("HM6_1039")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
                    return false;
                }
            }
            //不重复赋值
            document.getElementById("<%=txtClassName.ClientID%>").value = item.ClassName.substring(0, item.ClassName.length - 1);
            document.getElementById("<%=txtClassID.ClientID%>").value = item.ClassID.substring(0, item.ClassID.length - 1);
            //document.getElementById("<%=btnHiddenAdd.ClientID%>").click();
            <%=Page.GetPostBackEventReference(btnHiddenAdd,"")%>;//调用Button1控件事件
        }
        ///添加选择的组合项:1、不能为空；2、不能添加现有的组合项
        function CheckBeforeAdd() {
            if ($("#<%= txtClassName.ClientID%>")[0].value.replace(/ /g,"") == "") {
                alert('<%=Chy.Web.Resource.GetString("HM6_1040")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
                $("#<%= txtClassName.ClientID%>")[0].value ="";
                return false;
            }
            var isRtn = false;
            var checkbox = $("input[type='checkbox']");
            for (i = 0; i < checkbox.length; i++) {
                if ($("#<%= txtClassName.ClientID%>")[0].value == checkbox[i].nextSibling.innerText) {
                    alertMsg('<%=Chy.Web.Resource.GetString("HM6_1039")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
                    return false;
                }
            }
            return true;
        }

        function TagClick(){
            window.location = 'CheckupReportFill.aspx?Type=EditReport&CheckRepID=<%=Request.QueryString["CheckRepID"].ToString()%>&from=<%=Request.QueryString["from"]%>';
        }
        </script>
         <script language="javascript" type="text/javascript">
         //选择组织
         function OpenDialogOrg() {
             var d = new Date();
             var url = "/hc/Admin/TreeView/OrgTree.aspx?OrgGroupType=1&Time=" + d.toUTCString();
             xysShowModal('请选择组织', url, 350, 420, null);
         }
         function GetOrg(id, name, parentId) {
             $("#<%=hidOrgID.ClientID%>").val(id);
             $("#<%=txtOrg.ClientID%>").val(name);
             $("#<%=hidParentOrgID.ClientID%>").val(parentId);
             hcCloseModal();
         }
     </script>
</asp:Content>
