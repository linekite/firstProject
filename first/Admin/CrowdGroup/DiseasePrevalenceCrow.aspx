<%@ Page  Language="C#" MasterPageFile="~/MainContent.Master" AutoEventWireup="true" CodeBehind="DiseasePrevalenceCrow.aspx.cs" Inherits="Chm.Web.Admin.CrowdGroup.DiseasePrevalenceCrow" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .hidden{display:none;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
     <table width="99%" cellpadding="0" cellspacing="0" class="searchPanel" align="center">
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <td class="label" nowrap>
                            <Chy:XLabel ID="lblPersonRang" runat="server" Text=""></Chy:XLabel>
                        </td>
                        <td nowrap>
                            <Chy:XDropDownList ID="ddlPersonRange" Width="160px" runat="server" CssClass="secltwidth"></Chy:XDropDownList>
                        </td>
                         <td class="label" nowrap>
                            <Chy:XLabel ID="lblMedicineName" runat="server" Text="" />
                        </td>
                        <td>
                            <Chy:XTextBox ID="txtillName" runat="server" class="inputtext" MaxLength="32"></Chy:XTextBox>
                             &nbsp;<img alt='<%# Chy.Web.Resource.GetString("HM_0385")%>' runat="server"
                                    id="ImgClassName" src="/Images/search.gif" style="cursor: hand" onclick="OpenClassSelect();" /></span>
                        </td>
                        <td class="input" nowrap>
                            <Chy:XButton ID="btnSearch" runat="server" Text="" CssClass="button" OnClick="btnSearch_Click" />
                        </td>
                    </tr>
                </table>
            </td>
            <td class="add" nowrap >
             <Chy:XButton ID="btnSelectAll" runat="server" Text="" CssClass="button" 
                    onclick="btnSelectAll_Click" />&nbsp;
                <Chy:XButton ID="btnSendSMS" runat="server" Text="" CssClass="button" 
                    onclick="btnSendSMS_Click"  />
                <Chy:XButton ID="btnSendMessage" runat="server" Text="" CssClass="button" 
                    onclick="btnSendMessage_Click"  />
                <Chy:XButton ID="btnExport" runat="server" Text="" CssClass="button" 
                    onclick="btnExport_Click"  />
            </td>
        </tr>
    </table>
    <table width="99%" cellpadding="0" cellspacing="0" align="center" nowrap>
        <tr>
            <td nowrap>                
                <Chy:XGridView ID="gvDiseasePrevalenceCrow" runat="server" 
                    CssClass="zebratable" AllowPaging="true" 
                    DataKeyNames="CheckRptID" AutoGenerateColumns="False" PagerSettings-PageButtonCount="8"
                    PageSize="10" Width="100%" onrowdatabound="gvDiseasePrevalenceCrow_RowDataBound" >
                    <Columns>
                        <asp:TemplateField HeaderStyle-CssClass="check" ItemStyle-Width="24px" ItemStyle-CssClass="check">
                            <HeaderTemplate>
                            <asp:CheckBox ID="chkSelAll" runat="server" onclick="SelectAllBox(this,'chkSelItem')"/>
                            </HeaderTemplate>
                            <ItemTemplate>
                            <asp:CheckBox ID="chkSelItem" runat="server" onclick="CheckOne(this)"/>
                            </ItemTemplate>
                            <HeaderStyle CssClass="check"></HeaderStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <Chy:XLabel ID="PatientName" runat="server" Text="" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="" ItemStyle-Width="120px">
                            <ItemTemplate>
                                <Chy:XLabel ID="lblUserSex" runat="server" Text="" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText=""  ItemStyle-Width="55px" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
                            <ItemTemplate>
                                <Chy:XLabel ID="lblUserAge" runat="server" Text="" />
                            </ItemTemplate>
                        </asp:TemplateField>  
                        <asp:TemplateField HeaderText="" ItemStyle-Width="120px">
                            <ItemTemplate>
                                <a id='TpNo' href='../Checkup/CheckUpReportPrint.aspx?RPT=K&Type=Detail&CheckRepID=<%# Eval("CheckRptID")%>'  title=''  target='_blank'><%# Eval("CheckRptNO")%></a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Label ID="lblOrgName" Text='<%# Eval("OrgName") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="" ItemStyle-Width="120px">
                            <ItemTemplate>
                                <Chy:XLabel ID="lblUserPhone" runat="server" Text="" />
                            </ItemTemplate>
                        </asp:TemplateField>  
                        <asp:TemplateField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
                            <ItemTemplate>
                                <asp:Label ID="PatientID" runat="server" Text='<%# Eval("PatientID") %>' ></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
                            <ItemTemplate>
                                <asp:Label ID="lblCheckupReportNo" runat="server" Text='<%# Eval("CheckRptNO") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </Chy:XGridView>
            </td>
        </tr>
    </table>
    <asp:HiddenField ID="hdnSelectAll" runat="server" Value="false" />
    <script type="text/javascript">
        function OpenClassSelect() {
            var url = "Selectillnesses.aspx";
            $("<div style='width:100%;height:300px' id='divchooseFrame'><iframe  scrolling='auto' width='100%' height='100%'  frameborder=0  id='ChooseFrame' src='" + url + "' /></div>").dialog({ autoOpen: true, width: 660, height: 550, showTitle: false, modal: true, title: '<%= Chy.Web.Resource.GetString("HM_0385") %>' });
        }

        function SelectAllBox(chbChooseAll, chkChooseID) {
            var o = document.getElementsByTagName("Input");
            for (i = 0; i < o.length; i++) {
                if (o.item(i).type == "checkbox" && o.item(i).name.indexOf(chkChooseID) > 0) {
                    if (chbChooseAll.checked) {
                        o.item(i).checked = true;
                        o.item(i).parentNode.parentNode.parentNode.className = "GridViewItem";
                    }
                    else {
                        o.item(i).checked = false;
                        o.item(i).parentNode.parentNode.parentNode.className = "dataGridItem";
                    }
                }
            }
            document.getElementById("<%=hdnSelectAll.ClientID %>").value = "false";
        }

        function CheckOne(chkChooseID) {
            if (chkChooseID.checked == false) {
                $("#<%=gvDiseasePrevalenceCrow.ClientID %> tr :checkbox[id*='chkSelAll']")[0].checked = false;
                document.getElementById("<%=hdnSelectAll.ClientID %>").value = "false";
                return;
            } else {
                var o = $("#<%=gvDiseasePrevalenceCrow.ClientID %> tr:gt(0) :checkbox");
                for (i = 0; i < o.length; i++) {
                    if (o[i].checked == false) {
                        $("#<%=gvDiseasePrevalenceCrow.ClientID %> :checkbox[id*='chkSelAll']")[0].checked = false;
                        document.getElementById("<%=hdnSelectAll.ClientID %>").value = "false";
                        return;
                    }
                }
            }
            $("#<%=gvDiseasePrevalenceCrow.ClientID %> tr :checkbox[id*='chkSelAll']")[0].checked = true;
            document.getElementById("<%=hdnSelectAll.ClientID %>").value = "false";
        }


        function setValue(obj) {
            $("#<%=txtillName.ClientID %>").val(obj);
            $('div').dialog('close');
        }

    </script>
</asp:Content>
