<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MainContent.Master" CodeBehind="DietaryHabit.aspx.cs" Inherits="Chm.Web.Admin.HealthRecord.DietaryHabit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="../../Styles/adminwordbreak.css" rel="stylesheet" type="text/css" />
     <style type="text/css">
        .con {
            font-size: 12px;
            margin: 0px auto;
        }       
     </style>
    <script src="/hc/js/healthInfo.js" type="text/javascript"></script>
     <script type="text/javascript">
           //var strP = /^\d+$/;
           //function validate(obj) {
           //    var tar = $(obj);
           //    if (tar.val() != '') {
           //        if (!strP.test(tar.val())) {
           //            alert('次数只能是数字');
           //            tar.val('');
           //        }
           //    }
           //}
           //function validateAll() {
           //    var isPass = 1;
           //    $("#tbData input[type=text]").each(function () {
           //        var tar = $(this);
           //        if (tar.val() != '') {
           //            if (tar.attr('class').indexOf('novalidate') < 0)
           //            {
           //                if (!strP.test(tar.val())) {
           //                    alert('次数只能是数字');
           //                    isPass = 0;
           //                }
           //            }                       
           //        }
           //    });
           //    if (isPass == 1)
           //        return true;
           //    else
           //        return false;
           //}
           
       </script>
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
                                     
                                        <thead>
                            <tr>
                                <th colspan="2" class="text-c">食物名称</th>
                                <th style="text-align:left;">单位时间食用次数/食用量(如：1次/天，500g/天)</th>
                            </tr>
                        </thead>
                        <tr>
                            <td rowspan="4"  class="label" style="width:25%">谷类</td>
                            <td class="" style="width:35%">大米类（如米饭、米粥）</td>
                            <td class="text-c"><asp:TextBox ID="txtriceTimeDay" runat="server" class="inputtext"></asp:TextBox>
                                 
                                <span style="display:none;">次/天<asp:TextBox ID="txtriceTimeWeek" runat="server" class="input liveinput mlr5"></asp:TextBox>
                                次/周 
                                <asp:TextBox ID="txtriceTimeMonth" runat="server" class="input liveinput mlr5"></asp:TextBox>
                                次/月</span>
                                </td>
                        </tr>
                        <tr>
                            <td class="">面食类（如面条、包子、馒头）</td>
                            <td class="text-c">
                                <asp:TextBox ID="txtnoodleTimeDay" runat="server" class="inputtext"></asp:TextBox>
                                 
                                 <span style="display:none;">次/天<asp:TextBox ID="txtnoodleTimeWeek" runat="server" class="input liveinput mlr5"></asp:TextBox>
                                次/周 
                                <asp:TextBox ID="txtnoodleTimeMonth" runat="server" class="input liveinput mlr5"></asp:TextBox>
                                次/月</span>
                                </td>
                        </tr>
                        <tr>
                            <td class="">薯类（如红薯、马铃薯、芋头、山药）</td>
                            <td class="text-c">
                                <asp:TextBox ID="txtpotatoTimeDay" runat="server" class="inputtext"></asp:TextBox>
                                 
                                <span style="display:none;">次/天<asp:TextBox ID="txtpotatoTimeWeek" runat="server" class="input liveinput mlr5"></asp:TextBox>
                                次/周 
                                <asp:TextBox ID="txtpotatoTimeMonth" runat="server" class="input liveinput mlr5"></asp:TextBox>
                                次/月</span>
                                </td>
                        </tr>
                        <tr>
                            <td class="">杂粮类（如玉米、小米、高粱、芥麦、燕麦）</td>
                            <td class="text-c">
                                <asp:TextBox ID="txtCerealTimeDay" runat="server" class="inputtext"></asp:TextBox>
                                
                                <span style="display:none;">次/天 <asp:TextBox ID="txtCerealTimeWeek" runat="server" class="input liveinput mlr5"></asp:TextBox>
                                次/周 
                                <asp:TextBox ID="txtCerealTimeMonth" runat="server" class="input liveinput mlr5"></asp:TextBox>
                                次/月</span>
                                </td>
                        </tr>
                        <tr>
                            <td rowspan="2"  class="label">肉类</td>
                            <td class="">畜肉类及制品（如猪羊牛肉及制品）</td>
                            <td class="text-c">
                                <asp:TextBox ID="txtBeastMeatTimeDay" runat="server" class="inputtext"></asp:TextBox>
                                
                                <span style="display:none;">次/天 <asp:TextBox ID="txtBeastMeatTimeWeek" runat="server" class="input liveinput mlr5"></asp:TextBox>
                                次/周 
                                <asp:TextBox ID="txtBeastMeatTimeMonth" runat="server" class="input liveinput mlr5"></asp:TextBox>
                                次/月</span>
                                </td>
                        </tr>
                        <tr>
                            <td class="">禽肉及制品</td>
                            <td class="text-c">
                                <asp:TextBox ID="txtbirdsMeatTimeDay" runat="server" class="inputtext"></asp:TextBox>
                                 
                                <span style="display:none;">次/天<asp:TextBox ID="txtbirdsMeatTimeWeek" runat="server" class="input liveinput mlr5"></asp:TextBox>
                                次/周 
                                <asp:TextBox ID="txtbirdsMeatTimeMonth" runat="server" class="input liveinput mlr5"></asp:TextBox>
                                次/月</span>
                                </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="label">鱼及水产品</td>
                            <td class="text-c">
                                <asp:TextBox ID="txtFisheriesTimeDay" runat="server" class="inputtext"></asp:TextBox>
                                 
                                <span style="display:none;">次/天<asp:TextBox ID="txtFisheriesTimeWeek" runat="server" class="input liveinput mlr5"></asp:TextBox>
                                次/周 
                                <asp:TextBox ID="txtFisheriesTimeMonth" runat="server" class="input liveinput mlr5"></asp:TextBox>
                                次/月</span>
                                </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="label">蛋类及制品</td>
                            <td class="text-c">
                                <asp:TextBox ID="txteggTimeDay" runat="server" class="inputtext"></asp:TextBox>
                                
                                <span style="display:none;">次/天 <asp:TextBox ID="txteggTimeWeek" runat="server" class="input liveinput mlr5"></asp:TextBox>
                                次/周 
                                <asp:TextBox ID="txteggTimeMonth" runat="server" class="input liveinput mlr5"></asp:TextBox>
                                次/月</span>
                                </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="label">鲜奶或纯牛奶</td>
                            <td class="text-c">
                                <asp:TextBox ID="txtmilkTimeDay" runat="server" class="inputtext"></asp:TextBox>
                                 
                                <span style="display:none;">次/天<asp:TextBox ID="txtmilkTimeWeek" runat="server" class="input liveinput mlr5"></asp:TextBox>
                                次/周 
                                <asp:TextBox ID="txtmilkTimeMonth" runat="server" class="input liveinput mlr5"></asp:TextBox>
                                次/月</span>
                                </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="label">奶制品（如奶片、奶粉）</td>
                            <td class="text-c">
                                <asp:TextBox ID="txtdairyTimeDay" runat="server" class="inputtext"></asp:TextBox>
                                
                                <span style="display:none;">次/天 <asp:TextBox ID="txtdairyTimeWeek" runat="server" class="input liveinput mlr5"></asp:TextBox>
                                次/周 
                                <asp:TextBox ID="txtdairyTimeMonth" runat="server" class="input liveinput mlr5"></asp:TextBox>
                                次/月</span>
                                </td>
                        </tr>
                        <tr>
                            <td rowspan="3"  class="label">豆类</td>
                            <td class="">干豆类（如黄豆、绿豆、黑豆、蚕豆）</td>
                            <td class="text-c">
                                <asp:TextBox ID="txtbeanTimeDay" runat="server" class="inputtext"></asp:TextBox>
                                 
                                <span style="display:none;"> 次/天<asp:TextBox ID="txtbeanTimeWeek" runat="server" class="input liveinput mlr5"></asp:TextBox>
                                次/周 
                                <asp:TextBox ID="txtbeanTimeMonth" runat="server" class="input liveinput mlr5"></asp:TextBox>
                                次/月</span>
                               </td>
                        </tr>
                        <tr>
                            <td class="style1">豆制品（如豆腐、豆干）</td>
                            <td class="text-c">
                                <asp:TextBox ID="txtbeanProductsTimeDay" runat="server" class="inputtext"></asp:TextBox>
                                 
                                <span style="display:none;">次/天<asp:TextBox ID="txtbeanProductsTimeWeek" runat="server" class="input liveinput mlr5"></asp:TextBox>
                                次/周 
                                <asp:TextBox ID="txtbeanProductsTimeMonth" runat="server" class="input liveinput mlr5"></asp:TextBox>
                                次/月</span>
                                </td>
                        </tr>
                        <tr>
                            <td class="">豆浆（一杯-240毫升）</td>
                            <td class="text-c">
                                <asp:TextBox ID="txtsoybeanMilkTimeDay" runat="server" class="inputtext"></asp:TextBox>
                                 
                                <span style="display:none;">次/天<asp:TextBox ID="txtsoybeanMilkTimeWeek" runat="server" class="input liveinput mlr5"></asp:TextBox>
                                次/周 
                                <asp:TextBox ID="txtsoybeanMilkTimeMonth" runat="server" class="input liveinput mlr5"></asp:TextBox>
                                次/月</span>
                                </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="label">坚果（如瓜子、杏仁、核桃）</td>
                            <td class="text-c">
                                <asp:TextBox ID="txtmastTimeDay" runat="server" class="inputtext"></asp:TextBox>
                                
                                <span style="display:none;">次/天 <asp:TextBox ID="txtmastTimeWeek" runat="server" class="input liveinput mlr5"></asp:TextBox>
                                次/周 
                                <asp:TextBox ID="txtmastTimeMonth" runat="server" class="input liveinput mlr5"></asp:TextBox>
                                次/月</span>
                                </td>
                        </tr>
                        <tr>
                            <td class="label" rowspan="2">新鲜蔬菜</td>
                            <td class="">绿叶蔬菜（如白菜、生菜、空心菜）</td>
                            <td class="text-c">
                                <asp:TextBox ID="txtgreenVegetablesTimeDay" runat="server" class="inputtext"></asp:TextBox>
                                 
                                <span style="display:none;">次/天<asp:TextBox ID="txtgreenVegetablesTimeWeek" runat="server" class="input liveinput mlr5"></asp:TextBox>
                                次/周 
                                <asp:TextBox ID="txtgreenVegetablesTimeMonth" runat="server" class="input liveinput mlr5"></asp:TextBox>
                                次/月</span>
                                </td>
                        </tr>
                        <tr>
                            <td class="">非绿叶蔬菜（如红椒、西红柿、洋葱）</td>
                            <td class="text-c">
                                <asp:TextBox ID="txtgreenLeafyVegetablesTimeDay" runat="server" class="inputtext"></asp:TextBox>
                                
                                <span style="display:none;">次/天 <asp:TextBox ID="txtgreenLeafyVegetablesTimeWeek" runat="server" class="input liveinput mlr5"></asp:TextBox>
                                次/周 
                                <asp:TextBox ID="txtgreenLeafyVegetablesTimeMonth" runat="server" class="input liveinput mlr5"></asp:TextBox>
                                次/月</span>
                                </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="label">新鲜水果</td>
                            <td class="text-c">
                                <asp:TextBox ID="txtfruitTimeDay" runat="server" class="inputtext"></asp:TextBox>
                                
                                <span style="display:none;">次/天<asp:TextBox ID="txtfruitTimeWeek" runat="server" class="input liveinput mlr5"></asp:TextBox>
                                次/周 
                                <asp:TextBox ID="txtfruitTimeMonth" runat="server" class="input liveinput mlr5"></asp:TextBox>
                                次/月</span> 
                                </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="label">平均每天食盐的摄入量</td>
                            <td class="text-c">
                                <asp:TextBox ID="txtsaltAmountDay" runat="server" class="inputtext"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="label">平均每天摄入的烹调油</td>
                            <td class="text-c">
                                <asp:TextBox ID="txtoilAmountDay" runat="server" class="inputtext"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="label">平均每天的饮水量</td>
                            <td class="text-c" >
                                <asp:TextBox ID="txtwaterAmountDay" runat="server" class="inputtext"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="label">饮水水质</td>
                            <td class="text-c">
                                <asp:RadioButtonList ID="rblwaterType" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" class="bloodradio">
                                    <asp:ListItem Value="1">矿泉水</asp:ListItem>
                                    <asp:ListItem Value="2">纯净水</asp:ListItem>
                                    <asp:ListItem Value="3">过滤水</asp:ListItem>
                                    <asp:ListItem Value="4">碱性水</asp:ListItem>
                                    <asp:ListItem Value="5">特质水</asp:ListItem>
                                    <asp:ListItem Value="6">其它</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="label">不吃的食物</td>
                            <td class="text-c">
                                <asp:TextBox ID="txtDislikeTheFood" runat="server" class="inputtext"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="label">保健品</td>
                            <td class="text-c">
                                <asp:TextBox ID="txthealthCareProducts" runat="server" class="inputtext"></asp:TextBox>
                            </td>
                        </tr>
                                    </table>
                                    
                                </div>
                            </div>
       
        </div>
     <div class="text_c">
                                    <asp:Button ID="btnSave" runat="server" Text="保存"  OnClick="btnSave_Click"   class="button"/>
                                        </div>
    </asp:Content>