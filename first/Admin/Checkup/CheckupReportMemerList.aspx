<%@ Page Language="C#" MasterPageFile="~/AmMainContent.Master" AutoEventWireup="true"
    CodeBehind="CheckupReportMemerList.aspx.cs" Inherits="Chm.Web.Admin.Checkup.CheckupReportMemerList" %>

<%@ Register Assembly="Chy.UI.Controls" Namespace="Chy.UI.Controls" TagPrefix="Chy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/Js/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <style type="text/css">
        .hidden
        {
            display: none;
        }       
    </style>
    <script type="text/javascript">
        function locationLoad(url) {
            if (window.MessageEvent && !document.getBoxObjectFor) {alert(1);
                var hia = $("#hiddenA");
                hia.attr("src", url);
                hia[0].click();
            }
            else {
                window.open(url, '_blank', '');
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
    <div style="display:none">
    <a id='hiddenA' target="_blank"></a>
    <Chy:XLabel ID="lblHospital" runat="server" Visable="false" ></Chy:XLabel>
    <Chy:XTextBox ID="txtHospital" runat="server" class="inputtext" MaxLength="64" Visable="false"></Chy:XTextBox></div>
    <table width="99%" cellpadding="0" cellspacing="0" border="0" class="search_tab" align="center">
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" border="0">
                    <tr>                        
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
                <Chy:XButton ID="btnAdd" runat="server" Text="新增" CssClass="button" />
                <Chy:XButton ID="btnDelete" runat="server" Text="删除" CssClass="button" OnClick="btnDelete_Click"
                    Style="display: none;" />
                <input id="btnDeleteCheck" type="button" class="button" runat="server" value="删除" />
            </td>
        </tr>
    </table>
    <table width="99%" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td>
                <Chy:XGridView ID="gvReport" runat="server" CssClass="zebratable" AllowPaging="true"
                    DataKeyNames="checkRptID" AutoGenerateColumns="False" PagerSettings-PageButtonCount="8"
                    PageSize="10" Width="100%" OnBindCstm="gvReport_BindCstm" OnRowDataBound="gvReport_RowDataBound">
                    <Columns>
                        <asp:TemplateField  ItemStyle-Width="24px" HeaderStyle-Width="24px" >
                            <HeaderTemplate>
                                <input id="chkSelAll" type="checkbox" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSelItem" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="PatientName" HeaderText="姓名" HeaderStyle-CssClass="hidden"
                            ItemStyle-CssClass="hidden"></asp:BoundField>
                        <asp:TemplateField ShowHeader="true" HeaderText="体检日期">
                            <ItemTemplate>
                                <%# Convert.ToDateTime(Eval("CheckTime")).ToString("yyyy-MM-dd")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="hospital" HeaderText="医院名称" ></asp:BoundField>
                        <asp:BoundField DataField="doctor" HeaderText="总检医生" ></asp:BoundField>
                        <asp:TemplateField ShowHeader="true" HeaderText="查看">
                            <ItemTemplate> 
                                <asp:HyperLink ID="lbtnDetail" runat="server" Target="_blank">查看</asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="true" HeaderText="修改" ItemStyle-Width="55px" >
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnEdit" runat="server" CausesValidation="False" CommandName="itemEdit"
                                    CommandArgument='<%# Eval("checkRptID") %>' OnCommand="gvReport_Command" Text="修改"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="true" HeaderText="填写结果" ItemStyle-Width="75px" HeaderStyle-CssClass="hidden"
                            ItemStyle-CssClass="hidden">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtUpdate" runat="server" CausesValidation="False" CommandName="itemEditReport"
                                    CommandArgument='<%# Eval("checkRptID") %>' OnCommand="gvReport_Command" Text="填写"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="true" HeaderText="对比" ItemStyle-Width="55px">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnBalance" runat="server" CausesValidation="False" CommandName="itemBalance"
                                    CommandArgument='<%# Eval("checkRptID") %>' OnCommand="gvReport_Command" Text="对比"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </Chy:XGridView>
            </td>
        </tr>
    </table>
    <script type="text/javascript">
        $(document).ready(function () {
            var obj = parent.document.getElementById('main_iframe');
            if (obj != null) {
                obj.height = document.body.scrollHeight;
            }
            $("#<%=btnAdd.ClientID %>").click(
            function () {
                javascript: document.location.href = 'CheckupReportMemerAdd.aspx?Type=Add&rnt=' + Math.random();
                return false;
            });

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
                    if (confirmMsg('<%=btnDelete.UniqueID %>', '<%=Chy.Web.Resource.GetString("HM_ConfirmDel")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200)) {
                        document.getElementById("<%=btnDelete.ClientID %>").click();
                    }
                }
            });
        });

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
    </script>
</asp:Content>
