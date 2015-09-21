<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/MainContent.Master" CodeBehind="CheckupReportAdd.aspx.cs" Inherits="Chm.Web.Admin.Checkup.CheckupReportAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/Js/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <link href="../../Styles/Common.css" rel="stylesheet" type="text/css" />
    <link href="../../Styles/tmmon.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .combination
        {
            margin-top: 6px;
            margin-left:3px;
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">

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
                        ValidType="String" MaxDate="%y-%M-%d"  onchange="fillDate()" ></Chy:XDatePicker>
                </span>
            </td>

            <td class="label">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="label">
                <span class="red">&nbsp;</span><Chy:XLabel ID="lblRegisterDate" runat="server"></Chy:XLabel>
            </td>
            <td class="input">
                <Chy:XDatePicker ID="dpRegisterDate" runat="server" AllowEmpty="true" ValidationGroup="DoctorValid"
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
            <td class="input">&nbsp;
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
<%--                <Chy:XDropDownList ID="dropOrg" Width="250px" runat="server" AutoPostBack="true">
                </Chy:XDropDownList>--%>
                 <%--<asp:DropDownList ID="dropOrg" Width="250px" runat="server">
                 </asp:DropDownList>--%>                              
                 <asp:HiddenField ID="hidOrgID" runat="server" Value="1" />
                <asp:HiddenField ID="hidParentOrgID" runat="server" Value="0" />
                <Chy:XTextBox ID="txtOrg" runat="server" Text="海思卡尔私人健康管理中心" class="inputtext searchinput" onclick="OpenDialogOrg();"/>
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
                            ID="btnAdd" runat="server"  OnClick="btnAdd_Click" ImageUrl="/Images/addaa.gif"
                            OnClientClick="return CheckBeforeAdd()" />
                    &nbsp;<img alt='' runat="server" id="ImgClassName" src="../../Image/search.png" style="cursor: hand"
                        onclick="OpenClassSelect();" /></span><asp:Button ID="btnHiddenAdd" style="display:none" runat="server" Text="Button" OnClick="btnAdd_Click" />
            </td>
        </tr>
    </table>
    <table width="100%" border="0" cellspacing="2" cellpadding="2">
        <tr>
            <td align="center" colspan="3">
                <asp:CheckBox ID="chkMedicalService" runat="server" Text="就医服务记录" style=" display:none;" />
                <Chy:XButton ID="btnSave" runat="server" Text="保存" ValidationGroup="DoctorValid"
                    CssClass="button" OnClick="btnSave_Click" OnClientClick="return CheckSave();" />
                <span class="space"></span>
                <Chy:XButton ID="btnCancel" runat="server" Text="返回" CssClass="button" CausesValidation="false"
                    OnClick="btnCancel_Click" />
            </td>
        </tr>
    </table>
    <script type="text/javascript">
            function CloseItemDialg() {
            $('div').dialog('close');
            window.location.href = window.location.href;
        }

        $(".default_top").click(function () {
            $("#" + this.id + "_").slideToggle(500);
        });
        ///保存前的验证
        function CheckSave() {
            var org=$("#<%=txtOrg.ClientID %>").val();
            if(org==null)
            {
               alertMsg('请选择组织机构!', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
               return false;
            }

//            if (!checkTime()) {
//                return false;
//            } else
            if ($("#<%=dpCheckDate.ClientID %>").val() == "") {
                alertMsg('<%=Chy.Web.Resource.GetString("HM_0304")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
                return false;
            }           
//            else if ($("#<%=dpRegisterDate.ClientID %>").val() == "") {
//                alertMsg('<%=Chy.Web.Resource.GetString("HM_0303")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
//                return false;
//            }
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

        function fillDate()
        {
          var dates=$.trim($("#<%=dpCheckDate.ClientID %>").val());
          document.getElementById("<%=dpRegisterDate.ClientID%>").value=dates;
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
function resizeParentFrame() {
            if (parent.document.getElementById("mainFrame") != null) {
                // clientUnity.resizeFrame(parent.document.getElementById("mainFrame"));  
                if (!clientUnity.resizeOpenWindow()) {
                    clientUnity.resizeFrame();
                }
            }
            if (window.parent.document.getElementById("IFRAME1") != null) {
                window.parent.reSizeiFrame(window.parent.document.getElementById("IFRAME1"));
                window.parent.parent.reSizeWindow();
            }
        }

    </script>
     <script language="javascript" type="text/javascript">
         //弹出DIV嵌套iframe的模态窗体使窗体超过高度显示滚动条
         xysShowModal = function (title, url, width, height, callback) {
             var w_title = title;
             var $browser = $.browser;

             if ($browser.msie)
                 $("<div style='width:" + width + "px;height:100%;' id='divchooseFrame'><iframe  scrolling='yes' width='100%' height='100%'  frameborder=0  id='ChooseFrame' src='" + url + "' /></div>").dialog({ autoOpen: true, width: width, height: height || 700, showTitle: false, draggable: false, bgiframe: true, modal: true, title: w_title, close: callback, position: ['center', 150] });
             else {
                 //if (height) {
                 //    height = height - 180;
                 //}
                 $("<div style='width:100%;' id='divchooseFrame'><iframe  scrolling='yes' width='100%' height='100%'  frameborder=0  id='ChooseFrame' src='" + url + "' /></div>").dialog({ autoOpen: true, width: width, height: height || 500, showTitle: false, draggable: false, bgiframe: true, modal: true, title: w_title, close: callback, position: ['center', 150] });
             }
         }

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
