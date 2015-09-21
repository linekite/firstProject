<%@ Page Language="C#" MasterPageFile="~/AmMainContent.Master" AutoEventWireup="true"
    CodeBehind="CheckupReportMemerEdit.aspx.cs" Inherits="Chm.Web.Admin.Checkup.CheckupReportMemerEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/Js/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <link href="../../Styles/Common.css" rel="stylesheet" type="text/css" />
    <link href="../../Styles/tmmon.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .searchPanel1
        {
            overflow: hidden;
            text-align: left;
            border: #9bb7c3 1px solid;
        }
    
        .t_ss
        {
            background-image: url(../../images/asdftt.jpg);
            background-repeat: repeat-x;
            background-position: bottom; 
        }
        #con
        {
            font-size: 12px;
            margin: 0px auto; 
        }
        #tagss
        {
            padding-right: 0px;
            padding-left: 0px;
            padding-bottom: 0px;
            margin: 0px 0px 0px 0px;
            padding-top: 0px;
            height: 31px;
        }
        #tagss LI
        {
            font-size: 12px;
            font-weight: bold;
            background: url(../../images/tnbleft.gif) no-repeat left bottom;
            float: left;
            margin-right: 1px;
            list-style-type: none;
            height: 31px;
        }
        #tagss LI A
        {
            padding-right: 20px;
            padding-left: 20px;
            background: url(../../images/tnbright.gif) no-repeat right bottom;
            float: left;
            padding-bottom: 0px;
            color: #023d5f;
            line-height: 31px;
            padding-top: 0px;
            height: 31px;
            text-decoration: none;
        }
        #tagss LI.emptyTag
        {
            background: none transparent scroll repeat 0% 0%;
            width: 4px;
        }
        #tagss LI.selectTag
        {
            background-position: left top;
            margin-bottom: -2px;
            position: relative;
            height: 31px;
        }
        #tagss LI.selectTag A
        {
            background-position: right top;
            color: #023d5f;
            line-height: 31px;
            height: 31px;
        }
        .tagContent
        {
            width: 740px;
            color: #474747;
            height: 100%;
        }
        #tagContent DIV.selectTag
        {
            display: block;
        }
        .combination td
        {
            text-align: left;
            line-height: 26px;
            height: 26px;
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
            text-indent: 2px;
            white-space: nowrap;
        }
        
        .zc_dxk td
        {
            width: 200px;
            height: 30px;
            line-height: 30px;
            float: left;
            font-size: 12px;
        }
        
        .zc_dxk2
        {
        }
        
        .zc_dxk2 td
        {
            width: 200px;
            height: 30px;
            line-height: 30px;
            float: left;
            font-size: 12px;
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
    <div id="con">
        <ul id="tagss" class="t_ss">
            <li class="selectTag"><a href="javascript:void(0)">基本信息</a> </li>
            <li><a onclick="TagClick();return false;" href="javascript:void(0)">体检组合项</a> </li>
        </ul>
        <div id="tagContent" style="width:746px;">
            <div class="tagContent selectTag">
                <table width="100%" class="searchPanel1">
                    <tr>
                        <td class="tbtb">
                            <span class="red">*</span><Chy:XLabel ID="lblName" runat="server"></Chy:XLabel>
                        </td>
                        <td class="tbtb">
                            <Chy:XTextBox ID="txtName" MaxLength="64" runat="server" CssClass="inputtext" AllowEmpty="false"
                                ValidationGroup="DoctorValid" ValidType="String" ReadOnly="true"></Chy:XTextBox>
                        </td>
                        <td class="tata">
                            <Chy:XLabel ID="lblCheckNo" runat="server"></Chy:XLabel>
                        </td>
                        <td class="tbtb">
                            <Chy:XTextBox ID="txtCheckNo" runat="server" CssClass="inputtext" AllowEmpty="true"
                                MaxLength="32"></Chy:XTextBox>
                        </td>
                        <td class="tata">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="tata">
                            <span class="red">*</span><Chy:XLabel ID="lblRegisterDate" runat="server"></Chy:XLabel>
                        </td>
                        <td class="tbtb">
                            <Chy:XDatePicker ID="dpRegisterDate" runat="server" AllowEmpty="false" ValidationGroup="DoctorValid"
                                ValidType="String" MaxDate="%y-%M-%d"></Chy:XDatePicker>
                        </td>
                        <td class="tata">
                            <span class="red">*</span><Chy:XLabel ID="lblCheckDate" runat="server"></Chy:XLabel>
                        </td>
                        <td class="tata">
                            <span class="tbtb">
                                <Chy:XDatePicker ID="dpCheckDate" runat="server" AllowEmpty="false" ValidationGroup="DoctorValid"
                                    ValidType="String" MaxDate="%y-%M-%d"></Chy:XDatePicker>
                            </span>
                        </td>
                        <td class="tata">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="tata">
                            <Chy:XLabel ID="lblCheckDoctor" runat="server"></Chy:XLabel>
                        </td>
                        <td class="tbtb">
                            <Chy:XTextBox ID="txtCheckDoctor" runat="server" CssClass="inputtext" AllowEmpty="true"
                                MaxLength="32"></Chy:XTextBox>
                        </td>
                        <td class="tata">
                            <Chy:XLabel ID="lblHospital" runat="server"></Chy:XLabel>
                        </td>
                        <td class="tbtb">
                            <Chy:XTextBox ID="txtHospital" runat="server" CssClass="inputtext" AllowEmpty="true"
                                MaxLength="32"></Chy:XTextBox>
                        </td>
                        <td class="tata">
                        </td>
                    </tr>
                 <%--   <tr>
                        <td class="tata">
                            <span class="red">*</span><Chy:XLabel ID="lblOrg" runat="server"></Chy:XLabel>
                        </td>
                        <td class="tbtb" colspan="4">
                            <Chy:XDropDownList ID="dropOrg" Width="250px" runat="server" AutoPostBack="true">
                            </Chy:XDropDownList>
                        </td>
                        <td class="label">
                        </td>
                    </tr>--%>
                </table>
                <div class="ut_tit_head" style="width: 99%">
                    <%=Chy.Web.Resource.GetString("HM_0317")%></div>
                <table width="100%" cellspacing="2" cellpadding="0" class="combination">
                    <asp:Repeater ID="RptCheckClass" runat="server" OnItemDataBound="RptCheckClass_ItemDataBound">
                        <ItemTemplate>
                            <tr>
                                <td valign="middle" style="text-align: left; width: 100px">
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
                                            CssClass="zc_dxk2" RepeatColumns="3">
                                        </asp:CheckBoxList>
                                        &nbsp;&nbsp;
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
                    <tr>
                     <td style="text-align: left; width: 100px" rowspan="2">
                        <span style="font-family: 宋体; font-size: 13px; font-weight: bold; font-style: normal;
                            text-decoration: none; color: #333333;">
                           上传体检报告：</span>
                    </td>
                    <td>
                        <span><asp:FileUpload ID="fl" runat="server" /></span>
                    </td>
                </tr>
                </table>
                <table width="100%" border="0" cellspacing="2" cellpadding="2">
                    <tr>
                        <td align="center" colspan="3">
                            <asp:CheckBox ID="chkMedicalService" runat="server" Text="就医服务记录" Style="display: none" />
                            <Chy:XButton ID="btnSave" runat="server" Text="保存" ValidationGroup="DoctorValid"
                                CssClass="button" OnClick="btnSave_Click" OnClientClick="return CheckSave(this);" />
                            <span class="space"></span>
                            <Chy:XButton ID="btnCancel" runat="server" Text="返回" CssClass="button" CausesValidation="false"
                                OnClick="btnCancel_Click" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <script type="text/javascript">

        $(".default_top").click(function () {
            $("#" + this.id + "_").slideToggle(50);
            setTimeout("AdjustSize1()", 50);
        });

        function AdjustSize1() {
            var obj = parent.document.getElementById('main_iframe');
            if (obj != null) {
                obj.height = document.body.scrollHeight;
            }
        }

        function CheckSave(o) {

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
            else{
                o.style.display="none";
                return true;
            }
        }

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
            var url = "ChoseClassSelect.aspx?checkRptID=-39";
            $("<div style='width:100%;height:375px' id='divchooseFrame'><iframe  scrolling='auto' width='100%' height='100%'  frameborder=0  id='ChooseFrame' src='" + url + "' /></div>").dialog({ autoOpen: true, width: 660, height: 375, showTitle: false, modal: true, title: '选择组合项目' });
        }
        ///
        function GetItemInfo(item) {
            ///是否重复
            var checkbox = $("input[type='checkbox']");
            for (i = 0; i < checkbox.length; i++) {
                if (item.ClassName.indexOf(checkbox[i].nextSibling.innerText+"|")>=0) {
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
            window.location='CheckupReportMemerFill.aspx?Type=EditReport&CheckRepID=<%=Request.QueryString["CheckRepID"].ToString()%>&rnt=' + Math.random();
        }
    </script>
</asp:Content>
