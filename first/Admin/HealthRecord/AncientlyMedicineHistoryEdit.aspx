<%@ Page Language="C#" MasterPageFile="~/MainContent.Master" AutoEventWireup="true"
    CodeBehind="AncientlyMedicineHistoryEdit.aspx.cs" Inherits="Chm.Web.Admin.HealthRecord.AncientlyMedicineHistoryEdit" %>

<%@ Register TagPrefix="Chy" Namespace="Chy.UI.Controls" Assembly="Chy.UI.Controls" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/Js/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="../../Scripts/MultiLineLength.js" type="text/javascript"></script>
    <link href="../../../CSS/jquery.autocomplete.css" rel="stylesheet" type="text/css" />
    <script src="/Js/jquery.autocomplete.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            var $Frequency = $("#<%=txtFrequency.ClientID%>");
            $Frequency.autocomplete(
                        {
                            minLength: 0,
                            source: function (request, response) {
                                $.ajax({
                                    url: "CategoryHandler.ashx?data=" + new Date().toString() + "&keyword=" + encodeURI($Frequency.val()) + "&categoryId=39",
                                    dataType: "json",
                                    data: request,
                                    success: function (data) {
                                        response(data);
                                    }
                                });
                            }
                        }).click(function () {
                            if (this.value == "") {
                                $(this).autocomplete('search', '');
                            }
                        })
                    });
        $(function () {
            var $Usage = $("#<%=txtUsage.ClientID%>");
            $Usage.autocomplete(
                        {
                            minLength: 0,
                            source: function (request, response) {
                                $.ajax({
                                    url: "CategoryHandler.ashx?data=" + new Date().toString() + "&keyword=" + encodeURI($Usage.val()) + "&categoryId=40",
                                    dataType: "json",
                                    data: request,
                                    success: function (data) {
                                        response(data);
                                    }
                                });
                            }
                        }).click(function () {
                            if (this.value == "") {
                                $(this).autocomplete('search', '');
                            }
                        })
        });

        $(function () {
            $Unit = $("#<%=txtUnit.ClientID %>");
            $Unit.autocomplete(
            {
                minLength: 0,
                source: function (request, response) {
                    $.ajax({
                        url: "UnitHander.ashx?keyword=" + encodeURI($Unit.val()),
                        dataType: "json",
                        data: request,
                        success: function (data) {
                            response(data);
                        }
                    });
                }
            }).click(function () {
                if (this.value == "") {
                    $(this).autocomplete('search', '');
                }
            })
        });
    </script>
    <style type="text/css">
        .hidden
        {
            display: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
    <table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr>
            <td>
                <div class="con">
                    <div id="tagContent">
                        <div class="tagContent selectTag" id="tagContent0">
                            <table border="0" cellspacing="0" cellpadding="0" class="addformcontainer">
                                <tr>
                                    <td class="warn">
                                        <span style="color: #FF3300">*</span>
                                    </td>
                                    <td class="label">
                                        <Chy:xlabel id="lblPatientName" runat="server" text="姓名" />
                                    </td>
                                    <td class="input">
                                        <Chy:XTextBox id="txtPatientName" runat="server" cssclass="inputtext" maxlength="500">
                                        </Chy:XTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="warn">
                                    </td>
                                    <td class="label">
                                        <Chy:xlabel id="lblIllName" runat="server" text="疾病名称" />
                                    </td>
                                    <td class="input">
                                        <Chy:XTextBox id="txtIllName" runat="server" cssclass="inputtext" maxlength="64"
                                            readonly="false">
                                        </Chy:XTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="warn">
                                        <span style="color: #FF3300">*</span>
                                    </td>
                                    <td class="label">
                                        <Chy:xlabel id="lblMedicineName" runat="server" text="药物名称" />
                                    </td>
                                    <td class="input">
                                        <Chy:XTextBox id="txtMedicineName" runat="server" cssclass="inputtext" maxlength="64">
                                        </Chy:XTextBox>
                                        <input type="button" id="btnSelectMedicine" class="gj_button" value='<%=Chm.Web.HMCommon.GetLanguage("HM_SelectMedicine")%>' />
                                        <input type="hidden" id="ipMhInfoID" value="-1" runat="server" />
                                        <input type="hidden" id="ipMedicineName" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="warn">
                                        <span class="red">&nbsp;</span>
                                    </td>
                                    <td class="label">
                                        <Chy:xlabel id="lblHospital" runat="server" text="医院名称" />
                                    </td>
                                    <td class="input">
                                        <Chy:XTextBox id="txtHospital" runat="server" cssclass="inputtext" maxlength="128">
                                        </Chy:XTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="warn">
                                        <span class="red">&nbsp;</span>
                                    </td>
                                    <td class="label">
                                        <Chy:xlabel id="lblDoctorName" runat="server" text="主治医生" />
                                    </td>
                                    <td class="input">
                                        <Chy:XTextBox id="txtDoctorName" runat="server" cssclass="inputtext" maxlength="64">
                                        </Chy:XTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="warn">
                                        <span>&nbsp;</span>
                                    </td>
                                    <td class="label">
                                        <Chy:xlabel id="lblFrequency" text="" runat="server" />
                                    </td>
                                    <td class="input">
                                        <Chy:XTextBox id="txtFrequency" runat="server" cssclass="inputtext" maxlength="100">
                                        </Chy:XTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="warn">
                                        <span>&nbsp;</span>
                                    </td>
                                    <td class="label">
                                        <Chy:xlabel id="lblMedicineTime" text="" runat="server" />
                                    </td>
                                    <td class="input">
                                        <Chy:XTextBox id="txtMedicineTime" runat="server" cssclass="inputtext" maxlength="64">
                                        </Chy:XTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="warn">
                                        <span>&nbsp;</span>
                                    </td>
                                    <td class="label">
                                        <Chy:xlabel id="lblUsage" text="" runat="server" />
                                    </td>
                                    <td class="input">
                                        <Chy:XTextBox runat="server" id="txtUsage" cssclass="inputtext" maxlength="50"></Chy:XTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="warn">
                                        <span class="red">&nbsp;</span>
                                    </td>
                                    <td class="label">
                                        <Chy:xlabel id="lblDose" runat="server" text="用药剂量" />
                                    </td>
                                    <td class="input">
                                        <Chy:XTextBox id="txtDose" runat="server" cssclass="inputtext" maxlength="32" readonly="false">
                                        </Chy:XTextBox>
                                    </td>
                                </tr>
                                <tr>
                                <td class="warn">
                                        <span class="red">&nbsp;</span>
                                    </td>
                                    <td class="label"><Chy:XLabel ID="lblUnit" Text="用药单位" runat="server"></Chy:XLabel>：</td>
                                    <td class="input">
                                    <Chy:XTextBox id="txtUnit" runat="server" cssclass="inputtext" maxlength="40">
                                        </Chy:XTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="warn">
                                    </td>
                                    <td class="label">
                                        <Chy:xlabel id="lblStartTime" text="用药开始日期" runat="server" />
                                    </td>
                                    <td class="input">
                                        <Chy:xdatepicker id="dpStartTime" maxdate="%y-%M-{%d-1}" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="warn">
                                    </td>
                                    <td class="label">
                                        <Chy:xlabel id="lblEndTime" runat="server" text="用药结束日期" />
                                    </td>
                                    <td class="input">
                                        <Chy:xdatepicker id="dpEndTime" maxdate="%y-%M-{%d-1}" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="warn">
                                        <span class="red">&nbsp;</span>
                                    </td>
                                    <td class="label">
                                        <Chy:xlabel id="lblReaction" runat="server" text="主要不良反应" />
                                    </td>
                                    <td class="input">
                                        <Chy:XTextBox id="txtReaction" name="主要不良反应" runat="server" rows="3" textmode="MultiLine"
                                            cssclass="inputtext" maxlen="512">
                                        </Chy:XTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3" align="center">
                                        <Chy:xbutton id="btnUpdate" runat="server" text="修改" cssclass="button" onclick="btnUpdate_Click" />
                                        <Chy:xbutton id="btnSave" runat="server" text="保存" cssclass="button" onclick="btnSave_Click" />
                                        <span class="space"></span>
                                        <%-- <Chy:XButton ID="btnReturn" runat="server" Text="返回" CssClass="button" 
                                            OnClick="btnReturn_Click" CausesValidation="False" />--%>
                                        <input id="btnReturn" type="button" class="button" value='返回'
                                            onclick="btClick()" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </td>
        </tr>
    </table>
    <div id="selectMedicineDiv" style="background: #fff;">
        <table cellpadding="0" cellspacing="0" width="100%" id="tbAdvance" class="healthPanel">
            <tr>
                <td class="label">
                    <Chy:xlabel id="lblMedicineNameQ" runat="server"></Chy:xlabel>
                </td>
                <td class="input">
                    <input type="text" id="txtMedicineNameQ" class="inputtext" />
                </td>
                <td class="label">
                    <Chy:xlabel id="lblMedicineCodeQ" runat="server"></Chy:xlabel>
                </td>
                <td class="input">
                    <input type="text" id="txtMedicineCodeQ" class="inputtext" />
                </td>
                <td class="input">
                </td>
                <td>
                    <td class="add">
                        <input type="button" id="ipMedicineSearch" class="button" value='查询' />
                    </td>
                </td>
            </tr>
        </table>
        <table class="zebratable" cellspacing="0" rules="all" border="1" id="tbMedichineList"
            style="border-style: Solid; width: 100%; border-collapse: collapse; word-break: break-all;
            word-wrap: break-word">
            <tr class="header">
                <th scope="col" abbr="MhInfoID" style="display: none;">
                    MhInfoID
                </th>
                <th scope="col" abbr="MedicineName">
                    <%=Chy.Web.Resource.GetString("HM_DrugName")%>
                </th>
                <th scope="col" abbr="Mnemocode">
                    <%=Chy.Web.Resource.GetString("HM_MedicineCodes")%>
                </th>
                <th scope="col" abbr="Vender">
                    <%=Chy.Web.Resource.GetString("HM_Manufacturer")%>
                </th>
                <th scope="col" abbr="BatchNumber">
                    <%=Chy.Web.Resource.GetString("HM_LotNo")%>
                </th>
                <th scope="col" abbr="Standard">
                    <%=Chy.Web.Resource.GetString("HM_Specifications")%>
                </th>
                <th scope="col" abbr="Select">
                    选择
                </th>
            </tr>
        </table>
        <table>
            <tr>
                <td align="left">
                    <span id="MedicineSelectorCurrentPageTip"></span><span id="MedicineSelectorPageCountTip">
                    </span>
                </td>
                <td align="right">
                    <a id="MedicineSelectorBtnFirstPage">
                        <%=Chy.Web.Resource.GetString("Remp_FirstPage")%></a> &nbsp<a id="MedicineSelectorBtnPreviousPage"><%=Chy.Web.Resource.GetString("Remp_PreviousPage")%></a>
                    <a id="MedicineSelectorBtnNextPage">
                        <%=Chy.Web.Resource.GetString("Remp_NextPage")%></a> &nbsp<a id="MedicineSelectorBtnLastPage"><%=Chy.Web.Resource.GetString("Remp_LastPage")%></a>
                </td>
            </tr>
            <tr>
                <td>
                    <input id="MedicineSelectorRecordCount" type="hidden" />
                    <input id="MedicineSelectorPageSize" type="hidden" />
                    <input id="MedicineSelectorCurrentPageIndex" type="hidden" />
                    <input id="MedicineSelectorPageCount" type="hidden" />
                </td>
            </tr>
        </table>
        <table width="100%" cellspacing="0">
            <tr>
                <td class="buttons" colspan="2" style="text-align: center">
                    <input class="button" type="button" value='<%=Chy.Web.Resource.GetString("Remp_Close") %>'
                        id="btnCloseSelector" />
                </td>
            </tr>
        </table>
    </div>
    <script type="text/javascript">

        /*************************MedicineSelector class******************************/
        var MedicineSelector = function () {

            var _HeaderKey = ["MhInfoID", "MedicineName", "Mnemocode","Vender","BatchNumber","Standard","Select"];
            var _hiddenKey = "MhInfoID";
            var option = {};
            var _selectEventCallback;

            var PackOption = function () {
                option.CurrentPageIndex = $("#MedicineSelectorCurrentPageIndex").val() == "0" ? "1" : $("#MedicineSelectorCurrentPageIndex").val();
                option.DataSourceUrl = "HealthRecordHandler.ashx" + "?data=" + new Date().toString();
                option.Mnemocode = encodeURI($("#txtMedicineCodeQ").val());
                option.MedichineName = encodeURI($("#txtMedicineNameQ").val());
                option.PageSize = $("#MedicineSelectorPageSize").val();
                option.OrgId = <%=OrgId%>;
            };
            var FindColumnIndex = function (headerKey) {
                var columnIndex;
                for (var i = 0; i < _HeaderKey.length; i++) {
                    if (headerKey == _HeaderKey[i]) {
                        columnIndex = i;
                        break;
                    }
                }
                return columnIndex;
            };
            var AddNewRow = function (data) {
                var $targetTable = $("#tbMedichineList");
                var $newRow = $("<tr></tr>");
                $newRow.attr("RowType", "Content");
                for (var i = 0; i < _HeaderKey.length; i++) {
                    var $newColumn = $("<td></td>");
                    $newColumn.attr("key", _HeaderKey[i]);
                    if (_HeaderKey[i] == _hiddenKey) {
                        $newColumn.attr("class", "hidden");
                    }
                    $newRow.append($newColumn);
                } //添加相应td
                for (columnName in data) {
                    var columnIndex = FindColumnIndex(columnName);
                    var columnObj = $newRow.find("td").eq(columnIndex);
                    columnObj.html(data[columnName]);
                }
                var selectColumnIndex = FindColumnIndex("Select");
                $newRow.find("td").eq(selectColumnIndex).html('<a href="#" style="color:#095998" onclick="MedicineSelector.SelectEvent(this)"><%=Chy.Web.Resource.GetString("Remp_Select") %></a>');
                $targetTable.append($newRow);
            };
            var TableInit = function () {
                var $rowCollection = $("#tbMedichineList [RowType]");
                $.each($rowCollection, function (rowIndex, rowObj) {
                    if ($(rowObj).attr("RowType") == "Content") {
                        $(rowObj).remove();
                    }
                })
            };
            MedicineSelector.DataInit = function (selectEventCallBack) {
                _selectEventCallback = selectEventCallBack;
                //init hidden input
                $("#MedicineSelectorRecordCount").val("0");
                $("#MedicineSelectorPageSize").val("5");
                $("#MedicineSelectorCurrentPageIndex").val("1");
                $("#MedicineSelectorPageCount").val("0");

                //bind Pagination event
                $("#MedicineSelectorBtnFirstPage").bind("click", function () { MedicineSelector.FirstPage(option) });
                $("#MedicineSelectorBtnPreviousPage").bind("click", function () { MedicineSelector.PreviousPage(option) });
                $("#MedicineSelectorBtnNextPage").bind("click", function () { MedicineSelector.NextPage(option) });
                $("#MedicineSelectorBtnLastPage").bind("click", function () { MedicineSelector.LastPage(option) });
            },
            MedicineSelector.DataBind = function () {
                PackOption();
                TableInit();
                $.ajax({
                    type: "POST",
                    url: option.DataSourceUrl,
                    dataType: "json",
                    async: false,
                    data: option,
                    success: function (data) {
                        for (var i = 0; i < data["Datatable"].length; i++) {
                            AddNewRow(data["Datatable"][i]);
                        }
                        if (data["Pagination"] != null) {
                            $("#MedicineSelectorPageSize").val(data["Pagination"]["PageSize"]);
                            $("#MedicineSelectorRecordCount").val(data["Pagination"]["RowCount"]);
                            $("#MedicineSelectorCurrentPageIndex").val(data["Pagination"]["CurrentPageIndex"]);
                            $("#MedicineSelectorPageCount").val(data["Pagination"]["PageCount"]);
                            $("#MedicineSelectorCurrentPageTip").html(data["Pagination"]["CurrentPageIndex"] + "\\");
                            $("#MedicineSelectorPageCountTip").html(data["Pagination"]["PageCount"]);
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                    }
                });
            },
            MedicineSelector.GetRowJson = function (rowObj) {
                var $columnObjCollection = $(rowObj).find("td");
                var json = "{";
                $.each($columnObjCollection, function (columnIndex, columnObj) {
                    if (columnIndex < _HeaderKey.length - 1) {

                        json += $(columnObj).attr("key");
                        json += ":";
                        json += "\'";
                        json += $(columnObj).html().replace("&nbsp;", "");
                        json += "\'";
                        json += ",";
                    }
                });
                json = json.substr(0, json.length - 1);
                json += "}";
                return json;
            },
            MedicineSelector.FirstPage = function () {
                $("#MedicineSelectorCurrentPageIndex").val("1");
                MedicineSelector.DataBind();
            },
            MedicineSelector.PreviousPage = function () {
                var currentPageIndex = parseInt($("#MedicineSelectorCurrentPageIndex").val());

                $("#MedicineSelectorCurrentPageIndex").val(currentPageIndex == 1 ? 1 : currentPageIndex - 1);

                MedicineSelector.DataBind();
            },
            MedicineSelector.NextPage = function () {

                var currentPageIndex = parseInt($("#MedicineSelectorCurrentPageIndex").val());
                var pageCount = parseInt($("#MedicineSelectorPageCount").val());

                $("#MedicineSelectorCurrentPageIndex").val(currentPageIndex != pageCount ? currentPageIndex + 1 : pageCount);

                MedicineSelector.DataBind();
            },
            MedicineSelector.LastPage = function () {

                $("#MedicineSelectorCurrentPageIndex").val($("#MedicineSelectorPageCount").val());

                MedicineSelector.DataBind();
            },
            MedicineSelector.SelectEvent = function (obj) {
                var rowObj = $(obj).parent().parent();
                var json = MedicineSelector.GetRowJson(rowObj);
                _selectEventCallback(json);
            }
        }
         $(document).ready(function () {
             $("#selectMedicineDiv").dialog({
                title:'<%=Chy.Web.Resource.GetString("HM_SelectMedicine")%>',
                bgiframe: true,
                draggable: false,
                autoOpen: false,
                modal: true,
                width: 700,
                height: 400,
                autoHeight: true,
                closeOnEscape: false
            });
             $("#ipMedicineSearch").click(function () {
                MedicineSelector.DataBind();
            });
        });

        var m = new MedicineSelector(); //i don't know why should doing this
        MedicineSelector.DataInit(selectEvent);

        function selectEvent(data) {
            $("#selectMedicineDiv").dialog("close");
            var jsonArray = eval("(" + data + ")");

            $("#<%=ipMhInfoID.ClientID%>").val(jsonArray["MhInfoID"]);
            $("#<%=txtMedicineName.ClientID%>").val(jsonArray["MedicineName"]);
            $("#<%=ipMedicineName.ClientID%>").val(jsonArray["MedicineName"]);
        }

        $("#btnSelectMedicine").click(function () {
            $("#selectMedicineDiv").dialog("open");
            MedicineSelector.DataBind();
        });

         $("#btnCloseSelector").click(function () {
            $("#selectMedicineDiv").dialog("close");
        });
           
        /*************************MedicineSelector class******************************/
    </script>
    <script language="javascript" type="text/javascript">
         jQuery.validator.addMethod('CheckHtml',
        function (value, element) {
            return this.optional(element) || !(/<|>/).test(value);
        },'不能输入特殊字符，如<，>等'); 
            $(document).ready(function(){ 
            var formid= $("form").first()        
            $(formid).validate({
            errorElement:"em",
	 	    //success:function(label){label.text("").addClass("success");},
            rules:{               
                <%=txtIllName.UniqueID %>:{CheckHtml:true},
                <%=txtMedicineName.UniqueID %>:{required:true,CheckHtml:true},
                <%=txtHospital.UniqueID %>:{CheckHtml:true},
                <%=txtDoctorName.UniqueID %>:{CheckHtml:true},
                <%=txtDose.UniqueID %>:{CheckHtml:true}, 
                <%=txtFrequency.UniqueID %>:{CheckHtml:true}, 
                <%=txtMedicineTime.UniqueID %>:{CheckHtml:true}, 
                <%=txtUsage.UniqueID %>:{CheckHtml:true}, 
                <%=txtReaction.UniqueID %>:{CheckHtml:true}
            },
            messages:{
                <%=txtIllName.UniqueID %>:{required:'<%=Chy.Web.Resource.GetString("HM_EmptyMsg")%>'},              
                <%=txtMedicineName.UniqueID %>:{required:'<%=Chy.Web.Resource.GetString("HM_EmptyMsg")%>'},
                <%=dpStartTime.UniqueID %>:{required:'<%=Chy.Web.Resource.GetString("HM_EmptyMsg")%>'},
                <%=dpEndTime.UniqueID %>:{required:'<%=Chy.Web.Resource.GetString("HM_EmptyMsg")%>'}
            },
            errorPlacement:function(error,element){error.appendTo(element.parent());}
        });
         $("#<%=btnSave.ClientID%>").click(function(){
                HandleMhInfoID();
                return CheckDate($("#<%=dpStartTime.ClientID%>").val(),$("#<%=dpEndTime.ClientID%>").val());
            });
           $("#<%=btnUpdate.ClientID%>").click(function(){
                HandleMhInfoID();
                return CheckDate($("#<%=dpStartTime.ClientID%>").val(),$("#<%=dpEndTime.ClientID%>").val());
            });
        });

          function btClick() {
            document.location.href = "AncientlyMedicineHistory.aspx?_pi=<%=Chy.UI.Framework.MemberManager.SelectedId%>"; 
        }

         function HandleMhInfoID()
        {
            if($("#<%=txtMedicineName.ClientID%>").val()!=$("#<%=ipMedicineName.ClientID%>").val())
            {
                $("#<%=ipMhInfoID.ClientID%>").val("-1");
            }
        }

        function CheckDate(beginDate,endDate){
            //转换为日期格式  
            beginDate=beginDate.replace(/-/g,"/");  
   
            //获取结束日期  
            endDate=endDate.replace(/-/g,"/");  
            //如果起始日期大于结束日期  
            if(Date.parse(beginDate)-Date.parse(endDate)>0){  
               alert('用药开始日期不能大于结束日期');
               return false;  
            }
            else{
               return true;
            }  
        }

         $("#btnCloseSelector").click(function () {
            $("#selectMedicineDiv").dialog("close");
        });
    </script>
</asp:Content>
