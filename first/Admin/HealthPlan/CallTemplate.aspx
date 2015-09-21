<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CallTemplate.aspx.cs" Inherits="Chm.Web.Admin.HealthPlan.CallTemplate"  MaintainScrollPositionOnPostBack="true"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../../zTree-3.0/js/jquery-1.4.4.min.js" type="text/javascript"></script>
    <link href="../../Styles/commonhp.css" rel="stylesheet" type="text/css" />
    <link href="../../Styles/fz.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../Scripts/layout.js"></script>
    <script src="/Js/jquery-ui-1.8.11.custom.min.js" type="text/javascript"></script>
    <script src="/Js/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">

        alertMsg = function (msg, title, width, height, url) {
            alert(msg);
            return false;
        }

        function SelectSingleCK(obj) {
            if ($(obj).attr("checked") == true) {
                $("#<%=gvCheckItem.ClientID %> :radio").not(":disabled").attr("checked", !$(obj).attr("checked"));
                $(obj).attr("checked", true);
            }
        }

        function selectTemplateTag(selfObj, type) {
            // 操作标签

            $('#<%=hidTreeType.ClientID %>').val(type);

            var tag = document.getElementById("sec_tags").getElementsByTagName("li");
            var taglength = tag.length;
            for (i = 0; i < taglength; i++) {
                tag[i].className = "";
            }
            //selfObj.parentNode.className = "selectTag";
            //            $('#<%=refreshGv.ClientID %>').click();

            $('#<%=refreshTree.ClientID %>').click();
            $('#<%=txtTitle.ClientID %>').val();
            
//            if (type == 1)
//                $("#li1").addClass("selectTag");
//            else
//                $("#li2").addClass("selectTag");
            
        }



        function SelectTemplate() {

            var checkedCK = $('#<%=gvCheckItem.ClientID %> input:checked');
            if (checkedCK.length < 1) {
                alert('至少选择一个信息模板');
                return false;
            }
            var checkedInfo = "";
            $('#<%=gvCheckItem.ClientID %> input:checked').not('input[id=chkSelAll]').each(function () {
                checkedInfo += $.trim($(this).parent().parent().nextAll().last().find('#Hidcontent').text());
            });
            parent.document.getElementById("" + parent.document.getElementById('FocusInput').value + "").value = parent.document.getElementById("" + parent.document.getElementById('FocusInput').value + "").value+checkedInfo;
            parent.window.closeDiv();
        }


        function UpateGroupID(Id) {           
            $("#<%=divScrollValue.ClientID %>").val(document.getElementById("divTree").scrollTop);  
            $('#<%=hidGroupId.ClientID %>').val(Id);
            $('#<%=refreshGv.ClientID %>').click();
            document.getElementById("divTree").scrollTop = $("#<%=divScrollValue.ClientID %>").val();
        }

        $(document).ready(function () {
            //alert("test");
            //$("#li1").addClass("selectTag");
            var type = $('#<%=hidTreeType.ClientID %>').val();
            $("#li" + type).addClass("selectTag");
        });       
    </script>
    <style type="text/css">
        .button{background-position:0 -192px; height:22px; border:#3375a1 1px solid; padding:2px 10px; *overflow: visible; cursor:pointer;background:url(../../images/sf_sg.gif) no-repeat center top;  width:54px; height:25px; font-size:12px; border:0px; line-height:25px; cursor:pointer;}
    </style>
</head>
<body style="width: 100%; height: 480px; background-color:#FEFEFE">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <input runat="server" id="divScrollValue" type="hidden" value="" /> 
    <div style="width: 100%; height: 440px">
        <table width="99%" border="0" cellspacing="0" cellpadding="0" align="center" style="margin-top: 10px;">
            <tr>
                <td>
                    <div class="con">
                        <ul id="sec_tags" class="tags">
                            <li id="li1"> 
                               <a onclick="selectTemplateTag(this,1)" href="javascript:void(0)">疾病信息模板库</a></li>
                            <li id="li2">
                            <a onclick="selectTemplateTag(this,2)" href="javascript:void(0)">
                                公共信息模板库</a>
                            </li>                           
                        </ul>
                        <div id="tagContent">
                            <div class="tagContent selectTag" id="MsgTemplate">
<%--                                <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                    <ContentTemplate>--%>
                                        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="23%" valign="top">
                                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                                      <Triggers>
                                                      <asp:PostBackTrigger ControlID="btnSearch" />
                                                      </Triggers>
                                                        <ContentTemplate>
                                                            <table width="99%" cellpadding="0" cellspacing="0" class="searchPanel" align="center" id="tbSearch" runat="server">
                                                                <tr>
                                                                    <td>
                                                                        <table cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td class="input">
                                                                                    <Chy:XTextBox ID="txtTitle" runat="server" class="inputtext" MaxLength="25" Width="110"></Chy:XTextBox>
                                                                                </td>
                                                                                <td class="input">
                                                                                    <Chy:XButton ID="btnSearch" runat="server" Text='查询' CssClass="button" OnClick="btnSearch_Click" />
                                                                                    <%-- 类型ID--%>
                                                                                    <%--<input type="hidden" id="hidMsgTypeID" value="" name="hidMsgTypeID" />--%>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <div style="margin-top: 10px; border: solid 1px #d7d7d7; overflow: scroll; width: 180px;
                                                                height: 345px" class="fz_template" id="divTree">
                                                                <Chy:XTreeView ID="tvType" runat="server" Width="100%" ShowLines="false" BorderColor="Transparent"
                                                                    BackColor="Transparent" SelectedNodeStyle-BackColor="Cyan">
                                                                </Chy:XTreeView>
                                                            </div>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </td>
                                                <td align="center" valign="top">
                                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                        <ContentTemplate>
                                                            <Chy:XGridView ID="gvCheckItem" runat="server" CssClass="zebratable" AllowPaging="true"
                                                                Width="99%" DataKeyNames="TID" AutoGenerateColumns="False" PagerSettings-PageButtonCount="8"
                                                                PageSize="8" HorizontalAlign="Center"  OnBindCstm="gvCheckItem_BindCstm">
                                                                <Columns>
                                                                    <asp:TemplateField HeaderStyle-CssClass="check" ItemStyle-Width="10" FooterStyle-HorizontalAlign="Left">                                                                   
                                                                        <ItemTemplate>
                                                                            <asp:RadioButton ID="chkSelItem" name="chk" runat="server" onclick="SelectSingleCK(this)" />
                                                                            <%--<asp:CheckBox ID="chkSelItem" name='chk' runat="server" onclick="SelectSingleCK(this)" />--%>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField ShowHeader="true" HeaderText="建议内容">
                                                                        <ItemTemplate>
                                                                           <label title='<%#Eval("TContent").ToString().Replace("<br/>", "\r\n")%>'><%#Eval("TContent").ToString().Replace("<br/>", " ").Replace("&nbsp;", " ").Length > 25 ? Eval("TContent").ToString().Replace("<br/>", " ").Replace("&nbsp;", " ").Substring(0, 25) + "..." : Eval("TContent").ToString().Replace("<br/>", " ").Replace("&nbsp;", " ")%></label>
                                                                          <%-- <label  id="Hidcontent" style=" display:none" ><%#Eval("TContent").ToString()%></label>--%>
                                                                           <textarea id="Hidcontent" rows="1" cols="1"  style=" display:none" ><%#Eval("TContent").ToString().Replace("<br/>", "\r\n")%></textarea>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    
                                                                </Columns>
                                                            </Chy:XGridView>
                                                            <asp:HiddenField ID="hidGroupId" runat="server" Value="0" />
                                                           <%-- <asp:HiddenField ID="hidGvList" runat="server" Value="2" />--%>
                                                            <Chy:XButton ID="refreshGv" runat="server" CssClass="button" Style="display: none"
                                                                OnClick="refreshGv_Click" />
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                    <div style="width: 100%; text-align: right; padding-right: 10px; padding-top: 10px;
                                                        height: 20px">
                                                        <input type="button" id="btnOK" class="button" value="确定" onclick="SelectTemplate()" />
                                                        <Chy:XButton ID="refreshTree" runat="server" CssClass="button" OnClick="refreshTree_Click"
                                                            Style="display: none" />
                                                        <%-- 模板类型--%>
                                                        <asp:HiddenField ID="hidTreeType" runat="server" Value="1" />
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
<%--                                    </ContentTemplate>
                                </asp:UpdatePanel>--%>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
