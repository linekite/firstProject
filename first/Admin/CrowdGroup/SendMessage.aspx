<%@ Page Language="C#" MasterPageFile="~/MainContent.Master" AutoEventWireup="true"
    CodeBehind="SendMessage.aspx.cs" Inherits="Chm.Web.Admin.CrowdGroup.SendMessage1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .TemplateSelect
        {
            color: #095998;
            text-decoration: underline;
            cursor: hand;
        }
    </style>
    <script type="text/javascript" language="javascript">
           jQuery.validator.addMethod('CheckMsgContentLength',
        function (value, element) {
            var checkResult = true;
            var varContent = $.trim($("#<%=txtMsgContent.ClientID %>").val());
            varContent = varContent.replace(/\n/ig,"换行");
            if (varContent.length > 200 )
            {
                checkResult = false;
            }
            return checkResult;
        },
        '<%=Chy.Web.Resource.GetString("Remp_ContentMaxLength")%>'
        );

      $(document).ready(function(){ 
        var formid= $("form").first();
        $(formid).validate({
            errorElement:"em",
            rules:{            
                <%=txtMsgContent.UniqueID %>:{required:true,CheckHtml:true,CheckMsgContentLength:true}             
            },
            messages:{
                <%=txtMsgContent.UniqueID %>:{required:'<%=Chy.Web.Resource.GetString("Remp_NotNull")%>'}
            },
            errorPlacement:function(error,element){error.appendTo(element.parent());}
        });
    }); 

    </script>
    <script type="text/javascript" language="javascript">
        SelectSMSTemp = function () {
            xysShowModal('<%=Chy.Web.Resource.GetString("Remp_SelectTemplate")%>', '/Admin/SMS/SMSTempSelect.aspx', 650, 650);
        }
        SetContentVal = function () {
            $("#<%=txtMsgContent.ClientID %>").val($("#SelTmp").val());
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
    <table border="0" cellspacing="0" cellpadding="0" class="hdtab" width="98%" style="height: 30px;"
        align="center" runat="server" id="Table1">
        <tr>
            <td>
                <span class="red">*</span>
            </td>
            <td class="label">
                <Chy:XLabel ID="lblRecivePerson" runat="server" Text="接收人:"></Chy:XLabel>
            </td>
            <td class="input">
                <Chy:XTextBox runat="server" Style="width: 480px;" CssClass="inputtext" ID="txtRecivePerson"></Chy:XTextBox>
            </td>
        </tr>
        <tr>
            <td>
                <span></span>
            </td>
            <td class="label">
                <asp:Label ID="lblAppID" runat="server" Text="业务类型："></asp:Label>
            </td>
            <td class="input">
                <asp:DropDownList ID="ddlAppID" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <span></span>
            </td>
            <td class="label">
                <asp:Label ID="lblMsgType" runat="server" Text="消息类型："></asp:Label>
            </td>
            <td class="input">
                <asp:DropDownList ID="ddlMsgType" runat="server">
                </asp:DropDownList>
                <asp:DropDownList ID="hidddlMsgType" runat="server" Visible="false">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <span class="red">*</span>
            </td>
            <td class="label">
                <asp:Label ID="lblMsgContent" runat="server" Text="内容："></asp:Label>
            </td>
            <td class="input" colspan="3">
                <Chy:XTextBox ID="txtMsgContent" runat="server" Height="50" MaxLength="200" Width="440"
                    TextMode="MultiLine"></Chy:XTextBox>
                <a onclick="SelectSMSTemp()" class="TemplateSelect">
                    <%=Chy.Web.Resource.GetString("Remp_TemplateSelect")%></a>
            </td>
        </tr>
        <tr>
            <td align="center" class="hdtabSend" colspan="3">
                <asp:Button ID="btnSend" runat="server" Text="发送" class="button" OnClick="btnSend_Click" />
                <%--<asp:Button ID="btnBack" runat="server" Text="返回" class="button"  CausesValidation="False" />--%>
                <input id="btnBack" type="button" class="button" onclick="ReturnListPage()" value='返回' />
            </td>
        </tr>
    </table>
    <%-- <table border="0" cellspacing="0" cellpadding="0" class="hdtab" width="98%" align="center"
        runat="server" id="tabMsgList">
        <tr>
            <td>
                <div style="height: 200px; overflow: auto; border-bottom: none;" class="hddiv" runat="server"
                    id="divMsgList">
                    <Chy:XDataList ID="dstMsg" runat="server" Width="95%" AllowPaging="true" PageButtonCount="0"
                        PageSize="2" OnBindCstm="fnBindGrid">
                        <ItemTemplate>
                            <div class="inftablist">
                                <p class="tit">
                                    <b>
                                        <%# fnJoinFormToToShow(Eval("FromName").ToString(),Eval("ToName").ToString()) %></b>
                                    <span class="gray">
                                        <%# Convert.ToDateTime(Eval("SendTime")).ToString("yyyy-MM-dd HH:mm:ss") %></span>
                                    <%# fnJoinMsgTypeToShow(Eval("AppID").ToString(),Eval("MsgType").ToString()) %>
                                </p>
                                <table width="95%" style="table-layout: fixed;">
                                    <tr>
                                        <td style="word-wrap: break-word;">
                                            <p class="cont">
                                                <%# Eval("MsgContent").ToString().Replace(System.Environment.NewLine, "<br>") %>
                                            </p>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="inftablistline">
                            </div>
                        </ItemTemplate>
                        <FooterTemplate>
                            <table width="100%">
                                <tr>
                                    <td>
                                    </td>
                                </tr>
                            </table>
                        </FooterTemplate>
                    </Chy:XDataList>
                </div>
            </td>
        </tr>
    </table>--%>
    <input type="hidden" id="SelTmp" />
    <asp:HiddenField ID="hdnType" runat="server" />
    <input type="button" id="btnAssignment" onclick="javascript:SetContentVal()" style="display: none" />
    <script language="javascript" type="text/javascript">
        function ReturnListPage() {
            var type = document.getElementById("<%=hdnType.ClientID %>").value;
            if (type == "AbnormalCrow") {
                window.location.href('AbnormalCrow.aspx');
            } else if (type == "DiseasePrevalenceCrow") {
                window.location.href('DiseasePrevalenceCrow.aspx');
            } else if (type == "SettingGroup") {
                window.location.href('SettingGroup.aspx');
            }
        }
    </script>
</asp:Content>
