<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Chm.Web.Admin.Checkup.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title> 
    <!--双日历控件-->  
    <link type="text/css" href="http://code.jquery.com/ui/1.9.1/themes/smoothness/jquery-ui.css" rel="stylesheet">
    <script src="/hc/js/jquery-1.8.1.min.js" type="text/javascript"></script>
    <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
    <script src="/hc/js/jquery-ui-timepicker-addon.js"></script>
    <script src="/hc/js/jquery-ui-timepicker-zh-CN.js"></script>
    <script src="/hc/js/WebStatistics.js" type="text/javascript"></script>   
    <script src="/hc/js/jquery-ui-1.8.11.min.js" type="text/javascript"></script>   
    <!--单日历控件-->  
    <script src="/hc/DatePicker/WdatePicker.js" type="text/javascript"></script>

    <script type="text/javascript"> <!--双日历控件-->  
        $(document).ready(function () {
            $('#dvTime').hide();           
            //点击确定按钮
            $('#btnConfirm').click(function () {
                $('#dvDate').html($.trim($("#dvStartTime").val()) + '至' + $.trim($("#dvEndTime").val())); //设置显示时间
                $('#txtDate').val($('#dvDate').html());
                $('#dvTime').hide();
                //query();
            });
        });
        //按钮取消事件
        function doCancel() {//取消后，将时间控件的选中值设置为原先的值
            var timeRange = $.trim($('#txtDate').val());
            var splen = "至".length + 10;
            $("#dvStartTime").datepicker("setDate", timeRange.substr(0, 10)).val(timeRange.substr(0, 10));
            $("#dvEndTime").datepicker("setDate", timeRange.substr(splen, 10)).val(timeRange.substr(splen, 10));
            $('#dvTime').hide();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div style="display:none;">
    <input id="txtDate" type="text" onclick="showDiv()" value='2014-1-1至2014-1-2' class="WarningInput " readonly="readonly" />
        <input type="text"  onfocus="WdatePicker()" /> 

        <div id="dvTime" class="DateTime_wrap">
            <h2 id="dvDate" class="DateTime_tit"></h2>
            <div id="dvClose">
               <!-- <img src="@Url.Content("~/images1.01/Img/closed.png")" onclick="doCancel()" />-->
            </div>
            <div id="dvStartTime" class="dvStartTime">

            </div>
            <div id="dvEndTime" class="dvEndTime">

            </div>
           


            <div class="DataTime_btnwrap">
                <ul>
                 <!--<li> </li>-->
                   
                 <input id="btnConfirm" type="button" value="确定" class="select-btn" />
                 <input id="btnCancel" onclick="doCancel()" type="button" value="关闭" class="DT_closebtn" />
                </ul>
            </div>
        </div>
       
             
    </div>
        <div >
            表名<asp:TextBox ID="TextBox1" runat="server" Width="300"></asp:TextBox> <asp:Button ID="Button3" runat="server" Text="调疾病分组的" OnClick="Button3_Click"/><br />
        <asp:TextBox ID="txtField" runat="server" TextMode="MultiLine" Width="700" Height="300"></asp:TextBox><br />
        <asp:Button ID="Button1" runat="server" Text="存储过程参数" OnClick="btnPro_Click"/>
        <asp:Button ID="btnInsert" runat="server" Text="插入语句" OnClick="btnInsert_Click"/>
        <asp:Button ID="btnUpdate" runat="server" Text="修改语句" OnClick="btnUpdate_Click"/>
        <asp:Button ID="btnQueryP" runat="server" Text="查询代码参数" OnClick="btnQueryP_Click"/>
        <asp:Button ID="btnAddP" runat="server" Text="添加代码参数" OnClick="btnAddP_Click"/>  
        <br />
        <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" Width="700" Height="200"></asp:TextBox>
         
        </div>
        <div style="display:none;">
            <asp:RadioButtonList ID="RadioButtonList1" runat="server">
            <asp:ListItem>aa</asp:ListItem>
             <asp:ListItem>bb</asp:ListItem>
        </asp:RadioButtonList>
        <asp:Button ID="Button2" runat="server" Text="Button" OnClick="Button2_Click"/>
        </div>
        
    </form>
</body>
</html>
