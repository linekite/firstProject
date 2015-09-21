<%@ Page Language="C#" MasterPageFile="~/MainContent.Master" AutoEventWireup="true"
    CodeBehind="SenSMS.aspx.cs" Inherits="Chm.Web.Admin.CrowdGroup.SendMessage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script language="javascript" type="text/javascript">
        SelectSMSTemp = function () {
            xysShowModal('<%=Chy.Web.Resource.GetString("Remp_SelectTemplate")%>', '/Admin/SMS/SMSTempSelect.aspx?orgid=<%=OrgId%>', 750, 650);
        }
        SetContentVal = function () {
            $("#<%=txtcontent.ClientID %>").val($("#SelTmp").val());
            if ($("#<%=txtcontent.ClientID %>").val() != "") {
                $("[htmlFor='<%=txtcontent.ClientID %>']").hide();
            }
        }
    </script>
    <script language="javascript" type="text/javascript">
    $(document).ready(function(){ 

     jQuery.validator.addMethod('CheckMobiles',
                function(value, element) {
                   var patrn=/^([0-9]|;)*$/; 
                   var ret = patrn.exec(value);
                    if(ret!=null){
                        return true;
                    }
                    return false;
                },
           '<%=Chy.Web.Resource.GetString("Remp_ValidCustomErrorInfo")%>'
            );


      $.validator.setDefaults({
        submitHandler: function(form) 
        {
            if($(formid).validate.cancelSubmit||$(formid).valid())
            {
                form.submit();
            }
        }
        
    });

        var formid= $("form").first();
        $(formid).validate({
            errorElement:"em",
	 	    
            rules:{
                <%=txtcontent.UniqueID %>:{required:true,CheckHtml:true,maxlength:200},
                <%=lblMobile.UniqueID %>:{required:true,CheckHtml:true,CheckMobiles:true}
            },
            messages:{
                <%=txtcontent.UniqueID %>:{required:'<%=Chy.Web.Resource.GetString("Remp_Required") %>',maxlength:'<%=Chy.Web.Resource.GetString("Remp_SMSContentTooLong") %>'},
                <%=lblMobile.UniqueID %>:{required:'<%=Chy.Web.Resource.GetString("Remp_Required") %>'}
            },
            errorPlacement:function(error,element){error.appendTo(element.parent());}
        });

        $("#<%=txtcontent.ClientID %>").change(function () {
            
        });
        
            $("#btnReturn").val('<%=Chy.Web.Resource.GetString("Remp_Return")%>');
         
        $("#<%=btnSend.ClientID %>").click(function () {
                var formid= $("form").first();
                 $(formid).validate.cancelSubmit = false;
        });
             
    }); 

    
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
           
            var dataPost = {

                "OrgId": "<%=OrgId%>",
                "ProjectId": "<%=ProjectId%>",
                "DrId": "<%=DrId %>",
                "Mode": "GetPatient"

            };

            function FullFillPageMassage() {

                var pagination = ts.GetPagination();

                if (pagination.PageIndex == 1 && pagination.PageIndex == pagination.PageCount) {
                    $("#btnFirstPage").attr("disabled", "disabled");
                    $("#btnPreviousPage").attr("disabled", "disabled");
                    $("#btnNextPage").attr("disabled", "disabled");
                    $("#btnLastPage").attr("disabled", "disabled");
                }
                else if (pagination.PageIndex == 1) {
                    $("#btnFirstPage").attr("disabled", "disabled");
                    $("#btnPreviousPage").attr("disabled", "disabled");
                    $("#btnNextPage").removeAttr("disabled");
                    $("#btnLastPage").removeAttr("disabled");
                }
                else if (pagination.PageIndex == pagination.PageCount) {
                    $("#btnFirstPage").removeAttr("disabled");
                    $("#btnPreviousPage").removeAttr("disabled");
                    $("#btnNextPage").attr("disabled", "disabled");
                    $("#btnLastPage").attr("disabled", "disabled");
                }
                else if (pagination.PageIndex != 1 && pagination.PageIndex != pagination.PageCount) {
                    $("#btnFirstPage").removeAttr("disabled");
                    $("#btnPreviousPage").removeAttr("disabled");
                    $("#btnNextPage").removeAttr("disabled");
                    $("#btnLastPage").removeAttr("disabled");
                }
                else if (pagination.PageIndex == 0) {
                    $("#btnFirstPage").attr("disabled", "disabled");
                    $("#btnPreviousPage").attr("disabled", "disabled");
                    $("#btnNextPage").attr("disabled", "disabled");
                    $("#btnLastPage").attr("disabled", "disabled");
                }

                $("#sCurrentPage").html(pagination.PageIndex);

                $("#sTotalPage").html(pagination.PageCount);
            }


            

         
            $("#btnReturn").val('<%=Chy.Web.Resource.GetString("Remp_Return")%>');
            //            $("#addMember").val('<%=Chy.Web.Resource.GetString("Remp_Return")%>');



            $("#btnSubmitDiv").click(function () {
                var PatientIds = ts.GetJsonString("PatientID");

                if (PatientIds == "" || PatientIds == "]") {
                    $("#<%=lblMobile.ClientID%>").val("");
                    $("#addMember").dialog("close");
                    return;
                }

                var list = eval(PatientIds);
                var keys = "";
                var values = "";

                for (var i = 0; i < list.length; i++) {
                    if (list[i] != "") {
                        keys = keys + list[i].PatientID + ",";
                        var keyvalue = list[i].PatientID.split("$");
                        if (keyvalue.length == 2) {
                            values = values + keyvalue[0] + ";";
                        }
                    }
                }

                if (values.length > 0) {
                    values = values.substr(0, values.length - 1);
                }

                document.getElementById("keyvalues").value = keys;

                $("#<%=lblMobile.ClientID%>").val(values);
                $("#addMember").dialog("close");
            });

            $("#btnSubmitCancel").click(function () {
                $("#addMember").dialog("close");
            });

        })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
    <table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr>
            <td>
                <table border="0" cellspacing="0" cellpadding="0" class="formcontainer">
                    <tr>
                        <td class="warn" valign="top" style="padding-top: 6px">
                            <span class="red">*</span>
                        </td>
                        <td class="label" valign="top" style="padding-top: 6px">
                            <Chy:XLabel runat="server" ID="lblMobileTip"><%=Chy.Web.Resource.GetString("Remp_Mobile") + Chy.Web.Resource.GetString("Remp_Colon")%></Chy:XLabel>
                        </td>
                        <td class="input">
                            <Chy:XTextBox runat="server" TextMode="MultiLine" ID="lblMobile" Style="width: 500px;
                                height: 70px"></Chy:XTextBox>
                            <%--<input type="button" id="btnSelectDoc" runat="server" class="button" nmouseover="this.className='hoverbutton'"
                                onmouseout="this.className='button'" />&nbsp;<br />
                            <span>
                                <%=Chy.Web.Resource.GetString("Remp_MultiSMSRecevice")%></span>
                            <input id="lblMobilehidden" runat="server" type="hidden" />--%>
                        </td>
                    </tr>
                   <%-- <tr>
                        <td class="warn" valign="top">
                        </td>
                        <td class="label" valign="top">
                        </td>
                        <td>
                            <asp:FileUpload Style="width: 500px" class="inputtext" runat="server" ID="ExcelFileUploader" />
                            <Chy:XButton runat="server" ID="btnImport" TextKey="Remp_Import" CssClass="cancel button" />
                            <br />
                            <a runat="server" id="aDownLoad">
                                <%=Chy.Web.Resource.GetString("Remp_TelXltDownload")%></a> <span id="msgTagExcelFileUploader"
                                    style="font-style: italic"></span>
                        </td>
                    </tr>--%>
                    <tr>
                        <td class="warn" valign="top">
                            <span class="red">*</span>
                        </td>
                        <td class="label" valign="top">
                            <Chy:XLabel ID="lblContent" runat="server"><%=Chy.Web.Resource.GetString("Remp_SendContent") + Chy.Web.Resource.GetString("Remp_Colon")%></Chy:XLabel>
                        </td>
                        <td class="input" colspan="3">
                            <Chy:XTextBox ID="txtcontent" runat="server" TextMode="MultiLine" Style="width: 500px;
                                height: 80px" CssClass="inputtext"></Chy:XTextBox>
                            <a href="#" onclick="SelectSMSTemp()">
                                <%=Chy.Web.Resource.GetString("Remp_TemplateSelect")%></a>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table width="99%" border="0" cellspacing="0" cellpadding="0" align="center" class="formcontainer">
        <tr>
            <td align="center">
                <Chy:XButton ID="btnSend" runat="server" TextKey="Remp_btnSend" CssClass="button"
                    OnClick="btnSend_Click" />
                <span class="space"></span><span class="space"></span>
            </td>
        </tr>
    </table>
    <input type="hidden" id="keyvalues" name="keyvalues" />
    <input type="hidden" id="SelTmp" />
    <input type="button" id="btnAssignment" onclick="javascript:SetContentVal()" style="display: none" />
</asp:Content>
