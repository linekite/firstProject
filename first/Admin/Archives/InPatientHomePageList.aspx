<%@ Page Language="C#" MasterPageFile="~/MainContent.Master" AutoEventWireup="true" CodeBehind="InPatientHomePageList.aspx.cs" Inherits="Chm.Web.Admin.Archives.InPatientHomePageList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/Js/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="/Js/jquery.json-2.3.min.js" type="text/javascript" ></script>
    <script src="/Js/jquery.autocomplete.js" type="text/javascript" ></script> 
    <script src="/Js/moreMenu.js" type="text/javascript" ></script>   

    <script type="text/javascript">
        $.extend($.fn, {
            SetAutocomplete: function (url, getPostData) {
                var obj = $(this);
                //诊断疾病智能提示
                obj.autocomplete({
                    minLength: 1,
                    source: function (request, response) {
                        $.ajax({
                            type: "get",
                            url: url,
                            dataType: "json",
                            data: (typeof (getPostData) != "function") ? null : getPostData(),
                            success: function (data) {                                
                                response($.map(data, function (item) {
                                    return {
                                        label: item.Name,
                                        idValue: item.CategoryId
                                    };
                                }));
                            }
                        });
                    },
                    autoFocus: true,
                    select: function (event, ui) {
                        obj.val(ui.item.label);
                        return false;
                    }
                });
            },
            setInputTitleTip: function (message) {
                if ($(this).val() == message) {
                    $(this).css("color", "#999");
                }
                else {
                    $(this).css("color", "#000");
                }
                $(this).bind("blur", function () {
                    if ($(this).val() == "") {
                        $(this).val(message);
                        $(this).css("color", "#999");
                    }
                }).bind("focus", function () {
                    if ($(this).val() == message) {
                        $(this).val("");
                        $(this).css("color", "#000");
                    }
                });
            }
        });

        function setAutocomplete() {
            function getDiagnoseDiseasePostData() {
                var dataPost = {
                    "key": $("#<%=txtDiagnoseDisease.ClientID%>").val()
                };
                return dataPost;
            }
            $("#<%=txtDiagnoseDisease.ClientID%>").SetAutocomplete("/hc/ajax/DiseaseQuery.ashx?Mode=diseaseQuery&orgId=0", getDiagnoseDiseasePostData);
        }

        $(function () {
            setAutocomplete();
        });         
    </script>

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
            var url = "/hc/Admin/TreeView/OrgTree.aspx?OrgGroupType=2&Time=" + d.toUTCString();
            xysShowModal('请选择组织', url, 350, 420, null);
        }
        function GetOrg(id, name, parentId) {
            $("#<%=hidOrgID.ClientID%>").val(id);
            $("#<%=txtOrg.ClientID%>").val(name);
            $("#<%=hidParentOrgID.ClientID%>").val(parentId);
            hcCloseModal();
        }

        //跳转到会员住院病历界面
        function OpenPatientPage(hpRecordID, patientID) {
            var url = "/hc/Admin/Inpatienthomepage/HomeDefault.aspx?hpid=" + hpRecordID;
            return clientUnity.redirectToPersionalByMenuId(patientID, url, 20003);
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
                <Chy:XTextBox ID="txtOrg" runat="server" class="inputtext serinput" onclick="OpenDialogOrg();" Width="274px"/>
                <img title=" 请选择" id="imgSelectOrg" style="cursor: hand;" onclick="OpenDialogOrg();" src="/App_Themes/default/images/search.gif" />
            </div>
            <div class="fl">
                <label for="" class="serformlabel">
                    <Chy:XLabel ID="lblPatientName" runat="server" Text="姓名："></Chy:XLabel>
                </label>
                <Chy:XTextBox ID="txtPatientName" runat="server" class="inputtext serinput" />
            </div>
            <div class="fl">
                <label for="" class="serformlabel">
                    <Chy:XLabel ID="lblInPatientNum" runat="server" Text="病案号："></Chy:XLabel>
                </label>
                <Chy:XTextBox ID="txtInPatientNum" runat="server" class="inputtext serinput" />
            </div>
        </div>
        <div class="serformline clearfix mb_10">
            <div class="fl">
                <label for="" class="serformlabel">
                    <Chy:XLabel ID="lblOutHosiptalDate" runat="server" Text="出院日期："></Chy:XLabel>
                </label>
                <Chy:XDatePicker ID="dpOutHosiptalStartDate" runat="server" Width="120px"/>&nbsp;
                <%= Chy.Web.Resource.GetString("HM_To")%><%= Chy.Web.Resource.GetString("Remp_Colon")%>&nbsp;
                <Chy:XDatePicker ID="dpOutHosiptalEndDate" runat="server" Width="120px"/>
            </div>
            <div class="fl">
                <label for="" class="serformlabel">
                    <Chy:XLabel ID="lblMobile" runat="server" Text="手机号码："></Chy:XLabel>
                </label>
                <Chy:XTextBox ID="txtMobile" runat="server" class="inputtext serinput" />
            </div>
            <div class="fl">
                <label for="" class="serformlabel">
                    <Chy:XLabel ID="lblDiagnoseDisease" runat="server" Text="诊断疾病名称："></Chy:XLabel>
                </label>
                <Chy:XTextBox ID="txtDiagnoseDisease" runat="server" class="inputtext serinput" />
            </div>
        </div>
        <div class="serformline" style="padding-left:80px;">
            <Chy:XButton ID="btnSearch" runat="server" Text='查询' CssClass="button" OnClick="btnSearch_Click"/>
        </div>
    </div>

    <table width="100%" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td>
            <Chy:XGridView ID="xgvInPatientHomePageList" runat="server" AllowPaging="True" PagerSettings-PageButtonCount="5"
                    AutoGenerateColumns="False" BorderStyle="Solid" EmptyShowHeader="True" PageIndexCstm="1" PageSize = "10"
                    OnBindCstm="xgvInPatientHomePageList_BindCstm" Width="100%" CssClass="zebratable">
                    <Columns>
                        <asp:TemplateField HeaderText="姓名" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                            <ItemTemplate>
                            <a href="#" onclick="return OpenPatientPage(<%# Eval("hpRecordID")%>,<%# Eval("PatientID")%>)"><%#Eval("xm")%></a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="性别" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                            <ItemTemplate>
                            <%#DisplayPatientSex((sbyte?)Eval("xb"))%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="年龄" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                            <ItemTemplate>
                            <%#Eval("nl")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="手机号" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                            <ItemTemplate>
                             <%#Eval("sjhm")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="病案号" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                            <ItemTemplate>
                             <%#Eval("bah")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="住院次数" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                            <ItemTemplate>
                            <%#Eval("zycs")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="出院日期" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                            <ItemTemplate>                            
                            <%# Convert.ToDateTime(Eval("cyrq")).ToString("yyyy-MM-dd")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="入院科室" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                            <ItemTemplate>
                            <%#Eval("rykb")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="出院科室" HeaderStyle-Wrap="false" ItemStyle-Wrap="false">
                            <ItemTemplate>
                            <%#Eval("cykb")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="诊断疾病名称" HeaderStyle-Wrap="false">
                            <ItemTemplate>
                            <%#Eval("zyzd")%>
                            </ItemTemplate>
                        </asp:TemplateField>                      
                    </Columns>
                    <PagerSettings PageButtonCount="5" />
                </Chy:XGridView>
            </td>
        </tr>
    </table>
</asp:Content>