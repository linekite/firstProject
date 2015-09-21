<%@ Page  Language="C#" MasterPageFile="~/MainContent.Master" AutoEventWireup="true"
    CodeBehind="PhysiqueAdd.aspx.cs" Inherits="Chm.Web.Admin.Checkup.PhysiqueAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../../Scripts/MultiLineLength.js" type="text/javascript"></script>
    <script src="/Js/DatePicker/WdatePicker.js" type="text/javascript"></script> 
    <script type="text/javascript">
        function OpenClassSelect() {
            var url = "PhysiqueItemSelect.aspx";
            $("<div style='width:100%;height:800px' id='divchooseFrame'><iframe  scrolling='auto' width='100%' height='100%'  frameborder=0  id='ChooseFrame' src='" + url + "' /></div>").dialog({ autoOpen: true, width: 650, height: 580, showTitle: false, modal: true, title: '选择小项' });
        }

        function GetItemInfo(Item) {
            document.getElementById("<%=txtItemRecName.ClientID %>").value = Item.ItemName;
            document.getElementById("<%=txtItemID.ClientID %>").value = Item.ItemID;
            document.getElementById("<%=txtUnit.ClientID %>").value = Item.Unit;
            document.getElementById("<%=txtReUpper.ClientID %>").value = Item.reUpper;
            document.getElementById("<%=txtReLower.ClientID %>").value = Item.reLower;
            $('div').dialog('close');
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
    <div >
        <Chy:XTextBox ID="txtType" runat="server" Style="display: none">
        </Chy:XTextBox>
        <table border="0" cellspacing="0" cellpadding="0" class="formcontainer">
            <tr>
                <td class="warn">
                    <span class="red">*</span>
                </td>
                <td class="label">
                    <Chy:XLabel ID="lblItemRecName" runat="server"></Chy:XLabel>
                </td>
                <td class="input">
                    <span>
                        <Chy:XTextBox ID="txtItemRecName" MaxLength="32" runat="server" CssClass="inputtext"  AllowEmpty="false" ValidationGroup="DoctorValid" ValidType="String" ></Chy:XTextBox>
                        <img alt='<%= Chy.Web.Resource.GetString("HM_0428")%>' id="ImgItemName" src="/Images/search.gif" style="cursor: hand" onclick="OpenClassSelect()" />
                        <Chy:XTextBox ID="txtItemID" MaxLength="32" runat="server" CssClass="inputtext" AllowEmpty="false"  Style="display: none"></Chy:XTextBox>                        
                    </span>
                </td>
            </tr>
            <tr>
                <td class="warn">
                </td>
                <td class="label">
                    <Chy:XLabel ID="lblUnit" runat="server"></Chy:XLabel>
                </td>
                <td class="input">
                    <Chy:XTextBox ID="txtUnit" MaxLength="8" runat="server" CssClass="inputtext">
                    </Chy:XTextBox>
                </td>
            </tr>
            <tr>
                <td class="warn">
                    <span class="red">*</span>
                </td>
                <td class="label">
                    <Chy:XLabel ID="lblCheckUpTime" runat="server"></Chy:XLabel>
                </td>
                <td class="input">
                    <Chy:XDatePicker ID="dpCheckUpTime" runat="server" AllowEmpty="false"  ValidationGroup="DoctorValid">
                    </Chy:XDatePicker>
                </td>
            </tr>
            <tr>
                <td class="warn">
                    <span class="red">*</span>
                </td>
                <td class="label">
                    <Chy:XLabel ID="lblResult" runat="server"></Chy:XLabel>
                </td>
                <td class="input">
                    <Chy:XTextBox ID="txtResult" MaxLength="32" AllowEmpty="false" runat="server" CssClass="inputtext" ValidationGroup="DoctorValid">
                    </Chy:XTextBox>
                </td>
            </tr>
            <tr>
                <td class="warn">
                </td>
                <td class="label">
                    <Chy:XLabel ID="lblReUpper" runat="server"></Chy:XLabel>
                </td>
                <td class="input">
                    <Chy:XTextBox ID="txtReUpper" MaxLength="10" runat="server" CssClass="inputtext">
                    </Chy:XTextBox>
                </td>
            </tr>
            <tr>
                <td class="warn">
                </td>
                <td class="label">
                    <Chy:XLabel ID="lblReLower" runat="server"></Chy:XLabel>
                </td>
                <td class="input">
                    <Chy:XTextBox ID="txtReLower" MaxLength="10" runat="server" CssClass="inputtext">
                    </Chy:XTextBox>
                </td>
            </tr>
            <tr>
                <td class="warn">
                </td>
                <td class="label">
                    <Chy:XLabel ID="lblTips" runat="server"></Chy:XLabel>
                </td>
                <td class="input">
                    <Chy:XTextBox ID="txtTips" Rows="3" TextMode="MultiLine" MaxLen="512"
                        runat="server" CssClass="inputtext" >
                    </Chy:XTextBox>
                </td>
            </tr>
            <tr>
                <td class="warn">
                </td>
                <td class="label">
                    <Chy:XLabel ID="lblPatientName" runat="server"></Chy:XLabel>
                </td>
                <td class="input">
                    <Chy:XTextBox ID="txtPatientName" MaxLength="32" runat="server" CssClass="inputtext">
                    </Chy:XTextBox>
                </td>
            </tr>
             <tr>
                <td align="center" colspan="3">
                    <Chy:XButton ID="btnSave" runat="server" Text="保存" ValidationGroup="DoctorValid"
                        CssClass="button" OnClick="btnSave_Click" />
                    <span class="space"></span>
                    <Chy:XButton ID="btnCancel" runat="server" Text="返回" CssClass="button" CausesValidation="false"
                        OnClick="btnCancel_Click" />
                </td>
            </tr>
        </table>
        <table width="99%" border="0" cellspacing="0" cellpadding="0" align="center" class="formcontainer">
           
        </table>
    </div>
    <script type="text/javascript">
        window.onload = function () {
            if (document.getElementById("<%=txtType.ClientID %>").value != "Add") {
                document.getElementById("ImgItemName").style.display = "none";
            }
        } 
    </script>
</asp:Content>
