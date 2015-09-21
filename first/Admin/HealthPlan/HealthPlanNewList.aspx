<%@ Page Title="" Language="C#" MasterPageFile="~/MainContent.Master" AutoEventWireup="true"
    CodeBehind="HealthPlanNewList.aspx.cs" Inherits="Chm.Web.Admin.HealthPlan.HealthPlanNewList" %>

<%@ Import Namespace="Chy.UI.Framework" %>
<%@ Register TagPrefix="Chy" Namespace="Chy.UI.Controls" Assembly="Chy.UI.Controls" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/Js/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="../../Scripts/MultiLineLength.js" type="text/javascript"></script>
    <link href="/CSS/skin.css" rel="stylesheet" type="text/css" />
    <script language="javascript" type="text/javascript">

        //个人保健计划
        //检查结束时间
        function checkTime() {
            var StartTime = $.trim($("#<%=txtStartTime.ClientID %>").val());
            var EndTime = $.trim($("#<%=txtEndTime.ClientID %>").val());

            if (EndTime.length != 0 && StartTime.length != 0) {
                var dateSt = new Date(StartTime);
                var dateEd = new Date(EndTime);
                if (dateSt > dateEd) {
                    // alertMsg('结束时间不能大于开始时间', '系统提示', 400, 200, '');
                    alertMsg('<%=Chy.Web.Resource.GetString("HM_From_To_Time")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
                    return false;
                }
            }
            return true;
        }
        $(function () {

//            $(":header").text('保健计划制定');
            $('#btnAdd').click(function () {
                location.href = 'HealthPlanAdd.aspx?Type=Person&_pi=<%=MemberManager.SelectedId %>';
            });

            $("#chkSelAll").click(function () {
                $("#<%=gvCheckItem.ClientID %> tr:gt(0) :checkbox").not(":disabled").attr("checked", $(this).attr("checked"))
            });


            $('#<%=btnDelete.ClientID %>').click(function () {
                if ($('#<%=gvCheckItem.ClientID %> [type=checkbox]:checked').length < 1) {
                    alertMsg('<%=Chy.Web.Resource.GetString("HM_ChooseDel")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
                    // alertMsg('至少选择一条数据', '系统提示', 400, 200, '');
                    return false;
                }
                return confirmMsg('<%=btnDelete.UniqueID %>', '<%=Chy.Web.Resource.GetString("HM_ConfirmDel")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200);

            });
        });

        //公用保健计划
        //检查结束时间
        function checkTimeOrg() {
            var StartTime = $.trim($("#<%=txtStartTimeOrg.ClientID %>").val());
            var EndTime = $.trim($("#<%=txtEndTimeOrg.ClientID %>").val());

            if (EndTime.length != 0 && StartTime.length != 0) {
                var dateSt = new Date(StartTime);
                var dateEd = new Date(EndTime);
                if (dateSt > dateEd) {
                    // alertMsg('结束时间不能大于开始时间', '系统提示', 400, 200, '');
                    alertMsg('<%=Chy.Web.Resource.GetString("HM_From_To_Time")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
                    return false;
                }
            }
            return true;
        }
        $(function () {

            //            $(":header").text('保健计划制定');
            $('#btnAddOrg').click(function () {
                location.href = 'HealthPlanAdd.aspx?Type=Org&_pi=<%=MemberManager.SelectedId %>';
            });

            $("#chkSelAllOrg").click(function () {
                $("#<%=gvCheckItemOrg.ClientID %> tr:gt(0) :checkbox").not(":disabled").attr("checked", $(this).attr("checked"))
            });


            $('#<%=btnDeleteOrg.ClientID %>').click(function () {
                if ($('#<%=gvCheckItemOrg.ClientID %> [type=checkbox]:checked').length < 1) {
                    alertMsg('<%=Chy.Web.Resource.GetString("HM_ChooseDel")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
                    // alertMsg('至少选择一条数据', '系统提示', 400, 200, '');
                    return false;
                }
                return confirmMsg('<%=btnDeleteOrg.UniqueID %>', '<%=Chy.Web.Resource.GetString("HM_ConfirmDel")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200);

            });
        });    

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
  
  <%--个人保健计划 Start--%>
  <div class="h_corner">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
         <tr>
            <td class="p_c_tleft"><img src="/images/p_ico_5.gif" align="absmiddle" /> 个人保健计划</td>
            <td class="p_c_tcont">
                 <span class="left">共<label class="blue" id="personCount" runat="server">0</label>个，正在进行
                 <label class="blue"  id="personTodayCount" runat="server">0</label>个，将要进行
                 <label class="blue"  id="personNoCount" runat="server">0</label>个</span>
            </td>
            <td class="p_c_tright">&nbsp;</td>
          </tr>
    </table>

<table width="100%" cellspacing="0" cellpadding="0" border="0">

<tr>
<td class="p_c_cleft" width="7">&nbsp;</td>
<td class="p_c_ccont">
    <table width="99%" cellpadding="0" cellspacing="0" class="searchPanel" align="center"
        style="margin-bottom: 10px">
        <tr>
            <td width="45%">
                <table cellpadding="0" cellspacing="0" border="0">
                    <tr>
                       <td class="label">
                            会员姓名：
                        </td>
                        <td class="input">
                            <Chy:XTextBox ID="txtUserName"  runat="server" ></Chy:XTextBox>
                        </td>
                        <td class="label">
                            证件号：
                        </td>
                        <td class="input">
                            <Chy:XTextBox ID="txtCredNO"  runat="server" ></Chy:XTextBox>
                        </td>
                        <td class="label">
                            计划状态：
                        </td>
                        <td class="input">
                            <Chy:XDropDownList ID="ddlStatus" runat="server" Width="100">
                            </Chy:XDropDownList>
                        </td>
                        
                    </tr>
                </table>
            </td>
            <td class="input" width="35%">
                <Chy:XButton ID="btnSearch" runat="server" Text='查询' CssClass="button" OnClick="btnSearch_Click"
                    OnClientClick="return checkTime();" />
                    <input id="ipAdvancedSearch" type="button" class="button" value='高级查询' />
            </td>
            <td class="add" width="20%" style="text-align: center">
                <input type="button" class="addbutton" value="新增" id="btnAdd" />
                <span style="width: 3%">&nbsp;</span>
                <Chy:XButton ID="btnDelete" runat="server" Text='删除' CssClass="delbutton" OnClick="btnDelete_Click" />
            </td>
        </tr>
    </table>

            <Chy:XGridView ID="gvCheckItem" runat="server" CssClass="zebratable" AllowPaging="true"
                Width="99%" DataKeyNames="PlanID" AutoGenerateColumns="False" PagerSettings-PageButtonCount="8"
                PageSize="10" OnBindCstm="gvCheckItem_BindCstm" OnRowDataBound="gvCheckItem_RowDataBound"
                HorizontalAlign="Center">
                <Columns>
                    <asp:TemplateField HeaderStyle-CssClass="check" ItemStyle-Width="24px" ItemStyle-CssClass="check">
                        <HeaderTemplate>
                            <input id="chkSelAll" type="checkbox" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkSelItem" name='chk' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="true" HeaderText="会员姓名" ItemStyle-Width="100px">
                        <ItemTemplate>
                            <%#Eval("PatientName").ToString()%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="true" HeaderText="性别">
                        <ItemTemplate>
                            <%#(Convert.ToInt32(Eval("Sex")) == 1 ? "男" : "女") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="true" HeaderText="年龄">
                        <ItemTemplate>
                            <%# Eval("Birthday").ToString()%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="OrgName" ItemStyle-Width="150px" HeaderText="所属单位"></asp:BoundField>
                    <asp:TemplateField ShowHeader="true" ItemStyle-Width="150px" HeaderText="计划标题">
                        <ItemTemplate>
                            <%#Eval("Title").ToString().Length > 10 ? Eval("Title").ToString().Substring(0, 10) + "..." : Eval("Title").ToString()%>
                        </ItemTemplate>
                    </asp:TemplateField>
                  
                    <%--<asp:BoundField DataField="ReLower" HeaderText="年龄"></asp:BoundField>--%>
                    <asp:TemplateField ShowHeader="true" HeaderText="计划开始日期">
                        <ItemTemplate>
                            <%# Convert.ToDateTime(Eval("BeginTime")).ToString("yyyy-MM-dd")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="true" HeaderText="计划结束日期">
                        <ItemTemplate>
                            <%# Convert.ToDateTime(Eval("EndTime")).ToString("yyyy-MM-dd")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField ShowHeader="true" HeaderText="创建日期">
                        <ItemTemplate>
                            <%# Convert.ToDateTime(Eval("CreateTime")).ToString("yyyy-MM-dd")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="true" ItemStyle-Width="50px" HeaderText="查看">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnDetail" runat="server" CausesValidation="False" CommandName="itemDetail"
                                CommandArgument='<%# Eval("PlanID") %>' OnCommand="gvReport_Command" Text="查看"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="true" ItemStyle-Width="50px" HeaderText="修改">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnEdit" runat="server" CausesValidation="False" CommandName="itemEdit"
                                CommandArgument='<%# Eval("PlanID") %>' OnCommand="gvReport_Command" Text="修改"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </Chy:XGridView>
       

    <div id="advancedSearchDiv" title='<%=Chy.Web.Resource.GetString("Remp_divHeaderAdvQuery") %>'>
        <table cellpadding="0" cellspacing="0" class="searchPanel">
            <tr>
            <td class="label">
                    会员姓名：
                </td>
                <td class="input">
                    <Chy:XTextBox ID="txtUserName1" Width="130" runat="server" class="inputtext" ></Chy:XTextBox>
                </td>
                <td class="label">
                    证件号：
                </td>
                <td class="input">
                    <Chy:XTextBox ID="txtCredNO1" class="inputtext"  runat="server"  Width="130"></Chy:XTextBox>
                </td>
                
            </tr>
            <tr>
               <td class="label">
                    手机号码：
                </td>
                <td class="input">
                    <Chy:XTextBox ID="txtPhone" runat="server" Width="130" class="inputtext"></Chy:XTextBox>
                </td>
                <td class="label">
                    性别：
                </td>
                <td class="input">
                    <Chy:XDropDownList ID="ddlSex" runat="server" Width="130">
                    </Chy:XDropDownList>
                </td>
               
               
            </tr>
            <tr>
               <td class="label">
                    计划标题：
                </td>
                <td class="input" colspan="4">
                    <Chy:XTextBox ID="txtPlanTitle" runat="server" Width="330" class="inputtext"></Chy:XTextBox>
                </td>
                
            </tr>
            <tr>
                 <td class="label">
                    开始日期：
                </td>
                <td class="input">
                    <Chy:XDatePicker ID="txtStartTime" Width="130" runat="server" DateFmt="yyyy-MM-dd"></Chy:XDatePicker>
                </td>
                <td class="label">
                    结束日期：
                </td>
                <td class="input">
                    <Chy:XDatePicker ID="txtEndTime" Width="130" runat="server" DateFmt="yyyy-MM-dd"></Chy:XDatePicker>
                </td>
            </tr>
            <tr>
                <td class="input" colspan="4" style="text-align: center; ">
                    <input type="button" id="ipAdvQuery" class="button" value='<%=Chy.Globalization.RS.GetString("Remp_Search") %>' onclick="return checkTime();"/>
                    &nbsp;&nbsp;
                    <input type="button" id="ipClose" class="button" value='<%=Chy.Globalization.RS.GetString("Remp_Close") %>' />
                </td>
            </tr>
        </table>
    </div>
   
    <asp:Button ID="btnAdvQuery" runat="server" Text="高级查询" CssClass="button" Style="display: none;"
        OnClick="btnAdvQuery_Click" />
        </td>
<td class="p_c_cright" width="7">&nbsp;</td>
</tr>

</table>
<table width="100%" cellspacing="0" cellpadding="0" border="0">

<tr>
<td class="p_c_bleft" width="7" height="7">&nbsp;</td>
<td class="p_c_bcont">&nbsp;</td>
<td class="p_c_bright" width="7">&nbsp;</td>
</tr>

</table>
   </div>
   <%--个人保健计划 End--%>
   <%--公用保健计划 Start--%>
   <div class="h_corner">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
         <tr>
            <td class="p_c_tleft"><img src="/images/p_ico_6.gif" align="absmiddle" /> 公用保健计划</td>
            <td class="p_c_tcont">
                 <span class="left">共<label class="blue"  id="orgCount" runat="server">0</label>个，正在进行
                 <label class="blue"  id="orgTodayCount" runat="server">0</label>个，将要进行
                 <label class="blue"  id="orgNoCount" runat="server">0</label>个</span>
            </td>
            <td class="p_c_tright">&nbsp;</td>
          </tr>
    </table>
    <table width="100%" cellspacing="0" cellpadding="0" border="0">

<tr>
<td class="p_c_cleft" width="7">&nbsp;</td>
<td class="p_c_ccont">
   <table width="99%" cellpadding="0" cellspacing="0" class="searchPanel" align="center"
        style="margin-bottom: 10px">
        <tr>
            <td width="45%">
                <table cellpadding="0" cellspacing="0" border="0">
                    <tr>
                       <td class="label">
                            会员分组：
                        </td>
                        <td class="input">
                            <Chy:XTextBox ID="txtUserOrg"  runat="server" ></Chy:XTextBox>
                             
                             <input id="txtUserOrgID" runat="server" type="hidden" />
                        </td>
                        <td class="label">
                            疾病分组：
                        </td>
                        <td class="input">
                            <Chy:XTextBox ID="txtIllGroup"  runat="server" ></Chy:XTextBox>
                            <input id="txtIllGroupID" runat="server" type="hidden" />
                        </td>
                        <td class="label">
                            计划状态：
                        </td>
                        <td class="input">
                            <Chy:XDropDownList ID="ddlOrgStatus" runat="server" Width="100">
                            </Chy:XDropDownList>
                        </td>
                        
                    </tr>
                </table>
            </td>
            <td class="input" width="35%">
                <Chy:XButton ID="btnSearchOrg" runat="server" Text='查询' CssClass="button" OnClick="btnSearchOrg_Click"
                    />
                    <input id="ipAdvancedSearch1" type="button" class="button" value='高级查询' />
            </td>
            <td class="add" width="20%" style="text-align: center">
                <input type="button" class="addbutton" value="新增" id="btnAddOrg" />
                <span style="width: 3%">&nbsp;</span>
                <Chy:XButton ID="btnDeleteOrg" runat="server" Text='删除' CssClass="delbutton" OnClick="btnDeleteOrg_Click" />
            </td>
        </tr>
    </table>

            <Chy:XGridView ID="gvCheckItemOrg" runat="server" CssClass="zebratable" AllowPaging="true"
                Width="99%" DataKeyNames="PlanID" AutoGenerateColumns="False" PagerSettings-PageButtonCount="8"
                PageSize="10" OnBindCstm="gvCheckItemOrg_BindCstm" OnRowDataBound="gvCheckItemOrg_RowDataBound"
                HorizontalAlign="Center" Visible="true">
                <Columns>
                    <asp:TemplateField HeaderStyle-CssClass="check" ItemStyle-Width="24px" ItemStyle-CssClass="check">
                        <HeaderTemplate>
                            <input id="chkSelAllOrg" type="checkbox" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkSelItemOrg" name='chkOrg' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                  
                    <asp:TemplateField ShowHeader="true" ItemStyle-Width="150px" HeaderText="会员分组">
                        <ItemTemplate>
                            <%#Eval("OrgName").ToString().Length > 10 ? Eval("OrgName").ToString().Substring(0, 10) + "..." : Eval("OrgName").ToString()%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="GroupName " HeaderText="疾病分组"  ItemStyle-Width="100px"></asp:BoundField>
                    <asp:BoundField DataField="ServiceLevel " HeaderText="星级服务"></asp:BoundField>
                    <asp:BoundField DataField="UserCount  " HeaderText="人数"></asp:BoundField>
                   
                    <asp:TemplateField ShowHeader="true" ItemStyle-Width="150px" HeaderText="计划标题">
                        <ItemTemplate>
                            <%#Eval("Title").ToString().Length > 10 ? Eval("Title").ToString().Substring(0, 10) + "..." : Eval("Title").ToString()%>
                        </ItemTemplate>
                    </asp:TemplateField>
                  
                    <%--<asp:BoundField DataField="ReLower" HeaderText="年龄"></asp:BoundField>--%>
                    <asp:TemplateField ShowHeader="true" HeaderText="计划开始日期">
                        <ItemTemplate>
                            <%# Convert.ToDateTime(Eval("BeginTime")).ToString("yyyy-MM-dd")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="true" HeaderText="计划结束日期">
                        <ItemTemplate>
                            <%# Convert.ToDateTime(Eval("EndTime")).ToString("yyyy-MM-dd")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField ShowHeader="true" HeaderText="创建日期">
                        <ItemTemplate>
                            <%# Convert.ToDateTime(Eval("CreateTime")).ToString("yyyy-MM-dd")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="true" ItemStyle-Width="50px" HeaderText="查看">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnDetail" runat="server" CausesValidation="False" CommandName="itemDetail"
                                CommandArgument='<%# Eval("PlanID") %>' OnCommand="gvReportOrg_Command" Text="查看"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="true" ItemStyle-Width="50px" HeaderText="修改">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnEdit" runat="server" CausesValidation="False" CommandName="itemEdit"
                                CommandArgument='<%# Eval("PlanID") %>' OnCommand="gvReportOrg_Command" Text="修改"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </Chy:XGridView>


    <div id="advancedSearchDiv1" title='<%=Chy.Web.Resource.GetString("Remp_divHeaderAdvQuery") %>'>
        <table cellpadding="0" cellspacing="0" class="searchPanel">
            <tr>
            <td class="label">
                    会员分组：
                </td>
                <td class="input"  colspan="3">
                    <Chy:XTextBox ID="txtUserOrg1" Width="330" runat="server" class="inputtext" ></Chy:XTextBox>
                   
                    <input id="txtUserOrgID1" runat="server" type="hidden" />
                </td>
                
            </tr>
            <tr>
               <td class="label">
                    疾病分组：
                </td>
                <td class="input"  colspan="3">
                    <Chy:XTextBox ID="txtIllGroup1" runat="server" Width="330" class="inputtext"></Chy:XTextBox>
                     <input id="txtIllGroupID1" runat="server" type="hidden" />
                </td>
                
               
            </tr>
            <tr>
               <td class="label">
                    计划标题：
                </td>
                <td class="input" colspan="3">
                    <Chy:XTextBox ID="txtPlanTitleOrg" runat="server" Width="330" class="inputtext"></Chy:XTextBox>
                </td>
                
            </tr>
            <tr>
                 <td class="label">
                    开始日期：
                </td>
                <td class="input">
                    <Chy:XDatePicker ID="txtStartTimeOrg" Width="130" runat="server" DateFmt="yyyy-MM-dd"></Chy:XDatePicker>
                </td>
                <td class="label">
                    结束日期：
                </td>
                <td class="input">
                    <Chy:XDatePicker ID="txtEndTimeOrg" Width="130" runat="server" DateFmt="yyyy-MM-dd"></Chy:XDatePicker>
                </td>
            </tr>
            <tr>
                <td class="input" colspan="4" style="text-align: center; ">
                    <input type="button" id="ipAdvQuery1" class="button" value='<%=Chy.Globalization.RS.GetString("Remp_Search") %>' onclick="return checkTimeOrg();" />
                    &nbsp;&nbsp;
                    <input type="button" id="ipClose1" class="button" value='<%=Chy.Globalization.RS.GetString("Remp_Close") %>' />
                </td>
            </tr>
        </table>
    </div>
   
    <asp:Button ID="btnAdvQuery1" runat="server" Text="高级查询" CssClass="button" Style="display: none;"
        OnClick="btnAdvQuery1_Click" />
          </td>
<td class="p_c_cright" width="7">&nbsp;</td>
</tr>

</table>
<table width="100%" cellspacing="0" cellpadding="0" border="0">

<tr>
<td class="p_c_bleft" width="7" height="7">&nbsp;</td>
<td class="p_c_bcont">&nbsp;</td>
<td class="p_c_bright" width="7">&nbsp;</td>
</tr>

</table>
 </div>
  <%--公用保健计划 End--%>

    <script language="javascript" type="text/javascript">
        $(document).ready(function () {
           //个人保健计划
            $("#ipClose").click(function () { $("#advancedSearchDiv").dialog("close"); })

            $("#ipAdvancedSearch").click(function () {
                $("#advancedSearchDiv").dialog("open");
            });

            $("#advancedSearchDiv").dialog({
                bgiframe: true,
                draggable: false,
                autoOpen: false,
                modal: true,
                width: 450,
                autoHeight: true,
                closeOnEscape: false
            });

            $("#advancedSearchDiv").parent().appendTo($("form:first"));

            $("#popDivChoose").dialog({
                bgiframe: true,
                draggable: false,
                autoOpen: false,
                modal: true,
                width: 450,
                autoHeight: true,
                closeOnEscape: false
            });
            $("#ipAdvQuery").click(function () {
                $("#advancedSearchDiv").dialog("close");
                $("#<%=btnAdvQuery.ClientID%>").click();

            });

            //公用保健计划
            $("#ipClose1").click(function () { $("#advancedSearchDiv1").dialog("close"); })

            $("#ipAdvancedSearch1").click(function () {
                $("#advancedSearchDiv1").dialog("open");
            });

            $("#advancedSearchDiv1").dialog({
                bgiframe: true,
                draggable: false,
                autoOpen: false,
                modal: true,
                width: 450,
                autoHeight: true,
                closeOnEscape: false
            });

            $("#advancedSearchDiv1").parent().appendTo($("form:first"));

         
            $("#ipAdvQuery1").click(function () {
                $("#advancedSearchDiv1").dialog("close");
                $("#<%=btnAdvQuery1.ClientID%>").click();

            });
        })
    </script>

</asp:Content>
