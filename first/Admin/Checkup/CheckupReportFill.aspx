<%@ Page Language="C#" MasterPageFile="~/MainContent.Master" AutoEventWireup="true"
    ValidateRequest="false" CodeBehind="CheckupReportFill.aspx.cs" Inherits="Chm.Web.Admin.Checkup.CheckupReportFill" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../../Scripts/CheckUp.js" type="text/javascript"></script>
    <script src="../../Scripts/MultiLineLength.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">
        function CloseItemDialg() {
            $('div').dialog('close');            
            window.location.href = window.location.href;
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


                        //var tr = $(spans[i]).parent().parent().next().find("table tr");
                        //删除行必须要从后向前删除，否则tableindex会改变。第0行是标题，不用循环
                        //for (j = tr.length - 1; j > 0; j--) {
                          //  if ($(tr[j]).find("td :checkbox[id$=cbItem]").attr("checked")) {
                          //      $(tr[j]).remove();
                           // }
                       // }

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
                alertMsg('<%=Chy.Web.Resource.GetString("HM_0131") %>', '<%=Chy.Web.Resource.GetString("HM_0018") %>', 400, 200, '');
                return false;
            }
            return false;
        }

        function OpenClassSelect() {
            var url = "CheckClassSelect.aspx?checkRptID=" + $("#<%=txtCheckrptID.ClientID %>")[0].value + "&_pi=<%=Chy.UI.Framework. MemberManager. SelectedId%>";
            $("<div style='width:100%;height:400px' id='divchooseFrame'><iframe  scrolling='auto' width='100%' height='100%'  frameborder=0  id='ChooseFrame' src='" + url + "' /></div>").dialog({ autoOpen: true, width: 660, height: 490, showTitle: false, modal: true, title: '<%= Chy.Web.Resource.GetString("HM_0040") %>' });
        }

        var addTable;
        function AddCheckItemRecord(o) {
            addTable = $(o).parent().parent().next().find("table");
            var url = "CheckupItemSelect.aspx?ClassRecID=" + $(o).parent().parent().find("TH span[id$=lblClassID]").html() + "&checkRptID=" + $.trim($(o).parent().parent().find("TH").eq(1).text()) + "&_pi=<%=Chy.UI.Framework. MemberManager. SelectedId%>";
            //alert(url);
            $("<div style='width:100%;height:400px' id='divchooseFrame'><iframe  scrolling='auto' width='100%' height='100%'  frameborder=0  id='ChooseFrame' src='" + url + "' /></div>").dialog({ autoOpen: true, width: 660, height: 570, showTitle: false, modal: true, title: '<%= Chy.Web.Resource.GetString("HM_0014") %>', position: ['center', 150] });
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

                    var rowInfo = '<tr class=normal align=middle><td style="display: none">' +
                '<span id="ctl00_MainlaceHolder_rptCheckClassRecord_ctl00_rptProject_ctl' + rowCountName + '_lblItemRecordID">' + ItemRecordID[i] + '</span>' +
                '</td>' +
                '<td style="display: none">' + ClassRecID[i] +
                    '</td>' +
                '<td>' +
                    '<input id="ctl00_MainlaceHolder_rptCheckClassRecord_ctl00_rptProject_ctl' + rowCountName + '_cbItem" type="checkbox" name="ctl00$MainlaceHolder$rptCheckClassRecord$ctl00$rptProject$ctl' + rowCountName + '$cbItem" />' +
                '</td>' +
                '<td>' +
                    '<input name="ctl00$MainlaceHolder$rptCheckClassRecord$ctl00$rptProject$ctl' + rowCountName + '$txtItemName" type="text" value="' + ItemName[i] + '" maxlength="32" id="ctl00_MainlaceHolder_rptCheckClassRecord_ctl00_rptProject_ctl' + rowCountName + '_txtItemName" class="inputtext"  />' +
                '</td>' +
                '<td>' +
                    '<input name="ctl00$MainlaceHolder$rptCheckClassRecord$ctl00$rptProject$ctl' + rowCountName + '$txtResult" value="' + Result[i] + '"  type="text" maxlength="32" id="ctl00_MainlaceHolder_rptCheckClassRecord_ctl00_rptProject_ctl' + rowCountName + '_txtResult" class="inputtext" />' +
                '</td>' +
                '<td>' +
                    '<input name="ctl00$MainlaceHolder$rptCheckClassRecord$ctl00$rptProject$ctl' + rowCountName + '$txtUnit" type="text" value="' + Units[i] + '" maxlength="8" id="ctl00_MainlaceHolder_rptCheckClassRecord_ctl00_rptProject_ctl' + rowCountName + '_txtUnit" class="inputtext"  />' +
                '</td>' +
                '<td>' +
                    '<input name="ctl00$MainlaceHolder$rptCheckClassRecord$ctl00$rptProject$ctl' + rowCountName + '$txtreRange" type="text" value="' + ReRange[i] + '" maxlength="21" id="ctl00_MainlaceHolder_rptCheckClassRecord_ctl00_rptProject_ctl' + rowCountName + '_txtreRange" class="inputtext"  />' +
                '</td>' +
                '<td>' +
                    '<input name="ctl00$MainlaceHolder$rptCheckClassRecord$ctl00$rptProject$ctl' + rowCountName + '$txttips" type="text" value="' + Tips[i] + '" maxlength="8" id="ctl00_MainlaceHolder_rptCheckClassRecord_ctl00_rptProject_ctl' + rowCountName + '_txttips" class="inputtext" />' +
                '</td></tr>';
                    $(rowInfo).insertAfter(addTable.find("tr:eq(" + rowCount + ")"))
                    rowCount++;
                }
            }
            clientUnity.resizeFrame(parent.document.getElementById("mainFrame"));
        }

        function DownAndUp(o) {
            var tr = $(o).parent().parent().next();
            if (tr[0].style.display != "none") {
                tr.css("display", "none");
                $(o).attr("src", "../../Image/arrow_large_down.gif");
            }
            else {
                tr.css("display", "");
                $(o).attr("src", "../../Image/arrow_large_up.gif");
            }
        }        
    </script>
    <style type="text/css">
        .con
        {
            margin: 0px auto;
            margin-top:5px;
        }
        #tags
        {
            margin: 0px;
            background-position: 0 -292px;
            padding: 0px;
            height: 27px;
            background-image: url(../../images/top_bg.gif);
        }
        #tags LI
        {
            background-position: 0 -281px;
            float: left;
            list-style-type: none;
            height: 27px;
            margin-right: 1px;
            cursor: pointer;
            background-image: url(../../images/adm_bg.gif);
            background-repeat: no-repeat;
        }
        #tags LI A
        {
            padding-right: 10px;
            padding-left: 10px;
            background-position: right -340px;
            float: left;
            color: #095998;
            line-height: 27px;
            padding-top: 0px;
            height: 27px;
            text-decoration: none;
            font-weight: bold;
        }
        #tags LI.emptyTag
        {
            background: none transparent scroll repeat 0% 0%;
            width: 4px;
        }
        #tags LI.selectTag
        {
            background-position: 0 -254px;
            margin-bottom: -2px;
            position: relative;
            height: 27px;
        }
        #tags LI.selectTag A
        {
            background-position: right -313px;
            color: #383838;
            line-height: 27px;
            height: 27px;
        }
        #tagContent
        {
            border: #d2e2f2 1px solid;
            padding: 1px;
            border-top: 0px;
            background-color: #fff;
            zoom: 1;
            overflow: hidden;
        }
        .tagContent
        {
            display: none;
            padding: 5px;
            background: #fefefe;
            color: #474747;
            overflow: hidden;
            zoom: 1;
        }
        #tagContent DIV.selectTag
        {
            display: block;
            overflow: hidden;
            zoom: 1;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
    <div class="con">
        <ul id="tags">
            <li><a onclick="TagClick();return false;"  href="javascript:void(0)">基本信息</a></li>
            <li class="selectTag"><a href="javascript:void(0)">
                体检组合项</a> </li>
        </ul>
        <div id="tagContent">
            <div class="tagContent selectTag" id="tagContent0">
                <table cellspacing="0" cellpadding="0" width="99%" border="0" class="addformcontainer"
                    align="center">
                    <tr>
                        <td class="label">
                            <Chy:XLabel ID="lblSummarize" runat="server"></Chy:XLabel>
                        </td>
                        <td align="left" class="input" width="92%">
                            <asp:TextBox ID="txtSummarize" Text='<%# Eval("summarize")%>' Rows="5" TextMode="MultiLine"
                                runat="server" MaxLen="2048" Width="700px" CssClass="inputarea"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">
                            <Chy:XLabel ID="lblAdvice" runat="server"></Chy:XLabel>
                        </td>
                        <td align="left" class="input">
                            <asp:TextBox ID="txtAdvice" Text='<%# Eval("advice")%>' Rows="5" TextMode="MultiLine"
                                Width="700px" runat="server" MaxLen="2048" CssClass="inputarea"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="3">
                            <asp:Button ID="btnSave" CssClass="gj_button" runat="server" Text="保存综述建议" OnClick="Button1_Click" />
                        </td>
                    </tr>
                </table>
                <div class="tablecontainer">
                    <div class="searchPanel">
                        <table cellspacing="0" cellpadding="0" width="98%" border="0">
                            <tr>
                                <td class="label" width="12%">
                                    <%--  <label>--%>
                                    <Chy:XLabel ID="lblClassName" runat="server"></Chy:XLabel>
                                </td>
                                <td align="left" class="input">
                                    <span>
                                        <asp:TextBox ID="txtClassName" runat="server" CssClass="inputtext" MaxLength="28"></asp:TextBox><asp:TextBox
                                            ID="txtClassID" runat="server" Style="display: none"></asp:TextBox><asp:ImageButton
                                                ID="imgAddClass" runat="server" ImageUrl="/Images/addaa.gif" OnClick="imgAddClass_Click" />
                                        &nbsp;<img alt='' runat="server" id="ImgClassName" src="/Images/search.gif" style="cursor: hand"
                                            onclick="OpenClassSelect();" /></span>
                                </td>
                                <td align="left">
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <table cellspacing="0" cellpadding="0" width="98%" border="0">
                    <tr>
                        <td>
                            <asp:Panel ID="UpdatePanel2" runat="server" UpdateMode="Conditional" CssClass="demolargetable">
                                <table id="rptCheckTable" width="100%" border="0px" cellspacing="0" cellpadding="0px"
                                    class="zebratable">
                                    <asp:Repeater ID="rptCheckClassRecord" runat="server" OnItemDataBound="rptCheckClassRecord_ItemDataBound">
                                        <HeaderTemplate>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr align="center">
                                                <th style="display: none" colspan="2">
                                                    <asp:HiddenField ID="TEst" runat="server" Value="" />
                                                    <Chy:XLabel ID="lblClassID" runat="server" Text='<%# Eval("classRecID")%>'></Chy:XLabel>
                                                </th>
                                                <th style="display: none" colspan="2">
                                                    <%# Eval("checkRptID")%>
                                                </th>
                                                <th style="width: 40%; line-height: 30px" colspan="2">
                                                    <span style="font-weight: bold; text-align: center; color: #006699">
                                                        <%# Eval("ClassName")%></span>
                                                </th>
                                                <th style="width: 35%; line-height: 30px" colspan="1">
                                                    <span style="font-weight: bold; text-align: center; color: #006699">
                                                        <%= Chy.Web.Resource.GetString("HM_0046")%></span><span style="font-weight: bold;
                                                            text-align: center; color: #006699"><asp:TextBox ID="txtResult" Text='<%# Eval("doctor")%>'
                                                                Width="250px" runat="server" MaxLength="20" CssClass="inputtext"></asp:TextBox></span>
                                                </th>
                                                <th style="text-align: right; padding-right: 5px; line-height: 30px;" colspan="2">
                                                    <asp:Label ID="lblAddSmall" runat="server" Text="" Font-Underline="true" Style="cursor: hand;
                                                        color: #095998;" onclick="AddCheckItemRecord(this);"></asp:Label>
                                                    <asp:LinkButton ID="btnDelete" runat="server" OnClientClick="return GetClassRecID(this);">删除</asp:LinkButton>
                                                    <img id="imgdown" src="../../Image/arrow_large_up.gif" onclick="DownAndUp(this);"
                                                        alt="" style="cursor: hand" />
                                                </th>
                                            </tr>
                                            <tr>
                                                <td colspan="6">
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
                                                                        <%= Chy.Web.Resource.GetString("HM_0002")%>
                                                                    </th>
                                                                    <th style="width: 20%">
                                                                        <%= Chy.Web.Resource.GetString("HM_0048")%>
                                                                    </th>
                                                                    <th style="width: 20%">
                                                                        <%= Chy.Web.Resource.GetString("HM_0006")%>
                                                                    </th>
                                                                    <th style="width: 20%">
                                                                        <%= Chy.Web.Resource.GetString("HM_0049")%>
                                                                    </th>
                                                                    <th style="width: 20%">
                                                                        <%= Chy.Web.Resource.GetString("HM_0018")%>
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
                                                                            CssClass="inputtext"></asp:TextBox>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtResult" Text='<%# Eval("Result")%>' runat="server" MaxLength="32"
                                                                            CssClass="inputtext"></asp:TextBox>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtUnit" Text='<%# Eval("Unit")%>' runat="server" MaxLength="8"
                                                                            CssClass="inputtext"></asp:TextBox>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtreRange" Text='<%# Eval("reRange")%>' runat="server" MaxLength="21"
                                                                            CssClass="inputtext"></asp:TextBox>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txttips" Text='<%# Eval("tips")%>' runat="server" MaxLength="8"
                                                                            CssClass="inputtext"></asp:TextBox>
                                                                    </td>
                                                                    <%--<asp:PlaceHolder runat="server" ID="PlaceHolder2">
                                                                <td>
                                                                    <asp:LinkButton ID="btnItemDelete" runat="server" OnClientClick="GetItemID(this)"
                                                                        OnClick="btnItemDelete_Click">删除</asp:LinkButton>
                                                                </td>
                                                            </asp:PlaceHolder>--%>
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
                                                                <%= Chy.Web.Resource.GetString("HM_0050") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <asp:TextBox ID="txtSummary" Text='<%# Eval("summary")%>' Rows="3" TextMode="MultiLine"
                                                                    runat="server" Width="700px" MaxLen="512" CssClass="inputarea"></asp:TextBox>
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
                                                    <%= Chy.Web.Resource.GetString("HM_0039") %>
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
                        <asp:Button ID="btnAduit" CssClass="gj_button" runat="server" Text="生成报告" OnClick="btnAduit_Click"
                                    OnClientClick="GetClassAndItemInfo(); return confirm('生成报告后，体检信息将不能再被修改!');" />
                            <asp:Button ID="btnReturn" CssClass="button" runat="server" Text="返回" OnClick="Button2_Click" />
                        </td>
                    </tr>
                </table>
            </div>
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
        <script type="text/javascript">
            $(document).ready(function () {
                $("td :checkbox[id$='cbItemAll']").click(function () {
                    $(this).parent().parent().nextAll().find("td :checkbox[id$=cbItem]").attr("checked", $(this).attr("checked"));
                });
            });


            $("td :checkbox[id$='cbItem']").click(function () {
                $("td :checkbox[id$='cbItemAll']").attr("checked", false);
            });

           

            ///<xml><class id='id'><dot>doctor</dot><summ>Summary</summ></class><item id='id'><name>name</name><result>result</result><unit>unit</unit><rang>rang</rang><tip>tip</tip></item></xml>
            function GetClassAndItemInfo() {
                var ClassInfo = $("#rptCheckTable>tbody>tr");
                for (i = 0; i < ClassInfo.length; i = i + 4) {
                    var TEst = $(ClassInfo[i]).find("th :input[id$='TEst']");
                    var info = "<xml>";
                    var classinfo = "<class id='" + $.trim($(ClassInfo[i]).find("th span[id$='lblClassID']").html().replace(/</g, "lg2;").replace(/>/g, "lt2;").replace(/&/g, "&amp;")) + "'>";
                    classinfo = classinfo + "<dot>" + $.trim($(ClassInfo[i]).find("th :input[id$='txtResult']").val().replace(/</g, "lg2;").replace(/>/g, "lt2;").replace(/&/g, "&amp;")) + "</dot>" + "<summ>" + $.trim($(ClassInfo[i + 2]).find("th :input[id$='txtSummary']").val().replace(/</g, "lg2;").replace(/>/g, "lt2;").replace(/&/g, "&amp;")) + "</summ>" + "</class>";
                    var itemTable = $(ClassInfo[i + 1]).find("td table tr");
                    var itemInfo = "";
                    ///去掉第一行的标头
                    for (j = 1; j < itemTable.length; j++) {
                        itemInfo = itemInfo + "<item id='" + $.trim($(itemTable[j]).find("td span[id$='lblItemRecordID']").html().replace(/</g, "lg2;").replace(/>/g, "lt2;").replace(/&/g, "&amp;")) + "'>";
                        itemInfo = itemInfo + "<name>" + $.trim($(itemTable[j]).find("td :input[id$='ItemName']").val().replace(/</g, "lg2;").replace(/>/g, "lt2;").replace(/&/g, "&amp;")) + "</name>";
                        itemInfo = itemInfo + "<result>" + $.trim($(itemTable[j]).find("td :input[id$='Result']").val().replace(/</g, "lg2;").replace(/>/g, "lt2;").replace(/&/g, "&amp;")) + "</result>";
                        itemInfo = itemInfo + "<unit>" + $.trim($(itemTable[j]).find("td :input[id$='Unit']").val().replace(/</g, "lg2;").replace(/>/g, "lt2;").replace(/&/g, "&amp;")) + "</unit>";
                        itemInfo = itemInfo + "<rang>" + $.trim($(itemTable[j]).find("td :input[id$='reRange']").val().replace(/</g, "lg2;").replace(/>/g, "lt2;").replace(/&/g, "&amp;")) + "</rang>";
                        itemInfo = itemInfo + "<tip>" + $.trim($(itemTable[j]).find("td :input[id$='tips']").val().replace(/</g, "lg2;").replace(/>/g, "lt2;").replace(/&/g, "&amp;")) + "</tip>";
                        itemInfo = itemInfo + "</item>";
                    }
                    TEst.val((info + classinfo + itemInfo + "</xml>").replace(/</g, "&lg;").replace(/>/g, "&lt;"));
                }
                return true;
            }

            function TagClick() {
                window.location = 'CheckupReportEdit.aspx?Type=Edit&CheckRepID=<%=Request.QueryString["CheckRepID"].ToString() %>&_pi=<%=Chy.UI.Framework. MemberManager. SelectedId%>&rnt=' + Math.random() + "&from=<%=Request.QueryString["from"] %>";
            }
        </script>
    </div>
</asp:Content>
