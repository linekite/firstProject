<%@ Page Title="" Language="C#" MasterPageFile="~/MainContent.Master" AutoEventWireup="true" CodeBehind="ChooseInPatientInfo.aspx.cs" Inherits="Chm.Web.Admin.FllowUpHealth.ChooseInPatientInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
    <table width="99%" cellpadding="0" cellspacing="0" border="0">
        <tr>
            <td>
                <Chy:XGridView runat="server" PageSize="8" ID="gvInPatientRecordList" AutoGenerateColumns="false"
                    CssClass="zebratable" AllowPaging="true" PagerSettings-PageButtonCount="5" DataKeyNames=""
                    Width="100%">
                    <Columns>
                        <asp:TemplateField ItemStyle-Width="24px" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                            <HeaderTemplate>
                                选择
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:RadioButton ID="rbtSelItem" GroupName="SelItem" runat="server" onclick="Select(this)" />
                                <span style="display: none"><%# Eval("PatientId")%></span> 
                                <span style="display: none"><%# Eval("cishu")%></span> 
                                <span style="display: none"><%# Eval("InPatientNo")%></span>
                                <span style="display: none"><%# GetAge(Eval("PatientId"))%></span>
                                <span style="display: none"><%# GetSex(Eval("PatientId"))%></span>
                                <span style="display: none"><%#Eval("OutDepartment")%></span>
                                <span style="display: none"><%#Eval("EndTime")%></span>
                                <span style="display: none"><%#Eval("zyzdjbmc")%></span>
                                <span style="display: none"><%#Eval("fszdjbmc")%></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="病案号">
                            <ItemTemplate>
                                <asp:Label ID="lbl" runat="server" Text='<%# Eval("InPatientNo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="住院次数">
                            <ItemTemplate>
                                <asp:Label ID="lblCount" runat="server" Text='<%# Eval("cishu") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="出院科别">
                            <ItemTemplate>
                                <asp:Label ID="lblOutDepartment" runat="server" Text='<%# Eval("OutDepartment") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="出院日期">
                            <ItemTemplate>
                                <asp:Label ID="lblOutTime" runat="server" Text='<%# Eval("EndTime") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="主要诊断疾病名称">
                            <ItemTemplate>
                                <asp:Label ID="lblMainDiagnosisDisName" runat="server" Text='<%# Eval("zyzdjbmc") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="其他诊断疾病名称">
                            <ItemTemplate>
                                <asp:Label ID="lblOtherDiagnosisDisName" runat="server" Text='<%# Eval("fszdjbmc") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </Chy:XGridView>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Button ID="btnSet" runat="server" CssClass="button" OnClientClick="returnValue();"
                    Text="确定"/>
                <%--<input type="button" class="button" id="btnReturn" onclick="returnValue();" value="确定" />--%>
                <input type="button" class="button" id="Button1" value="取消" onclick="parent.$('div').dialog('close');" />
            </td>
        </tr>
    </table>
        <asp:HiddenField ID="hdfPatientNo" runat="server" />
    <asp:HiddenField ID="hdfCount" runat="server" />
        <asp:HiddenField ID="hdfAge" runat="server" />
    <asp:HiddenField ID="hdfSex" runat="server" />
    <script type="text/javascript" language="javascript">
        function returnValue() {
            var spans = $(":radio:checked").siblings("span");
            var Items = {
                Count: $(spans[1]).text(),
                PatientNo: $(spans[2]).text(),
                Age: $(spans[3]).text(),
                Sex: $(spans[4]).text(),
                OutDepartment: $(spans[5]).text(),
                EndTime: $(spans[6]).text(),
                zyzdjbmc: $(spans[7]).text(),
                fszdjbmc: $(spans[8]).text()
            }
            parent.GetInfo(Items);
            parent.CloseDialg();
        }

        function Select(o) {
            var gv = document.getElementById("<%=gvInPatientRecordList.ClientID %>");
            var Inputs = gv.getElementsByTagName("input");
            for (i = 0; i < Inputs.length; i++) {
                if (Inputs.item(i).type == "radio") {
                    Inputs.item(i).checked = false;
                }
            }
            o.checked = true;
        }
    </script>
</asp:Content>
