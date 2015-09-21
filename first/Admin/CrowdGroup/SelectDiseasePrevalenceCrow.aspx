<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelectDiseasePrevalenceCrow.aspx.cs" Inherits="Chm.Web.Admin.CrowdGroup.SelectDiseasePrevalenceCrow" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="/CSS/main.css" rel="stylesheet" type="text/css" />
    <link type="text/css" rel="Stylesheet" href="/CSS/common.css" />
    <link type="text/css" rel="Stylesheet" href="/CSS/control.css" />
    <link type="text/css" rel="Stylesheet" href="/CSS/jquery-ui-1.8.11.custom.css" />
    <script src="/Js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="/Js/sdmenu.js" type="text/javascript"></script>
    <script src="/Js/jquery-ui-1.8.11.custom.min.js" type="text/javascript"></script>
    <script src="/Js/jquery.bgiframe.js" type="text/javascript"></script>
    <script src="/Js/common-<%=System.Threading.Thread.CurrentThread.CurrentUICulture.Name %>.js"
        type="text/javascript"></script>
    <script src="/Js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="/Js/jquery.metadata.js" type="text/javascript"></script>
      <style type="text/css">
        .hidden{display:none;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
         <table width="99%" cellpadding="0" cellspacing="0" class="searchPanel" align="center">
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <td class="label" nowrap>
                            <Chy:XLabel ID="lblPersonRang" runat="server" Text="人员范围"></Chy:XLabel>
                        </td>
                        <td nowrap>
                            <Chy:XDropDownList ID="ddlPersonRange" Width="250px" runat="server" CssClass="secltwidth"></Chy:XDropDownList>
                        </td>
                         <td class="label" nowrap>
                            <Chy:XLabel ID="lblMedicineName" runat="server" Text="疾病名称" />
                        </td>
                        <td>
                            <Chy:XTextBox ID="txtillName" runat="server" class="inputtext" MaxLength="32"></Chy:XTextBox>
                             &nbsp;<img alt='<%# Chy.Web.Resource.GetString("HM_0385")%>' runat="server"
                                    id="ImgClassName" src="/Images/search.gif" style="cursor: hand" onclick="OpenClassSelect();" /></span>
                        </td>
                        <td class="input" nowrap>
                            <Chy:XButton ID="btnSearch" runat="server" Text="查询" CssClass="button" OnClick="btnSearch_Click" />
                        </td>
                    </tr>
                </table>
            </td>
           <%-- <td class="add" nowrap >
                <Chy:XButton ID="btnSendSMS" runat="server" Text="发送短信" CssClass="button" 
                    onclick="btnSendSMS_Click"  />
                <Chy:XButton ID="btnSendMessage" runat="server" Text="发送消息" CssClass="button" 
                    onclick="btnSendMessage_Click"  />
                <Chy:XButton ID="btnExport" runat="server" Text="导出" CssClass="button" 
                    onclick="btnExport_Click"  />
            </td>--%>
        </tr>
    </table>
    <table width="99%" cellpadding="0" cellspacing="0" align="center" nowrap>
        <tr>
            <td nowrap>                
                <Chy:XGridView ID="gvDiseasePrevalenceCrow" runat="server" 
                    CssClass="zebratable" AllowPaging="true" 
                    DataKeyNames="CheckRptID" AutoGenerateColumns="False" PagerSettings-PageButtonCount="8"
                    PageSize="6" Width="100%" onrowdatabound="gvDiseasePrevalenceCrow_RowDataBound" >
                    <Columns>
                        <asp:TemplateField HeaderStyle-CssClass="check" ItemStyle-Width="24px" ItemStyle-CssClass="check">
                            <HeaderTemplate>
                                <input type="checkbox" id="chkSelAll" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox id="chkSelItem" runat="server"/>
                            </ItemTemplate>
                            <HeaderStyle CssClass="check"></HeaderStyle>
                        </asp:TemplateField>
                        <asp:BoundField DataField="OrgName" HeaderText="监护单位" />
                        <asp:BoundField DataField="PatientName" HeaderText="会员姓名" />
                        <asp:TemplateField HeaderText="性别" ItemStyle-Width="120px" >
                            <ItemTemplate>
                                <Chy:XLabel ID="lblUserSex" runat="server" Text="" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="年龄" ItemStyle-Width="55px" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
                            <ItemTemplate>
                                <Chy:XLabel ID="lblUserAge" runat="server" Text="" />
                            </ItemTemplate>
                        </asp:TemplateField> 
                        <asp:TemplateField HeaderText="联系电话" ItemStyle-Width="120px">
                            <ItemTemplate>
                                <Chy:XLabel ID="lblUserPhone" runat="server" Text="" />
                            </ItemTemplate>
                        </asp:TemplateField>   
                        <asp:TemplateField HeaderText="体检编号" ItemStyle-Width="120px">
                            <ItemTemplate>
                                 <a id='TpNo' href='../Checkup/CheckUpReportPrint.aspx?RPT=K&Type=Detail&CheckRepID=<%# Eval("CheckRptID")%>'  title=''  target='_blank'><%# Eval("CheckRptNO")%></a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        
                        <asp:TemplateField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
                            <ItemTemplate>
                                <asp:Label ID ="lblCheckupReportId" runat="server" Text='<%# Eval("CheckRptID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
                            <ItemTemplate>
                                <asp:Label ID="lblPatientId" runat="server" Text='<%# Eval("PatientID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </Chy:XGridView>
            </td>
        </tr>
        <tr align="center">
            <td>
                <Chy:XButton ID="btnSubmit" runat="server" Text="确定" CssClass="button" OnClientClick="back()" />&nbsp;
               <%-- <Chy:XButton ID="btnReturn" runat="server" Text="返回" CssClass="button" />--%>
               <input id="btnReturn" type="button" class="button" value='返回' onclick="parent.$('div').dialog('close');"/>
            </td> 
        </tr>
    </table>
    <script type="text/javascript">
        function OpenClassSelect() {
            var url = "Selectillnesses.aspx";
            $("<div style='width:100%;height:550px' id='divchooseFrame'><iframe  scrolling='auto' width='100%' height='100%'  frameborder=0  id='ChooseFrame' src='" + url + "' /></div>").dialog({ autoOpen: true, width: 660, height:550, showTitle: false, modal: true, title: '<%= Chy.Web.Resource.GetString("HM_0385") %>' });
        }


        function back() {
            var s = "["
            $("#<%=gvDiseasePrevalenceCrow.ClientID %>").find("tr:gt(0)").each(function () {
                if ($(":checkbox", this).attr("checked")) {
                    s = s + "{\"Name\":" + "\"" + $(this).children("td").eq(2).text() + "\"" + ",\"Sex\":" + "\"" + $(this).children("td").eq(3).text() + "\"" + ",\"CheckupListNo\":" + "\"" + $(this).children("td").eq(6).text() + "\"" + ",\"DepartMent\":" + "\"" + $(this).children("td").eq(1).text() + "\"" + ",\"Phone\":" + "\"" + $(this).children("td").eq(5).text() + "\"" + ",\"CheckupReportId\":" + "\"" + $(this).children("td").eq(7).text() +"\""+",\"PatientNo\":"+"\""+$(this).children("td").eq(8).text()+"\"},";
                }
            });
            s = s.replace(/,*$/g, "");
            s = s + "]";
            try {
                parent.SetCheckupItem(s);
            }
            catch (err) {

            }
        }


        function setValue(obj) {
            $("#<%=txtillName.ClientID %>").val(obj);
            $('div').dialog('close');
        }
        $("#chkSelAll").click(function () {
            $("#<%=gvDiseasePrevalenceCrow.ClientID %> tr:gt(0) :checkbox").not(":disabled").attr("checked", $(this).attr("checked"))
        });
    </script>
    </form>
</body>
</html>
