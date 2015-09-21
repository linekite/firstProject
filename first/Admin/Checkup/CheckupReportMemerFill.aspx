<%@ Page Title="体检报告录入" Language="C#" MasterPageFile="~/AmMainContent.Master" AutoEventWireup="true"
    CodeBehind="CheckupReportMemerFill.aspx.cs" Inherits="Chm.Web.Admin.Checkup.CheckupReportMemerFill" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../../Scripts/CheckUp.js" type="text/javascript"></script>
    <script src="../../Scripts/MultiLineLength.js" type="text/javascript"></script>
    <link href="../../Styles/Common.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" language="javascript">
        function CloseItemDialg() {
            $('div').dialog('close');
            window.location = window.location;
        }

        function AdjustSize1() {
            var classid = $("#<%=txtCheckClassID.ClientID %>")[0].value;
            //通过选择的组合项id判断当前那个组合项要删除
            var spans = $("table tr th span[id$=lblClassID]");
            for (i = 0; i < spans.length; i++) {
                if ($(spans[i]).html() == classid) {
                    if ($(spans[i]).parent().parent().next().find("td :checkbox[id$=cbItemAll]").attr("checked")) {
                        ///删除结尾的空白行
                        $(spans[i]).parent().parent().next().next().next().remove();
                        ///删除小结
                        $(spans[i]).parent().parent().next().next().remove();
                        ///删除所有的小项
                        $(spans[i]).parent().parent().next().remove();
                        ///删除当前的标题项
                        $(spans[i]).parent().parent().remove();
                    }
                    else {
                        var tr = $(spans[i]).parent().parent().next().find("table tr");
                        //删除行必须要从后向前删除，否则tableindex会改变。第0行是标题，不用循环
                        for (j = tr.length - 1; j > 0; j--) {
                            if ($(tr[j]).find("td :checkbox[id$=cbItem]").attr("checked")) {
                                $(tr[j]).remove();
                            }
                        }
                    }
                    break;
                }
            }

            var obj = parent.document.getElementById('main_iframe');
            if (obj != null) {
                obj.height = document.body.scrollHeight;
            }
        }

        function locationLoad(url) {
            window.open(url, '_blank');
        }

        //判断是否可以删除
        function GetClassRecID(o) {
            if ($(o).parent().parent().next().find("td :checkbox[id$=cbItemAll]").attr("checked")) {
                $("#<%=txtCheckClassID.ClientID %>").val($(o).parent().parent().find("TH span[id$=lblClassID]").html());
                if (confirm('<%= Chy.Web.Resource.GetString("HM_0042")%>')) {
                    $.ajax({
                        type: "POST",
                        url: "/hc/Common/RmomsDiret.asmx/DeleteCheckupClassRecord",
                        data: "&CheckClassID=" + $(o).parent().parent().find("TH span[id$=lblClassID]").html(),
                        success: function (data, status) {
                            if (status == "success") {
                                AdjustSize1();
                                return false;
                            }
                        }
                    });
                }
                return false;
            }
            else {
                var cbItem = $(o).parent().parent().next().find("td :checkbox[id$=cbItem]");
                var isSelected = false;
                var ItemIDs = "";
                for (var i = 0; i < cbItem.length; i++) {
                    if (cbItem[i].checked) {
                        isSelected = true;
                        ItemIDs = ItemIDs + $(cbItem[i]).parent().parent().find("td span[id$=lblItemRecordID]").html() + "|";
                    }
                }
                if (isSelected == true) {
                    $("#<%=txtCheckClassID.ClientID %>").val($(o).parent().parent().find("TH span[id$=lblClassID]").html());
                    if (confirm('<%= Chy.Web.Resource.GetString("HM_0042")%>')) {
                        $.ajax({
                            type: "POST",
                            url: "/hc/Common/RmomsDiret.asmx/DeleteCheckupItemRecordList",
                            data: "&ItemIDs=" + ItemIDs,
                            success: function (data, status) {
                                if (status == "success") {
                                    AdjustSize1();
                                    return false;
                                }
                            }
                        });
                    }
                    return false;
                }
                alertMsg('请选择要删除的项', '提示', 400, 200, '');
                return false;
            }
            return false;
        }

        function OpenClassSelect() {
            var url = "CheckClassSelect.aspx?checkRptID=" + $("#<%=txtCheckrptID.ClientID %>")[0].value;
            $("<div style='width:100%;height:400px' id='divchooseFrame'><iframe  scrolling='auto' width='100%' height='100%'  frameborder=0  id='ChooseFrame' src='" + url + "' /></div>").dialog({ autoOpen: true, width: 660, height: 380, showTitle: false, modal: true, position: [50, 150], title: '选择组合项目' });
        }

        var addTable;
        function AddCheckItemRecord(o) {
            addTable = $(o).parent().parent().next().find("table");
            var url = "CheckItemSelectAm.aspx?ClassRecID=" + $(o).parent().parent().find("TH span[id$=lblClassID]").html() + "&checkRptID=" + $.trim($(o).parent().parent().find("TH").eq(1).text());
            //alert(url);
            $("<div style='width:100%;height:500px' id='divchooseFrame'><iframe  scrolling='auto' width='100%' height='100%'  frameborder=0  id='ChooseFrame' src='" + url + "' /></div>").dialog({ autoOpen: true, width: 660, height: 500, showTitle: false, modal: true, position: [50, 150], title: '选择小项' });
        }

        ///添加小项的
        function refushWindow(Item) {
            $('div').dialog('close');
            if (addTable != undefined && Item != undefined) {
                //行号是从0开始，故要减一
                var rowCount = addTable.find("tr").length - 1;

                ItemRecordID = Item.ItemRecordID.split("|");
                ClassRecID = Item.ClassRecID.split("|");
                ItemName = Item.ItemName.split("|");
                Result = Item.Result.split("|");
                Units = Item.Units.split("|");
                ReRange = Item.ReRange.split("|");
                Tips = Item.Tips.split("|");
                for (i = 0; i < ItemRecordID.length; i++) {
                    var rowCountName = rowCount + 1; //行的数量等于原数量加1
                    if (rowCountName < "10")
                        rowCountName = "0" + rowCountName;

                    var rowInfo = '<tr><td style="display: none">' +
                '<span id="ctl00_MainlaceHolder_rptCheckClassRecord_ctl00_rptProject_ctl' + rowCountName + '_lblItemRecordID">' + ItemRecordID[i] + '</span>' +
                '</td>' +
                '<td style="display: none">' + ClassRecID[i] +
                    '</td>' +
                '<td>' +
                    '<input id="ctl00_MainlaceHolder_rptCheckClassRecord_ctl00_rptProject_ctl' + rowCountName + '_cbItem" type="checkbox" name="ctl00$MainlaceHolder$rptCheckClassRecord$ctl00$rptProject$ctl' + rowCountName + '$cbItem" />' +
                '</td>' +
                '<td>' +
                    '<input name="ctl00$MainlaceHolder$rptCheckClassRecord$ctl00$rptProject$ctl' + rowCountName + '$txtItemName" type="text" value="' + ItemName[i] + '" maxlength="32" id="ctl00_MainlaceHolder_rptCheckClassRecord_ctl00_rptProject_ctl' + rowCountName + '_txtItemName" class="inputtext" style="width:100px;" />' +
                '</td>' +
                '<td>' +
                    '<input name="ctl00$MainlaceHolder$rptCheckClassRecord$ctl00$rptProject$ctl' + rowCountName + '$txtResult" value="' + Result[i] + '"  type="text" maxlength="32" id="ctl00_MainlaceHolder_rptCheckClassRecord_ctl00_rptProject_ctl' + rowCountName + '_txtResult" class="inputtext" style="width:120px;" />' +
                '</td>' +
                '<td>' +
                    '<input name="ctl00$MainlaceHolder$rptCheckClassRecord$ctl00$rptProject$ctl' + rowCountName + '$txtUnit" type="text" value="' + Units[i] + '" maxlength="8" id="ctl00_MainlaceHolder_rptCheckClassRecord_ctl00_rptProject_ctl' + rowCountName + '_txtUnit" class="inputtext" style="width:80px;" />' +
                '</td>' +
                '<td>' +
                    '<input name="ctl00$MainlaceHolder$rptCheckClassRecord$ctl00$rptProject$ctl' + rowCountName + '$txtreRange" type="text" value="' + ReRange[i] + '" maxlength="21" id="ctl00_MainlaceHolder_rptCheckClassRecord_ctl00_rptProject_ctl' + rowCountName + '_txtreRange" class="inputtext" style="width:100px;" />' +
                '</td>' +
                '<td>' +
                    '<input name="ctl00$MainlaceHolder$rptCheckClassRecord$ctl00$rptProject$ctl' + rowCountName + '$txttips" type="text" value="' + Tips[i] + '" maxlength="8" id="ctl00_MainlaceHolder_rptCheckClassRecord_ctl00_rptProject_ctl' + rowCountName + '_txttips" class="inputtext" />' +
                '</td></tr>';
                    $(rowInfo).insertAfter(addTable.find("tr:eq(" + rowCount + ")"));
                    rowCount++;
                }
                var obj = parent.document.getElementById('main_iframe');
                if (obj != null) {
                    obj.height = document.body.scrollHeight;
                }
            }
        }

        function DownAndUp(o) {
            var tr = $(o).parent().parent().next();
            if (tr[0].style.display != "none") {
                tr.css("display", "none");
                $(o).attr("src", "../../Image/arrow_large_down.gif");
                AdjustSize1();
            }
            else {
                tr.css("display", "");
                $(o).attr("src", "../../Image/arrow_large_up.gif");
                AdjustSize1();
            }
        }
        
    </script>
    <style type="text/css">
        .t_ss
        {
            background-image: url(../../images/asdftt.jpg);
            background-repeat: repeat-x;
            background-position: bottom;
        }
        #con
        {
            font-size: 12px;
            margin: 0px auto;
            width: 742px;
        }
        #tagss
        {
            padding-right: 0px;
            padding-left: 0px;
            padding-bottom: 0px;
            margin: 0px 0px 0px 0px;
            width: 742px;
            padding-top: 0px;
            height: 31px;
        }
        #tagss LI
        {
            font-size: 12px;
            font-weight: bold;
            background: url(../../images/tnbleft.gif) no-repeat left bottom;
            float: left;
            margin-right: 1px;
            list-style-type: none;
            height: 31px;
        }
        #tagss LI A
        {
            padding-right: 20px;
            padding-left: 20px;
            background: url(../../images/tnbright.gif) no-repeat right bottom;
            float: left;
            padding-bottom: 0px;
            color: #023d5f;
            line-height: 31px;
            padding-top: 0px;
            height: 31px;
            text-decoration: none;
        }
        #tagss LI.emptyTag
        {
            background: none transparent scroll repeat 0% 0%;
            width: 4px;
        }
        #tagss LI.selectTag
        {
            background-position: left top;
            margin-bottom: -2px;
            position: relative;
            height: 31px;
        }
        #tagss LI.selectTag A
        {
            background-position: right top;
            color: #023d5f;
            line-height: 31px;
            height: 31px;
        }
        .tagContent
        {
            width: 740px;
            color: #474747;
            height: 100%;
        }
        #tagContent DIV.selectTag
        {
            display: block;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
    <div id="con">
        <ul id="tagss" class="t_ss">
            <li><a onclick="TagClick();return false;" href="javascript:void(0)">基本信息</a>
            </li>
            <li class="selectTag"><a href="javascript:void(0)">体检组合项</a> </li>
        </ul>
        <div id="tagContent" style="width:740px;">
            <div class="tagContent selectTag">
                <div class="tablecontainer">
                    <table cellspacing="1" cellpadding="1" width="100%" align="center">
                        <tr>
                            <td class="tata" width="10%">
                                <Chy:XLabel ID="lblSummarize" runat="server"></Chy:XLabel>
                            </td>
                            <td align="left" class="tbtb" width="90%">
                                <asp:TextBox ID="txtSummarize" Text='<%# Eval("summarize")%>' Rows="5" Width="650px"
                                    TextMode="MultiLine" runat="server" MaxLen="2048" CssClass="inputarea"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="tata" width="10%">
                                <Chy:XLabel ID="lblAdvice" runat="server"></Chy:XLabel>
                            </td>
                            <td align="left" class="tbtb">
                                <asp:TextBox ID="txtAdvice" Text='<%# Eval("advice")%>' Rows="5" TextMode="MultiLine"
                                    Width="650px" runat="server" MaxLen="2048" CssClass="inputarea"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="3">
                                <asp:Button ID="btnSave" CssClass="long_l_button" runat="server" Text="保存综述建议" OnClick="Button1_Click" />
                            </td>
                        </tr>
                    </table>
                    <div class="tablecontainer">
                        <table cellspacing="2" cellpadding="2" width="99%">
                            <tr>
                                <td class="label" width="20%">
                                    <Chy:XLabel ID="lblClassName" runat="server"></Chy:XLabel>
                                </td>
                                &nbsp;
                                <td align="left" class="input">
                                    <span>
                                        <asp:TextBox ID="txtClassName" runat="server" CssClass="inputtext" MaxLength="28"></asp:TextBox><asp:TextBox
                                            ID="txtClassID" runat="server" Style="display: none"></asp:TextBox><asp:ImageButton
                                                ID="imgAddClass" runat="server" ImageUrl="/Images/addaa.gif" OnClick="imgAddClass_Click" />
                                        &nbsp;<img alt='' runat="server" id="ImgClassName" src="../../Image/search.png" style="cursor: hand"
                                            onclick="OpenClassSelect();" /></span>
                                </td>
                                <td align="left">
                                </td>
                            </tr>
                        </table>
                    </div>
                    <table cellspacing="1" cellpadding="1" width="99%" >
                        <tr>
                            <td>
                                <asp:Panel ID="UpdatePanel2" runat="server" UpdateMode="Conditional" CssClass="demolargetable">
                                    <table id="rptCheckTable" width="100%" border="0px" cellspacing="0" cellpadding="0px"
                                        class="zebratable">
                                        <asp:Repeater ID="rptCheckClassRecord" runat="server" OnItemDataBound="rptCheckClassRecord_ItemDataBound">
                                            <ItemTemplate>
                                                <tr align="center">
                                                    <th style="display: none" colspan="2">
                                                        <asp:HiddenField ID="TEst" runat="server" Value="" />
                                                        <Chy:XLabel ID="lblClassID" runat="server" Text='<%# Eval("classRecID")%>'></Chy:XLabel>
                                                    </th>
                                                    <th style="display: none" colspan="2">
                                                        <%# Eval("checkRptID")%>
                                                    </th>
                                                    <th style="width: 290px; line-height: 30px" colspan="2">
                                                        <span style="font-weight: bold; text-align: center; color: #006699">
                                                            <%# Eval("ClassName")%></span>
                                                    </th>
                                                    <th align="center" style="line-height: 30px;" colspan="1">
                                                        <span style="font-weight: bold; text-align: center; color: #006699">
                                                            检查医生 + Chy.Web.Resource.GetString("Remp_Colon")%></span><span
                                                                style="font-weight: bold; text-align: center; color: #006699"><asp:TextBox ID="txtResult"
                                                                    Text='<%# Eval("doctor")%>' Width="180px" runat="server" MaxLength="20" CssClass="inputtext"></asp:TextBox></span>
                                                    </th>
                                                    <th align="center" style="width: 160px; text-align: right; cursor: pointer; padding-right: 5px;
                                                        line-height: 30px;" colspan="2">
                                                        <asp:Label ID="lblAddSmall" runat="server" Text="" Font-Underline="true" Style="color: #095998;"
                                                            onclick="AddCheckItemRecord(this);"></asp:Label>
                                                        <asp:LinkButton ID="btnDelete" runat="server" OnClientClick="return GetClassRecID(this);">删除</asp:LinkButton>
                                                        <img id="imgdown" style="cursor: pointer" src="../../Image/arrow_large_up.gif" onclick="DownAndUp(this);" />
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <td colspan="5">
                                                        <table width="100%" border="1px" cellspacing="1px" cellpadding="3px" class="zebratable">
                                                            <asp:Repeater ID="rptProject" runat="server" OnItemDataBound="rptProject_ItemDataBound">
                                                                <HeaderTemplate>
                                                                    <tr class="header" align="center">
                                                                        <th style="display: none">
                                                                            <%# Eval("itemRecordID")%>
                                                                        </th>
                                                                        <th style="display: none">
                                                                            <%# Eval("ClassRecID")%>
                                                                        </th>
                                                                        <th width="10px">
                                                                            <asp:CheckBox ID="cbItemAll" runat="server" />
                                                                        </th>
                                                                        <th style="width: 20%">
                                                                            项目名称
                                                                        </th>
                                                                        <th style="width: 20%">
                                                                            检查结果
                                                                        </th>
                                                                        <th style="width: 20%">
                                                                            单位
                                                                        </th>
                                                                        <th style="width: 20%">
                                                                            参考范围
                                                                        </th>
                                                                        <th style="width: 20%">
                                                                            提示
                                                                        </th>
                                                                    </tr>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <tr class="normal" align="center">
                                                                        <td style="display: none">
                                                                            <Chy:XLabel ID="lblItemRecordID" runat="server" Text='<%# Eval("itemRecordID")%>'></Chy:XLabel>
                                                                        </td>
                                                                        <td style="display: none">
                                                                            <%# Eval("ClassRecID")%>
                                                                        </td>
                                                                        <td>
                                                                            <asp:CheckBox ID="cbItem" runat="server" />
                                                                        </td>
                                                                        <td>
                                                                            <asp:TextBox ID="txtItemName" Text='<%# Eval("ItemName")%>' runat="server" MaxLength="32"
                                                                                Width="100px" CssClass="inputtext"></asp:TextBox>
                                                                        </td>
                                                                        <td>
                                                                            <asp:TextBox ID="txtResult" Text='<%# Eval("Result")%>' runat="server" MaxLength="32"
                                                                                Width="120px" CssClass="inputtext"></asp:TextBox>
                                                                        </td>
                                                                        <td>
                                                                            <asp:TextBox ID="txtUnit" Text='<%# Eval("Unit")%>' runat="server" MaxLength="8"
                                                                                Width="80px" CssClass="inputtext"></asp:TextBox>
                                                                        </td>
                                                                        <td>
                                                                            <asp:TextBox ID="txtreRange" Text='<%# Eval("reRange")%>' runat="server" MaxLength="21"
                                                                                Width="100px" CssClass="inputtext"></asp:TextBox>
                                                                        </td>
                                                                        <td>
                                                                            <asp:TextBox ID="txttips" Text='<%# Eval("tips")%>' runat="server" MaxLength="8"
                                                                                CssClass="inputtext"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                </FooterTemplate>
                                                            </asp:Repeater>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th style="width: 100%; height: 40px;" colspan="6">
                                                        <table border="0" cellspacing="0" cellpadding="0" width="100%" style="margin-top: 10px;"
                                                            class="addformcontainer">
                                                            <tr>
                                                                <td style="font-weight: bold; text-align: center; color: #006699;">
                                                                    <%= 小结 + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <asp:TextBox ID="txtSummary" Text='<%# Eval("summary")%>' Rows="3" TextMode="MultiLine"
                                                                        Width="400px" runat="server" MaxLen="512" CssClass="inputarea"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <td height="20px" colspan="6">
                                                    </td>
                                                </tr>
                                                <!---->
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <%if (rptCheckClassRecord.Items.Count == 0)
                                                  { %>
                                                <tr align="center">
                                                    <td align="center" class="GridViewNoData" colspan="2">
                                                       暂时没有数据
                                                    </td>
                                                </tr>
                                                <%} %>
                                            </FooterTemplate>
                                        </asp:Repeater>
                                    </table>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:Button ID="btnSaveInfo" runat="server" Text="提交" CssClass="button" OnClick="btnSaveInfo_Click"
                                    OnClientClick="return GetClassAndItemInfo()" />
                                <asp:Button ID="btnAduit" CssClass="long_l_button" runat="server" Text="生成报告" OnClick="btnAduit_Click"
                                    OnClientClick="GetClassAndItemInfo(); return confirm('生成报告后，体检信息将不能再被修改!');" />
                                <asp:Button ID="btnReturn" CssClass="button" runat="server" Text="返回" OnClick="Button2_Click" />
                            </td>
                        </tr>
                    </table>
                </div>
                <div title="选择组合项目" id="addNewCheckClass" style="display: none">
                </div>
                <div id="Div1" style="display: none">
                    <asp:Button ID="btnsubmit" runat="server" OnClick="btnSubmit_Click" />
                    <input type="text" id="txtid" runat="server" />
                    <input type="text" id="txtnewid" runat="server" />
                    <input type="text" id="txtCheckClassID" runat="server" />
                    <input type="text" id="txtCheckItemID" runat="server" />
                    <input type="text" id="txtCheckrptID" runat="server" />
                    <input type="text" id="txtDateXml" runat="server" />
                    <asp:Button ID="btnAdd" runat="server" />
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            $("td :checkbox[id$='cbItemAll']").click(function () {
                $(this).parent().parent().nextAll().find("td :checkbox[id$=cbItem]").attr("checked", $(this).attr("checked"));
            });
            var obj = parent.document.getElementById('main_iframe');
            if (obj != null) {
                obj.height = document.body.scrollHeight;
            }
        });
        ///<xml><class id='id'><dot>doctor</dot><summ>Summary</summ></class><item id='id'><name>name</name><result>result</result><unit>unit</unit><rang>rang</rang><tip>tip</tip></item></xml>
        function GetClassAndItemInfo() {
            var ClassInfo = $("#rptCheckTable>tbody>tr");
            for (i = 0; i < ClassInfo.length; i = i + 4) {
                var TEst = $(ClassInfo[i]).find("th :input[id$='TEst']");
                var info = "<xml>";
                var classinfo = "<class id='" + $.trim($(ClassInfo[i]).find("th span[id$='lblClassID']").html().replace(/</g, "lg2;").replace(/>/g, "lt2;")) + "'>";
                classinfo = classinfo + "<dot>" + $.trim($(ClassInfo[i]).find("th :input[id$='txtResult']").val().replace(/</g, "lg2;").replace(/>/g, "lt2;")) + "</dot>" + "<summ>" + $.trim($(ClassInfo[i + 2]).find("th :input[id$='txtSummary']").val().replace(/</g, "&lg2;").replace(/>/g, "&lt2;")) + "</summ>" + "</class>";
                var itemTable = $(ClassInfo[i + 1]).find("td table tr");
                var itemInfo = "";
                ///去掉第一行的标头
                for (j = 1; j < itemTable.length; j++) {
                    itemInfo = itemInfo + "<item id='" + $.trim($(itemTable[j]).find("td span[id$='lblItemRecordID']").html().replace(/</g, "lg2;").replace(/>/g, "lt2;")) + "'>";
                    itemInfo = itemInfo + "<name>" + $.trim($(itemTable[j]).find("td :input[id$='ItemName']").val().replace(/</g, "lg2;").replace(/>/g, "&lt2;")) + "</name>";
                    itemInfo = itemInfo + "<result>" + $.trim($(itemTable[j]).find("td :input[id$='Result']").val().replace(/</g, "lg2;").replace(/>/g, "lt2;")) + "</result>";
                    itemInfo = itemInfo + "<unit>" + $.trim($(itemTable[j]).find("td :input[id$='Unit']").val().replace(/</g, "lg2;").replace(/>/g, "lt2;")) + "</unit>";
                    itemInfo = itemInfo + "<rang>" + $.trim($(itemTable[j]).find("td :input[id$='reRange']").val().replace(/</g, "lg2;").replace(/>/g, "lt2;")) + "</rang>";
                    itemInfo = itemInfo + "<tip>" + $.trim($(itemTable[j]).find("td :input[id$='tips']").val().replace(/</g, "lg2;").replace(/>/g, "lt2;")) + "</tip>";
                    itemInfo = itemInfo + "</item>";
                }
                TEst.val((info + classinfo + itemInfo + "</xml>").replace(/</g, "&lg;").replace(/>/g, "&lt;"));
            }
            return true;
        }

        function TagClick() {
            window.location = 'CheckupReportMemerEdit.aspx?Type=Edit&CheckRepID=<%=Request.QueryString["CheckRepID"].ToString()%>&rnt=' + Math.random();
        }
        var obj = parent.document.getElementById('main_iframe');
        if (obj != null) {
            obj.height = document.body.scrollHeight;
        }
    </script>
</asp:Content>
