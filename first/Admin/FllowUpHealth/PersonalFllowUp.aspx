
<%@ Page Title="" Language="C#" MasterPageFile="~/MainContent.Master" AutoEventWireup="true" CodeBehind="PersonalFllowUp.aspx.cs" Inherits="Chm.Web.Admin.FllowUpHealth.PersonalFllowUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
<div class="m_center">
        <table width="100%" cellpadding="0" cellspacing="0" class="searchPanel" align="center">
            <tr>
                <td>
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="label"><asp:Label ID="lblStatus" runat="server" Text="随访状态:"></asp:Label></td>
                            <td class="input">
                              
                                <Chy:XDropDownList ID="rdbFllowup" runat="server" 
                                    OnSelectedIndexChanged="rdbFllowup_SelectedIndexChanged" >
                                    <asp:ListItem  Text="全部" Value="-1" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="未随访" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="已随访" Value="1"></asp:ListItem>
                                </Chy:XDropDownList>
                            </td>
                            <td class="label">
                                <asp:Label ID="lblFollowupType" Text="随访类别:" runat="server"></asp:Label>
                            </td>
                            <td class="input">
                                <Chy:XDropDownList runat="server" ID="ddlType">
                                    <asp:ListItem Text="全部" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="体检" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="住院" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="其它" Value="3"></asp:ListItem>
                                </Chy:XDropDownList>
                            </td>
                            <td><Chy:XButton ID="btnSearch" Text="查询" CssClass="button" runat="server" 
                                    onclick="btnSearch_Click" /></td>
                        </tr>
                    </table>
                </td>
                <td class="add">
                    <Chy:XButton ID="btnAdd" runat="server" Text="新增" OnClientClick="ShowDiv2();return false"/>
                </td>
            </tr>
        </table>
        <table width="99%" cellpadding="0" cellspacing="0" align="center">
            <tr>
                <td>
                    <Chy:XGridView ID="gvPersonalFllowUp" runat="server" CssClass="zebratable" AllowPaging="true"
                        AutoGenerateColumns="false" DataKeyNames="HealthFUID" PagerSettings-PageButtonCount="8"
                        PageSize="10" Width="100%">
                        <Columns>
                            <asp:TemplateField HeaderText="随访目的">
                                <ItemTemplate>
                                    <asp:Label ID="lblOrgnazation" runat="server" Text='<%# Eval("FollowAim") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="随访结果">
                                <ItemTemplate>
                                    <asp:Label ID="lblFollowResult" runat="server" Text='<%# Eval("FollowResult") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="计划随访日期">
                                <ItemTemplate>
                                    <%# Eval("PlanTime")==null? "": (Convert.ToDateTime(Eval("PlanTime")).ToString("yyyy-MM-dd"))%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="随访类别">
                                <ItemTemplate>
                                   <asp:Label ID="lblType" runat="server" Text='<%# GetFollowUpType(Eval("FLType")) %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="操作" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <a onclick='return GoFill(<%# Eval("PatientID") %>,<%# Eval("HealthFUID") %>,<%# Eval("Status") %>,<%# Eval("FLType") %>)'
                                        href='javascript:;'>
                                        <asp:Label ID="lblAction" runat="server" Text='<%# ActionShow(Eval("Status")) %>'></asp:Label></a>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </Chy:XGridView>
                </td>
            </tr>
        </table>
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
                    <input type="button" class="button" value="取消" onclick="CloseDiv()" />
                </td>
            </tr>
        </table>
    </div>
    <asp:HiddenField ID="hdfStatus" runat="server" />
    <asp:HiddenField ID="hdfType" runat="server" />
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

//            if ($("#<%=hdfStatus.ClientID %>").val() != "") {
//                var index = $("#<%=hdfStatus.ClientID %>").val();
//                //$("#<%=rdbFllowup.ClientID %> option")[index].selected = true;
//                $("#<%=rdbFllowup.ClientID %> option:selected").click();
//            }
//            $("#<%=hdfStatus.ClientID %>").val("");
        });

        function GoFill(_pi, id, status,type) {
            var param = id + '|' + _pi + '|' + status + "|1"+"|"+type;
            var url = '/hc/Admin/FllowUpHealth/PersonFllowupRecords.aspx?parms=' + escape(param);
            OpenWindow(url);
            return false;
        }

        function ShowDiv2() {
            var type = $("#<%=hdfType.ClientID %>").val();
            if (type == "") {
                $("#popDiv2").dialog("open");
            }
        }

        function SetValue() {
            var type = $("#<%=rblFollowupType.ClientID %> :radio:checked").val();
            if (type != "") {
                $("#popDiv2").dialog("close");
                var status=$("#<%=rdbFllowup.ClientID %> option:selected").val();
                var params= "0|" + <%= this.PatientId%> + "|0|0"+"|"+type;
                var url="../../Admin/FllowUpHealth/PersonFllowupRecords.aspx?parms="+escape(params);
                window.location.href = url;
            }
        }

        function CloseDiv() {
            $("#popDiv2").dialog("close");
        }
    </script>
</asp:Content>
