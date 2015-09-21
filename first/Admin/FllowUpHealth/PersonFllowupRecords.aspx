<%@ Page Title="" Language="C#" MasterPageFile="~/MainContent.Master" AutoEventWireup="true" CodeBehind="PersonFllowupRecords.aspx.cs" Inherits="Chm.Web.Admin.FllowUpHealth.PersonFllowupRecords" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script src="../../Scripts/MultiLineLength.js" type="text/javascript"></script>
    <script src="/Js/DatePicker/WdatePicker.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="sf_tagContent">
        <div id="tagContent0" class="sf_tagContent selectTag">
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tbody>
                    <tr>
                        <td valign="top" width="50%">
                            <Chy:XGridView ID="gvShow" runat="server" CssClass="zebratable" AllowPaging="true"
                                DataKeyNames="HealthFUID" AutoGenerateColumns="False" PagerSettings-PageButtonCount="8"
                                PageSize="10" Width="100%" OnRowDataBound="gvShow_RowDataBound">
                                <Columns>
                                    <asp:TemplateField ItemStyle-Width="120px" HeaderText="计划随访日期">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbtPlanTime" runat="server" CommandName='<%#Eval("Status")%>'
                                                CommandArgument='<%# GetPram(Eval("HealthFUID"),Eval("FLType"))%>' OnCommand="gvShow_Command">                          
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="随访目的">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbtFollowAmi" runat="server" CommandName='<%#Eval("Status")%>'
                                                CommandArgument='<%# GetPram(Eval("HealthFUID"),Eval("FLType"))%>' Text='<%# Eval("FollowAim") %>'
                                                OnCommand="gvShow_Command">                          
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="随访结果">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbtFollowResult" runat="server" CommandName='<%#Eval("Status")%>'
                                                CommandArgument='<%# GetPram(Eval("HealthFUID"),Eval("FLType"))%>' OnCommand="gvShow_Command">                          
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="随访类别">
                                        <ItemTemplate>
                                            <asp:Label ID="lblFollowupType" runat="server" Text='<%# GetFollowUpType(Eval("FLType")) %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="完成状态">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbtStatus" runat="server" CommandName='<%#Eval("Status")%>' CommandArgument='<%# GetPram(Eval("HealthFUID"),Eval("FLType"))%> '
                                                OnCommand="gvShow_Command">                          
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </Chy:XGridView>
                        </td>
                        <td valign="top">
                            <table class="sf_search" border="0" cellspacing="0" cellpadding="0">
                                <tbody>
                                    <tr class="inpatient">
                                        <td class="r_label">
                                            <span class="red">*</span><asp:Label ID="lblInPatientNo" runat="server" Text="病案号："></asp:Label>
                                        </td>
                                        <td>
                                            <div class="hy_jb">
                                                <asp:TextBox ID="txtInPatientNo" ReadOnly="true" runat="server" CssClass="inputtext"
                                                    Style="width: 100px;" />
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
                                            <asp:TextBox ID="txtCount" Enabled="false" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr class="inpatient">
                                        <td class="r_label">
                                            <asp:Label ID="lblSex" runat="server" Text="性别：" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtSex" Enabled="false" runat="server" />
                                        </td>
                                        <td class="r_label">
                                            <asp:Label ID="lblAge" runat="server" Text="年龄：" />
                                        </td>
                                        <td>
                                            <asp:TextBox runat="server" Enabled="false" ID="txtAge" />
                                        </td>
                                    </tr>
                                    <tr class="inpatient">
                                        <td class="r_label">
                                            <Chy:XLabel ID="lblOutDepartment" runat="server" Text="出院科别："></Chy:XLabel>
                                        </td>
                                        <td class="input">
                                            <Chy:XTextBox ID="txtOutDepartment" Enabled="false" runat="server" MaxLength="32"
                                                CssClass="inputtext"></Chy:XTextBox>
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
                                            <Chy:XTextBox ID="txtMainDiagnosisDisName" ReadOnly="true" runat="server" MaxLength="32"
                                                CssClass="inputtext"></Chy:XTextBox>
                                        </td>
                                        <td class="r_label">
                                            <Chy:XLabel ID="lblOtherDiagnosisDisName" Text="其他诊断疾病名称：" runat="server" />
                                        </td>
                                        <td class="input">
                                            <Chy:XTextBox ID="txtOtherDiagnosisDisName" ReadOnly="true" runat="server" CssClass="inputtext"
                                                MaxLength="128">
                                            </Chy:XTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="label">
                                            完成状态：
                                        </td>
                                        <td class="input">
                                            <asp:DropDownList runat="server" ID="dplStatus" onchange="ShowControl()">
                                                <asp:ListItem Value="0">计划</asp:ListItem>
                                                <asp:ListItem Value="1">已完成</asp:ListItem>
                                                <asp:ListItem Value="2">取消</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td class="r_label">
                                            <span class="red">*</span>计划随访日期：
                                        </td>
                                        <td class="input">
                                            <Chy:XDatePicker ID="dpPlanTime" runat="server"></Chy:XDatePicker>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="label">
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
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="label" valign="top">
                                            主要健康问题：
                                        </td>
                                        <td class="input" valign="top" colspan="3">
                                            <Chy:XTextBox ID="txtHealthProblem" runat="server" TextMode="MultiLine" Style="width: 310px;
                                                height: 80px" Rows="5"></Chy:XTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="label" valign="top">
                                            随访目的：
                                        </td>
                                        <td class="input" valign="top" colspan="3">
                                            <Chy:XTextBox ID="txtFollowAim" runat="server" TextMode="MultiLine" MaxLen="2000"
                                                Style="width: 310px; height: 80px" Rows="5"></Chy:XTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="label" valign="top">
                                            随访结果：
                                        </td>
                                        <td class="input" valign="top" colspan="3">
                                            <Chy:XTextBox ID="txtFollowResult" runat="server" TextMode="MultiLine" MaxLen="2000"
                                                Style="width: 310px; height: 80px" Rows="5"></Chy:XTextBox>
                                        </td>
                                    </tr>
                                    <tr class="inpatient">
                                            <td class="r_label" valign="top">
                                                备注：
                                            </td>
                                            <td class="input" valign="top" colspan="3">
                                                <Chy:XTextBox ID="txtMemo" runat="server" TextMode="MultiLine" maxlen="2000"
                                                    Style="width: 310px; height: 80px" Rows="5"></Chy:XTextBox>
                                            </td>
                                        </tr>
                                    <tr class="inpatient">
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
                                            <%--<Chy:XDatePicker ID="xpCallduration" runat="server"></Chy:XDatePicker>--%>
                                            <Chy:XTextBox ID="txtCallduration" onblur="checkNumber(this);" runat="server"></Chy:XTextBox>(分)
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
                                    <tr>
                                        <td colspan="4" align="center">
                                            <Chy:XButton ID="btnAdd" runat="server" CssClass="button" Text="新增" OnClientClick=" return checkIsSelected()" OnClick="btnAdd_Click" />
                                            <span class="space"></span>
                                            <Chy:XButton ID="btnSave" runat="server" CssClass="button" OnClick="btnSave_Click"
                                                Text="保存" />
                                            <span class="space"></span>
                                            <Chy:XButton ID="btnUpdate" runat="server" CssClass="button" Text="修改" OnClick="btnUpdate_Click" />
                                            <span class="space"></span>
                                            <%--<input type="button" class="button" id="btnCancel" runat="server" value="取消" />--%>
                                            <Chy:XButton ID="btnCancel" runat="server" runat="server" Text="取消" OnClick="btnCancel_Click"
                                                Style="height: 26px" />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="sf_but_tab">
            </div>
        </div>
         <div id="popDiv2" align="center">
        <table>
            <tr align="center">
                <td>
                    <asp:RadioButtonList ID="rblFollowupType" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Text="体检随访" Value="1" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="住院随访" Value="2"></asp:ListItem>
                        <asp:ListItem Text="其它" Value="3"></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr align="center">
                <td>
                    <input type="button" class="button" value="确定" onclick="SetValue()" /><span class="space"></span>
                    <input type="button" class="button" value="取消" onclick="CloseDialg()" />

                </td>
            </tr>
        </table>
    </div>
    </div>
    <asp:HiddenField ID="lblPlanTime" runat="server" />
    <asp:HiddenField ID="hdfCount" runat="server" />
    <asp:HiddenField ID="hdfInPatientNo" runat="server" />
    <asp:HiddenField ID="hdfSex" runat="server" />
    <asp:HiddenField ID="hdfOutTime" runat="server" />
    <asp:HiddenField ID="hdfMainDiagnosisDisName" runat="server" />
    <asp:HiddenField ID="hdfOtherDiagnosisDisName" runat="server" />
    <asp:HiddenField ID="hdfAge" runat="server" />
    <asp:HiddenField ID="hdfOutDepartment" runat="server" />
    <asp:HiddenField ID="hdfTypeId" runat="server" />
    <script language="javascript" type="text/javascript">
        $(document).ready(function () {
        $("#popDiv2").dialog({
                bgiframe: true,
                draggable: false,
                autoOpen: false,
                modal: true,
                width: 250,
                autoHeight: true,
                closeOnEscape: false
            });

            $("#popDiv2").parent().appendTo($("form:first"));

            var type=<%=TypeId %>;
            if(type=="1")
            {
                $(".inpatient").hide();
            }else if(type=="2")
            {
                 $(".inpatient").show();
            }else
            {
                $(".inpatient").hide();
            }

            $("#<%=btnSave.ClientID %>").click(function () {
                var msg = '';
                var plantime = $("#<%=dpPlanTime.ClientID %>").val();
                var status = $("#<%=dplStatus.ClientID %>").val();
                var PlanTime = $("#<%=dpPlanTime.ClientID %>").val();
                var FllowTime = $("#<%=dpFollowTime.ClientID %>").val();
                var FllowResult = $("#<%=txtFollowResult.ClientID %>").val();
                var FllowAmi = $("#<%=txtFollowAim.ClientID %>").val();
                var inpatientNo=$("#<%=txtInPatientNo.ClientID %>").val();

                var StartTime = $.trim($("#<%=dpPlanTime.ClientID %>").val()).replace(/-/g, '/').split('/');
                var EndTime = $.trim($("#<%=dpFollowTime.ClientID %>").val()).replace(/-/g, '/').split('/');
                if(type=="2")
                {
                    if(inpatientNo=="" || inpatientNo=="请选择")
                    {
                        alert('请选择住院号');
                        return false;
                    }
                }
                if (status == 0) {
                    if (PlanTime.length == 0) {
                        alert('计划随访日期不能为空');
                        return false;
                    }
                    if (FllowAmi.length == 0) {
                        alert("随访目的不能为空");
                        return false;
                    }
                }
               
                if (status == 1) {
                    msg = '状态为已完成后不可修改，是否保存';
                    if (FllowResult.length == 0) {
                        alert("随访结果不能为空");
                        return false;
                    }
                    if (FllowTime.length == 0) {
                        alert("随访日期不能为空");
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
                        alert("实际随访日期不能小于计划随访日期");
                        return false;
                    }
                }
                if (msg.length != 0) {
                    return confirmMsg('<%=btnSave.UniqueID%>', msg, '<%=Chy.Web.Resource.GetString("Remp_Notice") %>', 300, 140);
                }
            });

        });

          function OpenChooseInPatient() {
                url = "ChooseInPatientInfo.aspx?_pi="+<%=PatientId %>;
            $("<div style='width:100%;height:400px' id='divchooseFrame'><iframe  scrolling='auto' width='100%' height='100%'  frameborder=0  id='ChooseFrame' src='" + url + "' /></div>").dialog({ autoOpen: true, width: 600, height:400, showTitle: false, modal: true, title: '选择住院记录' });
            }
       
        function ShowControl() {
            var status = $("#<%=dplStatus.ClientID %>").val();
            if (status == 0) {
                var dateNow = new Date();
                var month = (dateNow.getMonth() + 1) < 10 ? "0" + (dateNow.getMonth() + 1) : (dateNow.getMonth() + 1);
                var day = dateNow.getDate() < 10 ? "0" + dateNow.getDate() : dateNow.getDate();
                var dateNowDay = dateNow.getFullYear() + "-" + month + "-" + day;
                var plantime = $("#<%=dpPlanTime.ClientID %>").val();
                $("#<%=lblPlanTime.ClientID %>").val(plantime);
                $("#<%=dpPlanTime.ClientID %>").val(dateNowDay);
                $("#<%=dpFollowTime.ClientID %>").val("");
                $("#<%=txtFollowResult.ClientID %>").attr("disabled", "disabled");
                $("#<%=dpFollowTime.ClientID %>").attr("disabled", "disabled");
                $("#<%=txtFollowAim.ClientID %>").attr("readonly", false);
                $("#<%=dpPlanTime.ClientID %>").removeAttr("disabled");
            } else if (status == 1 || status == 2) {
                var dateNow = new Date();
                var month = (dateNow.getMonth() + 1) < 10 ? "0" + (dateNow.getMonth() + 1) : (dateNow.getMonth() + 1);
                var day = dateNow.getDate() < 10 ? "0" + dateNow.getDate() : dateNow.getDate();
                var dateNowDay = dateNow.getFullYear() + "-" + month + "-" + day;
                var plantime = $("#<%=dpPlanTime.ClientID %>").val();
                $("#<%=lblPlanTime.ClientID %>").val(plantime);
                $("#<%=dpFollowTime.ClientID %>").val(dateNowDay);
                $("#<%=txtFollowAim.ClientID %>").attr("readonly", true);
                $("#<%=dpPlanTime.ClientID %>").attr("disabled", "disabled");
                $("#<%=txtFollowResult.ClientID %>").removeAttr("disabled");
                $("#<%=dpFollowTime.ClientID %>").removeAttr("disabled");
            }
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

            $("#<%=hdfInPatientNo.ClientID %>").val(item.PatientNo);
            $("#<%=hdfCount.ClientID %>").val(item.Count);
              $("#<%=hdfSex.ClientID %>").val(item.Sex);
            $("#<%=hdfAge.ClientID %>").val(item.Age);
            $("#<%=hdfOutDepartment.ClientID %>").val(item.OutDepartment);
            $("#<%=hdfOutTime.ClientID %>").val(item.EndTime);
            $("#<%=hdfMainDiagnosisDisName.ClientID %>").val(item.zyzdjbmc);
            $("#<%=hdfOtherDiagnosisDisName.ClientID %>")
        }

        function CloseDialg()
        {
              $('div').dialog('close');
        }
        function checkNumber(obj)
        {
           var patt1 = new RegExp(/^[1-9]\d*$/g); //匹配正整数
            var patt2 = new RegExp(/^[1-9]\d*\.\d{1,2}$|0\.\d*[1-9]\d+$/g); //匹配正浮点数
            if (!patt1.test(obj.value) && !patt2.test(obj.value)) {
                alert('请输入整数或小数');
                obj.value = "";
                return;
            }
        }

        function checkIsSelected()
        {
         
                $("#popDiv2").dialog("open");
                return false;
           
        }

        function SetValue()
        {
            var type=$("#<%=rblFollowupType.ClientID %> :input:radio:checked").val();
            if(type!="")
            {
                $("#<%=hdfTypeId.ClientID %>").val(type);
                $("#popDiv2").dialog("close");
                 $("#<%=btnAdd.ClientID %>").click();
            }
        }
    </script>
</asp:Content>
