<%@ Page Language="C#" MasterPageFile="~/MainContent.Master" AutoEventWireup="true" CodeBehind="Behaviorhabit.aspx.cs" Inherits="Chm.Web.Admin.HealthRecord.Behaviorhabit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="../../Styles/adminwordbreak.css" rel="stylesheet" type="text/css" />
     <style type="text/css">
        .con {
            font-size: 12px;
            margin: 0px auto;
        }
      
     </style>
    <script type="text/javascript">
        function clearText(txtType) {
            if (txtType == 1) {
                document.getElementById("ctl00_initContent_txtdiet").value = '';
            }
            else {
                document.getElementById("ctl00_initContent_txtexerciseType").value = '';
            }
        }
        var strP = /^\d+$/;
        function validate(obj) {
            var tar = $(obj);
            if (tar.val() != '') {
                if (!strP.test(tar.val())) {
                    alert(tar.attr('msg') + '只能是数字');
                    tar.val('');
                }
            }
        }
        <%--function validateAll() {
            var isPass = 1;
            $("#tbData input[type=text]").each(function () {
                var tar = $(this);
                if (tar.attr('id') != '<%=txtexerciseNumber.ClientID%>') {
                    if (tar.val() != '') {
                        if (tar.attr('id') != '<%=txtdiet.ClientID%>' && tar.attr('id') != '<%=txtexerciseType.ClientID%>') {
                            if (!strP.test(tar.val())) {
                                alert(tar.attr('msg') + '只能是数字');
                                isPass = 0;
                            }
                        }
                    }
                }
            });
            if (isPass == 1)
                return true;
            else
                return false;
        };--%>

        function rblisSmoke_onchange() {
            //var sv = document.getElementById("<%=rblisSmoke.ClientID%>").options[document.getElementById("<%=rblisSmoke.ClientID%>").options.selectedIndex].value;
            if (checkra() == '0') {
                $(".smoketr").css("display", "none");
            } else {
                $(".smoketr").css("display", "table-row");
                window.top.document.getElementById("mainFrame").height = Number(window.top.document.getElementById("mainFrame").height) + 200;
            }

        };
        function checkra() {
            var rbltable = document.getElementById("<%=rblisSmoke.ClientID%>");
            var rbs = rbltable.getElementsByTagName("Input");
            var result = true;
            for (var i = 0; i < rbs.length; i++) {
                if (rbs[i].checked) {
                    result = rbs[i].value;
                    break;
                }
            }

            return result;
        };
        $(function () {
            rblisSmoke_onchange();

            var yjqk = -1;
            $("input[id^='<%=cbldrinkCondition.ClientID%>_']").each(function () {
                if ($(this).attr('checked')) {
                    yjqk = $(this).attr('id').replace('<%=cbldrinkCondition.ClientID%>_', '');
                }
            });
            setYjVisible(parseInt(yjqk) + 1);            
        });

        function setYjVisible(yjqk) {
            if (yjqk == 1) {
                $('#trstartDrinkAge').hide();
                $('#trfrequencyHight').hide();
            }
            else {
                $('#trstartDrinkAge').show();
                $('#trfrequencyHight').show();
                window.top.document.getElementById("mainFrame").height = Number(window.top.document.getElementById("mainFrame").height) + 100;
            }
        }
    </script>
     <script src="/hc/js/healthInfo.js" type="text/javascript"></script>
    </asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
    <div class="border mb_10" style="height:30px; line-height:30px;">
      &nbsp;&nbsp;&nbsp;&nbsp;<a href="HealthInfoEdit.aspx" id="aHealthInfoEdit">健康信息</a>&nbsp;&nbsp;&nbsp;&nbsp;
              <a href="Behaviorhabit.aspx" id="aBehaviorhabit">生活方式及行为习惯</a>
        &nbsp;&nbsp;&nbsp;&nbsp;<a href="DietaryHabit.aspx" id="aDietaryHabit">饮食习惯</a>                 
    </div>
    <div class="border mb_10">                          
                           <div class="con">                                                                                                                          
                                <div>
                                    <table border="0" cellspacing="0" cellpadding="0" class="formcontainer" id="tbData">
                                       
                                        <tr>
                                            <td class="warn">&nbsp;</td>
                                                
                            <td class="label" style=" width:20%">吸烟的情况:</td>
                            <td class="input">
                                <asp:RadioButtonList ID="rblisSmoke" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" class="bloodradio"
                                    onchange="rblisSmoke_onchange()">
                                    <asp:ListItem Value="0">无</asp:ListItem>
                                    <asp:ListItem Value="1">有</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr class="smoketr">
                            <td class="warn">&nbsp;</td>
                            <td class="label">开始吸烟的年龄:</td>
                            <td class="input">                                
                                <asp:TextBox ID="txtstartSmokeAge" runat="server" onblur="validate(this)" msg="开始吸烟的年龄" class="inputtext"></asp:TextBox>
                            </td>
                        </tr>
                        <tr class="smoketr">
                            <td class="warn">&nbsp;</td>
                            <td class="label">吸烟的年限:</td>
                             <td class="input">  <asp:TextBox ID="txtsmokeAgeLimit" runat="server" onblur="validate(this)" msg="吸烟的年限" class="inputtext"></asp:TextBox></td>
                        </tr>
                        <tr class="smoketr">
                            <td class="warn">&nbsp;</td>
                            <td class="label">平均每天吸烟的数量:</td>
                             <td class="input">  <asp:TextBox ID="txtsmokeNumber" runat="server" onblur="validate(this)" msg="平均每天吸烟的数量" class="inputtext"></asp:TextBox>支/天</td>
                        </tr>
                        <tr class="smoketr">
                            <td class="warn">&nbsp;</td>
                            <td class="label">复吸经历:</td>
                             <td class="input">  
                                <asp:RadioButtonList ID="cblisReSmoke" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" class="bloodradio">
                                    <asp:ListItem Value="1">是</asp:ListItem>
                                    <asp:ListItem Value="0">否</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr class="smoketr">
                            <td class="warn">&nbsp;</td>
                            <td class="label">被动吸烟:</td>
                             <td class="input">  
                                <asp:RadioButtonList ID="cblisPassivity" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" class="bloodradio">
                                    <asp:ListItem Value="1">是</asp:ListItem>
                                    <asp:ListItem Value="0">否</asp:ListItem>
                                </asp:RadioButtonList>
                             年限<asp:TextBox ID="txtpassivityAgeLimit" onblur="validate(this)" msg="被动吸烟年限" runat="server" class="inputtext"></asp:TextBox>年
                            </td>
                        </tr>
                        <tr>
                            <td class="warn">&nbsp;</td>
                            <td class="label">饮酒的情况:</td>
                            <td class="input">  
                                <asp:RadioButtonList ID="cbldrinkCondition" runat="server"  RepeatLayout="Flow" RepeatDirection="Horizontal" class="bloodradio">
                                     <asp:ListItem Value="1" onclick="setYjVisible(1)">不饮酒</asp:ListItem>
                                     <asp:ListItem Value="2" onclick="setYjVisible(2)">偶尔饮酒</asp:ListItem>
                                     <asp:ListItem Value="3" onclick="setYjVisible(3)">酗酒</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr id="trstartDrinkAge">
                            <td class="warn">&nbsp;</td>
                            <td class="label">开始饮酒的年龄:</td>
                             <td class="input">  
                                <asp:TextBox ID="txtstartDrinkAge" onblur="validate(this)" msg="开始饮酒的年龄" runat="server" class="inputtext"></asp:TextBox>
                            </td>
                        </tr>
                        <tr id="trfrequencyHight">
                            <td class="warn">&nbsp;</td>
                            <td class="label">频率较高：</td>
                            <td class="input">  
                                <asp:RadioButtonList ID="cblfrequencyHight" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" class="bloodradio">
                                     <asp:ListItem Value="1">白酒</asp:ListItem>
                                     <asp:ListItem Value="2">啤酒</asp:ListItem>
                                     <asp:ListItem Value="3">红酒</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td class="warn">&nbsp;</td>
                            <td class="label">咖啡的情况:</td>
                             <td class="input">  
                                <asp:RadioButtonList ID="cblcoffeeCondition" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" class="bloodradio">
                                    <asp:ListItem Value="1">每天喝</asp:ListItem>
                                    <asp:ListItem Value="2">经常喝</asp:ListItem>
                                    <asp:ListItem Value="3">偶尔喝</asp:ListItem>
                                    <asp:ListItem Value="4">不喝</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td class="warn">&nbsp;</td>
                           <td class="label">喝茶的情况:</td>
                            <td class="input">  <asp:RadioButtonList ID="cblteaCondition" runat="server"  RepeatLayout="Flow" RepeatDirection="Horizontal" class="bloodradio">
                                    <asp:ListItem Value="1">每天喝</asp:ListItem>
                                    <asp:ListItem Value="2">经常喝</asp:ListItem>
                                    <asp:ListItem Value="3">偶尔喝</asp:ListItem>
                                    <asp:ListItem Value="4">不喝</asp:ListItem>
                                </asp:RadioButtonList></td>
                   
                        </tr>
                        <tr>
                            <td class="warn">&nbsp;</td>
                            <td class="label">饮料情况:</td>
                             <td class="input">  <asp:RadioButtonList ID="cblbeverageCondition" runat="server"  RepeatLayout="Flow" RepeatDirection="Horizontal" class="bloodradio">
                                    <asp:ListItem Value="1">每天喝</asp:ListItem>
                                    <asp:ListItem Value="2">经常喝</asp:ListItem>
                                    <asp:ListItem Value="3">偶尔喝</asp:ListItem>
                                    <asp:ListItem Value="4">不喝</asp:ListItem>
                                </asp:RadioButtonList></td>
                        </tr>
                        <tr>
                            <td class="warn">&nbsp;</td>
                            <td class="label">工作强度:</td>
                            <td class="input">  
                                <asp:RadioButtonList ID="cblworkIntensity" runat="server"  RepeatLayout="Flow" RepeatDirection="Horizontal" class="bloodradio">
                                    <asp:ListItem Value="1">紧张</asp:ListItem>
                                    <asp:ListItem Value="2">适中</asp:ListItem>
                                    <asp:ListItem Value="3">清闲</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td class="warn">&nbsp;</td>
                            <td class="label">面对电脑的时间:</td>
                          <td class="input">  
                                <asp:RadioButtonList ID="cbluseComputerDuration" runat="server"  RepeatLayout="Flow" RepeatDirection="Horizontal" class="bloodradio">
                                    <asp:ListItem Value="1"><2小时</asp:ListItem>
                                    <asp:ListItem Value="2">2-5小时</asp:ListItem>
                                    <asp:ListItem Value="3">5-8小时</asp:ListItem>
                                    <asp:ListItem Value="4">>8小时</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td class="warn">&nbsp;</td>
                           <td class="label">睡眠:</td>
                            <td class="input">  
                                 <asp:RadioButtonList ID="cblsleepDuration" runat="server"  RepeatLayout="Flow" RepeatDirection="Horizontal" class="bloodradio">
                                    <asp:ListItem Value="1">>8小时</asp:ListItem>
                                    <asp:ListItem Value="2">7-8小时</asp:ListItem>
                                    <asp:ListItem Value="3">7-6小时</asp:ListItem>
                                    <asp:ListItem Value="4"><6小时</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td class="warn">&nbsp;</td>
                            <td class="label">午睡:</td>
                            <td class="input">  
                                 <asp:RadioButtonList ID="rblsiesta" runat="server"  RepeatLayout="Flow" RepeatDirection="Horizontal" class="bloodradio">
                                    <asp:ListItem Value="1">无</asp:ListItem>
                                    <asp:ListItem Value="2">每天</asp:ListItem>
                                    <asp:ListItem Value="3">经常</asp:ListItem>
                                    <asp:ListItem Value="4">偶尔</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td class="warn">&nbsp;</td>
                           <td class="label">饮食:</td>
                            <td class="input">  
                                <asp:CheckBoxList ID="cbldiet" runat="server"  RepeatLayout="Flow" RepeatDirection="Horizontal" class="bloodradio">
                                    <asp:ListItem Value="1" onclick="clearText(1)">三餐不规律</asp:ListItem>
                                    <asp:ListItem Value="2" onclick="clearText(1)">常不吃早餐</asp:ListItem>
                                    <asp:ListItem Value="3" onclick="clearText(1)">偶尔不吃早餐</asp:ListItem>
                                    <asp:ListItem Value="4" onclick="clearText(1)">常暴饮暴食</asp:ListItem>
                                    <asp:ListItem Value="5" onclick="clearText(1)">偶尔暴饮暴食</asp:ListItem>
                                    <asp:ListItem Value="6" onclick="clearText(1)">经常宵夜</asp:ListItem>
                                    <asp:ListItem Value="7" onclick="clearText(1)">偶尔宵夜</asp:ListItem>
                                    <asp:ListItem Value="8" onclick="clearText(1)">嗜咸</asp:ListItem>
                                    <asp:ListItem Value="9" onclick="clearText(1)">嗜甜</asp:ListItem>
                                    <asp:ListItem Value="10" onclick="clearText(1)">嗜辣</asp:ListItem>
                                    <asp:ListItem Value="11" onclick="clearText(1)">偏素食</asp:ListItem>
                                    <asp:ListItem Value="12" onclick="clearText(1)">偏肉食</asp:ListItem>
                                </asp:CheckBoxList>
                             
                            </td>
                        </tr>
                        <tr>
                            <td class="warn">&nbsp;</td>
                            <td class="label"></td>
                             <td class="input"> 
                                   &nbsp;其它：<asp:TextBox ID="txtdiet" runat="server" class="inputtext"></asp:TextBox>
                             </td>
                        </tr>
                        <tr>
                            <td class="warn">&nbsp;</td>
                            <td class="label">上午加餐:</td>
                             <td class="input">  
                                <asp:RadioButtonList ID="cblextraMealAM" runat="server"  RepeatLayout="Flow" RepeatDirection="Horizontal" class="bloodradio">
                                    <asp:ListItem Value="1">无</asp:ListItem>
                                    <asp:ListItem Value="2">每天</asp:ListItem>
                                    <asp:ListItem Value="3">经常</asp:ListItem>
                                    <asp:ListItem Value="4">偶尔</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td class="warn">&nbsp;</td>
                           <td class="label">下午加餐:</td>
                            <td class="input">  
                                <asp:RadioButtonList ID="cblextraMealPM" runat="server"  RepeatLayout="Flow" RepeatDirection="Horizontal" class="bloodradio">
                                    <asp:ListItem Value="1">无</asp:ListItem>
                                    <asp:ListItem Value="2">每天</asp:ListItem>
                                    <asp:ListItem Value="3">经常</asp:ListItem>
                                    <asp:ListItem Value="4">偶尔</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td class="warn">&nbsp;</td>
                            <td class="label">运动:</td>
                             <td class="input">  锻炼次数平均<asp:TextBox ID="txtexerciseNumber"  msg="锻炼次数" runat="server" class="inputtext"></asp:TextBox>次/周</td>
                        </tr>
                        <tr>
                            <td class="warn">&nbsp;</td>
                           <td class="label">每次锻炼的时间:</td>
                          <td class="input">  
                                <asp:RadioButtonList ID="cblexerciseDuration" runat="server"  RepeatLayout="Flow" RepeatDirection="Horizontal" class="bloodradio">
                                    <asp:ListItem Value="1"><30分钟</asp:ListItem>
                                    <asp:ListItem Value="2">30-60分钟</asp:ListItem>
                                    <asp:ListItem Value="3">>60分钟</asp:ListItem>                           
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td class="warn">&nbsp;</td>
                           <td class="label">锻炼的方式:</td>
                             <td class="input">                                  
                                 <asp:CheckBoxList ID="cblexerciseType" runat="server"  RepeatLayout="Flow" RepeatDirection="Horizontal" class="bloodradio">
                                     <asp:ListItem Value="1" onclick="clearText(2)">散步</asp:ListItem>
                                    <asp:ListItem Value="2" onclick="clearText(2)">跑步</asp:ListItem>
                                    <asp:ListItem Value="3" onclick="clearText(2)">太极</asp:ListItem>
                                    <asp:ListItem Value="4" onclick="clearText(2)">游泳</asp:ListItem>
                                    <asp:ListItem Value="5" onclick="clearText(2)">健身器械运动</asp:ListItem>
                                    <asp:ListItem Value="6" onclick="clearText(2)">健身操类</asp:ListItem>
                                 </asp:CheckBoxList>
                                &nbsp;&nbsp;&nbsp;其它：<asp:TextBox ID="txtexerciseType" runat="server" class="inputtext"></asp:TextBox>
                            </td>
                        </tr> 
                                    </table>
                                    
                                </div>
                            </div>
       
        </div>
     <div class="text_c">
                                    <asp:Button ID="btnSave" runat="server" Text="保存"  OnClick="btnSave_Click"  class="button"/>
                                        </div>
    </asp:Content>