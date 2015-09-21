<%@ Page Title="" Language="C#" MasterPageFile="~/MainContent.Master" AutoEventWireup="true"
    CodeBehind="ReChooseSinglePatient.aspx.cs" Inherits="Chm.Web.Admin.ReChooseSinglePatient" %>

<%@ Register TagPrefix="Chy" Namespace="Chy.UI.Controls" Assembly="Chy.UI.Controls" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/CSS/skin.css" rel="stylesheet" type="text/css" />
        <script src="/Js/DatePicker/WdatePicker.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table width="99%" cellpadding="0" cellspacing="0" class="searchPanel" align="center">
    <tr>
            <td nowrap>
                <span>&nbsp;</span>
            </td>
             <td class="label">
                <asp:Label ID="lblDataSource" runat="server" Text="随访类别:"></asp:Label>
            </td>
            <td >
                <Chy:XDropDownList Style="width: 130px;" ID="ddlDataSource" runat="server">
                    <asp:ListItem Value="1" Text="体检"></asp:ListItem>
                    <asp:ListItem Value="2" Text="住院"></asp:ListItem>
                    <asp:ListItem Value="3" Text="其它"></asp:ListItem>
                </Chy:XDropDownList>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
           <%-- <td colspan="2">
                
            </td>--%>
        </tr>
        <tr>
            <td nowrap>
                <span>&nbsp;</span>
            </td>
            <td class="label" nowrap>
                <asp:Label ID="lblMemberId" runat="server" Text="会员卡号:"></asp:Label>
            </td>
            <td>
                <Chy:XTextBox Style="width: 128px;" ID="txtMemberId" runat="server"></Chy:XTextBox>
            </td>
             
            <td class="label" nowrap>
                <asp:Label ID="lblPatientName" runat="server" Text="姓名:"></asp:Label>
            </td>
            <td>
                <Chy:XTextBox Style="width: 128px;" runat="server" ID="txtPatientName"></Chy:XTextBox>
            </td>
           
        </tr>
        <tr>
            <td nowrap>
                <span class="red">*</span>
            </td>
            <td class="label" nowrap>
                <Chy:XLabel ID="lblDoctorName" Text="会员分组:" runat="server" />
            </td>
            <td>
                    <Chy:XTextBox ID="txtToOrg" Style="width: 130px;" onclick="OpenClassSelect();" runat="server"
                        MaxLength="128" class="inputtext" ValidType="String" ReadOnly="true"></Chy:XTextBox>
                    <img alt="请选择会员分组" id="ImgItemName" src="../Image/search.png"
                      style="cursor: hand" onclick="OpenClassSelect();" title="请选择会员分组"/>
            </td>
            <td class="label" nowrap>
                <Chy:XLabel ID="XLabel1" Text="疾病分组:" runat="server" />
            </td>
            <td>
                    <Chy:XTextBox ID="txtDisease" Style="width: 130px;" runat="server" onclick="OpenDiseaseSelect();"
                        CssClass="inputtext" ReadOnly="true"></Chy:XTextBox>
                     <img alt="请选择疾病" id="Img2" src="../Image/search.png"
                                style="cursor: hand" onclick="OpenDiseaseSelect();" title="请选择疾病"/>
            </td>
        </tr>
         
        <%-- <tr>
            <td>
                <asp:Label ID="lblCardNo" runat="server" Text="证件号码:"></asp:Label>
            </td>
            <td>
                <Chy:XTextBox runat="server" ID="txtCradNo"></Chy:XTextBox>
            </td>
            <td>
                <asp:Label ID="lblSex" runat="server" Text="性别:"></asp:Label>
            </td>
            <td>
                <Chy:XDropDownList ID="ddlSex" runat="server" Style="width: 100px;">
                    <asp:ListItem Text=" 请选择 " Value="0" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="男" Value="1"></asp:ListItem>
                    <asp:ListItem Text="女" Value="2"></asp:ListItem>
                    <asp:ListItem Text="未知" Value="3"></asp:ListItem>
                </Chy:XDropDownList>
            </td>
        </tr>--%>
        
        <tr>
            <td nowrap>
                <span>&nbsp;</span>
            </td>
            <td class="label" nowrap>
                <Chy:XLabel ID="XLabel2" Text="星级服务:" runat="server" />
            </td>
            <td>
                <Chy:XCategoryList Style="width: 130px;" CssClass="secltwidth" ID="dropStarServiceLevel"
                    runat="server" CategoryId="46">
                </Chy:XCategoryList>
            </td>
            <td class="label" nowrap>
                <Chy:XLabel ID="XLabel4" Text="服务状态:" runat="server" />
            </td>
            <td>
                <Chy:XCategoryList Style="width: 130px;" ID="dropMemberServiceStatus" runat="server"
                    CategoryId="23">
                </Chy:XCategoryList>
            </td>
        </tr>

         <tr>
            <td nowrap>
                <span>&nbsp;</span>
            </td>
             <td class="label" nowrap>
                <Chy:XLabel ID="XLabel3" Text="监测项目:" runat="server" />
            </td>
            <td>
                <Chy:XDropDownList Width="130" ID="ddlProject" runat="server">
                </Chy:XDropDownList>
              
            </td>
            <td class="label" nowrap>
                <%=Chy.Web.Resource.GetStringColon("Remp_MemberRegisterDate")%>
            </td>
            <td >
                <Chy:XDatePicker ID="txtBeginDate" runat="server" AllowEmpty="true" Linkage="BeginDate"
                    Width="85px"></Chy:XDatePicker>
                <%=Chy.Web.Resource.GetString("Remp_To")%>
                <Chy:XDatePicker ID="txtEndDate" runat="server" AllowEmpty="true" Linkage="EndDate"
                    Width="85px"></Chy:XDatePicker>               
            </td>
        </tr>
       
        <tr>
            <td colspan="5" align="center">
                  <Chy:XButton ID="btnSear" runat="server" Text="查询" CssClass="button" OnClick="btnSearch_Click" />
            </td>
        </tr>
    </table>
    <asp:UpdatePanel ID="updatePanel1" runat="server">
        <ContentTemplate>
            <table width="99%" cellpadding="0" cellspacing="0" align="center">
                <tr>
                    <td>
                        <span  id="lblTip" runat="server" >请选择一个会员：</span>
                        
                    </td>
                </tr>
                <tr>
                    <td>
                        <Chy:XGridView ID="gvInPatient" runat="server" CssClass="zebratable" AllowPaging="true"
                            DataKeyNames="PatientId" AutoGenerateColumns="False" PagerSettings-PageButtonCount="8"
                            PageSize="5" Width="100%">
                            <Columns>
                                <asp:TemplateField HeaderText="姓名">
                                    <ItemTemplate>
                                        <a href="javascript:void(0)" onclick="returnValue(this)">
                                            <%# Eval("PatientName")%></a><asp:Label ID="Label1" runat="server" Text='<%# Eval("PatientId") %>'
                                                Style="display: none" /><asp:Label ID="LabclassID" runat="server" Text='<%# Eval("PatientName") %>'
                                                    Style="display: none" />
                                        <%-- <asp:RadioButton ID="rbtSelect" runat="server"  onclick="Select(this)"/>--%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%-- <asp:BoundField DataField="PatientName" HeaderText="姓名"></asp:BoundField>--%>
                                <asp:TemplateField HeaderText="性别">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSex" runat="server" Text='<%# GetSex(Eval("PatientSex")) %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="年龄">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAge" runat="server" Text='<%# GetAge(Eval("Birthday")) %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="会员卡号" ItemStyle-Width="120px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPatientCrodNo" runat="server" Text='<%# Eval("MemberID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%-- <asp:TemplateField HeaderText="管理单位" ItemStyle-Width="120px">
                            <ItemTemplate>
                                <asp:Label ID="lblUhit" runat="server" Text=""></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                            </Columns>
                        </Chy:XGridView>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnSear" />
        </Triggers>
    </asp:UpdatePanel>
    <table width="99%" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td align="center">
                <br />
                <input type="button" id="btnCancel" class="button" value="返回" onclick="Back()" />
            </td>
        </tr>
    </table>
    <input type="hidden" id="hidToOrgId" runat="server" />
    <input type="hidden" id="hidDiseaseId" runat="server" />
    <input type="hidden" id="hidParentType" runat="server" />
    <input type="hidden" id="hidDiseaseType" runat="server" />
    <input type="hidden" id="hidStarLevel" runat="server" />
    <input type="hidden" id="hidItem" runat="server" />
    <input type="hidden" id="hidServiceStatus" runat="server" />
    <input type="hidden" id="hidPatientId" runat="server" />
    <input type="hidden" id="hidIsSelect" runat="server" />
    <input type="hidden" id="hidDataSourceId" runat="server" />
    <script language="javascript" type="text/javascript">
        $(document).ready(function () {
            $("#<%=btnSear.ClientID %>").click(function () {
                $("#<%=lblTip.ClientID %>").html("<span style='color:red'>正在查询，请稍后！</span>");
            });
        });
        function OpenClassSelect() {
            //selectMode=1是体检，?selectMode=2是住院
            var selectMode = $("#<%=ddlDataSource.ClientID %> option:selected").val();
            var url = "../Admin/CrowdGroup/UserGroupTree.aspx?IsShow=1&selectMode=" + selectMode;
            $("<div style='width:100%;height:400px' id='divchooseFrame'><iframe  scrolling='auto' width='100%' height='100%'  frameborder=0  id='ChooseFrame' src='" + url + "' /></div>").dialog({ autoOpen: true, width: 550, height: 380, showTitle: false, modal: true, position: [50, 150], title: '选择会员分组' });
        }

        function OpenDiseaseSelect() {
            if (chkOrg()) {
                var selectMode = $("#<%=ddlDataSource.ClientID %> option:selected").val();
                var orgId = $("#<%=hidToOrgId.ClientID %>").val();
                var url = "../Admin/Query/DiseaseTree.aspx?IsShow=1&selectMode=" + selectMode + "&orgId=" + orgId;
                $("<div style='width:100%;height:400px' id='divchooseFrame'><iframe  scrolling='auto' width='100%' height='100%'  frameborder=0  id='ChooseFrame' src='" + url + "' /></div>").dialog({ autoOpen: true, width: 550, height: 380, showTitle: false, modal: true, position: [50, 150], title: '选择疾病分组' });
            }
        }

        function GetOrg(id, name) {
            $("#<%=hidToOrgId.ClientID %>").val(id);
            $("#<%=txtToOrg.ClientID %>").val(name);
        }

        function GetDisease(id, name, type) {
            $("#<%=hidDiseaseId.ClientID %>").val(id);
            $("#<%=txtDisease.ClientID %>").val(name);
            $("#<%=hidDiseaseType.ClientID %>").val(type);
        }


        CloseDialg = function () {
            $('div').dialog('close');
        }
        function GetRightListBoxValue(select) {
            var item = {
                PatientId: $(select).next().text(),
                PatientName: select.parentNode.childNodes[2].innerText,
                DataSource: $("#<%=ddlDataSource.ClientID %> option:selected").val()
            };
            return item;
        }
        function returnValue(select) {
            $("#<%=hidIsSelect.ClientID %>").val($(select).next().text());
            var Item = GetRightListBoxValue(select);
            if (Item == "-1") {
                alertMsg('请选择要添加的小项', '提示', 400, 200, "");
                return;
            }
            else {
                parent.GetItemInfo(Item);
                parent.CloseDialg();
                parent.Ref();
            }
        }

        function Back() {
            if ($("#<%=hidIsSelect.ClientID %>").val() != "") {
                parent.$('div').dialog('close');
            }
            else {
                parent.window.location.href("../Admin/FllowUpHealth/FllowUpRecord.aspx");
                parent.$('div').dialog('close');

            }
        }

        function chkOrg() {
            var orgId = $("#<%=hidToOrgId.ClientID %>").val();
            if (orgId.length == 0 || orgId == "-1") {
                alertMsg('请先选择分组!', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200, '');
                return false;
            }
            else
                return true;
        }
    </script>
</asp:Content>
