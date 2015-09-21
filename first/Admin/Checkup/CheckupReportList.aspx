<%@ Page Language="C#" MasterPageFile="~/MainContent.Master" AutoEventWireup="true"
    CodeBehind="CheckupReportList.aspx.cs" Inherits="Chm.Web.Admin.Checkup.CheckupReportList" %>

<%@ Register TagPrefix="Chy" Namespace="Chy.UI.Controls" Assembly="Chy.UI.Controls" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .hidden
        {
            display: none;
        }
        #b
        {
            background-image: url(loading.gif);
            background-position: center center;
            background-repeat: no-repeat;
        }
        body{background:#fff;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
    <div class="iframecon paddingt_10">
    <table width="100%" cellpadding="0" cellspacing="0" class="searchPanel" align="center">
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <td class="label">
                            <Chy:XLabel ID="lblHospital" runat="server"></Chy:XLabel>
                        </td>
                        <td class="input">
                            <Chy:XTextBox ID="txtHospital" runat="server" class="inputtext" MaxLength="64"></Chy:XTextBox>
                        </td>
                        <td class="label">
                            <Chy:XLabel ID="lblStartTime" runat="server"></Chy:XLabel>
                        </td>
                        <td class="input">
                            <Chy:XDatePicker ID="tpStartTime" runat="server"></Chy:XDatePicker>
                        </td>
                        <td class="label">
                            <Chy:XLabel ID="lblEndTime" runat="server"></Chy:XLabel>
                        </td>
                        <td class="input">
                            <Chy:XDatePicker ID="tpEndTime" runat="server"></Chy:XDatePicker>
                        </td>
                        <td class="input">
                            <Chy:XButton ID="btnSearch" runat="server" Text="查询" CssClass="button" OnClick="btnSearch_Click"
                                OnClientClick="return checkTime();" />
                        </td>
                    </tr>
                </table>
            </td>
            <td class="add">
                <Chy:XButton ID="btnAdd" runat="server" Text="新增" CssClass="addbutton" />
                <Chy:XButton ID="btnDelete" runat="server" Text="删除" CssClass="delbutton" OnClick="btnDelete_Click"
                    Style="display: none;" />
                <input id="btnDeleteCheck" type="button" class="delbutton" runat="server" />
            </td>
        </tr>
    </table>
    <table width="100%" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td>
                <Chy:XGridView ID="gvReport" runat="server" CssClass="zebratable" AllowPaging="true"
                    DataKeyNames="checkRptID" AutoGenerateColumns="False" PagerSettings-PageButtonCount="8"
                    PageSize="10" Width="100%" OnBindCstm="gvReport_BindCstm" OnRowDataBound="gvReport_RowDataBound">
                    <Columns>
                        <asp:TemplateField HeaderStyle-CssClass="check" ItemStyle-Width="24px" ItemStyle-CssClass="check">
                            <HeaderTemplate>
                                <%--<asp:CheckBox ID="chkSelAll" runat="server" onclick="selectAll(this,'<%=gvReport.ClientID %>')"/>--%>
                                <input id="chkSelAll" type="checkbox" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSelItem" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="PatientName" HeaderText="姓名" HeaderStyle-CssClass="hidden"
                            ItemStyle-CssClass="hidden"></asp:BoundField>
                        <asp:TemplateField ShowHeader="true" HeaderText="体检日期" ItemStyle-Width="120px">
                            <ItemTemplate>
                                <%# Convert.ToDateTime(Eval("CheckTime")).ToString("yyyy-MM-dd")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="hospital" HeaderText="医院名称"></asp:BoundField>
                        <asp:BoundField DataField="doctor" HeaderText="总检医生"></asp:BoundField>
                        <asp:TemplateField ShowHeader="true" HeaderText="查看" ItemStyle-Width="55px">
                            <ItemTemplate>
                             <a href="javascript:void(0)" onclick="print('ChkUpRptPrint.aspx?CheckRepID=<%#Eval("checkRptID") %>&_pi=<%=Chy.UI.Framework. MemberManager.SelectedId%>')"><%=Chy.Web.Resource.GetString("HM_View")%></a>
                                <asp:LinkButton ID="lbtnShow" runat="server"  CommandName="itemShow" Visible="false"
                                    CommandArgument='<%# Eval("checkRptID") %>' OnCommand="gvReport_Command" Text="查看"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
<%--                        <asp:TemplateField ShowHeader="true" HeaderText="查看" ItemStyle-Width="55px">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnDetail" runat="server" CausesValidation="False" CommandName="itemDetail"
                                    CommandArgument='<%# Eval("checkRptID") %>' OnCommand="gvReport_Command" Text="查看"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                        <asp:TemplateField ShowHeader="true" HeaderText="填写结果" HeaderStyle-CssClass="hidden"
                            ItemStyle-CssClass="hidden">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtUpdate" runat="server" CausesValidation="False" CommandName="itemEditReport"
                                    CommandArgument='<%# Eval("checkRptID") %>' OnCommand="gvReport_Command" Text="填写"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>                        
                        <asp:TemplateField ShowHeader="true" HeaderText="修改" ItemStyle-Width="55px" >
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnEdit" runat="server" CausesValidation="False" CommandName="itemEdit"
                                    CommandArgument='<%# Eval("checkRptID") %>' OnCommand="gvReport_Command" Text="修改"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="true" HeaderText="打印" ItemStyle-Width="55px">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnAudit" runat="server" CausesValidation="False" CommandName="itemAudit" OnClientClick="PrintingWord()"
                                    CommandArgument='<%# Eval("checkRptID") %>' OnCommand="gvReport_Command" Text=""></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="true" HeaderText="上传" ItemStyle-Width="55px">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtCheckRptUp" runat="server"  Text="上传"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                       <asp:TemplateField ShowHeader="true"  HeaderText="原报告" ItemStyle-Width="55px" ControlStyle-CssClass="ReportField">
                          <ItemTemplate>
                             <asp:LinkButton ID="lbtCheckRptWord" runat="server"  Text="下载" CausesValidation="False" CommandName="CheckRptWord"
                                    CommandArgument='<%# Eval("CheckRptPath") %>' OnCommand="gvReport_Command" Visible="false"></asp:LinkButton>  
                              <asp:HyperLink ID="hlDown" runat="server" Target="_blank">下载</asp:HyperLink>
                              <asp:HiddenField ID="hfCheckRptPath" runat="server"  Value='<%# Eval("CheckRptPath") %>'/>
                          </ItemTemplate>
                      </asp:TemplateField>
                      <asp:BoundField DataField="CheckRptID" HeaderText="报告ID" ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden"></asp:BoundField>
                    </Columns>
                </Chy:XGridView>
            </td>
            <td>
                <div id="doing" style="filter: alpha(opacity=30); -moz-opacity: 0.3; background-color: #AAAAAA;
                        width: 100%; height: 100%; z-index: 1000; position: absolute; left: 0; top: 0;
                        display: none; overflow: hidden;">
                    </div>
                    <!--加一个显示层-->
                    <div id="divMsg" style="background: #fff; padding: 0px 0px 5px 0px; width: 400px;
                        z-index: 1001; position: absolute; top: 50%; display: none; left: 60%; margin: -50px 0 0 -300px;">
                        <div id="a">
                            <div style="margin: 0px; padding: 0px; background:#6dc3ea">
                                <table style="background: #6dc3ea" width="100%">
                                    <tr>
                                        <td align="left" style="font: 13px; color: #fff; font-weight: bold;height:30px;">
                                            请选择要上传的文件 
                                        </td>
                                        <td align="right">
                                            <img src="/hc/admin/healthreport/cancel.png" onclick="ShowNo();" title="<%= Chy.Web.Resource.GetString("HM_0323")%>" id="close"/>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div style="text-align: center;">
                                <table border="0" cellspacing="0" cellpadding="0" class="formcontainer">
                                    <tr>
                                        <td class="warn">
                                            <span class="red">*</span>
                                        </td>
                                        <td class="label">
                                            <%= Chy.Web.Resource.GetString("HM_0417") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                        </td>
                                        <td id="upload">
                                            <asp:FileUpload ID="RptName" runat="server" Width="300px"/>
                                            <asp:HiddenField ID="hdnRptID" runat="server" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div style="text-align: center; margin-top:5px">
                                <div style="vertical-align: middle">
                                    <Chy:xbutton ID="btnASaveMode" CssClass="button" runat="server" Text='确定' 
                                        OnClientClick="return CheckName();" OnClick="Import"/>
                                    <Chy:xbutton ID="btnReturn" CssClass="button" runat="server" Text='返回' 
                                        OnClientClick="return ShowNo();" />
                                </div>
                            </div>
                        </div>
                        <div id="b" style=" height: 50px; display: none; text-align:center; padding-top:7px; font-size:11px"><%= Chy.Web.Resource.GetString("HM_0419")%>.....</div>
                    </div>
            </td>
        </tr>
    </table>
        <div align="center">
       <br />
      <input type="button" runat="server" id="btnC" value="返回" class="button"/>
<%--     <a id="btnExport" style="display:none;">确定</a>--%>
     
      <Chy:XButton ID="btnExport" runat="server" Text="打印" CssClass="button" OnClick="btnExport_Click"
                    Style="display: none;" />            
    </div>
    <link href="../../Styles/MsgBox.css" type="text/css" rel="Stylesheet"/>
     <div id="q_Msgbox" class="hide" align="center">
            <span id="mode_tips_v2" class="qz_msgbox_layer" style="z-index: 10000;"><span class="gtl_ico_clear">
            </span>
                <img alt="" src="../../image/loading.gif" />
                正在打开，请耐心等待... <span class="gtl_end"></span></span>
       </div>
    </div>
    <script src="/Js/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        function PrintingWord() {
            $("#q_Msgbox").removeClass("hide");
        }
        function PrintSussesWord(url) {
            $("#q_Msgbox").addClass("hide"); 
//            $("#<%=btnExport.ClientID %>").click();
            document.getElementById("<%=btnExport.ClientID %>").click();
        }
        $(document).ready(function () {
            $("#<%=btnAdd.ClientID %>").click(
            function () {
                javascript: document.location.href = 'CheckupReportAdd.aspx?Type=Add&_pi=<%=Chy.UI.Framework. MemberManager. SelectedId%>';
                return false;
            }
        );
            $("#chkSelAll").click(function () {
                $("#<%=gvReport.ClientID %> tr:gt(0) :checkbox").not(":disabled").attr("checked", $(this).attr("checked"))
            });

            $("#<%=btnDeleteCheck.ClientID %>").click(function () {

                var msg = '<%=Chy.Web.Resource.GetString("HM_0490") %>';
                var gridId = '<%=gvReport.ClientID %>';
                var express = "#" + gridId + " :checkbox[checked]";
                var selected = $(express).length;
                if (selected == 0) {
                    return alertMsg('<%=Chy.Web.Resource.GetString("HM_ChooseDel")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
                }
                else {
                    if (confirmMsg('<%=btnDelete.UniqueID %>', '<%=Chy.Web.Resource.GetString("确认要删除已选择的项及其相关的疾病分组和评估报告吗?")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200)) {
                        document.getElementById("<%=btnDelete.ClientID %>").click();
                    }
                }
            });
        });

        //审核提示
        function comfirmAudit(name) {
            return confirmMsg(name, '<%=Chy.Web.Resource.GetString("HM_ConfirmAudit")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200);
        }

        //检查结束时间
        function checkTime() {
            var StartTime = $.trim($("#<%=tpStartTime.ClientID %>").val()).replace(/-/g, '/').split('/');
            var EndTime = $.trim($("#<%=tpEndTime.ClientID %>").val()).replace(/-/g, '/').split('/');

            if (EndTime.length != 0 && StartTime.length != 0) {
                var dateSt = new Date(StartTime[0], StartTime[1]-1, StartTime[2]);
                var dateEd = new Date(EndTime[0], EndTime[1]-1, EndTime[2]);
                if (dateSt > dateEd) {
                    alertMsg('<%=Chy.Web.Resource.GetString("HM_From_To_Time")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
                    return false;
                }
            }
            return true;
        }
        function print(url) {
            //window.location.target = '_blank';
            //window.location.href = url;
            window.open(url, '_blank');
        }

        function showFloat(obj) {
            var file = $(":file");
            file.after(file.clone().val(""));
            file.remove();
            var range = getRange();
            G('doing').style.width = range.width + "px";
            G('doing').style.height = range.height + "px";
            G('doing').style.display = "block";
            document.getElementById("divMsg").style.display = "";
            if (typeof (obj) != "undefined") {
                $("#<%=hdnRptID.ClientID %>").val($(obj).parent().parent().children("td").eq(11).html());
            }
            else {
                $("#<%=hdnRptID.ClientID %>").val("");
            }
            return false;
        }
       
        function ShowNo()                        //隐藏两个层
        {
            document.getElementById("doing").style.display = "none";
            document.getElementById("divMsg").style.display = "none";
            return false;
        }
        function G(id) {
            return (document.getElementById) ? document.getElementById(id) : document.all[id];
        }
        function getRange()                      //得到屏幕的大小
        {
            var top = document.body.scrollTop;
            var left = document.body.scrollLeft;
            var height = document.body.clientHeight;
            var width = document.body.clientWidth;

            if (top == 0 && left == 0 && height == 0 && width == 0) {
                top = document.documentElement.scrollTop;
                left = document.documentElement.scrollLeft;
                height = document.documentElement.clientHeight;
                width = document.documentElement.clientWidth;
            }
            return { top: top, left: left, height: height, width: width };
        }
        function CheckName() {
            var fileName = $.trim($("#<%=RptName.ClientID %>").val());
            var reg = /.*?(.doc|.wps|.docx|.pdf)$/gi;
            if (fileName == "") {
                var msg = '提示'; //提示
                alert('上传的文件不能为空', msg, 300, 200); //上传的文件不能为空
                return false;
            }
            if (!reg.test(fileName)) {
                var msg = '提示';
                alertMsg('<%= Chy.Web.Resource.GetString("上传的文件必须是word")%>', msg, 300, 200); //上传的文件必须是word
                return false;
            }
            var str = fileName.split("\\");
            if (str[str.length - 1].length >= 150) {
                var msg = '提示';
                alertMsg('<%= Chy.Web.Resource.GetString("文件名长度不能大于150个字符")%>', msg, 300, 200); //输入的文件名长度不能大于150个字符
                return false;
            }
            $("#a").hide();
            $("#b").show();
            return true;
        }

    </script>
</asp:Content>
