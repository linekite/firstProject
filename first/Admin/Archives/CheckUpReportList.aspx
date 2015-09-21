<%@ Page Language="C#" MasterPageFile="~/MainContent.Master" AutoEventWireup="true" CodeBehind="CheckUpReportList.aspx.cs" Inherits="Chm.Web.Admin.Archives.CheckUpReportList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/Js/DatePicker/WdatePicker.js" type="text/javascript"></script>
    
    <script language="javascript" type="text/javascript">
        //弹出DIV嵌套iframe的模态窗体使窗体超过高度显示滚动条
        xysShowModal = function (title, url, width, height, callback) {
            var w_title = title;
            var $browser = $.browser;

            if ($browser.msie)
                $("<div style='width:" + width + "px;height:100%;' id='divchooseFrame'><iframe  scrolling='yes' width='100%' height='100%'  frameborder=0  id='ChooseFrame' src='" + url + "' /></div>").dialog({ autoOpen: true, width: width, height: height || 700, showTitle: false, draggable: false, bgiframe: true, modal: true, title: w_title, close: callback });
            else {
                if (height) {
                    height = height - 180;
                }
                $("<div style='width:100%;' id='divchooseFrame'><iframe  scrolling='yes' width='100%' height='100%'  frameborder=0  id='ChooseFrame' src='" + url + "' /></div>").dialog({ autoOpen: true, width: width, height: height || 500, showTitle: false, draggable: false, bgiframe: true, modal: true, title: w_title, close: callback });
            }
        }
    </script>
    <script language="javascript" type="text/javascript">
        //选择组织
        function OpenDialogOrg() {            
            var d = new Date();
            var url = "/hc/Admin/TreeView/OrgTree.aspx?OrgGroupType=1&Time=" + d.toUTCString();
            xysShowModal('请选择组织', url, 350, 420, null);
        }
        function GetOrg(id, name, parentId) {            
            $("#<%=hidOrgID.ClientID%>").val(id);
            $("#<%=txtOrg.ClientID%>").val(name);
            $("#<%=hidParentOrgID.ClientID%>").val(parentId);
            hcCloseModal();
        }

        //跳转到会员体检报告界面
        function OpenPatientPage(patientID, checkRptID) {
            var url = "/hc/Admin/Checkup/ChkUpRptPrint.aspx?CheckRepID=" + checkRptID + "&_pi=" + patientID;
            window.open(url, '_blank');          
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
    <div class="searchPanel">
        <div class="serformline clearfix mb_10">
            <div class="fl">
                <label for="" class="serformlabel">
                    <span class="red">*</span>
                    <Chy:XLabel ID="lblOrg" runat="server" Text="所属组织："></Chy:XLabel>
                </label>
                <asp:HiddenField ID="hidOrgID" runat="server" Value="-1" />
                <asp:HiddenField ID="hidParentOrgID" runat="server" Value="-1" />
                <Chy:XTextBox ID="txtOrg" runat="server" class="inputtext serinput" onclick="OpenDialogOrg();"/>
                <img title=" 请选择" id="imgSelectOrg" style="cursor: hand;" onclick="OpenDialogOrg();"
                    src="/App_Themes/default/images/search.gif" />
            </div>
            <div class="fl">
                <label for="" class="serformlabel"><Chy:XLabel ID="lblPatientName" runat="server" Text="姓名：">
                                </Chy:XLabel></label>
                <Chy:XTextBox ID="txtPatientName" runat="server" class="inputtext serinput"/>
            </div>
            <div class="fl">
                <label for="" class="serformlabel"><Chy:XLabel ID="lblCheckTime" runat="server" Text="体检时间：">
                            </Chy:XLabel></label>
                <Chy:XDatePicker ID="dpCheckStartTime" runat="server" Width="120px"/>&nbsp;
                            <%= Chy.Web.Resource.GetString("HM_To")%>
                <%= Chy.Web.Resource.GetString("Remp_Colon")%>&nbsp;
                            <Chy:XDatePicker ID="dpCheckEndTime" runat="server" Width="120px"/>
            </div>
            <label for="" class="serformlabel"></label>
        </div>
        <div class="serformline mb_10 clearfix">
            <div class="fl">
                <label for="" class="serformlabel"><Chy:XLabel ID="lblMobile" runat="server" Text="手机号码：">
                            </Chy:XLabel></label>
                <Chy:XTextBox ID="txtMobile" runat="server" class="inputtext serinput"/>
            </div>
            <div class="fl" style="margin-left:24px;">
                <label for="" class="serformlabel">
                    <Chy:XLabel ID="lblCheckUpPackage" runat="server" Text="体检套餐：">
                            </Chy:XLabel>
                </label>
                <Chy:XTextBox ID="txtCheckUpPackage" runat="server" class="inputtext serinput"/>
            </div>
            <div class="fl" style="display:none">
                <label for="" class="serformlabel">
                    <Chy:XLabel ID="lblChiefTime" runat="server" Text="总检时间：">
                            </Chy:XLabel>
                </label>
                <Chy:XDatePicker ID="dpChiefStartTime" runat="server" Width="120px"/>&nbsp;
                            <%= Chy.Web.Resource.GetString("HM_To")%>
                <%= Chy.Web.Resource.GetString("Remp_Colon")%>&nbsp;
                            <Chy:XDatePicker ID="dpChiefEndTime" runat="server" Width="120px"/>
            </div>
        </div>
        <div class="serformline" style="padding-left:80px;">
            <Chy:XButton ID="btnSearch" runat="server" Text='查询' CssClass="button" OnClick="btnSearch_Click"/>
        </div>
    </div>
    <table width="100%" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td>
                <Chy:XGridView ID="xgvCheckUpReportList" runat="server" AllowPaging="True" PagerSettings-PageButtonCount="5"
                    AutoGenerateColumns="False" BorderStyle="Solid" EmptyShowHeader="True" PageIndexCstm="1" PageSize = "10"
                    OnBindCstm="xgvCheckUpReportList_BindCstm" Width="100%" CssClass="zebratable">
                    <Columns>
                        <asp:TemplateField HeaderText="姓名" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                            <ItemTemplate>
                            <a href="#" onclick="return OpenPatientPage(<%# Eval("PatientID")%>,<%#Eval("CheckRptID")%>)">
                               <%#Eval("PatientName")%>
                            </a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="性别" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                            <ItemTemplate>
                            <%#Eval("XB")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="年龄" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                            <ItemTemplate>
                            <%#Eval("NL")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="手机号" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                            <ItemTemplate>
                             <%#Eval("SJHM")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="团检单位" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                             <%#Eval("OrgName")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="体检套餐" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                            <%#Eval("CheckUpPackage")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="总检时间" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                            <ItemTemplate>
                            <%# Eval("ChiefTime")==null?"": Convert.ToDateTime(Eval("ChiefTime")).ToString("yyyy-MM-dd")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="体检时间" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                            <ItemTemplate>
                            <%# Convert.ToDateTime(Eval("CheckTime")).ToString("yyyy-MM-dd")%>
                            </ItemTemplate>
                        </asp:TemplateField>                       
                    </Columns>
                    <PagerSettings PageButtonCount="5" />
                </Chy:XGridView>
            </td>
        </tr>
    </table>
</asp:Content>