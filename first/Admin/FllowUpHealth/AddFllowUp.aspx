<%@ Page Title="" Language="C#" MasterPageFile="~/MainContent.Master" AutoEventWireup="true" CodeBehind="AddFllowUp.aspx.cs" Inherits="Chm.Web.Admin.FllowUpHealth.AddFllowUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/Js/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="../../Scripts/MultilineLength.js" type="text/javascript" language="javascript"></script>
    <link href="../../Styles/sf.css" rel="Stylesheet" />
    <link href="/CSS/skin.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="sf_bg" style="width: 500px;">
        随访档案>>新增随访记录
    </div>
    <div class="hy_sj" id="dvChoosePatient" runat="server">
        <div class="hy_sj_left">
            <table border="0" width="100%" cellspacing="0" cellpadding="0" align="left">
                <tr>
                    <td class="label">
                        会员姓名：
                    </td>
                    <td colspan="3">
                        <div class="hy_re">
                            <Chy:XTextBox ID="txtPatientName" runat="server" Style="width: 570px;"></Chy:XTextBox>
                            <!-- <div class="hy_sel">
                                <input name="aa" type="button" value="查看" onmousedown="this.className='hy_sel_bd_h'"
                                    onmouseout="this.className='hy_sel_bd'" class="hy_sel_bd" id="btnView" />
                            </div>-->
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <div class="hy_sj_right">
            <p>
                <span class="or_num">1</span><font style="font-size: 9;">直接输入会员姓名，或者选择查询条件；</font></p>
            <p>
                <span class="or_num">2</span><font style="font-size: 9;">确认“会员姓名”后，才能群发手机短信。</font></p>
            <p class="but">
                <input type="button" class="qf_but" id="btnChoosePatient" value="重新选择会员" onclick="OpenChoosePatient()" /></p>
        </div>
    </div>
    <div class="sf_con">
        <ul id="sf_tags">
            <li><a href="javascript:void(0)">随访记录</a></li>
            <li><a onclick='RedirectPage(1)' href="javascript:void(0)">健康信息</a> </li>
            <li><a onclick='RedirectPage(2)' href="javascript:void(0)">体检档案</a> </li>
            <li><a onclick='RedirectPage(3)' href="javascript:void(0)">门诊档案</a> </li>
            <li><a onclick='RedirectPage(4)' href="javascript:void(0)">住院档案</a> </li>
        </ul>
        <div id="sf_tagContent">
            <div id="tagContent0" class="sf_tagContent selectTag">
                <table border="0" cellspacing="0" cellpadding="0" width="100%">
                    <tbody>
                        <tr>
                            <td valign="top">
                                <table class="sf_search" border="0" cellspacing="0" cellpadding="0">
                                    <tbody>
                                     <tr class="inpatient">
                                        <td class="r_label">
                                            <span class="red">*</span><asp:Label ID="lblInPatientNo" runat="server" Text="病案号："></asp:Label>
                                        </td>
                                        <td>
                                            <div class="hy_jb">
                                                <asp:TextBox ID="txtInPatientNo" ReadOnly="true" runat="server" CssClass="inputtext" style="width: 100px;" />
                                                <div class="hy_sel">
                                                    <input name="aa" type="button" value="选择" onmousedown="this.className='hy_sel_bd_h'"
                                                        onmouseout="this.className='hy_sel_bd'" class="hy_sel_bd" onclick="OpenChooseInPatient()" />
                                                </div>
                                            </div>
                                        </td>
                                        <td class="r_label">
                                            <asp:Label ID="lblCount" runat="server" Text="次数："></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtCount" ReadOnly="true" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr class="inpatient">
                                        <td class="r_label">
                                            <asp:Label ID="lblSex" runat="server" Text="性别：" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtSex" ReadOnly="true" runat="server" />
                                        </td>
                                        <td class="r_label">
                                            <asp:Label ID="lblAge" runat="server" Text="年龄：" />
                                        </td>
                                        <td>
                                            <asp:TextBox runat="server" ReadOnly="true" ID="txtAge" />
                                        </td>
                                    </tr>
                                        <tr class="inpatient">
                                            <td class="r_label">
                                                <Chy:XLabel ID="lblOutDepartment" runat="server" Text="出院科别："></Chy:XLabel>
                                            </td>
                                            <td class="input">
                                                <Chy:XTextBox ID="txtOutDepartment" ReadOnly="true" runat="server" MaxLength="32" CssClass="inputtext" ></Chy:XTextBox>
                                            </td>
                                            <td class="r_label">
                                                <Chy:XLabel ID="lblOutTime" runat="server" Text="出院日期："></Chy:XLabel>
                                            </td>
                                            <td class="input">
                                                <Chy:XDatePicker ID="xpOutTime" Enabled="false" runat="server"></Chy:XDatePicker>
                                            </td>
                                        </tr>
                                        <tr class="inpatient">
                                            <td class="r_label">
                                                <Chy:XLabel ID="lblMainDiagnosisDisName" runat="server" Text="主要诊断疾病名称："></Chy:XLabel>
                                            </td>
                                            <td>
                                                <Chy:XTextBox ID="txtMainDiagnosisDisName" ReadOnly="true" runat="server" MaxLength="32" CssClass="inputtext" ></Chy:XTextBox>
                                            </td>
                                            <td class="r_label">
                                                <Chy:XLabel ID="lblOtherDiagnosisDisName" Text="其他诊断疾病名称：" runat="server" />
                                            </td>
                                            <td class="input">
                                                <Chy:XTextBox ID="txtOtherDiagnosisDisName" ReadOnly="true" runat="server" CssClass="inputtext" MaxLength="128" >
                                                </Chy:XTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="r_label">
                                                完成状态：
                                            </td>
                                            <td class="input">
                                                <asp:DropDownList Width="130px" runat="server" ID="dplStatus" onchange="checkselect(this)">
                                                    <asp:ListItem Value="0">计划</asp:ListItem>
                                                    <asp:ListItem Value="1">已完成</asp:ListItem>
                                                    <asp:ListItem Value="2">取消</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                                            </td>
                                            <td class="r_label">
                                                计划随访日期：
                                            </td>
                                            <td class="input">
                                                <Chy:XDatePicker ID="dpPlanTime" runat="server"></Chy:XDatePicker>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="r_label">
                                                随访医生：
                                            </td>
                                            <td class="input">
                                                <Chy:XTextBox ID="txtDoctor" MaxLength="30" runat="server" CssClass="inputtext" ReadOnly="true"></Chy:XTextBox>
                                            </td>
                                            <td class="r_label">
                                                实际随访日期：
                                            </td>
                                            <td class="input">
                                                <Chy:XDatePicker ID="dpFollowTime" runat="server"></Chy:XDatePicker>
                                                <span class="red">*</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="r_label" valign="top">
                                                主要健康问题：
                                            </td>
                                            <td class="input" valign="top" colspan="3">
                                                <Chy:XTextBox ID="txtHealthProblem" runat="server" TextMode="MultiLine" Style="width: 406px;
                                                    height: 80px" Rows="5"></Chy:XTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="r_label" valign="top">
                                                随访目的：
                                            </td>
                                            <td class="input" valign="top" colspan="3">
                                                <Chy:XTextBox ID="txtFollowAim" runat="server" TextMode="MultiLine" maxlen="2000"
                                                    Style="width: 406px; height: 80px" Rows="5"></Chy:XTextBox>
                                                <span class="red">*</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="r_label" valign="top">
                                                随访结果：
                                            </td>
                                            <td class="input" valign="top" colspan="3">
                                                <Chy:XTextBox ID="txtFollowResult" runat="server" TextMode="MultiLine" maxlen="2000"
                                                    Style="width: 406px; height: 80px" Rows="5"></Chy:XTextBox>
                                            </td>
                                        </tr>
                                        <tr class="inpatient">
                                            <td class="r_label" valign="top">
                                                备注：
                                            </td>
                                            <td class="input" valign="top" colspan="3">
                                                <Chy:XTextBox ID="txtMemo" runat="server" TextMode="MultiLine" maxlen="2000"
                                                    Style="width: 406px; height: 80px" Rows="5"></Chy:XTextBox>
                                            </td>
                                        </tr>
                                        <tr class="inpatient" >
                                            <td class="r_label">
                                                <Chy:XLabel ID="lblContact" Text="联系人：" runat="server" />
                                            </td>
                                            <td class="input">
                                                <%--<asp:RadioButtonList ID="rblContact" runat="server" RepeatDirection="Horizontal">
                                                    </asp:RadioButtonList>--%>
                                                <asp:DropDownList ID="ddlContact" Width="130px" runat="server">
                                                </asp:DropDownList>
                                            </td>
                                            <td class="r_label">
                                                <Chy:XLabel ID="lblConnectStatus" Text="接通情况：" runat="server" />
                                            </td>
                                            <td class="input">
                                                <%--<asp:RadioButtonList runat="server" ID="rblConnectStatus" RepeatDirection="Horizontal">
                                                    </asp:RadioButtonList>--%>
                                                <asp:DropDownList ID="ddlConnectStatus" Width="130px" runat="server">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr class="inpatient">
                                            <td class="r_label">
                                                <Chy:XLabel ID="lblCallduration" Text="通话时长：" runat="server" />
                                            </td>
                                            <td class="input">
                                                <Chy:XTextBox ID="txtCallduration" runat="server"></Chy:XTextBox>
                                            </td>
                                            <td class="r_label">
                                                <Chy:XLabel ID="lblCoordinateStatus" Text="配合度：" runat="server" />
                                            </td>
                                            <td class="input">
                                                <%--<asp:RadioButtonList RepeatDirection="Horizontal" ID="rblCoordinateStatus" runat="server">
                                                    </asp:RadioButtonList>--%>
                                                <asp:DropDownList ID="ddlCoordinateStatus" Width="130px" runat="server">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr class="inpatient">
                                            <td class="r_label">
                                                <Chy:XLabel ID="lblIsAgreeReFollowup" Text="是否愿意再回访：" runat="server" />
                                            </td>
                                            <td class="input">
                                                <%--<asp:RadioButtonList RepeatDirection="Horizontal" ID="rblIsAgreeReFollowup" runat="server">
                                                    </asp:RadioButtonList>--%>
                                                <asp:DropDownList ID="ddlIsAgreeReFollowup" Width="130px" runat="server">
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <Chy:XButton ID="btnSave" runat="server" CssClass="button" OnClick="btnSave_Click"
                                    Text="保存" />
                                <span class="space"></span>
                                <input type="button" class="button" id="btnCancel" runat="server" value="返回" onclick="return btnCancel_onclick()" />
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div class="sf_but_tab">
                </div>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="hdfPlantime" runat="server" />
    <asp:HiddenField ID="hdfReSelect" runat="server" />
    <asp:HiddenField ID="hdfMobile" runat="server" />
    <asp:HiddenField ID="hdfPatientId" runat="server" />
    <asp:HiddenField ID="hdfDataSourceId" runat="server" />

    <asp:HiddenField ID="hdfPatientNo" runat="server" />
    <asp:HiddenField ID="hdfCount" runat="server" />
    <asp:HiddenField ID="hdfSex" runat="server" />
    <asp:HiddenField ID="hdfAge" runat="server" />
    <asp:HiddenField ID="hdfOutDepartment" runat="server" />
    <asp:HiddenField ID="hdfOutTime" runat="server" />
    <asp:HiddenField ID="hdfMainDiagnosisDisName" runat="server" />
    <asp:HiddenField ID="hdfOtherDiagnosisDisName" runat="server" />
    <asp:Button ID="btnLoadValue" runat="server" OnClick="btnLoadValue_Click" Style="display: none;" />
    <script language="javascript" type="text/javascript">
        $(document).ready(function () {
            var name = $("#<%=txtPatientName.ClientID %>").val();
            var dataSource = $("#<%=hdfDataSourceId.ClientID %>").val();
            var patientNo = $("#<%=hdfPatientNo.ClientID %>").val();
            if (name.length == 0) {
                showPatientWindow();
            }
            if (dataSource == "2") {
                $(".inpatient").show();
            } else {
                $(".inpatient").hide();
            }

            $("#<%=btnSave.ClientID %>").click(function () {
                var status = $("#<%=dplStatus.ClientID %>").val();
                var inPatientNo = $("#<%=txtInPatientNo.ClientID %>").val();
                var StartTime = $.trim($("#<%=dpPlanTime.ClientID %>").val()).replace(/-/g, '/').split('/');
                var EndTime = $.trim($("#<%=dpFollowTime.ClientID %>").val()).replace(/-/g, '/').split('/');
                var msg = '';
                var plantime = $("#<%=dpPlanTime.ClientID %>").val();
                $("#<%=hdfPlantime.ClientID %>").val(plantime);
                if (dataSource == "2") {
                    if (inPatientNo == "" || inPatientNo == "请选择") {
                        alertMsg('请选择住院号', '提示', 400, 200, "");
                        return false;
                    }
                }
                if (status == 0) {
                    if ($("#<%=dpPlanTime.ClientID %>").val() == "") {
                        alertMsg('计划随访日期不能为空', '提示', 400, 200, "");
                        return false;
                    } else {
                        if ($("#<%=txtFollowAim.ClientID %>").val() == "") {
                            alertMsg('随访目的不能为空', '提示', 400, 200, "");
                            return false;
                        }
                    }
                } else if (status == 1) {
                    msg = '状态为已完成后不可修改，是否保存';
                    if ($("#<%=dpFollowTime.ClientID %>").val() == "") {
                        alertMsg('实际随访日期不能为空', '提示', 400, 200, "");
                        return false;
                    }
                    if ($("#<%=txtFollowResult.ClientID %>").val() == "") {
                        alertMsg('随访结果不能为空', '提示', 400, 200, "");
                        return false;
                    }
                }


                if (status == 2) {
                    msg = '取消后资料不可更改，请确认随访已完成';
                }
                if (EndTime.length != 0 && StartTime.length != 0) {
                    var dateSt = new Date(StartTime[0], StartTime[1] - 1, StartTime[2]);
                    var dateEd = new Date(EndTime[0], EndTime[1] - 1, EndTime[2]);
                    if (dateSt > dateEd) {
                        alertMsg('实际随访日期不能小于计划随访日期', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
                        return false;
                    }
                }
                if (msg.length != 0) {
                    return confirmMsg('<%=btnSave.UniqueID%>', msg, '<%=Chy.Web.Resource.GetString("Remp_Notice") %>', 300, 140);
                }
            });

        });

        function showPatientWindow() {
            var url = "../../Admin/ReChooseSinglePatient.aspx";
            $("<div style='width:100%;height:600px' id='divchooseFrame'><iframe  scrolling='auto' width='100%' height='100%'  frameborder=0  id='ChooseFrame' src='" + url + "' /></div>").dialog({ closeOnEscape: false, autoOpen: true, width: 660, height: 600, showTitle: false, modal: true, title: '选择会员', open: function (event, ui) { $(".ui-dialog-titlebar-close").hide(); } });
        }
        function Ref() {
            $("#<%=btnLoadValue.ClientID %>").click();
        }

        function OpenChooseInPatient() {
            url = "ChooseInPatientInfo.aspx?_pi=" + $("#<%=hdfPatientId.ClientID %>").val();
            $("<div style='width:100%;height:400px' id='divchooseFrame'><iframe  scrolling='auto' width='100%' height='100%'  frameborder=0  id='ChooseFrame' src='" + url + "' /></div>").dialog({ autoOpen: true, width: 600, height: 400, showTitle: false, modal: true, title: '选择住院记录' });
        }

        function checkselect(obj) {
            var selectValue = $(obj).val();
            if (selectValue == "0") {
                var dateNow = new Date();
                var month = (dateNow.getMonth() + 1) < 10 ? "0" + (dateNow.getMonth() + 1) : (dateNow.getMonth() + 1);
                var day = dateNow.getDate() < 10 ? "0" + dateNow.getDate() : dateNow.getDate();
                var dateNowDay = dateNow.getFullYear() + "-" + month + "-" + day;
                var plantime = $("#<%=dpPlanTime.ClientID %>").val();
                $("#<%=hdfPlantime.ClientID %>").val(plantime);
                $("#<%=txtFollowResult.ClientID %>").attr("disabled", "disabled");
                $("#<%=dpFollowTime.ClientID %>").attr("disabled", "disabled");
                $("#<%=txtFollowAim.ClientID %>").attr("readonly", false);
                $("#<%=dpPlanTime.ClientID %>").removeAttr("disabled");

            }
            if (selectValue == "1" || selectValue == "2") {
                var dateNow = new Date();
                var month = (dateNow.getMonth() + 1) < 10 ? "0" + (dateNow.getMonth() + 1) : (dateNow.getMonth() + 1);
                var day = dateNow.getDate() < 10 ? "0" + dateNow.getDate() : dateNow.getDate();
                var dateNowDay = dateNow.getFullYear() + "-" + month + "-" + day;
                var plantime = $("#<%=dpPlanTime.ClientID %>").val();
                $("#<%=hdfPlantime.ClientID %>").val(plantime);
                $("#<%=dpFollowTime.ClientID %>").val(dateNowDay);
                $("#<%=txtFollowAim.ClientID %>").attr("readonly", true);
                $("#<%=dpPlanTime.ClientID %>").attr("disabled", "disabled");
                $("#<%=txtFollowResult.ClientID %>").removeAttr("disabled");
                $("#<%=dpFollowTime.ClientID %>").removeAttr("disabled");
            }

        }

        function btnCancel_onclick() {
            location.href = "FllowUpRecord.aspx";
        }

        function OpenChoosePatient() {

            document.getElementById("<%=hdfReSelect.ClientID %>").value = "true";
            showPatientWindow();
        }

        function GetItemInfo(item) {
            document.getElementById("<%=txtPatientName.ClientID %>").value = item.PatientName;
            document.getElementById("<%=hdfPatientId.ClientID %>").value = item.PatientId;
            document.getElementById("<%=hdfDataSourceId.ClientID %>").value = item.DataSource;
        }

        function GetInfo(item) {
            $("#<%=txtInPatientNo.ClientID %>").val(item.PatientNo);
            $("#<%=txtCount.ClientID %>").val(item.Count);

            $("#<%=txtSex.ClientID %>").val(item.Sex);
            $("#<%=txtAge.ClientID %>").val(item.Age);
            $("#<%=txtOutDepartment.ClientID %>").val(item.OutDepartment);
            $("#<%=xpOutTime.ClientID %>").val(item.EndTime);
            $("#<%=txtMainDiagnosisDisName.ClientID %>").val(item.zyzdjbmc);
            $("#<%=txtOtherDiagnosisDisName.ClientID %>").val(item.fszdjbmc);

            $("#<%=hdfPatientNo.ClientID %>").val(item.PatientNo);
            $("#<%=hdfCount.ClientID %>").val(item.Count);
            $("#<%=hdfSex.ClientID %>").val(item.Sex);
            $("#<%=hdfAge.ClientID %>").val(item.Age);
            $("#<%=hdfOutDepartment.ClientID %>").val(item.OutDepartment);
            $("#<%=hdfOutTime.ClientID %>").val(item.EndTime);
            $("#<%=hdfMainDiagnosisDisName.ClientID %>").val(item.zyzdjbmc);
            $("#<%=hdfOtherDiagnosisDisName.ClientID %>")
        }

        function checkNumber(obj) {
            var patt1 = new RegExp(/^[1-9]\d*$/g); //匹配正整数
            var patt2 = new RegExp(/^[1-9]\d*\.\d{1,2}$|0\.\d*[1-9]\d+$/g); //匹配正浮点数
            if (!patt1.test(obj.value) && !patt2.test(obj.value)) {
                alert('请输入整数或小数');
                obj.value = "";
                return;
            }
        }

        CloseDialg = function () {
            $('div').dialog('close');
        }

        function RedirectPage(type) {
            var _pi = document.getElementById("<%=hdfPatientId.ClientID %>").value;
            if (type == 1) {
                var url = "/hc/Admin/HealthRecord/HealthInfoEdit.aspx";
            } else if (type == 2) {
                var url = "/hc/Admin/Checkup/CheckupReportList.aspx";
            } else if (type == 3) {
                var url = "/hc/Admin/HealthRecord/OutPatient.aspx";
            }
            else if (type == 4) {
                var url = "/hc/Admin/HealthRecord/InPatient.aspx";
            }
            clientUnity.redirectToPersional(_pi, url);
        } 
    </script>
</asp:Content>
