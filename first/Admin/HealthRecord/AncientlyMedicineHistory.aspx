<%@ Page Language="C#" MasterPageFile="~/MainContent.Master" AutoEventWireup="true"
    CodeBehind="AncientlyMedicineHistory.aspx.cs" Inherits="Chm.Web.Admin.HealthRecord.AncientlyMedicineHistory" %>

<%@ Register Assembly="Chy.UI.Controls" Namespace="Chy.UI.Controls" TagPrefix="Chy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .hidden
        {
            display: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
    <table width="100%" cellpadding="0" cellspacing="0" class="searchPanel" align="center">
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <td class="label" nowrap>
                            <Chy:XLabel ID="lblMedicineName" runat="server" Text="药物名称">
                            </Chy:XLabel>
                        </td>
                        <td nowrap>
                            <Chy:XTextBox ID="txtMedicineName" Width="120px" MaxLength="64" runat="server" class="inputtext">
                            </Chy:XTextBox>
                        </td>
                        <td class="label">
                            <Chy:XLabel ID="lblAdvanceStartTime" runat="server" Text="日期从" />
                        </td>
                        <td>
                            <Chy:XDatePicker Width="80px" runat="server" ID="xpStartBeginDate" />
                        </td>
                        <td class="label">
                            <Chy:XLabel ID="lblAdvanceEndTime" runat="server" Text="至" />
                        </td>
                        <td>
                            <Chy:XDatePicker Width="80px" runat="server" ID="xpEndBeginDate" />
                        </td>
                        <td class="input">
                            <Chy:XButton ID="btnSearch" runat="server" Text="查询" CssClass="button" OnClick="btnSearch_Click" />
                        </td>
                    </tr>
                </table>
            </td>
            <td class="add" nowrap>
                <input type="button" id="btnAdd" runat="server" class="addbutton" value="新增" onclick="btClick()" />
                <Chy:XButton ID="btnDelete" runat="server" Text="删除" CssClass="delbutton" OnClick="btnDelete_Click" />
            </td>
        </tr>
    </table>
    <table width="100%" cellpadding="0" cellspacing="0" align="center" nowrap>
        <tr>
            <td nowrap>
                <Chy:XGridView ID="gvMedicineHistory" runat="server" CssClass="zebratable" AllowPaging="True"
                    DataKeyNames="mhID" AutoGenerateColumns="False" PagerSettings-PageButtonCount="8"
                    PageSize="10" Width="100%" OnRowDataBound="gvMedicineHistory_RowDataBound">
                    <columns>
                        <asp:TemplateField HeaderStyle-CssClass="check" ItemStyle-Width="24px" ItemStyle-CssClass="check">
                            <HeaderTemplate>
                                <input type="checkbox" onclick="selectAll(this,'<%=gvMedicineHistory.ClientID %>')" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <input type="checkbox" name="chk" value='<%# Eval("mhID") %>' />
                            </ItemTemplate>
                            <HeaderStyle CssClass="check"></HeaderStyle>
                        </asp:TemplateField>
                        <asp:BoundField DataField="patientName" HeaderText="会员姓名" Visible="false"></asp:BoundField>
                        <asp:BoundField DataField="medicineName" HeaderText="药物名称" />
                        <asp:BoundField DataField="hospital" HeaderText="医院名称" />                        
                         <asp:TemplateField HeaderText="剂量">
                            <ItemTemplate>
                                <span  title='<%#Eval("Dose")%>' ><%#Eval("Dose").ToString().Length > 10 ? Eval("Dose").ToString().Substring(0, 10) + "..." : Eval("Dose").ToString()%></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="用药频率">
                            <ItemTemplate>
                                <span  title='<%#Eval("Frequency")%>' ><%#Eval("Frequency").ToString().Length > 10 ? Eval("Frequency").ToString().Substring(0, 10) + "..." : Eval("Frequency").ToString()%></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="用药时间">
                            <ItemTemplate>
                                <span  title='<%#Eval("MedicineTime")%>' ><%#Eval("MedicineTime").ToString().Length > 10 ? Eval("MedicineTime").ToString().Substring(0, 10) + "..." : Eval("MedicineTime").ToString()%></span>
                            </ItemTemplate>
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="Usage">
                            <ItemTemplate>
                                <span  title='<%#Eval("Usage")%>' ><%#Eval("Usage").ToString().Length > 10 ? Eval("Usage").ToString().Substring(0, 10) + "..." : Eval("Usage").ToString()%></span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="用药开始日期">
                            <ItemTemplate>
                                <%# Convert.ToDateTime(Eval("startTime")).ToString("yyyy-MM-dd") == "0001-01-01" ? "" : Convert.ToDateTime(Eval("startTime")).ToString("yyyy-MM-dd")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="用药结束日期">
                            <ItemTemplate>
                                <%# Convert.ToDateTime(Eval("endTime")).ToString("yyyy-MM-dd") == "0001-01-01" ? "" : Convert.ToDateTime(Eval("endTime")).ToString("yyyy-MM-dd")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="状态">
                            <ItemTemplate>
                                <Chy:XLabel ID="labIsAudit" Text='<%# ShowStatus(Eval("isAudit"))%>' runat="server"></Chy:XLabel>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtView" runat="server" CausesValidation="false" CommandName="itemView"
                                    CommandArgument='<%# Eval("mhID ") %>' OnCommand="gvMedicineHistory_Command"
                                    Text="" nowrap>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtUpdate" runat="server" CausesValidation="False" CommandName="itemEdit"
                                    CommandArgument='<%# Eval("mhID ") %>' OnCommand="gvMedicineHistory_Command"
                                    Text="" nowrap></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtAudit" runat="server" CausesValidation="false" CommandName="itemAudit"
                                    CommandArgument='<%# Eval("mhID ") %>' OnCommand="gvMedicineHistory_Command"
                                    Text="" nowrap></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </columns>
                </Chy:XGridView>
            </td>
        </tr>
    </table>
    <%--<div id="advancedSearchDiv">
        <table cellpadding="0" cellspacing="0" class="formcontainer">
            <tr>
                 <td nowrap>
                    <Chy:XLabel ID="lblAdvanceMedicineName" runat="server" Text="药物名称"  />
                </td>
                <td nowrap>
                    <Chy:XTextBox ID="txtAdvancemedicineName" MaxLength="64" runat="server"></Chy:XTextBox>
                </td>
                <td>
                    <Chy:XLabel ID="lblAdvanceHospital" runat="server" Text="医院名称"/>
                </td>
                <td>
                    <Chy:XTextBox ID="txtAdvancehospitalName" MaxLength="128" runat="server"></Chy:XTextBox>
                </td>
            </tr>
            <tr>
                <td nowrap>
                    <Chy:XLabel ID="lblAdvanceStartTime" runat="server" Text="用药开始日期"/>
                </td>
                <td nowrap>
                    <Chy:XDatePicker runat="server" ID="xpStartBeginDate" />
                </td>
                <td><Chy:XLabel ID="lblStartTo" runat="server" Text="至"/>
                </td>
                <td nowrap>
                    <Chy:XDatePicker runat="server" ID="xpStartEndDate" />
                </td>
            </tr>
            <tr>
                <td nowrap>
                    <Chy:XLabel ID="lblAdvanceEndTime" runat="server" Text="用药结束日期"/>
                </td>
                <td nowrap>
                    <Chy:XDatePicker runat="server" ID="xpEndBeginDate" />
                </td>
                <td><Chy:XLabel ID="lblEndTo" runat="server" Text="至"/></td>
                                <td nowrap>
                    <Chy:XDatePicker runat="server" ID="xpEndEndDate" />
                </td>
            </tr>
        </table>
        <table cellpadding="0" cellspacing="0" class="formcontainer">
            <tr>
                <td class="label" style="width: 95px">
                </td>
                <td class="buttons" colspan="2" style="text-align: center">
                    <input type="button" class="button" id="btnQuery" runat="server" value='查询'/>&nbsp;&nbsp;
                    <input id="btnClose" type="button" runat="server" class="button" value='关闭' />
                </td>
            </tr>
        </table>
    </div>
    <asp:Button ID="btnAdvancedSearchSubmit" runat="server" Style="display: none" OnClick="btnAdvancedSearchSubmit_Click" />--%>
    <script src="/Js/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">
        $(document).ready(function () {
            //删除提示
            $("#<%=btnDelete.ClientID %>").click(function () {
                var msg = '<%=Chy.Web.Resource.GetString("Remp_PleaseSelect")%>';
                var gridId = '<%=gvMedicineHistory.ClientID %>';
                if (checkIsSelected(gridId, msg)) {
                    return confirmMsg('<%=btnDelete.UniqueID%>', '<%=Chy.Web.Resource.GetString("Remp_ConfirmDelete") %>', '<%=Chy.Web.Resource.GetString("Remp_Notice") %>', 300, 140);
                }
                else {
                    return false;
                }
            });

            //查询检查
            $("#<%=btnSearch.ClientID %>").click(function () {
                if (checkTime() && CheckQueryText($("#<%=txtMedicineName.ClientID %>").val())) {
                    return true;
                }
                else {
                    return false;
                }
            });

            //检查结束时间
            function checkTime() {
                var StartTime = $.trim($("#<%=xpStartBeginDate.ClientID %>").val()).replace(/-/g, '/').split('/');
                var EndTime = $.trim($("#<%=xpEndBeginDate.ClientID %>").val()).replace(/-/g, '/').split('/');

                if (EndTime.length != 0 && StartTime.length != 0) {
                    var dateSt = new Date(StartTime[0], StartTime[1] - 1, StartTime[2]);
                    var dateEd = new Date(EndTime[0], EndTime[1] - 1, EndTime[2]);
                    if (dateSt > dateEd) {
                        alertMsg('<%=Chy.Web.Resource.GetString("HM_From_To_Time")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
                        return false;
                    }
                }
                return true;
            }
        });

        //审核提示
        function comfirmAudit(name) {
            return confirmMsg(name, '<%=Chy.Web.Resource.GetString("HM_ConfirmAuditForMedicine")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200);
        }

        function btClick() {
            document.location.href = "AncientlyMedicineHistoryEdit.aspx?_pi=<%=Chy.UI.Framework.MemberManager.SelectedId%>";
        }

    </script>
</asp:Content>
