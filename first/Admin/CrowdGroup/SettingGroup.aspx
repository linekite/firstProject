<%--<%@ Page Language="C#" MasterPageFile="~/MainContent.Master" AutoEventWireup="true"
    CodeBehind="SettingGroup.aspx.cs" Inherits="Chm.Web.Admin.CrowdGroup.SettingGroup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Styles/Common.css" rel="stylesheet" type="text/css" />    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
    <asp:HiddenField ID="hdnGroupName" runat="server" />
    <asp:HiddenField ID="hdnType" runat="server" />
    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 4px;
        padding: 4px;">
        <tr>
            <td width="25%" valign="top">
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="main_tab">
                    <tr>
                        <td width="19%" valign="top">
                            <div class="list_tit_crowd">
                                <%=Chy.Web.Resource.GetString("HM5_0315")%></div>
                            <table width="98%" cellpadding="0" cellspacing="0" class="searchPanel" align="center">
                                <tr>
                                    <td align="right">
                                        <Chy:XButton runat="server" ID="btnAddGroupCrow" Style="display: none;" OnClick="btnAddGroupCrow_Click" />&nbsp;
                                        <input type="button" id="btnSetName" runat="server" class="addbutton" onclick="ShowAddGroup()"
                                            value="" />
                                        <input type="button" id="btnUpdateName" runat="server" value="" class="addbutton"
                                            onclick="UpdateGroupName()" />
                                        <Chy:XButton ID="btnUpdateGroupCrow" Style="display: none;" runat="server" OnClick="btnUpdateGroupCrow_Click" />&nbsp;
                                        <Chy:XButton ID="btnDeleteGroupCrow" CssClass="delbutton" runat="server" Text=""
                                            OnClick="btnDeleteGroupCrow_Click" />
                                    </td>
                                </tr>
                            </table>
                            <div style="margin: 10 6px 6px 6px;overflow-x:scroll;width:250px">
                                <Chy:XTreeView ID="xtvGropCrow" ShowLines="true" BorderColor="Transparent" BackColor="Transparent" Width="250px"
                                 SelectedNodeStyle-BackColor="Cyan" runat="server" OnSelectedNodeChanged="xtvGropCrow_SelectedNodeChanged">
                                    <Nodes>
                                        <asp:TreeNode Text='' Value="0"></asp:TreeNode>
                                    </Nodes>
                                </Chy:XTreeView>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
            <td width="75%" valign="top">
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="main_tab">
                    <tr>
                        <td width="80%">
                            <div class="list_tit_crowd">
                                <%=Chy.Web.Resource.GetString("HM5_0316")%></div>
                            <table width="98%" cellpadding="0" cellspacing="0" class="searchPanel" align="center">
                                <tr>
                                    <td align="center">
                                        <table cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td class="label">
                                                    <%=Chy.Web.Resource.GetString("HM5_0317")%><%=Chy.Web.Resource.GetString("Remp_Colon")%>
                                                </td>
                                                <td class="input">
                                                    <Chy:XDropDownList ID="ddlType" runat="server" Width="120px">
                                                    </Chy:XDropDownList>
                                                </td>
                                                <td class="input">
                                                    <input type="button" id="btnAddType" runat="server" class="button" value="" onclick="ShowSearch()" />&nbsp;
                                                    <Chy:XButton ID="btnSearch" runat="server" class="searchbutton" Text="" OnClick="btnSearch_Click" />
                                                    <asp:HiddenField ID="hdnResult" runat="server" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td align="right">
                                        
                                        <Chy:XButton ID="btnSelectAll" runat="server" Text="" CssClass="button" OnClick="btnSelectAll_Click" />&nbsp;
                                        <Chy:XButton ID="btnSMS" CssClass="button" runat="server" Text="" OnClick="btnSMS_Click" />&nbsp;
                                        <Chy:XButton ID="btnSendMessage" runat="server" Text="" OnClick="btnSendMessage_Click" />&nbsp;
                                        <Chy:XButton ID="btnExport" runat="server" Text="" CssClass="button" OnClick="btnExport_Click" />&nbsp;
                                        <Chy:XButton ID="btnDeleteType" runat="server" Text="" CssClass="button" OnClick="btnDeleteType_Click" />
                                        <span class="space"></span>
                                    </td>
                                </tr>
                            </table>
                            <table border="1" cellpadding="0" cellspacing="0" class="zebratable" width="98%"
                                align="center">
                                <tr>
                                    <td nowrap>
                                        <Chy:XGridView ID="gvGroupInfo" runat="server" CssClass="zebratable" AllowPaging="True"
                                            DataKeyNames="GPID" AutoGenerateColumns="False" PagerSettings-PageButtonCount="8"
                                            PageSize="10" Width="100%">
                                            <Columns>
                                                <asp:TemplateField HeaderStyle-CssClass="check" ItemStyle-Width="24px" ItemStyle-CssClass="check">
                                                    <HeaderTemplate>
                                                        <asp:CheckBox ID="selectAll" runat="server" onclick="SelectAllBox(this,'chkSelItem')" />
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkSelItem" runat="server" onclick="CheckOne(this)" /><asp:Label
                                                            ID="LabclassID" runat="server" Text='<%# Eval("GPID") %>' Style="display: none"></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="check"></HeaderStyle>
                                                    <ItemStyle CssClass="check" Width="24px"></ItemStyle>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblPatientName" runat="server" Text='<%# Eval("PatientName")%>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAge" runat="server" Text='<%# GetConvertSex(Eval("PatientID"))%>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="" ItemStyle-Width="120px">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblPhone" Text='<%# GetMobile(Eval("PatientID")) %>' runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="120px"></ItemStyle>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="" ItemStyle-Width="120px">
                                                    <ItemTemplate>
                                                        <a id='A1' href='../Checkup/CheckUpReportPrint.aspx?RPT=K&Type=Detail&CheckRepID=<%# Eval("CheckRptID")%>'  title=''  target='_blank'><%# Eval("CheckRptNO")%></a>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderStyle-CssClass="noShow" ItemStyle-CssClass="noShow">
                                                    <ItemTemplate>
                                                        <asp:Label ID="patietnId" runat="server" Text='<%# Eval("PatientID") %>' Style="display: none;"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField >
                                                <asp:TemplateField HeaderStyle-CssClass="noShow" ItemStyle-CssClass="noShow">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSex" runat="server" Text='<%# Eval("Sex") %>' ></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderStyle-CssClass="noShow" ItemStyle-CssClass="noShow">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDepartment" runat="server" Text='<%# Eval("Department") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderStyle-CssClass="noShow" ItemStyle-CssClass="noShow">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblGroupID" Text='<%# Eval("GroupID") %>' runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderStyle-CssClass="noShow" ItemStyle-CssClass="noShow">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCheckRptID" Text='<%# Eval("CheckRptID") %>' runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField >
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCheckRptNO" Text='<%# Eval("CheckRptNO") %>' runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <PagerSettings PageButtonCount="8"></PagerSettings>
                                        </Chy:XGridView>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:HiddenField ID="hdnSelectAll" runat="server" Value="false" />
    <script language="javascript" type="text/javascript">

        ShowAddGroup = function () {
            $("<div style='width:100%;height:550px' id='divchooseFrame'><iframe  scrolling='auto' width='100%' height='100%'  frameborder=0  id='ChooseFrame' src='AddGroup.aspx' /></div>").dialog({ autoOpen: true, width: 600, height: 550, showTitle: false, modal: true, title: '<%= Chy.Web.Resource.GetString("HM5_0292")%>' });
        }

        function SetValue(groupname, type) {
            $("#<%= hdnGroupName.ClientID%>").val(groupname);
            $("#<%=hdnType.ClientID %>").val(type);
            $('div').dialog('close');
            if (type == "Add") {
                document.getElementById("<%=btnAddGroupCrow.ClientID %>").click();
            } else if (type = "Update") {
                document.getElementById("<%=btnUpdateGroupCrow.ClientID %>").click();
            }
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
                $("#<%=gvGroupInfo.ClientID %> tr :checkbox[id*='selectAll']")[0].checked = false;
                document.getElementById("<%=hdnSelectAll.ClientID %>").value = "false";
                return;
            } else {
                var o = $("#<%=gvGroupInfo.ClientID %> tr:gt(0) :checkbox");
                for (i = 0; i < o.length; i++) {
                    if (o[i].checked == false) {
                        $("#<%=gvGroupInfo.ClientID %> :checkbox[id*='selectAll']")[0].checked = false;
                        document.getElementById("<%=hdnSelectAll.ClientID %>").value = "false";
                        return;
                    }
                }
            }
            $("#<%=gvGroupInfo.ClientID %> tr :checkbox[id*='selectAll']")[0].checked = true;
            document.getElementById("<%=hdnSelectAll.ClientID %>").value = "false";
        }

        UpdateGroupName = function () {
            var thisForm = document.forms['aspnetForm'];
            if (!thisForm) {
                thisForm = document.forms;
            }
            var selectedNodeId = thisForm.elements["<%=xtvGropCrow.ClientID%>_SelectedNode"].value;
            if (selectedNodeId != "") {
                var selectedName = document.getElementById(selectedNodeId).innerText;
                $("<div style='width:100%;height:200px' id='divchooseFrame'><iframe  scrolling='auto' width='100%' height='100%'  frameborder=0  id='ChooseFrame' src='AddGroup.aspx?name=" + escape(selectedName) + "' /></div>").dialog({ autoOpen: true, width: 600, height: 200, showTitle: false, modal: true, title: '<%= Chy.Web.Resource.GetString("HM5_0291")%>' });
            } else {
                return alertMsg('<%=Chy.Web.Resource.GetString("HM5_0318") %>', '提示', 300, 200, '');
            }

        }

        function ShowSearch() {
            var type = $("#<%=ddlType.ClientID %> option:selected").val();
            if (type == undefined) {
                return alertMsg('<%=Chy.Web.Resource.GetString("HM5_0319") %>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 300, 200, '');
            } else {
                if (!GetSelect()) {
                    return alertMsg('<%=Chy.Web.Resource.GetString("HM5_0318") %>', '提示', 300, 200, '');
                }
                if (type == "1") {
                    $("<div style='width:100%;height:550px' id='divchooseFrame'><iframe  scrolling='auto' width='100%' height='100%'  frameborder=0  id='ChooseFrame' src='../../Admin/SelectGroupUserInfo.aspx' /></div>").dialog({ autoOpen: true, width: 900, height: 550, showTitle: false, modal: true, title: '<%=Chy.Web.Resource.GetString("HM5_0320") %>' });
                } else if (type == "2") {
                    $("<div style='width:100%;height:700px' id='divchooseFrame'><iframe  scrolling='auto' width='100%' height='100%'  frameborder=0  id='ChooseFrame' src='SelectAbnormalCrow.aspx' /></div>").dialog({ autoOpen: true, width: 900, height: 700, showTitle: false, modal: true, title: '<%=Chy.Web.Resource.GetString("HM5_0321") %>' });
                } else if (type == "3") {
                    $("<div style='width:100%;height:600px' id='divchooseFrame'><iframe  scrolling='auto' width='100%' height='100%'  frameborder=0  id='ChooseFrame' src='SelectDiseasePrevalenceCrow.aspx' /></div>").dialog({ autoOpen: true, width: 900, height: 600, showTitle: false, modal: true, title: '<%=Chy.Web.Resource.GetString("HM5_0322") %>' });
                }
            }
        }

        function GetSelect() {
            var thisForm = document.forms['aspnetForm'];
            if (!thisForm) {
                thisForm = document.forms;
            }
            var selectedNodeId = thisForm.elements["<%=xtvGropCrow.ClientID%>_SelectedNode"].value;
            if (selectedNodeId != "") {
                return true;
            } else {
                return false;
            }
        }

        function SetCheckupItem(s) {
            $("#<%=hdnResult.ClientID %>").val(s);
            $('div').dialog('close');
            document.getElementById("<%=btnSearch.ClientID %>").click();

        }

        $(document).ready(function () {
            //确认删除提示
            $("#<%=btnDeleteType.ClientID %>").click(function () {
                var msg = '<%=Chy.Web.Resource.GetString("HM5_0324") %>';
                var gridId = '<%=gvGroupInfo.ClientID %>';
                var express = "#" + gridId + " :checkbox[checked]";
                var selected = $(express).length;
                if (selected == 0) {
                    return alertMsg('<%=Chy.Web.Resource.GetString("HM_ChooseDel")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
                } else {
                    return confirmMsg('<%=btnDeleteType.UniqueID %>', '<%=Chy.Web.Resource.GetString("HM_ConfirmDel")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200);
                }
            });

            $("#selectAll").click(function () {
                $("#<%=gvGroupInfo.ClientID %> tr:gt(0) :checkbox").not("disabled").attr("checked", $(this).attr("checked"))
            });
        });
    </script>
</asp:Content>
--%>
<%@ Page Language="C#" MasterPageFile="~/MainContent.Master" AutoEventWireup="true"
    CodeBehind="SettingGroup.aspx.cs" Inherits="Chm.Web.Admin.CrowdGroup.SettingGroup" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Styles/Common.css" rel="stylesheet" type="text/css" /> 
     <link href="../../zTree-3.0/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css" />   
         <style type="text/css">
        html { overflow-x:hidden;overflow-y:auto; }
        .addgroup
        {
            height:20px;
            margin: 5px 0 5px 0; 
            cursor: pointer;
            padding-left:20px;
            padding-right:10px;
        }
        
        .toptitle
        {
            font-size:12px; font-weight:bold; line-height:31px; text-indent:12px;
	        background: url(/hc/Images/fz_bt.jpg) top repeat-x; margin:0;
        }
        
         a:hover {color:red;}
         .ztree li button.add {margin-left:2px; margin-right: -1px; background-position:-112px 0; vertical-align:top; *vertical-align:middle}
    </style>
     <script src="../../zTree-3.0/js/jquery.ztree.all-3.0.min.js" type="text/javascript"></script>
    <script src="../../zTree-3.0/xys.crowgroup.js" type="text/javascript"></script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="main_tab">
            <tr>
                <td width="300px" valign="top">
                    <div style="width: 285px; height: 100%; float: left; background-color: #fff; border: #cecece 1px solid;
                        margin: 5px 0px 0 5px">
                        <div class="toptitle">
                            关注人群
                        </div>
                        <div class="searchPanel" style="width:280px; margin: 5px 2px 2px 2px; padding: 10px 10px 10px 10px;
                            position: relative; text-align: right;">
                            <input type="button" class="button" value="设置关注" onclick="setcrgroup(0)" onmouseover="this.className='hoverbutton'"
                                onmouseout="this.className='button'" />
                        </div>
                        <div style="width: 285px; height: 100%; overflow: auto;">
                            <ul id="treeDemo" class="ztree" style="height: 350px;">
                            </ul>
                        </div>
                    </div>
                </td>
                <td valign="top">
                    <div id="showgrouplist" style="width: 99%; height: 100%; float: right; background-color: #fff;
                        border: #cecece 1px solid; margin: 5px 5px 0 0px">
                        <div class="toptitle">
                            分组人员
                        </div>
                        <div class="searchPanel" style="margin: 5px; padding: 10px 10px 10px 10px;">
                            <div style="text-align: left; font-weight: bold; font-size: 15px; float: left;">
                                姓名：<input type="text" name="txtsearchname" id="txtsearchname" /><input type="button"
                                    name="btnSearch" class="button" value="查询" onmouseover="this.className='hoverbutton'"
                                    onmouseout="this.className='button'" onclick="btnsearchbyname()" /></div>
                            <div style="text-align: right;">
                                <input type="button" name="btnSearch" class="button" value="刷新人员列表" onmouseover="this.className='hoverbutton'"
                                    onmouseout="this.className='button'" onclick="refhuman()" />
                                <input type="button" name="btnSearch" class="button" value="保健计划制定" onmouseover="this.className='hoverbutton'"
                                    onmouseout="this.className='button'" onclick="addnewplan()" />
                            </div>
                        </div>
                        <div style="margin: 5px; height: 100%">
                            <div id="showpart" style="width: 100%;">
                            </div>
                        </div>
                    </div>
                    <div id="showcreategroup" style="width: 99%; height: 100%; float: right; background-color: #fff;
                        border: #cecece 1px solid; margin: 5px 5px 0 0px; display: none;">
                        <div class="toptitle">
                            设置关注人员
                        </div>
                        <div class="searchPanel" style="margin: 5px; padding: 10px 10px 10px 10px;">
                                分组年份:
                            <select name="ddlType" id="ddlyear" class="secltwidth" style="width: 120px;">
                            </select>&nbsp;
                        </div>
                        <div style="margin: 5px; height: 350px; overflow: auto;">
                            <ul id="group" class="ztree" style="height: 260px;">
                            </ul>
                        </div>
                        <div style="text-align: center; padding:10px 0 10px 0">
                            <input type="button" class="button" value="保  存" onclick="addgrouptodb()" />&nbsp;&nbsp;<input
                                type="button" class="button" value="取  消" onclick="setcrgroup(1)" /></div>
                    </div>
                </td>
            </tr>
        </table>
</asp:Content>


