<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MainContent.Master"
    CodeBehind="HealthInfoEdit.aspx.cs" Inherits="Chm.Web.Admin.HealthRecord.HealthInfoEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/Js/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="../../Scripts/MultiLineLength.js" type="text/javascript"></script>
    <link href="../../Styles/adminwordbreak.css" rel="stylesheet" type="text/css" />
     <script src="/hc/js/healthInfo.js" type="text/javascript"></script>
    <%-- <script src="../../Scripts/jquery-1.4.1-vsdoc.js"></script>--%>
    <style type="text/css">
        .con {
            font-size: 12px;
            margin: 0px auto;
        }

        .tags {
            margin: 0px;
            background: #ffffff; /* Old browsers */
            /* IE9 SVG, needs conditional override of 'filter' to 'none' */
            background: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIwJSIgeTI9IjEwMCUiPgogICAgPHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iI2ZmZmZmZiIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjEwMCUiIHN0b3AtY29sb3I9IiNmMmYxZWYiIHN0b3Atb3BhY2l0eT0iMSIvPgogIDwvbGluZWFyR3JhZGllbnQ+CiAgPHJlY3QgeD0iMCIgeT0iMCIgd2lkdGg9IjEiIGhlaWdodD0iMSIgZmlsbD0idXJsKCNncmFkLXVjZ2ctZ2VuZXJhdGVkKSIgLz4KPC9zdmc+);
            background: -moz-linear-gradient(top, #ffffff 0%, #f2f1ef 100%); /* FF3.6+ */
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#ffffff), color-stop(100%,#f2f1ef)); /* Chrome,Safari4+ */
            background: -webkit-linear-gradient(top, #ffffff 0%,#f2f1ef 100%); /* Chrome10+,Safari5.1+ */
            background: -o-linear-gradient(top, #ffffff 0%,#f2f1ef 100%); /* Opera 11.10+ */
            background: -ms-linear-gradient(top, #ffffff 0%,#f2f1ef 100%); /* IE10+ */
            background: linear-gradient(to bottom, #ffffff 0%,#f2f1ef 100%); /* W3C */
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#f2f1ef',GradientType=0 ); /* IE6-8 */
            border-top: 1px solid #dadada;
            border-bottom: 1px solid #dadada;
            padding: 0px;
            height: 34px;
            line-height: 34px;
        }

            .tags LI {
                float: left;
                list-style-type: none;
                height: 24px;
                margin-right: 1px;
            }

                .tags LI A {
                    padding-right: 10px;
                    padding-left: 10px;
                    float: left;
                    color: #1491c9;
                    line-height: 34px;
                    padding-top: 0px;
                    height: 34px;
                    text-decoration: none;
                    font-weight: bold;
                }

                .tags LI.emptyTag {
                    background: none transparent scroll repeat 0% 0%;
                    width: 4px;
                }

                .tags LI.selectTag {
                    background-position: left top;
                    margin-bottom: -2px;
                    position: relative;
                    height: 24px;
                }

                    .tags LI.selectTag A {
                        background-position: right top;
                        color: #1491c9;
                        line-height: 34px;
                        height:34px;
                    }

        #tagContent {
            border: #9da9b5 1px solid;
            padding: 1px;
            border-top: 0px;
            background-color: #fff;
            zoom: 1;
            overflow: hidden;
        }

        .tagContent {
            display: none;
            padding: 5px;
            background: #fefefe;
            color: #474747;
            overflow: hidden;
            zoom: 1;
        }

        #tagContent DIV.selectTag {
            display: block;
            overflow: hidden;
            zoom: 1;
        }

        .tdcss {
            border: #D2E2F2 1px dotted;
        }

        .thcss {
            border: #D2E2F2 1px dotted;
            background-color: #F7FCFF;
            font-size: 10px;
        }

        .tbcss {
            border-bottom: #D2E2F2 1px dotted;
        }

        .btn {
            padding: 1px 3px 1px 3px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
    <script type="text/javascript">
        var strP = /^\d+(\.\d+)?$/;
        function validate(obj) {
            var tar = $(obj);           
            if (tar.val() != '') {
                if (!strP.test(tar.val())) {
                    tar.val('');
                }
            }
        }
        //请不要修改此验证逻辑(尤其是代码次序)
        function CheckNum(obj) {
            obj.value = obj.value.replace(/^\s+|\s+$/g, ''); //去掉前后空格
            if (obj.value.length == 0)
                return;

            var errMsg = '身高、体重、腰围、臀围、脉搏、心率、血压、空腹血糖、尿酸、总胆固醇、甘油三脂、高密度脂蛋白、低密度脂蛋白必须为不大于999.99的正数(最多一位小数)';
            var patt1 = new RegExp(/^[1-9]\d*$/g); //匹配正整数
            var patt2 = new RegExp(/^[1-9]\d*\.\d*|0\.\d*[1-9]\d*$/g); //匹配正浮点数
            if (!patt1.test(obj.value) && !patt2.test(obj.value)) {
                alert(errMsg);
                obj.value = "";
                return;
            }

            if (obj.value > 999.99) {  //不能大于999.99
                alert(errMsg);
                obj.value = "";
                return;
            }
            if (obj.value.split(".").length == 1) //输入了整数
                return;
            if (obj.value.split(".").length > 2) {  //不允许输入“2.3.4”这样的浮点数
                alert(errMsg);
                obj.value = "";
                return;
            }
            if (obj.value.split(".")[1].length > 2) {  //不允许输入“5.28”这样的浮点数
                alert(errMsg);
                obj.value = "";
                return;
            }
        };

        //删除最后的小数点（“5.”）
        function DeleteLast(obj) {
            obj.value = obj.value.replace(/^\s+|\s+$/g, ''); //去掉前后空格
            if (obj.value.length == 0) {
                return;
            }

            if (obj.value.split(".").length == 1) //输入了整数
            {
                return;
            }
            if (obj.value.split(".")[1].length == 0) {  //不允许输入“5.”这样的浮点数
                obj.value = obj.value.split(".")[0];
                return;
            }
        };

        function CheckAgeNum(obj) {
            obj.value = obj.value.replace(/^\s+|\s+$/g, ''); //去掉前后空格
            if (obj.value.length == 0)
                return;

            var errMsg = '必须为大于0的整数 ';
            var patt1 = new RegExp(/^[1-9]\d*$/g); //匹配正整数
            var patt2 = new RegExp(/^[1-9]\d*\.\d*|0\.\d*[1-9]\d*$/g); //匹配正浮点数
            if (!patt1.test(obj.value) && !patt2.test(obj.value)) {
                alert(errMsg);
                obj.value = "";
                return;
            }

            if (obj.value > 999.9) {  //不能大于999.9
                alert(errMsg);
                obj.value = "";
                return;
            }
            if (obj.value.split(".").length == 1) //输入了整数
                return;
            if (obj.value.split(".").length > 2) {  //不允许输入“2.3.4”这样的浮点数
                alert(errMsg);
                obj.value = "";
                return;
            }
            if (obj.value.split(".")[1].length != 1) {  //不允许输入“5.”或“5.28”这样的浮点数
                alert(errMsg);
                obj.value = "";
                return;
            }
        };


        //只能输入数字和两位小数
        function clearNoNum(obj) {
            obj.value = obj.value.replace(/[^\d.]/g, "");  //清除“数字”和“.”以外的字符
            obj.value = obj.value.replace(/^\./g, "");  //验证第一个字符是数字而不是.
            obj.value = obj.value.replace(/\.{2,}/g, "."); //只保留第一个. 清除多余的
            obj.value = obj.value.replace(".", "$#$").replace(/\./g, "").replace("$#$", ".");
            obj.value = obj.value.replace(/^(\-)*(\d+)\.(\d\d).*$/, '$1$2.$3'); //只能输入两个小数
            obj.value = obj.value.replace(/^(\d\d\d)(\d*)(\.\d*)?$/, '$1$3'); //只能输入3整数
            obj.value = obj.value.replace(/^0(\d+)(.*)$/, '$1$2'); //不是作为小数0去掉
        }
        //只能输入数字和两位小数
        function clearNoInt(obj) {
            obj.value = obj.value.replace(/[^\d]/g, "");  //清除“数字”以外的字符
            obj.value = obj.value.replace(/^(\d\d\d)(\d*)$/, '$1'); //只能输入3整数
            obj.value = obj.value.replace(/^0(\d+)(.*)$/, '$1$2'); //不是作为小数0去掉
        }

    </script>
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true">
    </asp:ScriptManager>
    <div class="border mb_10" style="height:30px; line-height:30px;">
        &nbsp;&nbsp;&nbsp;&nbsp;<a href="HealthInfoEdit.aspx" id="aHealthInfoEdit">健康信息</a>&nbsp;&nbsp;&nbsp;&nbsp;
              <a href="Behaviorhabit.aspx" id="aBehaviorhabit">生活方式及行为习惯</a>
        &nbsp;&nbsp;&nbsp;&nbsp;<a href="DietaryHabit.aspx" id="aDietaryHabit">饮食习惯</a>                       
    </div>
    <div class="border mb_10">
                            <!--血型-->

                            <div class="con">
                                <ul class="tags">
                                    <li class="selectTag"><a onclick="selectTag('tagContent0',this)" href="javascript:void(0)">
                                        <%= Chy.Web.Resource.GetString("HM_0327")%></a></li>
                                    <img alt="展开" style="cursor: pointer; float: right; padding-right: 5px; padding-top: 10px;"
                                        src="../../Images/arrow_aup.gif" onclick="DownAndUp(this);" />
                                </ul>
                                <Chy:XTextBox ID="txtPatientName" CssClass="inputtext" runat="server" ValidationGroup="EditVal"
                                    Visible="false" ValidType="String">
                                </Chy:XTextBox>
                                <Chy:XTextBox ID="txtPatientID" CssClass="inputtext" runat="server" ValidationGroup="EditVal"
                                    Visible="false" ValidType="String">
                                </Chy:XTextBox>
                                <input type="hidden" runat="server" id="id" />
                                <div id="tagContent0">
                                    <table border="0" cellspacing="0" cellpadding="0" class="formcontainer">
                                        <tr align="left">
                                            <td class="warn">&nbsp;
                                            </td>
                                            <td class="input">
                                                <asp:RadioButtonList ID="rblBlood" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                                    <asp:ListItem Value="0" Text=""></asp:ListItem>
                                                    <asp:ListItem Value="1" Text=""></asp:ListItem>
                                                    <asp:ListItem Value="2" Text=""></asp:ListItem>
                                                    <asp:ListItem Value="3" Text=""></asp:ListItem>
                                                    <asp:ListItem Value="4" Selected="True" Text=""></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <!--过敏史-->
                            <div class="con">
                                <ul class="tags">
                                    <li class="selectTag"><a onclick="selectTag('tagContent1',this)" href="javascript:void(0)">
                                        <%= Chy.Web.Resource.GetString("HM_0333")%></a></li>
                                    <img alt="展开" style="cursor: pointer; float: right; padding-right: 5px; padding-top: 10px;"
                                        src="../../Images/arrow_aup.gif" onclick="DownAndUp(this);" />
                                </ul>
                                <div id="tagContent1">
                                    <asp:UpdatePanel ID="upFatherIllness" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <table border="0" cellspacing="0" cellpadding="0" class="formcontainer">
                                                <tr>
                                                    <td class="warn">&nbsp;
                                                    </td>
                                                    <td class="input">
                                                        <asp:RadioButtonList ID="rblAllergy" runat="server" RepeatDirection="Horizontal"
                                                            RepeatLayout="Flow" OnSelectedIndexChanged="rblAllergy_SelectedIndexChanged"
                                                            AutoPostBack="true">
                                                            <asp:ListItem Value="0" Selected="True" Text=""></asp:ListItem>
                                                            <asp:ListItem Value="1" Text=""></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td class="warn">&nbsp;
                                                    </td>
                                                    <td class="input" id="trAllergy" runat="server">
                                                        <asp:CheckBoxList ID="cblAllergy" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow"
                                                            RepeatColumns="3">
                                                            <asp:ListItem Value="0" Text=""></asp:ListItem>
                                                            <asp:ListItem Value="1" Text=""></asp:ListItem>
                                                            <asp:ListItem Value="2" Text=""></asp:ListItem>
                                                        </asp:CheckBoxList>
                                                    </td>
                                                    <td class="warn">&nbsp;
                                                    </td>
                                                    <td class="input" nowrap runat="server" id="trAllergyWay">
                                                        <asp:Label runat="server" Text="" ID="lblAllergy"></asp:Label>
                                                        <Chy:XTextBox onkeypress="TextValidate()" onblur="numkeydelete(this)" MaxLength="100"
                                                            runat="server" CssClass="inputtext" ID="txtAllergy">
                                                        </Chy:XTextBox>
                                                        <%--<Chy:XTextBox TextMode="MultiLine" onkeypress="TextValidate()" onblur="numkeydelete(this)" MaxLen="100"  runat="server" Rows="3" CssClass="inputtext" ID="txtAllergy"></Chy:XTextBox>--%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                            <!--体格检查-->
                            <div class="con">
                                <ul class="tags">
                                    <li class="selectTag"><a onclick="selectTag('tagContent2',this)" href="javascript:void(0)">
                                        <%= Chy.Web.Resource.GetString("HM_0310")%></a></li>
                                    <img alt="展开" style="cursor: pointer; float: right; padding-right: 5px; padding-top: 10px;"
                                        src="../../Images/arrow_aup.gif" onclick="DownAndUp(this);" />
                                </ul>
                                <div id="tagContent2">
                                    <table border="0" cellspacing="0" cellpadding="0" class="formcontainer">
                                        <tr>
                                            <td class="warn">&nbsp;
                                            </td>
                                            <td class="label">
                                                <%= Chy.Web.Resource.GetString("HM_0340") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                            </td>
                                            <td class="input" nowrap>
                                                <Chy:XTextBox ID="txtHeight" MaxLength="6" CssClass="inputtext" Style="width: 40px"
                                                    runat="server" ValidationGroup="EditVal" onKeyUp="clearNoNum(this)" onblur="DeleteLast(this)">
                                                </Chy:XTextBox>&nbsp;cm
                                            </td>
                                            <td class="warn">&nbsp;
                                            </td>
                                            <td class="label">
                                                <%= Chy.Web.Resource.GetString("HM_0341") + Chy.Web.Resource.GetString("Remp_Colon") %>
                                            </td>
                                            <td class="input" nowrap>
                                                <Chy:XTextBox ID="txtWeight" MaxLength="6" CssClass="inputtext" Style="width: 40px"
                                                    runat="server" ValidationGroup="EditVal" onKeyUp="clearNoNum(this)" onblur="DeleteLast(this)">
                                                </Chy:XTextBox>&nbsp;kg
                                            </td>
                                            <td class="warn">&nbsp;
                                            </td>
                                            <td class="label">
                                                <%= Chy.Web.Resource.GetString("HM_0342") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                            </td>
                                            <td class="input" nowrap>
                                                <Chy:XTextBox ID="txtWaist" MaxLength="6" CssClass="inputtext" runat="server" Style="width: 40px"
                                                    ValidationGroup="EditVal" onKeyUp="clearNoNum(this)" onblur="DeleteLast(this)">
                                                </Chy:XTextBox>&nbsp;cm
                                            </td>
                                            <td class="warn">&nbsp;
                                            </td>
                                            <td class="label">
                                                <%= Chy.Web.Resource.GetString("HM_0343") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                            </td>
                                            <td class="input" nowrap>
                                                <Chy:XTextBox ID="txtHip" MaxLength="6" CssClass="inputtext" runat="server" Style="width: 40px"
                                                    ValidationGroup="EditVal" onKeyUp="clearNoNum(this)" onblur="DeleteLast(this)">
                                                </Chy:XTextBox>&nbsp;cm
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="warn">&nbsp;
                                            </td>
                                            <td class="label">
                                                <%= Chy.Web.Resource.GetString("HM_0344") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                            </td>
                                            <td class="input" nowrap>
                                                <Chy:XTextBox ID="txtPluse" MaxLength="3" CssClass="inputtext" runat="server" Style="width: 40px"
                                                    ValidationGroup="EditVal" ValidType="IntZeroPostive" onKeyUp="clearNoInt(this)">
                                                </Chy:XTextBox>&nbsp;<%= Chy.Web.Resource.GetString("HM_0346")%>
                                            </td>
                                            <td class="warn">&nbsp;
                                            </td>
                                            <td class="label">
                                                <%= Chy.Web.Resource.GetString("HM_0345") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                            </td>
                                            <td class="input" nowrap>
                                                <Chy:XTextBox ID="txtheart" MaxLength="3" CssClass="inputtext" runat="server" Style="width: 40px"
                                                    ValidationGroup="EditVal" ValidType="IntZeroPostive" onKeyUp="clearNoInt(this)">
                                                </Chy:XTextBox>&nbsp;<%= Chy.Web.Resource.GetString("HM_0346")%>
                                            </td>
                                            <td class="warn">&nbsp;
                                            </td>
                                            <td class="label">
                                                <%= Chy.Web.Resource.GetString("HM_0347") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                            </td>
                                            <td class="input" nowrap colspan="4">
                                                <Chy:XTextBox ID="txtBPress1" runat="server" Style="width: 40px" ValidationGroup="EditVal"
                                                    MaxLength="3" CssClass="inputtext" ValidType="IntZeroPostive" onKeyUp="clearNoInt(this)">
                                                </Chy:XTextBox>&nbsp;/&nbsp;
                                                <Chy:XTextBox ID="txtBPress2" runat="server" MaxLength="3" CssClass="inputtext" Style="width: 40px"
                                                    ValidationGroup="EditVal" ValidType="IntZeroPostive" onKeyUp="clearNoInt(this)">
                                                </Chy:XTextBox>&nbsp;mmHg
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="warn">&nbsp;
                                            </td>
                                            <td class="label">空腹血糖<%=Chy.Web.Resource.GetString("Remp_Colon")%>
                                            </td>
                                            <td class="input" nowrap>
                                                <Chy:XTextBox ID="txtFPG" MaxLength="6" CssClass="inputtext" runat="server" Style="width: 40px"
                                                    ValidationGroup="EditVal" onKeyUp="clearNoNum(this)" onblur="DeleteLast(this)">
                                                </Chy:XTextBox>&nbsp;mmol/L
                                            </td>
                                            <td class="warn">&nbsp;
                                            </td>
                                            <td class="label">尿酸<%=Chy.Web.Resource.GetString("Remp_Colon")%>
                                            </td>
                                            <td class="input" nowrap>
                                                <Chy:XTextBox ID="txtUA" MaxLength="6" CssClass="inputtext" runat="server" Style="width: 40px"
                                                    ValidationGroup="EditVal" onKeyUp="clearNoNum(this)" onblur="DeleteLast(this)">
                                                </Chy:XTextBox>&nbsp;mmol/L
                                            </td>
                                            <td class="warn">&nbsp;
                                            </td>
                                            <td class="label">总胆固醇<%= Chy.Web.Resource.GetString("Remp_Colon")%>
                                            </td>
                                            <td class="input" nowrap>
                                                <Chy:XTextBox ID="txtTC" MaxLength="6" CssClass="inputtext" runat="server" Style="width: 40px"
                                                    ValidationGroup="EditVal" onKeyUp="clearNoNum(this)" onblur="DeleteLast(this)">
                                                </Chy:XTextBox>&nbsp;mmol/L
                                            </td>
                                            <td class="warn">&nbsp;
                                            </td>
                                            <td class="label">甘油三脂<%=Chy.Web.Resource.GetString("Remp_Colon")%>
                                            </td>
                                            <td class="input" nowrap>
                                                <Chy:XTextBox ID="txtTG" MaxLength="6" CssClass="inputtext" runat="server" Style="width: 40px"
                                                    ValidationGroup="EditVal" onKeyUp="clearNoNum(this)" onblur="DeleteLast(this)">
                                                </Chy:XTextBox>&nbsp;mmol/L
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="warn">&nbsp;
                                            </td>
                                            <td class="label">高密度脂蛋白<%=Chy.Web.Resource.GetString("Remp_Colon")%>
                                            </td>
                                            <td class="input" nowrap>
                                                <Chy:XTextBox ID="txtHDLC" MaxLength="6" CssClass="inputtext" runat="server" Style="width: 40px"
                                                    ValidationGroup="EditVal" onKeyUp="clearNoNum(this)" onblur="DeleteLast(this)">
                                                </Chy:XTextBox>&nbsp;mmol/L
                                            </td>
                                            <td class="warn">&nbsp;
                                            </td>
                                            <td class="label">低密度脂蛋白<%=Chy.Web.Resource.GetString("Remp_Colon")%>
                                            </td>
                                            <td class="input" nowrap>
                                                <Chy:XTextBox ID="txtLDLC" MaxLength="6" CssClass="inputtext" runat="server" Style="width: 40px"
                                                    ValidationGroup="EditVal" onKeyUp="clearNoNum(this)" onblur="DeleteLast(this)">
                                                </Chy:XTextBox>&nbsp;mmol/L
                                            </td>
                                            <td colspan="6">&nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                             <!--肝功能-->
                            <div class="con">
                                <ul class="tags">
                                    <li class="selectTag"><a onclick="selectTag('tagContent9',this)" href="javascript:void(0)">
                                        肝功能</a></li>
                                    <img alt="展开" style="cursor: pointer; float: right; padding-right: 5px; padding-top: 10px;"
                                        src="../../Images/arrow_aup.gif" onclick="DownAndUp(this);" />
                                </ul>
                               
                               
                              
                                <div id="tagContent9">
                                    <table border="0" cellspacing="0" cellpadding="0" class="formcontainer">
                                        <tr>
                                            <td class="label">血清谷丙转氨酶： 
                                            </td>
                                            <td class="input">
                                                <asp:TextBox ID="txtsgpt" runat="server" onblur="validate(this)" msg="血清谷丙转氨酶" class="inputtext" Style="width: 40px"></asp:TextBox>（U/L）
                                            </td>
                                            <td class="label">血清谷草转氨酶： 
                                            </td>
                                            <td class="input">
                                                <asp:TextBox ID="txtsgot" runat="server" onblur="validate(this)" mag="血清谷草转氨酶" class="inputtext" Style="width: 40px"></asp:TextBox>（U/L）
                                            </td>
                                            <td class="label">白蛋白： 
                                            </td>
                                            <td class="input">
                                                <asp:TextBox ID="txtalb" runat="server" onblur="validate(this)" mag="蛋白质" class="inputtext" Style="width: 40px"></asp:TextBox>（g/L）
                                            </td>
                                            <td class="label">总胆红素： 
                                            </td>
                                            <td class="input">
                                               <asp:TextBox ID="txttbili" runat="server" onblur="validate(this)" mag="总胆红素" class="inputtext" Style="width: 40px"></asp:TextBox>（μmol/L）
                                            </td>
                                            <td class="label">直接胆红素： 
                                            </td>
                                            <td class="input">
                                                <asp:TextBox ID="txtdbil" runat="server" onblur="validate(this)" mag="结合胆红素" class="inputtext" Style="width: 40px"></asp:TextBox>（μmol/L）
                                            </td>
                                        </tr>
                                        
                                    </table>
                                </div>
                            </div>
                          <!--肾功能-->
                            <div class="con">
                                <ul class="tags">
                                    <li class="selectTag"><a onclick="selectTag('tagContent10',this)" href="javascript:void(0)">
                                        肾功能</a></li>
                                    <img alt="展开" style="cursor: pointer; float: right; padding-right: 5px; padding-top: 10px;"
                                        src="../../Images/arrow_aup.gif" onclick="DownAndUp(this);" />
                                </ul>
                               
                               
                              
                                <div id="tagContent10">
                                    <table border="0" cellspacing="0" cellpadding="0" class="formcontainer">
                                        <tr>
                                            <td class="label">血清肌酐： 
                                            </td>
                                            <td class="input">
                                               <asp:TextBox ID="txtscre" runat="server" onblur="validate(this)" msg="血清肌酐" class="inputtext" Style="width: 40px"></asp:TextBox>（μmol/L）
                                            </td>
                                            <td class="label">血尿素氮： 
                                            </td>
                                            <td class="input">
                                                <asp:TextBox ID="txtbun" runat="server" onblur="validate(this)" mag="血尿素氮" class="inputtext" Style="width: 40px"></asp:TextBox>（mmol/L）
                                            </td>                                          
                                        </tr>
                                        
                                    </table>
                                </div>
                            </div>
                            <!--现病史-->
                            <input type="hidden" runat="server" id="hidNowIll" />
                            <div class="con">
                                <ul class="tags">
                                    <li class="selectTag"><a onclick="selectTag('tagContent4',this)" href="javascript:void(0)">
                                        <%= Chy.Web.Resource.GetString("HM_0101")%></a></li>
                                    <img alt="展开" style="cursor: pointer; float: right; padding-right: 5px; padding-top: 10px;"
                                        src="../../Images/arrow_aup.gif" onclick="DownAndUp(this);" />
                                </ul>
                                <div id="tagContent4">
                                    <table border="0" cellspacing="0" cellpadding="0" class="formcontainer">
                                        <tr runat="server" id="trnowill">
                                            <td colspan="2">
                                                <table>
                                                    <tr id="trNowIll0">
                                                        <td class="warn">&nbsp;
                                                        </td>
                                                        <td class="label">
                                                            <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                        </td>
                                                        <td class="input" nowrap>
                                                            <input type="text" class="inputtext" id="txtNowIll0" maxlength="64" style="width: 200px"
                                                                onkeypress="TextValidate()" onblur="numkeydelete(this)" />
                                                            <input type="button" value='<%= Chy.Web.Resource.GetString("HM_0219")%>' onclick="ChooseIll(this)"
                                                                id="NowIllsearch" style="padding: 1px 3px 1px 3px" />
                                                        </td>
                                                        <td class="label">
                                                            <%= Chy.Web.Resource.GetString("HM_0352") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                        </td>
                                                        <td class="input" nowrap>
                                                            <Chy:XDatePicker ID="dpNowIll" runat="server" DateFmt="yyyy-MM" MaxDate="%y-%M">
                                                            </Chy:XDatePicker>
                                                        </td>
                                                        <td class="warn">
                                                            <input type="button" onclick="addNowIll()" id="btnAddNowIll0" value='<%= Chy.Web.Resource.GetString("HM_0350")%>'
                                                                class="btn" />
                                                        </td>
                                                        <td class="warn">&nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="warn">&nbsp;
                                                        </td>
                                                        <td class="label">主诉<%=Chy.Web.Resource.GetString("Remp_Colon")%>
                                                        </td>
                                                        <td class="input" colspan="5">
                                                            <Chy:XTextBox ID="txtSymptom" TextMode="MultiLine" MaxLen="100" Width="95%" onkeypress="TextValidate()"
                                                                onblur="numkeydelete(this)" runat="server" Rows="3" CssClass="inputtext">
                                                            </Chy:XTextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <!--既往史-->
                            <input type="hidden" runat="server" id="hidWayIll" />
                            <input type="hidden" runat="server" id="hidInjury" />
                            <input type="hidden" runat="server" id="hidOperation" />
                            <input type="hidden" runat="server" id="hidInBlood" />
                            <div class="con">
                                <ul class="tags">
                                    <li class="selectTag"><a onclick="selectTag('tagContent5',this)" href="javascript:void(0)">
                                        <%= Chy.Web.Resource.GetString("HM_0351")%></a></li>
                                    <img alt="展开" style="cursor: pointer; float: right; padding-right: 5px; padding-top:10px;"
                                        src="../../Images/arrow_aup.gif" onclick="DownAndUp(this);" />
                                </ul>
                                <div id="tagContent5">
                                    <asp:Panel ID="upIllness" runat="server">
                                        <table border="0" cellspacing="0" cellpadding="0" class="formcontainer">
                                            <tr>
                                                <td class="warn">&nbsp;
                                                </td>
                                                <td class="label" colspan="8">
                                                    <asp:CheckBoxList ID="cblIllness" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow"
                                                        RepeatColumns="9">
                                                    </asp:CheckBoxList>
                                                </td>
                                            </tr>
                                            <tr runat="server" id="trBP">
                                                <td class="warn">&nbsp;
                                                </td>
                                                <td class="label">
                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                </td>
                                                <td class="input" nowrap>
                                                    <Chy:XTextBox ID="Ill0" CssClass="inputtext" ReadOnly="true" runat="server" ValidationGroup="EditVal"
                                                        ValidType="String" Style="width: 200px">
                                                    </Chy:XTextBox>
                                                </td>
                                                <td class="warn">&nbsp;
                                                </td>
                                                <td class="label">
                                                    <%= Chy.Web.Resource.GetString("HM_0352") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                </td>
                                                <td class="input" nowrap>
                                                    <Chy:XDatePicker ID="Time0" runat="server" DateFmt="yyyy-MM" MaxDate="%y-%M">
                                                    </Chy:XDatePicker>
                                                </td>
                                                <td class="warn">&nbsp;
                                                </td>
                                                <td class="label">
                                                    <%= Chy.Web.Resource.GetString("HM_0349") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                </td>
                                                <td class="input" nowrap>
                                                    <Chy:XDropDownList ID="ddl0" runat="server">
                                                    </Chy:XDropDownList>
                                                </td>
                                            </tr>
                                            <tr runat="server" id="trDiabete">
                                                <td class="warn">&nbsp;
                                                </td>
                                                <td class="label">
                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                </td>
                                                <td class="input" nowrap>
                                                    <Chy:XTextBox ID="Ill1" CssClass="inputtext" ReadOnly="true" runat="server" Style="width: 200px"
                                                        ValidationGroup="EditVal" ValidType="String">
                                                    </Chy:XTextBox>
                                                </td>
                                                <td class="warn">&nbsp;
                                                </td>
                                                <td class="label">
                                                    <%= Chy.Web.Resource.GetString("HM_0352") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                </td>
                                                <td class="input" nowrap>
                                                    <Chy:XDatePicker ID="Time1" runat="server" DateFmt="yyyy-MM" MaxDate="%y-%M">
                                                    </Chy:XDatePicker>
                                                </td>
                                                <td class="warn">&nbsp;
                                                </td>
                                                <td class="label">
                                                    <%= Chy.Web.Resource.GetString("HM_0349") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                </td>
                                                <td class="input" nowrap>
                                                    <Chy:XDropDownList ID="ddl1" runat="server">
                                                    </Chy:XDropDownList>
                                                </td>
                                            </tr>
                                            <tr runat="server" id="trHeartIll">
                                                <td class="warn">&nbsp;
                                                </td>
                                                <td class="label">
                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                </td>
                                                <td class="input" nowrap>
                                                    <Chy:XTextBox ID="Ill2" CssClass="inputtext" ReadOnly="true" runat="server" Style="width: 200px"
                                                        ValidationGroup="EditVal" ValidType="String">
                                                    </Chy:XTextBox>
                                                </td>
                                                <td class="warn">&nbsp;
                                                </td>
                                                <td class="label">
                                                    <%= Chy.Web.Resource.GetString("HM_0352") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                </td>
                                                <td class="input" nowrap>
                                                    <Chy:XDatePicker ID="Time2" runat="server" DateFmt="yyyy-MM" MaxDate="%y-%M">
                                                    </Chy:XDatePicker>
                                                </td>
                                                <td class="warn">&nbsp;
                                                </td>
                                                <td class="label">
                                                    <%= Chy.Web.Resource.GetString("HM_0349") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                </td>
                                                <td class="input" nowrap>
                                                    <Chy:XDropDownList ID="ddl2" runat="server">
                                                    </Chy:XDropDownList>
                                                </td>
                                            </tr>
                                            <tr runat="server" id="trCancer">
                                                <td class="warn">&nbsp;
                                                </td>
                                                <td class="label">
                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                </td>
                                                <td class="input" nowrap>
                                                    <Chy:XTextBox ID="Ill3" CssClass="inputtext" ReadOnly="true" runat="server" Style="width: 200px"
                                                        ValidationGroup="EditVal" ValidType="String">
                                                    </Chy:XTextBox>
                                                </td>
                                                <td class="warn">&nbsp;
                                                </td>
                                                <td class="label">
                                                    <%= Chy.Web.Resource.GetString("HM_0352") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                </td>
                                                <td class="input" nowrap>
                                                    <Chy:XDatePicker ID="Time3" runat="server" DateFmt="yyyy-MM" MaxDate="%y-%M">
                                                    </Chy:XDatePicker>
                                                </td>
                                                <td class="warn">&nbsp;
                                                </td>
                                                <td class="label">
                                                    <%= Chy.Web.Resource.GetString("HM_0349") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                </td>
                                                <td class="input" nowrap>
                                                    <Chy:XDropDownList ID="ddl3" runat="server">
                                                    </Chy:XDropDownList>
                                                </td>
                                            </tr>
                                            <tr runat="server" id="trStroke">
                                                <td class="warn">&nbsp;
                                                </td>
                                                <td class="label">
                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                </td>
                                                <td class="input" nowrap>
                                                    <Chy:XTextBox ID="Ill4" CssClass="inputtext" ReadOnly="true" runat="server" Style="width: 200px"
                                                        ValidationGroup="EditVal" ValidType="String">
                                                    </Chy:XTextBox>
                                                </td>
                                                <td class="warn">&nbsp;
                                                </td>
                                                <td class="label">
                                                    <%= Chy.Web.Resource.GetString("HM_0352") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                </td>
                                                <td class="input" nowrap>
                                                    <Chy:XDatePicker ID="Time4" runat="server" DateFmt="yyyy-MM" MaxDate="%y-%M">
                                                    </Chy:XDatePicker>
                                                </td>
                                                <td class="warn">&nbsp;
                                                </td>
                                                <td class="label">
                                                    <%= Chy.Web.Resource.GetString("HM_0349") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                </td>
                                                <td class="input" nowrap>
                                                    <Chy:XDropDownList ID="ddl4" runat="server">
                                                    </Chy:XDropDownList>
                                                </td>
                                            </tr>
                                            <tr runat="server" id="trBFat">
                                                <td class="warn">&nbsp;
                                                </td>
                                                <td class="label">
                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                </td>
                                                <td class="input" nowrap>
                                                    <Chy:XTextBox ID="Ill5" CssClass="inputtext" ReadOnly="true" runat="server" Style="width: 200px"
                                                        ValidationGroup="EditVal" ValidType="String">
                                                    </Chy:XTextBox>
                                                </td>
                                                <td class="warn">&nbsp;
                                                </td>
                                                <td class="label">
                                                    <%= Chy.Web.Resource.GetString("HM_0352") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                </td>
                                                <td class="input" nowrap>
                                                    <Chy:XDatePicker ID="Time5" runat="server" DateFmt="yyyy-MM" MaxDate="%y-%M">
                                                    </Chy:XDatePicker>
                                                </td>
                                                <td class="warn">&nbsp;
                                                </td>
                                                <td class="label">
                                                    <%= Chy.Web.Resource.GetString("HM_0349") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                </td>
                                                <td class="input" nowrap>
                                                    <Chy:XDropDownList ID="ddl5" runat="server">
                                                    </Chy:XDropDownList>
                                                </td>
                                            </tr>
                                            <tr runat="server" id="trGout">
                                                <td class="warn">&nbsp;
                                                </td>
                                                <td class="label">
                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                </td>
                                                <td class="input" nowrap>
                                                    <Chy:XTextBox ID="Ill6" CssClass="inputtext" ReadOnly="true" runat="server" Style="width: 200px"
                                                        ValidationGroup="EditVal" ValidType="String">
                                                    </Chy:XTextBox>
                                                </td>
                                                <td class="warn">&nbsp;
                                                </td>
                                                <td class="label">
                                                    <%= Chy.Web.Resource.GetString("HM_0352") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                </td>
                                                <td class="input" nowrap>
                                                    <Chy:XDatePicker ID="Time6" runat="server" DateFmt="yyyy-MM" MaxDate="%y-%M">
                                                    </Chy:XDatePicker>
                                                </td>
                                                <td class="warn">&nbsp;
                                                </td>
                                                <td class="label">
                                                    <%= Chy.Web.Resource.GetString("HM_0349") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                </td>
                                                <td class="input" nowrap>
                                                    <Chy:XDropDownList ID="ddl6" runat="server">
                                                    </Chy:XDropDownList>
                                                </td>
                                            </tr>
                                            <tr runat="server" id="trDep">
                                                <td class="warn">&nbsp;
                                                </td>
                                                <td class="label">
                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                </td>
                                                <td class="input" nowrap>
                                                    <Chy:XTextBox ID="Ill7" CssClass="inputtext" ReadOnly="true" runat="server" Style="width: 200px"
                                                        ValidationGroup="EditVal" ValidType="String">
                                                    </Chy:XTextBox>
                                                </td>
                                                <td class="warn">&nbsp;
                                                </td>
                                                <td class="label">
                                                    <%= Chy.Web.Resource.GetString("HM_0352") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                </td>
                                                <td class="input" nowrap>
                                                    <Chy:XDatePicker ID="Time7" runat="server" DateFmt="yyyy-MM" MaxDate="%y-%M">
                                                    </Chy:XDatePicker>
                                                </td>
                                                <td class="warn">&nbsp;
                                                </td>
                                                <td class="label">
                                                    <%= Chy.Web.Resource.GetString("HM_0349") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                </td>
                                                <td class="input" nowrap>
                                                    <Chy:XDropDownList ID="ddl7" runat="server">
                                                    </Chy:XDropDownList>
                                                </td>
                                            </tr>
                                            <tr runat="server" id="trHepat">
                                                <td class="warn">&nbsp;
                                                </td>
                                                <td class="label">
                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                </td>
                                                <td class="input" nowrap>
                                                    <Chy:XTextBox ID="Ill8" CssClass="inputtext" ReadOnly="true" runat="server" Style="width: 200px"
                                                        ValidationGroup="EditVal" ValidType="String">
                                                    </Chy:XTextBox>
                                                </td>
                                                <td class="warn">&nbsp;
                                                </td>
                                                <td class="label">
                                                    <%= Chy.Web.Resource.GetString("HM_0352") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                </td>
                                                <td class="input" nowrap>
                                                    <Chy:XDatePicker ID="Time8" runat="server" DateFmt="yyyy-MM" MaxDate="%y-%M">
                                                    </Chy:XDatePicker>
                                                </td>
                                                <td class="warn">&nbsp;
                                                </td>
                                                <td class="label">
                                                    <%= Chy.Web.Resource.GetString("HM_0349") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                </td>
                                                <td class="input" nowrap>
                                                    <Chy:XDropDownList ID="ddl8" runat="server">
                                                    </Chy:XDropDownList>
                                                </td>
                                            </tr>
                                            <tr runat="server" id="trGastric">
                                                <td class="warn">&nbsp;
                                                </td>
                                                <td class="label">
                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                </td>
                                                <td class="input" nowrap>
                                                    <Chy:XTextBox ID="Ill9" CssClass="inputtext" ReadOnly="true" runat="server" Style="width: 200px"
                                                        ValidationGroup="EditVal" ValidType="String">
                                                    </Chy:XTextBox>
                                                </td>
                                                <td class="warn">&nbsp;
                                                </td>
                                                <td class="label">
                                                    <%= Chy.Web.Resource.GetString("HM_0352") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                </td>
                                                <td class="input" nowrap>
                                                    <Chy:XDatePicker ID="Time9" runat="server" DateFmt="yyyy-MM" MaxDate="%y-%M">
                                                    </Chy:XDatePicker>
                                                </td>
                                                <td class="warn">&nbsp;
                                                </td>
                                                <td class="label">
                                                    <%= Chy.Web.Resource.GetString("HM_0349") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                </td>
                                                <td class="input" nowrap>
                                                    <Chy:XDropDownList ID="ddl9" runat="server">
                                                    </Chy:XDropDownList>
                                                </td>
                                            </tr>
                                            <tr runat="server" id="trFracture">
                                                <td class="warn">&nbsp;
                                                </td>
                                                <td class="label">
                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                </td>
                                                <td class="input" nowrap>
                                                    <Chy:XTextBox ID="Ill10" CssClass="inputtext" ReadOnly="true" runat="server" Style="width: 200px"
                                                        ValidationGroup="EditVal" ValidType="String">
                                                    </Chy:XTextBox>
                                                </td>
                                                <td class="warn">&nbsp;
                                                </td>
                                                <td class="label">
                                                    <%= Chy.Web.Resource.GetString("HM_0352") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                </td>
                                                <td class="input" nowrap>
                                                    <Chy:XDatePicker ID="Time10" runat="server" DateFmt="yyyy-MM" MaxDate="%y-%M">
                                                    </Chy:XDatePicker>
                                                </td>
                                                <td class="warn">&nbsp;
                                                </td>
                                                <td class="label">
                                                    <%= Chy.Web.Resource.GetString("HM_0349") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                </td>
                                                <td class="input" nowrap>
                                                    <Chy:XDropDownList ID="ddl10" runat="server">
                                                    </Chy:XDropDownList>
                                                </td>
                                            </tr>
                                            <tr runat="server" id="trArthritis">
                                                <td class="warn">&nbsp;
                                                </td>
                                                <td class="label">
                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                </td>
                                                <td class="input" nowrap>
                                                    <Chy:XTextBox ID="Ill11" CssClass="inputtext" ReadOnly="true" runat="server" Style="width: 200px"
                                                        ValidationGroup="EditVal" ValidType="String">
                                                    </Chy:XTextBox>
                                                </td>
                                                <td class="warn">&nbsp;
                                                </td>
                                                <td class="label">
                                                    <%= Chy.Web.Resource.GetString("HM_0352") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                </td>
                                                <td class="input" nowrap>
                                                    <Chy:XDatePicker ID="Time11" runat="server" DateFmt="yyyy-MM" MaxDate="%y-%M">
                                                    </Chy:XDatePicker>
                                                </td>
                                                <td class="warn">&nbsp;
                                                </td>
                                                <td class="label">
                                                    <%= Chy.Web.Resource.GetString("HM_0349") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                </td>
                                                <td class="input" nowrap>
                                                    <Chy:XDropDownList ID="ddl11" runat="server">
                                                    </Chy:XDropDownList>
                                                </td>
                                            </tr>
                                        </table>
                                        <table border="0" cellspacing="0" cellpadding="0" class="formcontainer">
                                            <tr id="trWayIll0">
                                                <td class="warn">&nbsp;
                                                </td>
                                                <td class="label">其它疾病<%= Chy.Web.Resource.GetString("Remp_Colon")%>
                                                </td>
                                                <td class="input" nowrap>
                                                    <input type="text" class="inputtext" id="txtWayIll0" maxlength="64" style="width: 200px"
                                                        onkeypress="TextValidate()" onblur="numkeydelete(this)" />
                                                </td>
                                                <td class="warn">&nbsp;
                                                </td>
                                                <td class="label">
                                                    <%= Chy.Web.Resource.GetString("HM_0352") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                </td>
                                                <td class="input" nowrap>
                                                    <Chy:XDatePicker ID="dpWayIll" runat="server" DateFmt="yyyy-MM" MaxDate="%y-%M">
                                                    </Chy:XDatePicker>
                                                </td>
                                                <td class="warn">&nbsp;
                                                </td>
                                                <td class="label">
                                                    <%= Chy.Web.Resource.GetString("HM_0349") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                </td>
                                                <td class="input" nowrap>
                                                    <select cssclass="secltwidth" id="ddlWayIll0">
                                                        <option selected="selected"></option>
                                                        <option value="0">痊愈</option>
                                                        <option value="1">好转</option>
                                                        <option value="2">后遗</option>
                                                        <option value="3">恶化</option>
                                                    </select>
                                                </td>
                                                <td class="warn">&nbsp;
                                                </td>
                                                <td class="warn">
                                                    <input type="button" onclick="addWayIll()" id="btnAddWayIll0" value='<%= Chy.Web.Resource.GetString("HM_0350")%>'
                                                        class="btn" />
                                                </td>
                                            </tr>
                                            <tr id="trOperation0">
                                                <td class="warn">&nbsp;
                                                </td>
                                                <td class="label">手术史<%= Chy.Web.Resource.GetString("Remp_Colon")%>
                                                </td>
                                                <td class="input" nowrap>
                                                    <input type="text" class="inputtext" id="txtOperation0" maxlength="64" style="width: 200px"
                                                        onkeypress="TextValidate()" onblur="numkeydelete(this)" />
                                                </td>
                                                <td class="warn">&nbsp;
                                                </td>
                                                <td class="label">
                                                    <%= Chy.Web.Resource.GetString("HM_0352") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                </td>
                                                <td class="input" nowrap>
                                                    <Chy:XDatePicker ID="dpOperation" runat="server" DateFmt="yyyy-MM" MaxDate="%y-%M">
                                                    </Chy:XDatePicker>
                                                </td>
                                                <td class="warn">&nbsp;
                                                </td>
                                                <td class="warn">
                                                    <input type="button" onclick="addOperation()" id="btnAddOperation0" value='<%= Chy.Web.Resource.GetString("HM_0350")%>'
                                                        class="btn" />
                                                </td>
                                                <td colspan="3"></td>
                                            </tr>
                                            <tr id="trInjury0">
                                                <td class="warn">&nbsp;
                                                </td>
                                                <td class="label">外伤史<%= Chy.Web.Resource.GetString("Remp_Colon")%>
                                                </td>
                                                <td class="input" nowrap>
                                                    <input type="text" class="inputtext" id="txtInjury0" maxlength="64" style="width: 200px"
                                                        onkeypress="TextValidate()" onblur="numkeydelete(this)" />
                                                </td>
                                                <td class="warn">&nbsp;
                                                </td>
                                                <td class="label">
                                                    <%= Chy.Web.Resource.GetString("HM_0352") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                </td>
                                                <td class="input" nowrap>
                                                    <Chy:XDatePicker ID="dpInjury" runat="server" DateFmt="yyyy-MM" MaxDate="%y-%M">
                                                    </Chy:XDatePicker>
                                                </td>
                                                <td class="warn">&nbsp;
                                                </td>
                                                <td class="warn">
                                                    <input type="button" onclick="addInjury()" id="btnAddInjury0" value='<%= Chy.Web.Resource.GetString("HM_0350")%>'
                                                        class="btn" />
                                                </td>
                                                <td colspan="3"></td>
                                            </tr>
                                            <tr id="trInBlood0">
                                                <td class="warn">&nbsp;
                                                </td>
                                                <td class="label">输血史<%= Chy.Web.Resource.GetString("Remp_Colon")%>
                                                </td>
                                                <td class="input" nowrap>
                                                    <input type="text" class="inputtext" id="txtInBlood0" maxlength="64" style="width: 200px"
                                                        onkeypress="TextValidate()" onblur="numkeydelete(this)" />
                                                </td>
                                                <td class="warn">&nbsp;
                                                </td>
                                                <td class="label">
                                                    <%= Chy.Web.Resource.GetString("HM_0352") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                </td>
                                                <td class="input" nowrap>
                                                    <Chy:XDatePicker ID="dpInBlood" runat="server" DateFmt="yyyy-MM" MaxDate="%y-%M">
                                                    </Chy:XDatePicker>
                                                </td>
                                                <td class="warn">&nbsp;
                                                </td>
                                                <td class="warn">
                                                    <input type="button" onclick="addInBlood()" id="btnAddInBlood0" value='<%= Chy.Web.Resource.GetString("HM_0350")%>'
                                                        class="btn" />
                                                </td>
                                                <td colspan="3"></td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </div>
                            </div>
                            <!--家族史-->
                            <div class="con">
                                <ul class="tags">
                                    <li class="selectTag"><a onclick="selectTag('tagContent6',this)" href="javascript:void(0)">
                                        <%= Chy.Web.Resource.GetString("HM_0353")%></a></li>
                                    <img alt="展开" style="cursor: pointer; float: right; padding-right: 5px; padding-top: 10px;"
                                        src="../../Images/arrow_aup.gif" onclick="DownAndUp(this);" />
                                </ul>
                                <div id="tagContent6">
                                    <table border="0" cellspacing="0" cellpadding="0" class="formcontainer">
                                        <tr>
                                            <td>
                                                <asp:UpdatePanel ID="upFather" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <table>
                                                            <tr>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0354") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap colspan="5">
                                                                    <asp:CheckBoxList ID="cblFather" runat="server" RepeatDirection="Horizontal" AutoPostBack="true"
                                                                        RepeatLayout="Flow" RepeatColumns="9" OnSelectedIndexChanged="cblFather_SelectedIndexChanged">
                                                                    </asp:CheckBoxList>
                                                                </td>
                                                            </tr>
                                                            <tr runat="server" id="trfather0">
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtFatherIll0" ReadOnly="true" CssClass="inputtext" runat="server"
                                                                        ValidationGroup="EditVal" MaxLength="64" ValidType="String" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM5_0010") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtFatherAge0" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                                        ValidationGroup="EditVal" MaxLength="3" ValidType="IntZeroPostive" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr runat="server" id="trfather1">
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtFatherIll1" ReadOnly="true" CssClass="inputtext" runat="server"
                                                                        ValidationGroup="EditVal" MaxLength="64" ValidType="String" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM5_0010") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtFatherAge1" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                                        ValidationGroup="EditVal" MaxLength="3" ValidType="IntZeroPostive" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr runat="server" id="trfather2">
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtFatherIll2" ReadOnly="true" CssClass="inputtext" runat="server"
                                                                        ValidationGroup="EditVal" MaxLength="64" ValidType="String" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM5_0010") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtFatherAge2" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                                        ValidationGroup="EditVal" MaxLength="3" ValidType="IntZeroPostive" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr runat="server" id="trfather3">
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtFatherIll3" ReadOnly="true" CssClass="inputtext" runat="server"
                                                                        ValidationGroup="EditVal" MaxLength="64" ValidType="String" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM5_0010") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtFatherAge3" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                                        ValidationGroup="EditVal" MaxLength="3" ValidType="IntZeroPostive" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr runat="server" id="trfather4">
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtFatherIll4" ReadOnly="true" CssClass="inputtext" runat="server"
                                                                        ValidationGroup="EditVal" MaxLength="64" ValidType="String" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM5_0010") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtFatherAge4" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                                        ValidationGroup="EditVal" MaxLength="3" ValidType="IntZeroPostive" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr runat="server" id="trfather5">
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtFatherIll5" ReadOnly="true" CssClass="inputtext" runat="server"
                                                                        ValidationGroup="EditVal" MaxLength="64" ValidType="String" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM5_0010") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtFatherAge5" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                                        ValidationGroup="EditVal" MaxLength="3" ValidType="IntZeroPostive" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr runat="server" id="trfather6">
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtFatherIll6" ReadOnly="true" CssClass="inputtext" runat="server"
                                                                        ValidationGroup="EditVal" MaxLength="64" ValidType="String" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM5_0010") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtFatherAge6" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                                        ValidationGroup="EditVal" MaxLength="3" ValidType="IntZeroPostive" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr runat="server" id="trfather7">
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtFatherIll7" ReadOnly="true" CssClass="inputtext" runat="server"
                                                                        ValidationGroup="EditVal" MaxLength="64" ValidType="String" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM5_0010") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtFatherAge7" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                                        ValidationGroup="EditVal" MaxLength="3" ValidType="IntZeroPostive" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr runat="server" id="trfather8">
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtFatherIll8" ReadOnly="true" CssClass="inputtext" runat="server"
                                                                        ValidationGroup="EditVal" MaxLength="64" ValidType="String" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM5_0010") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtFatherAge8" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                                        ValidationGroup="EditVal" MaxLength="3" ValidType="IntZeroPostive" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr runat="server" id="trfather9">
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtFatherIll9" ReadOnly="true" CssClass="inputtext" runat="server"
                                                                        ValidationGroup="EditVal" MaxLength="64" ValidType="String" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM5_0010") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtFatherAge9" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                                        ValidationGroup="EditVal" MaxLength="3" ValidType="IntZeroPostive" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr runat="server" id="trfather10">
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtFatherIll10" ReadOnly="true" CssClass="inputtext" runat="server"
                                                                        ValidationGroup="EditVal" MaxLength="64" ValidType="String" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM5_0010") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtFatherAge10" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                                        ValidationGroup="EditVal" MaxLength="3" ValidType="IntZeroPostive" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr runat="server" id="trfather11">
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtFatherIll11" ReadOnly="true" CssClass="inputtext" runat="server"
                                                                        ValidationGroup="EditVal" MaxLength="64" ValidType="String" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM5_0010") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtFatherAge11" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                                        ValidationGroup="EditVal" MaxLength="3" ValidType="IntZeroPostive" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr runat="server" id="trfather12">
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtFatherIll12" CssClass="inputtext" runat="server" ValidationGroup="EditVal"
                                                                        MaxLength="64" ValidType="String" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM5_0010") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtFatherAge12" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                                        ValidationGroup="EditVal" MaxLength="3" ValidType="IntZeroPostive" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </td>
                                        </tr>
                                        <tr style="margin-top: 5px">
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:UpdatePanel ID="upMother" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <table>
                                                            <tr>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0355") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap colspan="5">
                                                                    <asp:CheckBoxList ID="cblMother" runat="server" RepeatDirection="Horizontal" AutoPostBack="true"
                                                                        RepeatLayout="Flow" RepeatColumns="9" OnSelectedIndexChanged="cblMother_SelectedIndexChanged">
                                                                    </asp:CheckBoxList>
                                                                </td>
                                                            </tr>
                                                            <tr runat="server" id="trmother0">
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtMotherIll0" ReadOnly="true" CssClass="inputtext" runat="server"
                                                                        ValidationGroup="EditVal" MaxLength="64" ValidType="String" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM5_0010") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtMotherAge0" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                                        ValidationGroup="EditVal" MaxLength="3" ValidType="IntZeroPostive" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr runat="server" id="trmother1">
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtMotherIll1" ReadOnly="true" CssClass="inputtext" runat="server"
                                                                        ValidationGroup="EditVal" MaxLength="64" ValidType="String" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM5_0010") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtMotherAge1" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                                        ValidationGroup="EditVal" MaxLength="3" ValidType="IntZeroPostive" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr runat="server" id="trmother2">
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtMotherIll2" ReadOnly="true" CssClass="inputtext" runat="server"
                                                                        ValidationGroup="EditVal" MaxLength="64" ValidType="String" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM5_0010") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtMotherAge2" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                                        ValidationGroup="EditVal" MaxLength="3" ValidType="IntZeroPostive" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr runat="server" id="trmother3">
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtMotherIll3" ReadOnly="true" CssClass="inputtext" runat="server"
                                                                        ValidationGroup="EditVal" MaxLength="64" ValidType="String" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM5_0010") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtMotherAge3" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                                        ValidationGroup="EditVal" MaxLength="3" ValidType="IntZeroPostive" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr runat="server" id="trmother4">
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtMotherIll4" ReadOnly="true" CssClass="inputtext" runat="server"
                                                                        ValidationGroup="EditVal" MaxLength="64" ValidType="String" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM5_0010") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtMotherAge4" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                                        ValidationGroup="EditVal" MaxLength="3" ValidType="IntZeroPostive" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr runat="server" id="trmother5">
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtMotherIll5" ReadOnly="true" CssClass="inputtext" runat="server"
                                                                        ValidationGroup="EditVal" MaxLength="64" ValidType="String" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM5_0010") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtMotherAge5" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                                        ValidationGroup="EditVal" MaxLength="3" ValidType="IntZeroPostive" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr runat="server" id="trmother6">
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtMotherIll6" ReadOnly="true" CssClass="inputtext" runat="server"
                                                                        ValidationGroup="EditVal" MaxLength="64" ValidType="String" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM5_0010") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtMotherAge6" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                                        ValidationGroup="EditVal" MaxLength="3" ValidType="IntZeroPostive" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr runat="server" id="trmother7">
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtMotherIll7" ReadOnly="true" CssClass="inputtext" runat="server"
                                                                        ValidationGroup="EditVal" MaxLength="64" ValidType="String" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM5_0010") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtMotherAge7" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                                        ValidationGroup="EditVal" MaxLength="3" ValidType="IntZeroPostive" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr runat="server" id="trmother8">
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtMotherIll8" ReadOnly="true" CssClass="inputtext" runat="server"
                                                                        ValidationGroup="EditVal" MaxLength="64" ValidType="String" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM5_0010") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtMotherAge8" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                                        ValidationGroup="EditVal" MaxLength="3" ValidType="IntZeroPostive" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr runat="server" id="trmother9">
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtMotherIll9" ReadOnly="true" CssClass="inputtext" runat="server"
                                                                        ValidationGroup="EditVal" MaxLength="64" ValidType="String" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM5_0010") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtMotherAge9" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                                        ValidationGroup="EditVal" MaxLength="3" ValidType="IntZeroPostive" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr runat="server" id="trmother10">
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtMotherIll10" ReadOnly="true" CssClass="inputtext" runat="server"
                                                                        ValidationGroup="EditVal" MaxLength="64" ValidType="String" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM5_0010") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtMotherAge10" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                                        ValidationGroup="EditVal" MaxLength="3" ValidType="IntZeroPostive" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr runat="server" id="trmother11">
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtMotherIll11" ReadOnly="true" CssClass="inputtext" runat="server"
                                                                        ValidationGroup="EditVal" MaxLength="64" ValidType="String" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM5_0010") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtMotherAge11" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                                        ValidationGroup="EditVal" MaxLength="3" ValidType="IntZeroPostive" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr runat="server" id="trmother12">
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtMotherIll12" CssClass="inputtext" runat="server" ValidationGroup="EditVal"
                                                                        MaxLength="64" ValidType="String" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM5_0010") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtMotherAge12" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                                        ValidationGroup="EditVal" MaxLength="3" ValidType="IntZeroPostive" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </td>
                                        </tr>
                                        <tr style="margin-top: 5px">
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:UpdatePanel ID="upSib" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <table>
                                                            <tr>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0356") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap colspan="5">
                                                                    <asp:CheckBoxList ID="cblSib" runat="server" RepeatDirection="Horizontal" AutoPostBack="true"
                                                                        RepeatLayout="Flow" RepeatColumns="9" OnSelectedIndexChanged="cblSib_SelectedIndexChanged">
                                                                    </asp:CheckBoxList>
                                                                </td>
                                                            </tr>
                                                            <tr runat="server" id="trsib0">
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtSibIll0" ReadOnly="true" CssClass="inputtext" runat="server"
                                                                        ValidationGroup="EditVal" MaxLength="64" ValidType="String" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM5_0010") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtSibAge0" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                                        ValidationGroup="EditVal" MaxLength="3" ValidType="IntZeroPostive" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr runat="server" id="trsib1">
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtSibIll1" ReadOnly="true" CssClass="inputtext" runat="server"
                                                                        ValidationGroup="EditVal" MaxLength="64" ValidType="String" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM5_0010") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtSibAge1" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                                        ValidationGroup="EditVal" MaxLength="3" ValidType="IntZeroPostive" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr runat="server" id="trsib2">
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtSibIll2" ReadOnly="true" CssClass="inputtext" runat="server"
                                                                        ValidationGroup="EditVal" MaxLength="64" ValidType="String" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM5_0010") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtSibAge2" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                                        ValidationGroup="EditVal" MaxLength="3" ValidType="IntZeroPostive" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr runat="server" id="trsib3">
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtSibIll3" ReadOnly="true" CssClass="inputtext" runat="server"
                                                                        ValidationGroup="EditVal" MaxLength="64" ValidType="String" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM5_0010") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtSibAge3" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                                        ValidationGroup="EditVal" MaxLength="3" ValidType="IntZeroPostive" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr runat="server" id="trsib4">
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtSibIll4" ReadOnly="true" CssClass="inputtext" runat="server"
                                                                        ValidationGroup="EditVal" MaxLength="64" ValidType="String" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM5_0010") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtSibAge4" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                                        ValidationGroup="EditVal" MaxLength="3" ValidType="IntZeroPostive" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr runat="server" id="trsib5">
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtSibIll5" ReadOnly="true" CssClass="inputtext" runat="server"
                                                                        ValidationGroup="EditVal" MaxLength="64" ValidType="String" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM5_0010") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtSibAge5" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                                        ValidationGroup="EditVal" MaxLength="3" ValidType="IntZeroPostive" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr runat="server" id="trsib6">
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtSibIll6" ReadOnly="true" CssClass="inputtext" runat="server"
                                                                        ValidationGroup="EditVal" MaxLength="64" ValidType="String" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM5_0010") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtSibAge6" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                                        ValidationGroup="EditVal" MaxLength="3" ValidType="IntZeroPostive" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr runat="server" id="trsib7">
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtSibIll7" ReadOnly="true" CssClass="inputtext" runat="server"
                                                                        ValidationGroup="EditVal" MaxLength="64" ValidType="String" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM5_0010") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtSibAge7" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                                        ValidationGroup="EditVal" MaxLength="3" ValidType="IntZeroPostive" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr runat="server" id="trsib8">
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtSibIll8" ReadOnly="true" CssClass="inputtext" runat="server"
                                                                        ValidationGroup="EditVal" MaxLength="64" ValidType="String" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM5_0010") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtSibAge8" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                                        ValidationGroup="EditVal" MaxLength="3" ValidType="IntZeroPostive" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr runat="server" id="trsib9">
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtSibIll9" ReadOnly="true" CssClass="inputtext" runat="server"
                                                                        ValidationGroup="EditVal" MaxLength="64" ValidType="String" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM5_0010") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtSibAge9" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                                        ValidationGroup="EditVal" MaxLength="3" ValidType="IntZeroPostive" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr runat="server" id="trsib10">
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtSibIll10" ReadOnly="true" CssClass="inputtext" runat="server"
                                                                        ValidationGroup="EditVal" MaxLength="64" ValidType="String" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM5_0010") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtSibAge10" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                                        ValidationGroup="EditVal" MaxLength="3" ValidType="IntZeroPostive" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr runat="server" id="trsib11">
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtSibIll11" ReadOnly="true" CssClass="inputtext" runat="server"
                                                                        ValidationGroup="EditVal" MaxLength="64" ValidType="String" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM5_0010") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtSibAge11" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                                        ValidationGroup="EditVal" MaxLength="3" ValidType="IntZeroPostive" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr runat="server" id="trsib12">
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtSibIll12" CssClass="inputtext" runat="server" ValidationGroup="EditVal"
                                                                        MaxLength="64" ValidType="String" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM5_0010") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtSibAge12" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                                        ValidationGroup="EditVal" MaxLength="3" ValidType="IntZeroPostive" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </td>
                                        </tr>
                                        <tr style="margin-top: 5px">
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:UpdatePanel ID="upChild" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <table>
                                                            <tr>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0357") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap colspan="5">
                                                                    <asp:CheckBoxList ID="cblChild" runat="server" RepeatDirection="Horizontal" AutoPostBack="true"
                                                                        RepeatLayout="Flow" RepeatColumns="9" OnSelectedIndexChanged="cblChild_SelectedIndexChanged">
                                                                    </asp:CheckBoxList>
                                                                </td>
                                                            </tr>
                                                            <tr runat="server" id="trchild0">
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtChildIll0" ReadOnly="true" CssClass="inputtext" runat="server"
                                                                        ValidationGroup="EditVal" MaxLength="64" ValidType="String" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM5_0010") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtChildAge0" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                                        ValidationGroup="EditVal" MaxLength="3" ValidType="IntZeroPostive" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr runat="server" id="trchild1">
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtChildIll1" ReadOnly="true" CssClass="inputtext" runat="server"
                                                                        ValidationGroup="EditVal" MaxLength="64" ValidType="String" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM5_0010") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtChildAge1" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                                        ValidationGroup="EditVal" MaxLength="3" ValidType="IntZeroPostive" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr runat="server" id="trchild2">
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtChildIll2" ReadOnly="true" CssClass="inputtext" runat="server"
                                                                        ValidationGroup="EditVal" MaxLength="64" ValidType="String" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM5_0010") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtChildAge2" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                                        ValidationGroup="EditVal" MaxLength="3" ValidType="IntZeroPostive" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr runat="server" id="trchild3">
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtChildIll3" ReadOnly="true" CssClass="inputtext" runat="server"
                                                                        ValidationGroup="EditVal" MaxLength="64" ValidType="String" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM5_0010") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtChildAge3" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                                        ValidationGroup="EditVal" MaxLength="3" ValidType="IntZeroPostive" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr runat="server" id="trchild4">
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtChildIll4" ReadOnly="true" CssClass="inputtext" runat="server"
                                                                        ValidationGroup="EditVal" MaxLength="64" ValidType="String" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM5_0010") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtChildAge4" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                                        ValidationGroup="EditVal" MaxLength="3" ValidType="IntZeroPostive" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr runat="server" id="trchild5">
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtChildIll5" ReadOnly="true" CssClass="inputtext" runat="server"
                                                                        ValidationGroup="EditVal" MaxLength="64" ValidType="String" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM5_0010") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtChildAge5" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                                        ValidationGroup="EditVal" MaxLength="3" ValidType="IntZeroPostive" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr runat="server" id="trchild6">
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtChildIll6" ReadOnly="true" CssClass="inputtext" runat="server"
                                                                        ValidationGroup="EditVal" MaxLength="64" ValidType="String" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM5_0010") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtChildAge6" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                                        ValidationGroup="EditVal" MaxLength="3" ValidType="IntZeroPostive" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr runat="server" id="trchild7">
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtChildIll7" ReadOnly="true" CssClass="inputtext" runat="server"
                                                                        ValidationGroup="EditVal" MaxLength="64" ValidType="String" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM5_0010") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtChildAge7" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                                        ValidationGroup="EditVal" MaxLength="3" ValidType="IntZeroPostive" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr runat="server" id="trchild8">
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtChildIll8" ReadOnly="true" CssClass="inputtext" runat="server"
                                                                        ValidationGroup="EditVal" MaxLength="64" ValidType="String" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM5_0010") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtChildAge8" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                                        ValidationGroup="EditVal" MaxLength="3" ValidType="IntZeroPostive" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr runat="server" id="trchild9">
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtChildIll9" ReadOnly="true" CssClass="inputtext" runat="server"
                                                                        ValidationGroup="EditVal" MaxLength="64" ValidType="String" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM5_0010") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtChildAge9" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                                        ValidationGroup="EditVal" MaxLength="3" ValidType="IntZeroPostive" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr runat="server" id="trchild10">
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtChildIll10" ReadOnly="true" CssClass="inputtext" runat="server"
                                                                        ValidationGroup="EditVal" MaxLength="64" ValidType="String" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM5_0010") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtChildAge10" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                                        ValidationGroup="EditVal" MaxLength="3" ValidType="IntZeroPostive" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr runat="server" id="trchild11">
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtChildIll11" ReadOnly="true" CssClass="inputtext" runat="server"
                                                                        ValidationGroup="EditVal" MaxLength="64" ValidType="String" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM5_0010") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtChildAge11" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                                        ValidationGroup="EditVal" MaxLength="3" ValidType="IntZeroPostive" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                            </tr>
                                                            <tr runat="server" id="trchild12">
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtChildIll12" CssClass="inputtext" runat="server" ValidationGroup="EditVal"
                                                                        MaxLength="64" ValidType="String" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                                <td class="warn">&nbsp;
                                                                </td>
                                                                <td class="label">
                                                                    <%= Chy.Web.Resource.GetString("HM5_0010") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                                                </td>
                                                                <td class="input" nowrap>
                                                                    <Chy:XTextBox ID="txtChildAge12" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                                        ValidationGroup="EditVal" MaxLength="3" ValidType="IntZeroPostive" Width="200px">
                                                                    </Chy:XTextBox>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <!--过敏史-->
                            <input type="hidden" id="hidGenetic" runat="server" />
                            <div class="con">
                                <ul class="tags">
                                    <li class="selectTag"><a onclick="selectTag('tagContent7',this)" href="javascript:void(0)">
                                        <%= Chy.Web.Resource.GetString("HM_0358")%></a></li>
                                    <img alt="展开" style="cursor: pointer; float: right; padding-right: 5px; padding-top: 10px;"
                                        src="../../Images/arrow_aup.gif" onclick="DownAndUp(this);" />
                                </ul>
                                <div id="tagContent7">
                                    <table border="0" cellspacing="0" cellpadding="0" class="formcontainer">
                                        <tr>
                                            <td class="warn">&nbsp;
                                            </td>
                                            <td class="label" colspan="4">
                                                <asp:RadioButtonList ID="rblGenetic" runat="server" RepeatDirection="Horizontal"
                                                    RepeatLayout="Flow">
                                                    <asp:ListItem Value="0" Selected="True" Text="无"></asp:ListItem>
                                                    <asp:ListItem Value="1" Text="有"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr id="trGenetic0">
                                            <td class="warn">&nbsp;
                                            </td>
                                            <td class="label">
                                                <%= Chy.Web.Resource.GetString("HM_0084") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                            </td>
                                            <td class="input" nowrap>
                                                <input type="text" onkeypress="TextValidate()" onblur="numkeydelete(this)" class="inputtext"
                                                    id="txtGenetic0" maxlength="64" style="width: 200px" />
                                            </td>
                                            <td class="warn">&nbsp;
                                            </td>
                                            <td class="label">
                                                <input type="button" onclick="addGenetic()" id="btnAddGenetic0" value='<%= Chy.Web.Resource.GetString("HM_0350")%>'
                                                    class="btn" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <!--女性检查-->
                            <div class="con" runat="server" id="woman">
                                <ul class="tags">
                                    <li class="selectTag"><a onclick="selectTag('tagContent8',this)" href="javascript:void(0)">婚育史</a></li>
                                    <img alt="展开" style="cursor: pointer; float: right; padding-right: 5px; padding-top: 10px;"
                                        src="../../Images/arrow_aup.gif" onclick="DownAndUp(this);" />
                                </ul>
                                <div id="tagContent8">
                                    <table border="0" cellspacing="0" cellpadding="0" class="formcontainer">
                                        <tr>
                                            <td class="warn">&nbsp;
                                            </td>
                                            <td class="label">
                                                <%= Chy.Web.Resource.GetString("HM_0360") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                            </td>
                                            <td class="input" nowrap>
                                                <Chy:XTextBox ID="txtPregnancy" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                    ValidationGroup="EditVal" MaxLength="4" ValidType="IntZeroPostive">
                                                </Chy:XTextBox>&nbsp;<%= Chy.Web.Resource.GetString("HM_0361")%>
                                            </td>
                                            <td class="warn">&nbsp;
                                            </td>
                                            <td class="label">
                                                <%= Chy.Web.Resource.GetString("HM_0362") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                            </td>
                                            <td class="input" nowrap>
                                                <Chy:XTextBox ID="txtMotherhood" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                    ValidationGroup="EditVal" MaxLength="4" ValidType="IntZeroPostive">
                                                </Chy:XTextBox>&nbsp;<%= Chy.Web.Resource.GetString("HM_0361")%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="warn">&nbsp;
                                            </td>
                                            <td class="label">
                                                <%= Chy.Web.Resource.GetString("HM_0363") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                            </td>
                                            <td class="input" nowrap colspan="4">
                                                <asp:CheckBoxList ID="cblWay" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow"
                                                    RepeatColumns="3">
                                                    <asp:ListItem Value="0" Text=""></asp:ListItem>
                                                    <asp:ListItem Value="1" Text=""></asp:ListItem>
                                                    <asp:ListItem Value="2" Text=""></asp:ListItem>
                                                </asp:CheckBoxList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="warn">&nbsp;
                                            </td>
                                            <td class="label">
                                                <%= Chy.Web.Resource.GetString("HM_0367") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                            </td>
                                            <td class="input" nowrap>
                                                <Chy:XTextBox ID="txtMenarche" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                    ValidationGroup="EditVal" MaxLength="4" ValidType="IntPostive">
                                                </Chy:XTextBox>&nbsp;<%= Chy.Web.Resource.GetString("HM_0368")%>
                                            </td>
                                            <td class="warn">&nbsp;
                                            </td>
                                            <td class="label">
                                                <%= Chy.Web.Resource.GetString("HM_0369") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                            </td>
                                            <td class="input" nowrap>
                                                <Chy:XDatePicker ID="txtLastTime" runat="server">
                                                </Chy:XDatePicker>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="warn">&nbsp;
                                            </td>
                                            <td class="label">
                                                <%= Chy.Web.Resource.GetString("HM_0370") + Chy.Web.Resource.GetString("Remp_Colon")%>
                                            </td>
                                            <td class="input" nowrap>
                                                <Chy:XTextBox ID="txtCycle" CssClass="inputtext" runat="server" onKeyUp="clearNoInt(this)"
                                                    ValidationGroup="EditVal" MaxLength="3" ValidType="IntZeroPostive">
                                                </Chy:XTextBox>&nbsp;<%= Chy.Web.Resource.GetString("HM_0371")%>
                                            </td>
                                            <td class="warn">&nbsp;
                                            </td>
                                            <td class="label">
                                                <%= Chy.Web.Resource.GetString("HM_0372")%>:
                                            </td>
                                            <td class="input">
                                                <asp:RadioButtonList ID="rblVolume" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                                    <asp:ListItem Value="0" Text=""></asp:ListItem>
                                                    <asp:ListItem Value="1" Text=""></asp:ListItem>
                                                    <asp:ListItem Value="2" Text=""></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="warn">&nbsp;
                                            </td>
                                            <td class="label">
                                                <%= Chy.Web.Resource.GetString("HM_0376")%>:
                                            </td>
                                            <td class="input" nowrap colspan="4">
                                                <asp:CheckBoxList ID="cblMethods" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow"
                                                    RepeatColumns="5">
                                                    <asp:ListItem Value="0" Text=""></asp:ListItem>
                                                    <asp:ListItem Value="1" Text=""></asp:ListItem>
                                                    <asp:ListItem Value="2" Text=""></asp:ListItem>
                                                    <asp:ListItem Value="3" Text=""></asp:ListItem>
                                                    <asp:ListItem Value="4" Text=""></asp:ListItem>
                                                </asp:CheckBoxList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="warn">&nbsp;
                                            </td>
                                            <td class="label"></td>
                                            <td class="input" nowrap colspan="4">
                                                <%--<asp:CheckBox ID="cbWayMethods" runat="server" Text="其他:"/>--%>
                                                <asp:Label runat="server" Text="" ID="lblMethods"></asp:Label>
                                                <Chy:XTextBox TextMode="MultiLine" onkeypress="TextValidate()" onblur="numkeydelete(this)"
                                                    MaxLen="30" runat="server" Rows="3" CssClass="inputtext" ID="txtMethods">
                                                </Chy:XTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
        </div>
                        <div class="text_c">
                            <Chy:XButton ID="btnSave" runat="server" Text='' CssClass="button" OnClick="btnSave_Click"
                                ValidationGroup="EditVal" OnClientClick="return SaveAll();" />
                            <span class="space"></span>
                            <Chy:XButton ID="btnAudit" runat="server" Visible="false" ValidationGroup="EditVal"
                                Text='' CssClass="button" OnClick="btnAudit_Click" />
                            <span class="space"></span>
                            <Chy:XButton ID="btnUnAudit" runat="server" Visible="false" ValidationGroup="EditVal"
                                Text='' CssClass="button" OnClick="btnUnAudit_Click" />
                            <%--<Chy:XButton ID="btnCancel" runat="server"  ValidationGroup="EditVal" Text="取消" CssClass="button" OnClientClick="window.location.href='MedicalserviceList.aspx';" />--%>
                            <input type="button" runat="server" id="btnC" value="返回" class="button" />
                            <input type="hidden" id="hid_value" runat="server" />
                            <input type="hidden" runat="server" id="healID" />
                            <input type="hidden" runat="server" id="hideAudit" value="0" />
                        </div>

                <script type="text/javascript">
                    $(document).ready(
                        function () {
                            var hideAudit = document.getElementById("<%=hideAudit.ClientID %>"); //是否审核的标记
                            if (hideAudit.value == "1") {
                                //document.getElementById("search").style.display = "none";
                                $("input:button[id!='<%=btnUnAudit.ClientID %>']").hide();
                                $("input[id!='<%=btnUnAudit.ClientID %>']").attr("disabled", "disabled");
                                $("input:hidden").removeAttr("disabled");
                                $("#<%=btnUnAudit.ClientID %>").removeAttr("disabled");
                                $("#<%=btnUnAudit.ClientID %>").show();

                            }
                            else {
                                $("input:button[id!='<%=btnUnAudit.ClientID %>']").show();
                                $("input").removeAttr("disabled");
                                $("#<%=btnUnAudit.ClientID %>").hide();
                            }
                            $("#<%=cblIllness.ClientID %>>input:checkbox").click(function () {
                                ShowPassIll($(this).attr("id"), $(this).attr("checked"));
                            });
                            $("#<%=cblIllness.ClientID %>>input:checkbox").each(function () {
                                ShowPassIll($(this).attr("id"), $(this).attr("checked"));
                            });

                            $("#<%=rblGenetic.ClientID %>>input:radio").click(function () {
                                if ($(this).val() == "0") {
                                    $("tr[id^='trGenetic']").hide();
                                }
                                else {
                                    $("tr[id^='trGenetic']").show();
                                }
                                clientUnity.resizeFrame(parent.document.getElementById("mainFrame"));
                            });

                            $("#<%=rblGenetic.ClientID %>>input:radio").each(function () {
                                if ($(this).attr("checked")) {
                                    if ($(this).val() == "0") {
                                        $("tr[id^='trGenetic']").hide();
                                    }
                                    else {
                                        $("tr[id^='trGenetic']").show();
                                    }
                                }
                            });
                            if ($("#<%=btnC.ClientID %>").val() == "返回") {
                                $("input").attr("disabled", "disabled");
                                $("#<%=btnC.ClientID %>").removeAttr("disabled");
                            }
                            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
                        }
                    );

                        function DownAndUp(obj) {
                            var btn = $(obj).parent().find("a");
                            if ($(obj).attr("alt") == "展开") {
                                $(obj).attr("alt", "收起");
                                $(obj).attr("src", "../../Images/arrow_adown.gif");
                            }
                            else {
                                $(obj).attr("alt", "展开");
                                $(obj).attr("src", "../../Images/arrow_aup.gif");
                            }
                            clientUnity.resizeFrame(parent.document.getElementById("mainFrame"));
                            btn.click();
                        }
                        function ShowPassIll(id, isShow) {
                            var no = parseInt(id.substr(id.lastIndexOf('_') + 1));
                            // trBP, trDiabete, trHeartIll, trCancer, trStroke, trBFat, trGout,
                            // trDep, trHepat, trGastric, trInjury, trOperation, trFracture, trArthritis, trInBlood, trWayIll
                            switch (no) {
                                case 0:
                                    if (isShow) {
                                        $("#<%=trBP.ClientID %>").show();
                                    }
                                    else {
                                        $("#<%=trBP.ClientID %>").hide();
                                    }
                                    break;
                                case 1:
                                    if (isShow) {
                                        $("#<%=trDiabete.ClientID %>").show();
                                    }
                                    else {
                                        $("#<%=trDiabete.ClientID %>").hide();
                                    }
                                    break;
                                case 2:
                                    if (isShow) {
                                        $("#<%=trHeartIll.ClientID %>").show();
                                }
                                else {
                                    $("#<%=trHeartIll.ClientID %>").hide();
                                }
                                break;
                            case 3:
                                if (isShow) {
                                    $("#<%=trCancer.ClientID %>").show();
                                }
                                else {
                                    $("#<%=trCancer.ClientID %>").hide();
                                }
                                break;
                            case 4:
                                if (isShow) {
                                    $("#<%=trStroke.ClientID %>").show();
                                }
                                else {
                                    $("#<%=trStroke.ClientID %>").hide();
                                }
                                break;
                            case 5:
                                if (isShow) {
                                    $("#<%=trBFat.ClientID %>").show();
                                }
                                else {
                                    $("#<%=trBFat.ClientID %>").hide();
                                }
                                break;
                            case 6:
                                if (isShow) {
                                    $("#<%=trGout.ClientID %>").show();
                                }
                                else {
                                    $("#<%=trGout.ClientID %>").hide();
                                }
                                break;
                            case 7:
                                if (isShow) {
                                    $("#<%=trDep.ClientID %>").show();
                                }
                                else {
                                    $("#<%=trDep.ClientID %>").hide();
                                }
                                break;
                            case 8:
                                if (isShow) {
                                    $("#<%=trHepat.ClientID %>").show();
                                }
                                else {
                                    $("#<%=trHepat.ClientID %>").hide();
                                }
                                break;
                            case 9:
                                if (isShow) {
                                    $("#<%=trGastric.ClientID %>").show();
                                }
                                else {
                                    $("#<%=trGastric.ClientID %>").hide();
                                }
                                break;
                            case 10:
                                if (isShow) {
                                    $("#<%=trFracture.ClientID %>").show();
                                }
                                else {
                                    $("#<%=trFracture.ClientID %>").hide();
                                }

                                break;
                            case 11:
                                if (isShow) {
                                    $("#<%=trArthritis.ClientID %>").show();
                                }
                                else {
                                    $("#<%=trArthritis.ClientID %>").hide();
                                }
                                break;
                            case 12:
                                if (isShow) {
                                    $("tr[id^='trInjury']").show();
                                }
                                else {
                                    $("tr[id^='trInjury']").hide();
                                }
                                break;
                            case 13:
                                if (isShow) {
                                    $("tr[id^='trOperation']").show();
                                }
                                else {
                                    $("tr[id^='trOperation']").hide();
                                }
                                break;
                            case 14:
                                if (isShow) {
                                    $("tr[id^='trInBlood']").show();
                                }
                                else {
                                    $("tr[id^='trInBlood']").hide();
                                }
                                break;
                            case 15:
                                if (isShow) {
                                    $("tr[id^='trWayIll']").show();
                                }
                                else {
                                    $("tr[id^='trWayIll']").hide();
                                }
                                break;
                            default:

                        }

                        clientUnity.resizeFrame(parent.document.getElementById("mainFrame"));
                    }

                    function SaveAll() {
                        return saveNowIll() && saveWayIll() && saveOperation() && saveInjury() && saveInBlood() && saveGenetic();
                    }

                    function selectTag(showContent, selfObj) {
                        if (selfObj.parentNode.className == "selectTag") {
                            selfObj.parentNode.className = "";
                            document.getElementById(showContent).style.display = "none";
                        }
                        else {
                            selfObj.parentNode.className = "selectTag";
                            document.getElementById(showContent).style.display = "block";
                        }
                    }
                    //初始化疾病信息栏
                    IniIllInfo = function (name, UpdateID) {
                        if (name.replace(/(^\s*)|(\s*$)/g, "") == "") {
                            alertMsg('<%= Chy.Web.Resource.GetString("HM_0382")%>', '<%= Chy.Web.Resource.GetString("HM_0018")%>', 400, 200, '');
                                return false;
                            }
                            else {
                                $("#" + UpdateID).val(name);
                            }
                    }
                        /************************Choose Member***************************/
                        ChooseIll = function (obj) {
                            var UpdateID = $("#" + obj.id).prev(":text").attr("id");
                            $("<div style='width:100%;height:500px' id='divchooseFrame'><iframe  scrolling='auto' width='100%' height='100%'  frameborder=0  id='ChooseFrame' src='IllQuery.aspx?UpdateID=" + UpdateID + "'/></div>").dialog({ autoOpen: true, width: 700, height: 540, showTitle: false, modal: true, title: '<%= Chy.Web.Resource.GetString("HM_0385")%>' });
                        }
                        CloseIllDialg = function () {
                            $('div').dialog('close');
                        }

                        var hideAudit = document.getElementById("<%=hideAudit.ClientID %>"); //是否审核的标记 
                        //现病史
                        var NowIll = 1;
                        function addNowIll() {
                            var tr = '<tr id="trNowIll' + NowIll + '"><td class="warn">&nbsp;</td><td class="label">疾病名称：</td><td class="input" nowrap>' +
    '<input type="text" onkeypress="TextValidate()" onblur="numkeydelete(this)" class="inputtext" id="txtNowIll' + NowIll + '" maxlength="64" style="width:200px"/>&nbsp;<input type="button" value="选择" onclick="ChooseIll(this)" id="NowIllsearch' + NowIll + '" style="padding:1px 3px 1px 3px"/></td>' +
    '<td class="label">确诊时间：</td><td class="input" nowrap><input type="text" onkeypress="TextValidate()" onblur="numkeydelete(this)" id="dpNowIll' + NowIll + '" onfocus="WdatePicker({doubleCalendar:false,lang:&#39;zh-cn&#39;,dateFmt:&#39;yyyy-MM&#39;,vel:&#39;dpNowIll_hidden' + NowIll + '&#39;,minDate:&#39;&#39;,maxDate:&#39;%y-%M&#39;})" class="Wdate" /><input type="hidden" id="dpNowIll_hidden' + NowIll + '" /> </td>' +
    '<td class="warn"><input type="button" onclick="delNowIll(' + NowIll + ')" id="btnAddNowIll' + NowIll + '" value="删除" class="btn"/></td><td class="warn">&nbsp;</td></tr><tr>';
                            var index = 0;
                            for (index = NowIll; index > 0; index--) {
                                if ($("#trNowIll" + index).length > 0) {
                                    break;
                                }
                            }
                            $("#trNowIll" + index).after(tr);
                            NowIll += 1;
                            clientUnity.resizeFrame(parent.document.getElementById("mainFrame"));
                        }

                        function delNowIll(no) {
                            $("#trNowIll" + no).remove();
                            clientUnity.resizeFrame(parent.document.getElementById("mainFrame"));
                        }
                        //保存现病史
                        function saveNowIll() {
                            var strValue = "";
                            var tmp = "";
                            var flag = true;
                            var hidValue = "";
                            $(":text[id^='txtNowIll']:visible").each(function (i) {
                                strValue = $(this).val();
                                if (strValue.replace(/(^\s*)|(\s*$)/g, "") == "") {
                                    if ($(this).attr("id") != "txtNowIll0") {
                                        alertMsg('<%= Chy.Web.Resource.GetString("HM_0382")%>', '<%= Chy.Web.Resource.GetString("HM_0018")%>', 400, 200, '');
                                $(this).val("");
                                flag = false;
                                return false;
                            }
                        }
                        else {
                            if (hidValue.indexOf("," + strValue + "#") > -1) {
                                alertMsg('<%= Chy.Web.Resource.GetString("HM_0383")%>', '<%= Chy.Web.Resource.GetString("HM_0018")%>', 400, 200, '');
                                flag = false;
                                return false;
                            }
                            else {
                                if (i == 0) {
                                    tmp = "," + strValue + "#" + $("#<%=dpNowIll.ClientID %>").val();
                                }
                                else {
                                    var index = $(this).attr("id").substr(9);
                                    tmp = "," + strValue + "#" + $("#dpNowIll" + index).val();
                                }
                                hidValue += tmp;
                            }
                        }
                        });
                    if (flag) {
                        $("#<%=hidNowIll.ClientID %>").val(hidValue);
                            return true;
                        }
                        else
                            return false;
                    }
                    //现病史显示
                    function ShowNowIll() {
                        //var hideAudit = document.getElementById("<%=hideAudit.ClientID %>"); //是否审核的标记                       
                        var tabValue = document.getElementById("<%=hidNowIll.ClientID %>");
                        if (tabValue != null && tabValue.value != "") {
                            tabValue.value = tabValue.value.substr(1);
                            var spValue = tabValue.value.split(',');
                            if (spValue.length > 0)
                                for (var i = 0; i < spValue.length; i++) {
                                    if (spValue[i] != null && spValue[i] != "") {
                                        //添加内容
                                        var trValue = spValue[i].split('#');
                                        if (i == 0) {
                                            $("#txtNowIll0").val(trValue[0]);
                                            $("#<%=dpNowIll.ClientID %>").val(trValue[1]);
                                        }
                                        else {
                                            NowIll = i + 1;
                                            var tr = '<tr id="trNowIll' + i + '"><td class="warn">&nbsp;</td><td class="label">疾病名称：</td><td class="input" nowrap>' +
'<input type="text" onkeypress="TextValidate()" onblur="numkeydelete(this)" class="inputtext" id="txtNowIll' + i + '" maxlength="64" style="width:200px"  value="' + trValue[0] + '"/>&nbsp;<input type="button" value="选择" onclick="ChooseIll(this)" id="NowIllsearch' + i + '" style="padding:1px 3px 1px 3px"/></td>' +
'<td class="label">确诊时间：</td><td class="input" nowrap><input  value="' + trValue[1] + '" type="text" onkeypress="TextValidate()" onblur="numkeydelete(this)" id="dpNowIll' + i + '" onfocus="WdatePicker({doubleCalendar:false,lang:&#39;zh-cn&#39;,dateFmt:&#39;yyyy-MM&#39;,vel:&#39;dpNowIll_hidden' + i + '&#39;,minDate:&#39;&#39;,maxDate:&#39;%y-%M&#39;})" class="Wdate" /><input type="hidden" id="dpNowIll_hidden' + i + '" /> </td>' +
'<td class="warn"><input type="button" onclick="delNowIll(' + i + ')" id="btnAddNowIll' + i + '" value="删除" class="btn"/></td><td class="warn">&nbsp;</td></tr><tr>';

                                            $("#trNowIll" + (i - 1)).after(tr);
                                        }
                                        if (hideAudit.value == "0") {
                                            $("#btnAddNowIll" + i).show();
                                        }
                                        else {
                                            $("#btnAddNowIll" + i).hide();
                                        }
                                    }
                                }
                        }

                        clientUnity.resizeFrame(parent.document.getElementById("mainFrame"));
                    }
                    ShowNowIll();



                    //既往史
                    var WayIll = 1;
                    function addWayIll() {
                        var tr = '<tr id="trWayIll' + WayIll + '"><td class="warn">&nbsp;</td><td class="label">其它疾病:</td><td nowrap="nowrap" class="input">' +
'<input type="text" onkeypress="TextValidate()" onblur="numkeydelete(this)" class="inputtext" id="txtWayIll' + WayIll + '" maxlength="64" style="width:200px"></td><td class="warn">&nbsp;' +
'</td><td class="label">确诊时间:</td><td nowrap="nowrap" class="input"><input type="text" onkeypress="TextValidate()" onblur="numkeydelete(this)" class="Wdate" onfocus="WdatePicker({doubleCalendar:false,lang:\'zh-cn\',dateFmt:\'yyyy-MM\',vel:\'dpWayIll_hidden' + WayIll + '\',minDate:\'\',maxDate:\'%y-%M\'})" id="dpWayIll' + WayIll + '"><input type="hidden" id="dpWayIll_hidden' + WayIll + '">' +
'</td><td class="warn">&nbsp;</td><td class="label">转归:</td><td nowrap="nowrap" class="input"><select cssclass="secltwidth" id="ddlWayIll' + WayIll + '">' +
'<option selected="selected"></option><option value="0">痊愈</option><option value="1">好转</option><option value="2">后遗</option><option value="3">恶化</option></select></td><td class="warn">&nbsp;' +
'</td><td class="warn"><input type="button" class="btn" value="删除" id="btnAddWayIll' + WayIll + '" onclick="delWayIll(' + WayIll + ')"></td></tr>';
                        var index = 0;
                        for (index = WayIll; index > 0; index--) {
                            if ($("#trWayIll" + index).length > 0) {
                                break;
                            }
                        }
                        $("#trWayIll" + index).after(tr);
                        WayIll += 1;
                        clientUnity.resizeFrame(parent.document.getElementById("mainFrame"));
                    }

                    function delWayIll(no) {
                        $("#trWayIll" + no).remove();
                        clientUnity.resizeFrame(parent.document.getElementById("mainFrame"));
                    }
                    //保存既往史
                    function saveWayIll() {
                        var strValue = "";
                        var tmp = "";
                        var flag = true;
                        var hidValue = "";
                        $(":text[id^='txtWayIll']:visible").each(function (i) {
                            strValue = $(this).val();
                            if (strValue.replace(/(^\s*)|(\s*$)/g, "") == "") {
                                alertMsg('<%= Chy.Web.Resource.GetString("HM_0382")%>', '<%= Chy.Web.Resource.GetString("HM_0018")%>', 400, 200, '');
                                $(this).val("");
                                flag = false;
                                return false;
                            }
                            else {
                                if (hidValue.indexOf("#" + strValue + "#") > -1) {
                                    alertMsg('<%= Chy.Web.Resource.GetString("HM_0383")%>', '<%= Chy.Web.Resource.GetString("HM_0018")%>', 400, 200, '');
                                    flag = false;
                                    return false;
                                }
                                else {
                                    if (i == 0) {
                                        tmp = "," + $("#ddlWayIll0>:selected").val() + "#" + strValue + "#" + $("#<%=dpWayIll.ClientID %>").val() + "#" + $("#ddlWayIll0>:selected").text();
                                    }
                                    else {
                                        var index = $(this).attr("id").substr(9);
                                        tmp = "," + $("#ddlWayIll" + index + ">:selected").val() + "#" + strValue + "#" + $("#dpWayIll" + index).val() + "#" + $("#ddlWayIll" + index + ">:selected").text();
                                    }
                                    hidValue += tmp;
                                }
                            }
                        });
                        if (flag) {
                            $("#<%=hidWayIll.ClientID %>").val(hidValue);
                            return true;
                        }
                        else
                            return false;
                    }
                    //既往史显示
                    function ShowWayIll() {
                        var hideAudit = document.getElementById("<%=hideAudit.ClientID %>"); //是否审核的标记                       
                        var tabValue = document.getElementById("<%=hidWayIll.ClientID %>");
                        if (tabValue != null && tabValue.value != "") {
                            tabValue.value = tabValue.value.substr(1);
                            var spValue = tabValue.value.split(',');
                            if (spValue.length > 0)
                                for (var i = 0; i < spValue.length; i++) {
                                    if (spValue[i] != null && spValue[i] != "") {
                                        //添加内容
                                        var trValue = spValue[i].split('#');
                                        if (i == 0) {
                                            $("#txtWayIll0").val(trValue[1]);
                                            $("#<%=dpWayIll.ClientID %>").val(trValue[2]);
                                        }
                                        else {
                                            WayIll = i + 1;
                                            var tr = '<tr id="trWayIll' + i + '"><td class="warn">&nbsp;</td><td class="label">其它疾病:</td><td nowrap="nowrap" class="input">' +
'<input type="text" onkeypress="TextValidate()" onblur="numkeydelete(this)" class="inputtext" id="txtWayIll' + i + '" maxlength="64" style="width:200px" value="' + trValue[1] + '"></td><td class="warn">&nbsp;</td>' +
'<td class="label">确诊时间:</td><td nowrap="nowrap" class="input"><input value="' + trValue[2] + '" type="text" onkeypress="TextValidate()" onblur="numkeydelete(this)" class="Wdate" onfocus="WdatePicker({doubleCalendar:false,lang:\'zh-cn\',dateFmt:\'yyyy-MM\',vel:\'dpWayIll_hidden' + i + '\',minDate:\'\',maxDate:\'%y-%M\'})" id="dpWayIll' + i + '"><input type="hidden" id="dpWayIll_hidden' + i + '">' +
'</td><td class="warn">&nbsp;</td><td class="label">转归:</td><td nowrap="nowrap" class="input"><select cssclass="secltwidth" id="ddlWayIll' + i + '">' +
'<option selected="selected"></option><option value="0">痊愈</option><option value="1">好转</option><option value="2">后遗</option><option value="3">恶化</option></select></td><td class="warn">&nbsp;' +
'</td><td class="warn"><input type="button" class="btn" value="删除" id="btnAddWayIll' + i + '" onclick="delWayIll(' + i + ')"></td></tr>';
                                            $("#trWayIll" + (i - 1)).after(tr);
                                        }
                                        if (hideAudit.value == "0") {
                                            $("#btnAddWayIll" + i).show();
                                        }
                                        else {
                                            $("#btnAddWayIll" + i).show();
                                        }
                                        $("#ddlWayIll" + i).find("option").eq(parseInt(trValue[0])).attr("selected", "selected");
                                    }
                                }
                        }

                        clientUnity.resizeFrame(parent.document.getElementById("mainFrame"));
                    }
                    ShowWayIll();

                    //手术史
                    var Operation = 1;
                    function addOperation() {
                        var tr = '<tr id="trOperation' + Operation + '"><td class="warn">&nbsp;</td><td class="label">手术史:</td><td nowrap="nowrap" class="input">' +
'<input type="text" onkeypress="TextValidate()" onblur="numkeydelete(this)" class="inputtext" id="txtOperation' + Operation + '" maxlength="64" style="width:200px"></td><td class="warn">&nbsp;' +
'</td><td class="label">确诊时间:</td><td nowrap="nowrap" class="input"><input type="text" onkeypress="TextValidate()" onblur="numkeydelete(this)" class="Wdate" onfocus="WdatePicker({doubleCalendar:false,lang:\'zh-cn\',dateFmt:\'yyyy-MM\',vel:\'dpOperation_hidden' + Operation + '\',minDate:\'\',maxDate:\'%y-%M\'})" id="dpOperation' + Operation + '"><input type="hidden" id="dpOperation_hidden' + Operation + '">' +
'<td class="warn">&nbsp;</td><td class="warn"><input type="button" class="btn" value="删除" id="btnAddOperation' + Operation + '" onclick="delOperation(' + Operation + ')"></td></tr>';
                        var index = 0;
                        for (index = Operation; index > 0; index--) {
                            if ($("#trOperation" + index).length > 0) {
                                break;
                            }
                        }
                        $("#trOperation" + index).after(tr);
                        Operation += 1;
                        clientUnity.resizeFrame(parent.document.getElementById("mainFrame"));
                    }

                    function delOperation(no) {
                        $("#trOperation" + no).remove();
                        clientUnity.resizeFrame(parent.document.getElementById("mainFrame"));
                    }
                    //保存手术史
                    function saveOperation() {
                        var strValue = "";
                        var tmp = "";
                        var flag = true;
                        var hidValue = "";
                        $(":text[id^='txtOperation']:visible").each(function (i) {
                            strValue = $(this).val();
                            if (strValue.replace(/(^\s*)|(\s*$)/g, "") == "") {
                                alertMsg('<%= Chy.Web.Resource.GetString("HM_0382")%>', '<%= Chy.Web.Resource.GetString("HM_0018")%>', 400, 200, '');
                                $(this).val("");
                                flag = false;
                                return false;
                            }
                            else {
                                if (hidValue.indexOf("," + strValue + "#") > -1) {
                                    alertMsg('<%= Chy.Web.Resource.GetString("HM_0383")%>', '<%= Chy.Web.Resource.GetString("HM_0018")%>', 400, 200, '');
                                    flag = false;
                                    return false;
                                }
                                else {
                                    if (i == 0) {
                                        tmp = "," + strValue + "#" + $("#<%=dpOperation.ClientID %>").val();
                                    }
                                    else {
                                        var index = $(this).attr("id").substr(12);
                                        tmp = "," + strValue + "#" + $("#dpOperation" + index).val();
                                    }
                                    hidValue += tmp;
                                }
                            }
                        });
                        if (flag) {
                            $("#<%=hidOperation.ClientID %>").val(hidValue);
                            return true;
                        }
                        else
                            return false;
                    }
                    //手术史显示
                    function ShowOperation() {
                        var hideAudit = document.getElementById("<%=hideAudit.ClientID %>"); //是否审核的标记                       
                        var tabValue = document.getElementById("<%=hidOperation.ClientID %>");
                        if (tabValue != null && tabValue.value != "") {
                            tabValue.value = tabValue.value.substr(1);
                            var spValue = tabValue.value.split(',');
                            if (spValue.length > 0)
                                for (var i = 0; i < spValue.length; i++) {
                                    if (spValue[i] != null && spValue[i] != "") {
                                        //添加内容
                                        var trValue = spValue[i].split('#');
                                        if (i == 0) {
                                            $("#txtOperation0").val(trValue[0]);
                                            $("#<%=dpOperation.ClientID %>").val(trValue[1]);
                                        }
                                        else {
                                            Operation = i + 1;
                                            var tr = '<tr id="trOperation' + i + '"><td class="warn">&nbsp;</td><td class="label">手术史:</td><td nowrap="nowrap" class="input">' +
'<input type="text" onkeypress="TextValidate()" onblur="numkeydelete(this)" class="inputtext" id="txtOperation' + i + '" maxlength="64" style="width:200px" value="' + trValue[0] + '"></td><td class="warn">&nbsp;</td>' +
'<td class="label">确诊时间:</td><td nowrap="nowrap" class="input"><input value="' + trValue[1] + '" type="text" onkeypress="TextValidate()" onblur="numkeydelete(this)" class="Wdate" onfocus="WdatePicker({doubleCalendar:false,lang:\'zh-cn\',dateFmt:\'yyyy-MM\',vel:\'dpOperation_hidden' + i + '\',minDate:\'\',maxDate:\'%y-%M\'})" id="dpOperation' + i + '"><input type="hidden" id="dpOperation_hidden' + i + '">' +
'<td class="warn">&nbsp;</td><td class="warn"><input type="button" class="btn" value="删除" id="btnaddOperation' + i + '" onclick="delOperation(' + i + ')"></td></tr>';
                                            $("#trOperation" + (i - 1)).after(tr);
                                        }
                                        if (hideAudit.value == "0") {
                                            $("#btnAddOperation" + i).show();
                                        }
                                        else {
                                            $("#btnAddOperation" + i).hide();
                                        }
                                    }
                                }
                        }
                        clientUnity.resizeFrame(parent.document.getElementById("mainFrame"));
                    }
                    ShowOperation();


                    //外伤史
                    var Injury = 1;
                    function addInjury() {
                        var tr = '<tr id="trInjury' + Injury + '"><td class="warn">&nbsp;</td><td class="label">外伤史:</td><td nowrap="nowrap" class="input">' +
'<input type="text" onkeypress="TextValidate()" onblur="numkeydelete(this)" class="inputtext" id="txtInjury' + Injury + '" maxlength="64" style="width:200px"></td><td class="warn">&nbsp;' +
'</td><td class="label">确诊时间:</td><td nowrap="nowrap" class="input"><input type="text" onkeypress="TextValidate()" onblur="numkeydelete(this)" class="Wdate" onfocus="WdatePicker({doubleCalendar:false,lang:\'zh-cn\',dateFmt:\'yyyy-MM\',vel:\'dpInjury_hidden' + Injury + '\',minDate:\'\',maxDate:\'%y-%M\'})" id="dpInjury' + Injury + '"><input type="hidden" id="dpInjury_hidden' + Injury + '">' +
'<td class="warn">&nbsp;</td><td class="warn"><input type="button" class="btn" value="删除" id="btnAddInjury' + Injury + '" onclick="delInjury(' + Injury + ')"></td></tr>';
                        var index = 0;
                        for (index = Injury; index > 0; index--) {
                            if ($("#trInjury" + index).length > 0) {
                                break;
                            }
                        }
                        $("#trInjury" + index).after(tr);
                        Injury += 1;
                        clientUnity.resizeFrame(parent.document.getElementById("mainFrame"));
                    }

                    function delInjury(no) {
                        $("#trInjury" + no).remove();
                        clientUnity.resizeFrame(parent.document.getElementById("mainFrame"));
                    }
                    //保存外伤史
                    function saveInjury() {
                        var strValue = "";
                        var tmp = "";
                        var flag = true;
                        var hidValue = "";
                        $(":text[id^='txtInjury']:visible").each(function (i) {
                            strValue = $(this).val();
                            if (strValue.replace(/(^\s*)|(\s*$)/g, "") == "") {
                                alertMsg('<%= Chy.Web.Resource.GetString("HM_0382")%>', '<%= Chy.Web.Resource.GetString("HM_0018")%>', 400, 200, '');
                                $(this).val("");
                                flag = false;
                                return false;
                            }
                            else {
                                if (hidValue.indexOf("," + strValue + "#") > -1) {
                                    alertMsg('<%= Chy.Web.Resource.GetString("HM_0383")%>', '<%= Chy.Web.Resource.GetString("HM_0018")%>', 400, 200, '');
                                    flag = false;
                                    return false;
                                }
                                else {
                                    if (i == 0) {
                                        tmp = "," + strValue + "#" + $("#<%=dpInjury.ClientID %>").val();
                                    }
                                    else {
                                        var index = $(this).attr("id").substr(9);
                                        tmp = "," + strValue + "#" + $("#dpInjury" + index).val();
                                    }
                                    hidValue += tmp;
                                }
                            }
                        });
                        if (flag) {
                            $("#<%=hidInjury.ClientID %>").val(hidValue);
                            return true;
                        }
                        else
                            return false;
                    }
                    //外伤史显示
                    function ShowInjury() {
                        //var hideAudit = document.getElementById("<%=hideAudit.ClientID %>"); //是否审核的标记                       
                        var tabValue = document.getElementById("<%=hidInjury.ClientID %>");
                        if (tabValue != null && tabValue.value != "") {
                            tabValue.value = tabValue.value.substr(1);
                            var spValue = tabValue.value.split(',');
                            if (spValue.length > 0)
                                for (var i = 0; i < spValue.length; i++) {
                                    if (spValue[i] != null && spValue[i] != "") {
                                        //添加内容
                                        var trValue = spValue[i].split('#');
                                        if (i == 0) {
                                            $("#txtInjury0").val(trValue[0]);
                                            $("#<%=dpInjury.ClientID %>").val(trValue[1]);
                                        }
                                        else {
                                            Injury = i + 1;
                                            var tr = '<tr id="trInjury' + i + '"><td class="warn">&nbsp;</td><td class="label">外伤史:</td><td nowrap="nowrap" class="input">' +
'<input type="text" onkeypress="TextValidate()" onblur="numkeydelete(this)" class="inputtext" id="txtInjury' + i + '" maxlength="64" style="width:200px" value="' + trValue[0] + '"></td><td class="warn">&nbsp;</td>' +
'<td class="label">确诊时间:</td><td nowrap="nowrap" class="input"><input value="' + trValue[1] + '" type="text" onkeypress="TextValidate()" onblur="numkeydelete(this)" class="Wdate" onfocus="WdatePicker({doubleCalendar:false,lang:\'zh-cn\',dateFmt:\'yyyy-MM\',vel:\'dpInjury_hidden' + i + '\',minDate:\'\',maxDate:\'%y-%M\'})" id="dpInjury' + i + '"><input type="hidden" id="dpInjury_hidden' + i + '">' +
'<td class="warn">&nbsp;</td><td class="warn"><input type="button" class="btn" value="删除" id="btnaddInjury' + i + '" onclick="delInjury(' + i + ')"></td></tr>';
                                            $("#trInjury" + (i - 1)).after(tr);
                                        }
                                        if (hideAudit.value == "0") {
                                            $("#btnAddInjury" + i).show();
                                        }
                                        else {
                                            $("#btnAddInjury" + i).hide();
                                        }
                                    }
                                }
                        }
                        clientUnity.resizeFrame(parent.document.getElementById("mainFrame"));
                    }
                    ShowInjury();

                    //输血史
                    var InBlood = 1;
                    function addInBlood() {
                        var tr = '<tr id="trInBlood' + InBlood + '"><td class="warn">&nbsp;</td><td class="label">输血史:</td><td nowrap="nowrap" class="input">' +
'<input type="text" onkeypress="TextValidate()" onblur="numkeydelete(this)" class="inputtext" id="txtInBlood' + InBlood + '" maxlength="64" style="width:200px"></td><td class="warn">&nbsp;' +
'</td><td class="label">确诊时间:</td><td nowrap="nowrap" class="input"><input type="text" onkeypress="TextValidate()" onblur="numkeydelete(this)" class="Wdate" onfocus="WdatePicker({doubleCalendar:false,lang:\'zh-cn\',dateFmt:\'yyyy-MM\',vel:\'dpInBlood_hidden' + InBlood + '\',minDate:\'\',maxDate:\'%y-%M\'})" id="dpInBlood' + InBlood + '"><input type="hidden" id="dpInBlood_hidden' + InBlood + '">' +
'<td class="warn">&nbsp;</td><td class="warn"><input type="button" class="btn" value="删除" id="btnAddInBlood' + InBlood + '" onclick="delInBlood(' + InBlood + ')"></td></tr>';
                        var index = 0;
                        for (index = InBlood; index > 0; index--) {
                            if ($("#trInBlood" + index).length > 0) {
                                break;
                            }
                        }
                        $("#trInBlood" + index).after(tr);
                        InBlood += 1;
                        clientUnity.resizeFrame(parent.document.getElementById("mainFrame"));
                    }

                    function delInBlood(no) {
                        $("#trInBlood" + no).remove();
                        clientUnity.resizeFrame(parent.document.getElementById("mainFrame"));
                    }
                    //保存输血史
                    function saveInBlood() {
                        var strValue = "";
                        var tmp = "";
                        var flag = true;
                        var hidValue = "";
                        $(":text[id^='txtInBlood']:visible").each(function (i) {
                            strValue = $(this).val();
                            if (strValue.replace(/(^\s*)|(\s*$)/g, "") == "") {
                                alertMsg('<%= Chy.Web.Resource.GetString("HM_0382")%>', '<%= Chy.Web.Resource.GetString("HM_0018")%>', 400, 200, '');
                                $(this).val("");
                                flag = false;
                                return false;
                            }
                            else {
                                if (hidValue.indexOf("," + strValue + "#") > -1) {
                                    alertMsg('<%= Chy.Web.Resource.GetString("HM_0383")%>', '<%= Chy.Web.Resource.GetString("HM_0018")%>', 400, 200, '');
                                    flag = false;
                                    return false;
                                }
                                else {
                                    if (i == 0) {
                                        tmp = "," + strValue + "#" + $("#<%=dpInBlood.ClientID %>").val();
                                    }
                                    else {
                                        var index = $(this).attr("id").substr(10);
                                        tmp = "," + strValue + "#" + $("#dpInBlood" + index).val();
                                    }
                                    hidValue += tmp;
                                }
                            }
                        });
                        if (flag) {
                            $("#<%=hidInBlood.ClientID %>").val(hidValue);
                            return true;
                        }
                        else
                            return false;
                    }
                    //输血史显示

                    function ShowInBlood() {
                        var tabValue = document.getElementById("<%=hidInBlood.ClientID %>");
                        if (tabValue != null && tabValue.value != "") {
                            tabValue.value = tabValue.value.substr(1);
                            var spValue = tabValue.value.split(',');
                            if (spValue.length > 0)
                                for (var i = 0; i < spValue.length; i++) {
                                    if (spValue[i] != null && spValue[i] != "") {
                                        //添加内容
                                        var trValue = spValue[i].split('#');
                                        if (i == 0) {
                                            $("#txtInBlood0").val(trValue[0]);
                                            $("#<%=dpInBlood.ClientID %>").val(trValue[1]);
                                        }
                                        else {
                                            InBlood = i + 1;
                                            var tr = '<tr id="trInBlood' + i + '"><td class="warn">&nbsp;</td><td class="label">输血史:</td><td nowrap="nowrap" class="input">' +
'<input type="text" onkeypress="TextValidate()" onblur="numkeydelete(this)" class="inputtext" id="txtInBlood' + i + '" maxlength="64" style="width:200px" value="' + trValue[0] + '"></td><td class="warn">&nbsp;</td>' +
'<td class="label">确诊时间:</td><td nowrap="nowrap" class="input"><input value="' + trValue[1] + '" type="text" onkeypress="TextValidate()" onblur="numkeydelete(this)" class="Wdate" onfocus="WdatePicker({doubleCalendar:false,lang:\'zh-cn\',dateFmt:\'yyyy-MM\',vel:\'dpInBlood_hidden' + i + '\',minDate:\'\',maxDate:\'%y-%M\'})" id="dpInBlood' + i + '"><input type="hidden" id="dpInBlood_hidden' + i + '">' +
'<td class="warn">&nbsp;</td><td class="warn"><input type="button" class="btn" value="删除" id="btnAddInBlood' + i + '" onclick="delInBlood(' + i + ')"></td></tr>';
                                            $("#trInBlood" + (i - 1)).after(tr);
                                        }
                                        if (hideAudit.value == "0") {
                                            $("#btnAddInBlood" + i).show();
                                        }
                                        else {
                                            $("#btnAddInBlood" + i).hide();
                                        }
                                    }
                                }
                        }

                        clientUnity.resizeFrame(parent.document.getElementById("mainFrame"));
                    }
                    ShowInBlood();

                    //遗传史
                    var Genetic = 1;
                    function addGenetic() {
                        var tr = '<tr id="trGenetic' + Genetic + '"><td class="warn">&nbsp;</td><td class="label">疾病名称：</td><td class="input" nowrap>' +
'<input type="text" onkeypress="TextValidate()" onblur="numkeydelete(this)"  class="inputtext" id="txtGenetic' + Genetic + '" maxlength="64" style="width:200px"/></td>' +
'<td class="warn">&nbsp;</td><td class="label">' +
'<input type="button" onclick="delGenetic(' + Genetic + ')" id="btnAddGenetic' + Genetic + '" value="删除" class="btn"/></td></tr>';
                        var index = 0;
                        for (index = Genetic; index > 0; index--) {
                            if ($("#trGenetic" + index).length > 0) {
                                break;
                            }
                        }
                        $("#trGenetic" + index).after(tr);
                        Genetic += 1;
                        clientUnity.resizeFrame(parent.document.getElementById("mainFrame"));
                    }

                    function delGenetic(no) {
                        $("#trGenetic" + no).remove();
                        clientUnity.resizeFrame(parent.document.getElementById("mainFrame"));
                        //
                    }
                    //保存遗传史
                    function saveGenetic() {
                        var strValue = "";
                        var tmp = "";
                        var flag = true;
                        var hidValue = "";
                        $(":text[id^='txtGenetic']:visible").each(function (i) {
                            strValue = $(this).val();
                            if (strValue.replace(/(^\s*)|(\s*$)/g, "") == "") {
                                alertMsg('<%= Chy.Web.Resource.GetString("HM_0382")%>', '<%= Chy.Web.Resource.GetString("HM_0018")%>', 400, 200, '');
                                $(this).val("");
                                flag = false;
                                return false;
                            }
                            else {
                                var strlength = hidValue.split("#");
                                if (hidValue.indexOf("#" + strValue) > -1) {
                                    alertMsg('<%= Chy.Web.Resource.GetString("HM_0383")%>', '<%= Chy.Web.Resource.GetString("HM_0018")%>', 400, 200, '');
                                    flag = false;
                                    return false;
                                }
                                else if (strlength.length > 20) {
                                    alertMsg('<%= Chy.Web.Resource.GetString("HM_0510")%>', '<%= Chy.Web.Resource.GetString("HM_0018")%>', 400, 200, '');
                                        flag = false;
                                        return false;
                                    }
                                    else {
                                        tmp = "#" + strValue;
                                        hidValue += tmp;
                                    }
                            }
                        });
                        if (flag) {
                            $("#<%=hidGenetic.ClientID %>").val(hidValue);
                            return true;
                        }
                        else
                            return false;
                    }
                    //遗传史显示

                    function ShowGenetic() {
                        var tabValue = document.getElementById("<%=hidGenetic.ClientID %>");
                        if (tabValue != null && tabValue.value != "") {
                            tabValue.value = tabValue.value.substr(1);
                            var spValue = tabValue.value.split('#');
                            if (spValue.length > 0)
                                for (var i = 0; i < spValue.length; i++) {
                                    if (spValue[i] != null && spValue[i] != "") {
                                        //添加内容
                                        //var trValue = spValue[i].split('#');
                                        if (i == 0) {
                                            $("#txtGenetic0").val(spValue[i]);
                                        }
                                        else {
                                            Genetic = i + 1;
                                            var tr = '<tr id="trGenetic' + i + '"><td class="warn">&nbsp;</td><td class="label">疾病名称：</td><td class="input" nowrap>' +
'<input type="text" onkeypress="TextValidate()" onblur="numkeydelete(this)" value="' + spValue[i] + '"  class="inputtext" id="txtGenetic' + i + '" maxlength="64" style="width:200px"/></td>' +
'<td class="warn">&nbsp;</td><td class="label">' +
'<input type="button" onclick="delGenetic(' + i + ')" id="btnAddGenetic' + i + '" value="删除" class="btn"/></td></tr>';
                                            $("#trGenetic" + (i - 1)).after(tr);
                                        }
                                        if (hideAudit.value == "0") {
                                            $("#btnAddGenetic" + i).show();
                                        }
                                        else {
                                            $("#btnAddGenetic" + i).hide();
                                        }
                                    }
                                }
                        }
                        clientUnity.resizeFrame(parent.document.getElementById("mainFrame"));
                    }
                    ShowGenetic();



                    /*****************判断录入字符合法性****************/
                    function TextValidate() {
                        var code;
                        var character;
                        var err_msg = "Text can not contain SPACES or any of these special characters other than underscore (_) and hyphen (-).";
                        if (document.all) //判断是否是IE浏览器
                        {
                            code = window.event.keyCode;
                        }
                        else {
                            code = arguments.callee.caller.arguments[0].which;
                        }
                        var character = String.fromCharCode(code);

                        //                          var txt1 = new RegExp("[ ,\\`,\\~,\\!,\\@,\#,\\$,\\%,\\^,\\+,\\*,\\&,\\\\,\\/,\\?,\\|,\\:,\\.,\\<,\\>,\\{,\\},\\(,\\),\\',\\;,\\=,\"]");
                        //特殊字符正则表达式,不过复制粘贴还是可以输入的。
                        var txt = new RegExp("[,\#]");
                        if (txt.test(character)) {
                            if (document.all) {
                                window.event.returnValue = false;
                            }
                            else {
                                arguments.callee.caller.arguments[0].preventDefault();
                            }
                        }
                    }

                    function numkeydelete(obj) {
                        obj.value = obj.value.replace(/[#]/g, "");
                        obj.value = obj.value.replace(/^\s+|\s+$/g, "");
                    }

                    function EndRequestHandler(sender, args) {
                        if (parent.document.getElementById("mainFrame") != null) {
                            // resizeParentFrame();  
                            if (!clientUnity.resizeOpenWindow()) {
                                clientUnity.resizeFrame();
                            }
                        }
                        if (window.parent.document.getElementById("IFRAME1") != null) {
                            window.parent.reSizeiFrame(window.parent.document.getElementById("IFRAME1"));
                            window.parent.parent.reSizeWindow();
                        }
                    }


                    /*******************设置既往史确诊时间不能为空（为空的时候设置为当前时间）***********************/
                    function changetext(obj) {
                        if (obj.value == "") {
                            var myDate = new Date();
                            obj.value = myDate.getFullYear() + "-" + myDate.getMonth() + "-" + myDate.getDate();
                        }
                    }

                </script>

</asp:Content>
