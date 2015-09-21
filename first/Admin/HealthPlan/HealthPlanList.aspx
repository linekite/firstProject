<%@ Page Title="" Language="C#" MasterPageFile="~/MainContent.Master" AutoEventWireup="true"
    CodeBehind="HealthPlanList.aspx.cs" Inherits="Chm.Web.Admin.HealthPlan.HealthPlanList" %>

<%@ Import Namespace="Chy.UI.Framework" %>
<%@ Register TagPrefix="Chy" Namespace="Chy.UI.Controls" Assembly="Chy.UI.Controls" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/Js/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="../../Scripts/MultiLineLength.js" type="text/javascript"></script>
    <link href="/CSS/skin.css" rel="stylesheet" type="text/css" />
    <script language="javascript" type="text/javascript">

        var day = 1000 * 60 * 60 * 24;
        var dateNow = new Date();
        var CheckTime = dateNow.getHours() + ":" + dateNow.getMinutes();
        function ValidTime(firstdate, seconddate) {
            //验证时间
            var StartTime = $.trim(firstdate).replace(/-/g, '/').split('/');
            var EndTime = $.trim(seconddate).replace(/-/g, '/').split('/');
            if (EndTime.length != 0 && StartTime.length != 0) {
                var dateSt = new Date(StartTime[0], StartTime[1] - 1, StartTime[2]);
                var dateEd = new Date(EndTime[0], EndTime[1] - 1, EndTime[2]);
                if (dateSt > dateEd) {
                    return false;
                }
            }
            return true;
        }

        $(function () {

            //            $(":header").text('保健计划制定');
            $('#btnAdd').click(function () {
                location.href = 'HealthPlanAdd.aspx?Mode=0&HMResource=tagContent0&_pi=<%=MemberManager.SelectedId %>';
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
          
            var advStartTime = $.trim($("#<%=txtStartTimeOrg.ClientID %>").val());
            var advEndTime = $.trim($("#<%=txtEndTimeOrg.ClientID %>").val());

            if (ValidTime(advStartTime, advEndTime) == false) {       
               
                // alertMsg('结束时间不能大于开始时间', '系统提示', 400, 200, '');
                alertMsg('<%=Chy.Web.Resource.GetString("HM_From_To_Time")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
                return false;
                
            }
            return true;
        }
        $(function () {

            //            $(":header").text('保健计划制定');
            $('#btnAddOrg').click(function () {
                location.href = 'HealthPlanAdd.aspx?Mode=1&HMResource=tagContent1&_pi=<%=MemberManager.SelectedId %>';
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

        function selectTag(showContent, selfObj) {
            // 操作标签
            var tag = document.getElementById("tags").getElementsByTagName("li");
            var taglength = tag.length;
            for (i = 0; i < taglength; i++) {
                tag[i].className = "";
            }
            selfObj.parentNode.className = "selectTag";
            // 操作内容
            for (i = 0; j = document.getElementById("tagContent" + i); i++) {
                j.style.display = "none";
            }
            document.getElementById(showContent).style.display = "block";

            $("#<%=clickType.ClientID %>").val(showContent);
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
  
  <div style=" margin-left:5px">
    <ul id="tags" class="tags">
        <li class="selectTag"><a id="MessagePlan" onclick="selectTag('tagContent0',this);return false;"
            href="javascript:void(0)">个人保健计划</a> </li>
        <li><a id="EmailPlan" onclick="selectTag('tagContent1',this);return false;" href="javascript:void(0)">
            公用保健计划</a> </li>
    </ul>
    <asp:HiddenField runat="server" ID="clickType" Value="tagContent0" />
    <div id="tagContent">

  <%--个人保健计划 Start--%>
  <div class="tagContent selectTag" id="tagContent0">


    <table width="99%" cellpadding="0" cellspacing="0" class="searchPanel" align="center"
        style="margin-bottom: 10px">
        <tr>
            <td width="43%">
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
                            <Chy:XDropDownList ID="ddlStatus" runat="server" Width="75">
                            </Chy:XDropDownList>
                        </td>
                        
                    </tr>
                </table>
            </td>
            <td class="input" style="text-align:left">
                <Chy:XButton ID="btnSearch" runat="server" Text='查询' CssClass="button" OnClick="btnSearch_Click"/>
                    <input id="ipAdvancedSearch" type="button" class="gj_button" value='高级查询' />
            </td>
            <td class="add" style="text-align:right">
                <input type="button" class="addbutton" value="新增" id="btnAdd" style=" display:none" />
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
                             <%#Eval("PatientName").ToString().Length > 14 ? Eval("PatientName").ToString().Substring(0, 14) + "..." : Eval("PatientName").ToString()%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="true" HeaderText="性别" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="lblSex" runat="server" Text='<%# ShowSex(Eval("PatientSex")) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="true" HeaderText="年龄">
                        <ItemTemplate>
                            <asp:Label ID="lblPatientNo" runat="server" Text='<%# GetAge(Eval("Birthday")) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="OrgName" ItemStyle-Width="130px" HeaderText="所属单位" Visible="false"></asp:BoundField>
                    <asp:TemplateField ShowHeader="true" ItemStyle-Width="130px" HeaderText="计划标题">
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
                    <asp:BoundField DataField="OrgName" HeaderText="创建人"></asp:BoundField>
                    <asp:TemplateField ShowHeader="true" ItemStyle-Width="40px" HeaderText="查看">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnDetail" runat="server" CausesValidation="False" CommandName="itemDetail"
                                CommandArgument='<%# Eval("PlanID") %>' OnCommand="gvReport_Command" Text="查看"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="true" ItemStyle-Width="40px" HeaderText="修改">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnEdit" runat="server" CausesValidation="False" CommandName="itemEdit"
                                CommandArgument='<%# Eval("PlanID") %>' OnCommand="gvReport_Command" Text="修改"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </Chy:XGridView>
       

    <div id="advancedSearchDiv" title='<%=Chy.Web.Resource.GetString("Remp_divHeaderAdvQuery") %>'  style=" display:none;">
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
                    <input type="button" id="ipAdvQuery" class="button" value='<%=Chy.Globalization.RS.GetString("Remp_Search") %>'/>
                    &nbsp;&nbsp;
                    <input type="button" id="ipClose" class="button" value='<%=Chy.Globalization.RS.GetString("Remp_Close") %>' />
                </td>
            </tr>
        </table>
    </div>
   
    <asp:Button ID="btnAdvQuery" runat="server" Text="高级查询" CssClass="button" Style="display: none;" OnClick="btnAdvQuery_Click"  />


   </div>
   <%--个人保健计划 End--%>
   <%--公用保健计划 Start--%>
   <div class="tagContent" id="tagContent1">

   <table width="99%" cellpadding="0" cellspacing="0" class="searchPanel" align="center"
        style="margin-bottom: 10px">
        <tr>
            <td width="43%">
                <table cellpadding="0" cellspacing="0" border="0">
                    <tr>
                 <%--    <td class="label">类别：</td>
					  <td class="input" >
                         <select id="SelMode"  Width="70">
                           <option value="0">全部</option>
                           <option value="1">体检</option>
                           <option value="2">住院</option>
                         </select>
                       </td>--%>
                       <td class="label">
                            会员分组：
                        </td>
                        <td class="input" nowrap>
                          <%--<div class="hy_jb">--%>
                           <Chy:XTextBox ID="txtUserOrg"  runat="server" ></Chy:XTextBox>
                           
                                            <img alt="请选择会员分组" id="ImgItemName" src="../../Image/search.png"
                                style="cursor: hand" onclick="OpenDialgFromOrg('0');" title="请选择会员分组"/>
                                 <input id="txtUserOrgID" runat="server" type="hidden" />
                           
                         <%-- </div>--%>
                        </td>
                        <td class="label">
                            疾病分组：
                        </td>
                        <td class="input" nowrap>
                         <%--<div class="hy_jb">--%>
                            <Chy:XTextBox ID="txtIllGroup"  runat="server" ></Chy:XTextBox>
                             <%-- <div class="hy_sel">
                                <input type="button" value="选择" onmousedown="this.className='hy_sel_bd_h'"
                                            onmouseout="this.className='hy_sel_bd'" class="hy_sel_bd" onclick="OpenDialgDisease('0');" />--%>
                                             <img alt="请选择疾病分组" id="Img1" src="../../Image/search.png"
                                style="cursor: hand" onclick="OpenDialgDisease('0');" title="请选择疾病分组"/>
                                <input id="txtIllGroupID" runat="server" type="hidden" />
                             <%-- </div>
                          </div>--%>
                        </td>
                        <td class="label">
                            计划状态：
                        </td>
                        <td class="input">
                            <Chy:XDropDownList ID="ddlOrgStatus" runat="server" Width="75">
                            </Chy:XDropDownList>
                        </td>
                        
                    </tr>
                </table>
            </td>
            <td class="input" style="text-align:left">
                <Chy:XButton ID="btnSearchOrg" runat="server" Text='查询' CssClass="button" OnClick="btnSearchOrg_Click"
                    />
                    <input id="ipAdvancedSearch1" type="button" class="gj_button" value='高级查询' />
            </td>
            <td class="add" style="text-align:right">
                <input type="button" class="addbutton" value="新增" id="btnAddOrg"  style=" display:none;"/>
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
                  
                    <asp:TemplateField ShowHeader="true" ItemStyle-Width="180px" HeaderText="会员分组">
                        <ItemTemplate>
                            <asp:Label ID="lblAllPath" runat="server" Text='<%# LoadOrgAllPath(Eval("PertainID")) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <%--<asp:BoundField DataField="GroupName " HeaderText="疾病分组"  ItemStyle-Width="100px"></asp:BoundField>--%>
                    <asp:TemplateField ShowHeader="true" ItemStyle-Width="120px" HeaderText="疾病分组">
                        <ItemTemplate>
                            <asp:Label ID="lblGroupName" runat="server" Text='<%# Eval("GroupName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <%--<asp:BoundField DataField="ServiceLevel" HeaderText="星级服务"></asp:BoundField>--%>
                    <asp:TemplateField ShowHeader="true" ItemStyle-Width="90px" HeaderText="星级服务">
                        <ItemTemplate>
                            <asp:Label ID="lblStarService" runat="server" Text='<%# ShowStarService(Eval("ServiceLevel")) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="UserCount" HeaderText="人数" ItemStyle-Width="40px"></asp:BoundField>
                   
                    <asp:TemplateField ShowHeader="true" ItemStyle-Width="130px" HeaderText="计划标题">
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
                    <asp:BoundField DataField="OrgName" HeaderText="创建人"></asp:BoundField>
                    <asp:TemplateField ShowHeader="true" ItemStyle-Width="40px" HeaderText="查看">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnDetail" runat="server" CausesValidation="False" CommandName="itemDetail"
                                CommandArgument='<%# Eval("PlanID") %>' OnCommand="gvReportOrg_Command" Text="查看"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="true" ItemStyle-Width="40px" HeaderText="修改">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnEdit" runat="server" CausesValidation="False" CommandName="itemEdit"
                                CommandArgument='<%# Eval("PlanID") %>' OnCommand="gvReportOrg_Command" Text="修改"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </Chy:XGridView>


    <div id="advancedSearchDiv1" title='<%=Chy.Web.Resource.GetString("Remp_divHeaderAdvQuery") %>'  style=" display:none;">
        <table cellpadding="0" cellspacing="0" class="searchPanel">
          <%-- <tr>
              <td class="label">类别：</td>
			 <td class="input" >
                <select id="SelMode1" style="width: 100px;">
                <option value="0">全部</option>
                <option value="1">体检</option>
                <option value="2">住院</option>
                </select>
              </td>
            </tr>--%>
            <tr>
               
                <td class="label">
                    会员分组：
                </td>
                <td class="input"  colspan="3">
                <%-- <div class="hy_jb" style="width: 310px;">--%>
                    <Chy:XTextBox ID="txtUserOrg1" Width="310" runat="server" class="inputtext"></Chy:XTextBox>
                     <%-- <div class="hy_sel">--%>
                       <%-- <input type="button" value="选择" onmousedown="this.className='hy_sel_bd_h'"
                                            onmouseout="this.className='hy_sel_bd'" class="hy_sel_bd" onclick="OpenDialgFromOrg('1');"/>--%>
                                           <img alt="请选择会员分组" id="Img2" src="../../Image/search.png"
                                style="cursor: hand" onclick="OpenDialgFromOrg('1');" title="请选择会员分组"/>
                        <input id="txtUserOrgID1" runat="server" type="hidden" />
                     <%-- </div>
                  </div>--%>
                </td>
                
            </tr>
            <tr>
               <td class="label">
                    疾病分组：
                </td>
                <td class="input"  colspan="3">
                <%-- <div class="hy_jb" style="width: 310px;">--%>
                    <Chy:XTextBox ID="txtIllGroup1" runat="server" Width="310" class="inputtext"></Chy:XTextBox>
                     <%--<div class="hy_sel">
                        <input type="button" value="选择" onmousedown="this.className='hy_sel_bd_h'"
                                            onmouseout="this.className='hy_sel_bd'" class="hy_sel_bd" onclick="OpenDialgDisease('1');" />--%>
                                            <img alt="请选择疾病分组" id="Img3" src="../../Image/search.png"
                                style="cursor: hand" onclick="OpenDialgDisease('1');" title="请选择疾病分组"/>
                         <input id="txtIllGroupID1" runat="server" type="hidden" />
                    <%--  </div>
                  </div>--%>
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
                    <input type="button" id="ipAdvQuery1" class="button" value='<%=Chy.Globalization.RS.GetString("Remp_Search") %>'/>
                    &nbsp;&nbsp;
                    <input type="button" id="ipClose1" class="button" value='<%=Chy.Globalization.RS.GetString("Remp_Close") %>' />
                </td>
            </tr>
        </table>
    </div>
   
    <asp:Button ID="btnAdvQuery1" runat="server" Text="高级查询" CssClass="button" Style="display: none;"
        OnClick="btnAdvQuery1_Click" /> 
          <asp:HiddenField ID="hidSelectMode" runat="server" Value="0"/> 
          <asp:HiddenField ID="hidSelectMode1" runat="server" Value="0"/> 
         
 </div>
  <%--公用保健计划 End--%>

   </div>
  </div>
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
                //                height: 550,
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
                //                height: 550,
                autoHeight: true,
                closeOnEscape: false
            });
            $("#ipAdvQuery").click(function () {
                var StartTime = $.trim($("#<%=txtStartTime.ClientID %>").val());
                var EndTime = $.trim($("#<%=txtEndTime.ClientID %>").val());
                if (ValidTime(StartTime, EndTime) == false) {
                    alertMsg('<%=Chy.Web.Resource.GetString("HM_From_To_Time")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
                    return false;
                }
                else {
                    $("#advancedSearchDiv").dialog("close");
                    $("#<%=btnAdvQuery.ClientID%>").click();
                }

            });

            //公用保健计划


            //            $("#SelMode").change(function () {
            //                selectMode = $(this).val();
            //                $("#<%=hidSelectMode.ClientID %>").val(selectMode);
            //            })

            //            $("#SelMode1").change(function () {
            //                selectMode1 = $(this).val();
            //                $("#<%=hidSelectMode1.ClientID %>").val(selectMode1);
            //            })

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
                //                height:550,
                autoHeight: true,
                closeOnEscape: false
            });

            $("#advancedSearchDiv1").parent().appendTo($("form:first"));

            $("#ipAdvQuery1").click(function () {
                var advStartTime = $.trim($("#<%=txtStartTimeOrg.ClientID %>").val());
                var advEndTime = $.trim($("#<%=txtEndTimeOrg.ClientID %>").val());

                if (ValidTime(advStartTime, advEndTime) == false) {
                    alertMsg('<%=Chy.Web.Resource.GetString("HM_From_To_Time")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
                    return false;
                }
                else {
                    $("#advancedSearchDiv1").dialog("close");
                    $("#<%=btnAdvQuery1.ClientID%>").click();
                }

            });
        })

        //关闭
        CloseDialg = function () {
            $("div[id!='advancedSearchDiv1']").dialog('close');
        }

        function OpenDialgFromOrg(obj) {
            var d = new Date();
            if (obj == "0")
           {
               hmShowModal('会员分组', '/hc/admin/CrowdGroup/UserGroupTree.aspx?IsShow=1&selectMode=' + $("#<%=hidSelectMode.ClientID %>").val()+ '&Time=' + d.toUTCString(), '500', '500', '');
            }
            if (obj == "1") {//高级查询
                hmShowModal('会员分组', '/hc/admin/CrowdGroup/UserGroupTree.aspx?IsShow=1&selectMode=' + $("#<%=hidSelectMode1.ClientID %>").val() + '&Time=' + d.toUTCString(), '500', '500', '');
            }
            
        }

        function GetToOrg(id, name, sDate, eDate) {
            $("#<%=txtUserOrgID.ClientID %>").val(id);
            $("#<%=txtUserOrg.ClientID %>").val(name);
            $("#<%=txtUserOrgID1.ClientID %>").val(id);
            $("#<%=txtUserOrg1.ClientID %>").val(name);

            $("#<%=txtIllGroupID.ClientID %>").val("");
            $("#<%=txtIllGroup.ClientID %>").val("");
            $("#<%=txtIllGroupID1.ClientID %>").val("");
            $("#<%=txtIllGroup1.ClientID %>").val("");
        }

        function GetOrg(id, name) {
            $("#<%=txtUserOrgID.ClientID %>").val(id);
            $("#<%=txtUserOrg.ClientID %>").val(name);
            $("#<%=txtUserOrgID1.ClientID %>").val(id);
            $("#<%=txtUserOrg1.ClientID %>").val(name);

            $("#<%=txtIllGroupID.ClientID %>").val("");
            $("#<%=txtIllGroup.ClientID %>").val("");
            $("#<%=txtIllGroupID1.ClientID %>").val("");
            $("#<%=txtIllGroup1.ClientID %>").val("");
        }

        function OpenDialgDisease(obj) {
            if (obj == "0") {
                if ($("#<%=txtUserOrgID.ClientID %>").val() == "" || $("#<%=txtUserOrg.ClientID %>").val() == "") {
                    alertMsg('请先选择会员分组！', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
                }
                else {
                    hmShowModal('疾病分类', '/hc/admin/query/DiseaseTree.aspx?selectMode=' + $("#<%=hidSelectMode.ClientID %>").val() + '&orgId=' + $("#<%=txtUserOrgID.ClientID %>").val(), '500', '500', '');
                }
            }
            if (obj == "1") {
                if ($("#<%=txtUserOrgID1.ClientID %>").val() == "" || $("#<%=txtUserOrg1.ClientID %>").val() == "") {
                    alertMsg('请先选择会员分组！', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
                }
                else {
                    hmShowModal('疾病分类', '/hc/admin/query/DiseaseTree.aspx?selectMode=' + $("#<%=hidSelectMode1.ClientID %>").val() + '&orgId=' + $("#<%=txtUserOrgID1.ClientID %>").val(), '500', '500', '');
                }
            }
           
        }
        function GetDisease(id, name, type) {
            $("#<%=txtIllGroupID.ClientID %>").val(id);
            $("#<%=txtIllGroup.ClientID %>").val(name);
            $("#<%=txtIllGroupID1.ClientID %>").val(id);
            $("#<%=txtIllGroup1.ClientID %>").val(name);
        }

        hmShowModal = function (title, url, width, height, callback) {

            var w_title = title;
            var $browser = $.browser;

            if ($browser.msie)
                $("<div style='width:" + width + "px;height:100%;' id='divchooseFrame'><iframe  scrolling='auto' width='100%' height='100%'  frameborder=0  id='ChooseFrame' src='" + url + "' /></div>").dialog({ autoOpen: true, width: width, height: height || 700, showTitle: false, draggable: false, bgiframe: true, modal: true, title: w_title, close: callback });
            else {
                if (height) {
                    height = height - 180;
                }
                $("<div style='width:100%;' id='divchooseFrame'><iframe  scrolling='auto' width='100%' height='100%'  frameborder=0  id='ChooseFrame' src='" + url + "' /></div>").dialog({ autoOpen: true, width: width, height: height || 500, showTitle: false, draggable: false, bgiframe: true, modal: true, title: w_title, close: callback });
            }
        }
        if ($("#<%=clickType.ClientID %>").val() == "tagContent0") {
            $('#MessagePlan').click();
        }
        if ($("#<%=clickType.ClientID %>").val() == "tagContent1") {
            $('#EmailPlan').click();
        }
    </script>

</asp:Content>
