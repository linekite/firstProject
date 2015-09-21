<%@ Page Title="" Language="C#" MasterPageFile="~/MainContent.Master" AutoEventWireup="true"
    CodeBehind="ReChoosePatient.aspx.cs" Inherits="Chm.Web.Admin.ReChoosePatient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/CSS/skin.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/MultiLineLength.js" type="text/javascript"></script>
    <link href="/CSS/jquery.autocomplete.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
    <table width="99%" cellpadding="0" cellspacing="0" class="searchPanel" align="center">
        <tr>
            <td class="label" nowrap>
                <span class="red">*</span><Chy:XLabel ID="lblDoctorName" Text="会员分组:" runat="server" />
            </td>
            <td>  
                   <Chy:XTextBox ID="txtToOrg" Style="width: 130px;" onclick="OpenClassSelect();" runat="server"
                        MaxLength="128" class="inputtext" ValidType="String" ReadOnly="true"></Chy:XTextBox>
                    <img alt="请选择会员分组" id="ImgItemName" src="../Image/search.png"
                      style="cursor: hand" onclick="OpenClassSelect();" title="请选择会员分组"/>

<%--                <div class="hy_jb" style="width: 250px;">
                    <Chy:XTextBox ID="txtToOrg" Style="width: 238px;" onclick="OpenClassSelect();"  runat="server" MaxLength="128"
                        AllowEmpty="false" ValidationGroup="RoleVal"></Chy:XTextBox>
                    <div class="hy_sel">
                        <input name="aa" type="button" value="选择" onmousedown="this.className='hy_sel_bd_h'"
                            onmouseout="this.className='hy_sel_bd'" class="hy_sel_bd" onclick="OpenClassSelect();" />
                    </div>
                </div>--%>
            </td>
            <td class="label" style="display:none">
                <asp:Label ID="lblDataSource" runat="server" Text="会员类别:"></asp:Label>
            </td>
            <td style="display:none">
                <Chy:XDropDownList ID="ddlDataSource" runat="server">
                    <asp:ListItem Value="0" Text="全部" Selected="True"></asp:ListItem>
                    <asp:ListItem Value="1" Text="体检"></asp:ListItem>
                    <asp:ListItem Value="2" Text="住院"></asp:ListItem>
                </Chy:XDropDownList>
            </td>
             <td class="label" nowrap>
                <Chy:XLabel ID="XLabel1" Text="疾病分组:" runat="server" />
            </td>
            <td>
                    <Chy:XTextBox ID="txtDisease" Style="width: 130px;" runat="server" onclick="OpenDiseaseSelect();"
                        CssClass="inputtext" ReadOnly="true"></Chy:XTextBox>
                     <img alt="请选择疾病" id="Img2" src="../Image/search.png"
                                style="cursor: hand" onclick="OpenDiseaseSelect();" title="请选择疾病"/>
<%--                <div class="hy_jb">
                    <Chy:XTextBox ID="txtDisease" onclick="OpenDiseaseSelect();" runat="server" CssClass="inputtext"></Chy:XTextBox>
                    <div class="hy_sel">
                        <input name="aa" type="button" value="选择" onmousedown="this.className='hy_sel_bd_h'"
                            onmouseout="this.className='hy_sel_bd'" class="hy_sel_bd" onclick="OpenDiseaseSelect();" />
                    </div>
                </div>--%>
            </td>
        </tr>
        <tr>           
            <td class="label" nowrap>
                <Chy:XLabel ID="XLabel2" Text="星级服务:" runat="server" />
            </td>
            <td>
                <Chy:XCategoryList CssClass="secltwidth" ID="dropStarServiceLevel" runat="server"
                    CategoryId="46">
                </Chy:XCategoryList>
            </td>
        </tr>
        <tr>
            <td class="label" nowrap>
                <Chy:XLabel ID="XLabel3" Text="监测项目:" runat="server" />
            </td>
            <td>
                <Chy:XDropDownList Width="160" ID="ddlProject" runat="server">
                </Chy:XDropDownList>
            </td>
            <td class="label" nowrap>
                <Chy:XLabel ID="XLabel4" Text="服务状态:" runat="server" />
            </td>
            <td>
                <Chy:XCategoryList ID="dropMemberServiceStatus" runat="server" CategoryId="23">
                </Chy:XCategoryList>
                &nbsp;&nbsp;
                <Chy:XButton ID="XButton2" runat="server" Text="查询" CssClass="button" OnClick="btnSearch_Click" ValidationGroup="RoleVal" />
            </td>
        </tr>
    </table>
    <table width="99%" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td>
                <asp:Label ID="lblTip" runat="server" Text="请确认列表中的会员："></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <Chy:XGridView ID="gvInPatient" runat="server" CssClass="zebratable" AllowPaging="true"
                    DataKeyNames="PatientId" AutoGenerateColumns="False" PagerSettings-PageButtonCount="8"
                    PageSize="5" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="PatientName" HeaderText="姓名"></asp:BoundField>
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
                        <asp:TemplateField HeaderText="管理单位" ItemStyle-Width="120px">
                            <ItemTemplate>
                                <asp:Label ID="lblUhit" runat="server" Text=""></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </Chy:XGridView>
            </td>
        </tr>
        <tr>
            <td class="buttons">
                <input type="button" id="btnSave" class="button" value="确定" onclick="ReturnValue()"
                    validationgroup="DoctorValid" /><span class="space"></span>
                <input type="button" id="btnCancel" class="button" value="取消" onclick="parent.$('div').dialog('close');" />
            </td>
        </tr>
    </table>
    <input type="hidden" id="hidToOrgId" runat="server" />
    <input type="hidden" id="hidDiseaseId" runat="server" />
    <input type="hidden" id="hidDiseaseType" runat="server" />
    <input type="hidden" id="hidStarLevel" runat="server" />
    <input type="hidden" id="hidItem" runat="server" />
    <input type="hidden" id="hidServiceStatus" runat="server" />
    <script language="javascript" type="text/javascript">
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

        function ReturnValue() {
            var Items = {
                OrgId: document.getElementById("<%=hidToOrgId.ClientID %>").value,
                DiseaseId: document.getElementById("<%=hidDiseaseId.ClientID %>").value,
                StarLevel: document.getElementById("<%=hidStarLevel.ClientID %>").value,
                Item: document.getElementById("<%=hidItem.ClientID %>").value,
                ServiceStatus: document.getElementById("<%=hidServiceStatus.ClientID %>").value
            }
            parent.GetCondition(Items);
            parent.CloseDialg();
        }

        CloseDialg = function () {
            $('div').dialog('close');
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
