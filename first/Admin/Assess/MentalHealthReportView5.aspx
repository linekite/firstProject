<%@ Page Language="C#" MasterPageFile="~/MainContent.Master" AutoEventWireup="true"
    CodeBehind="MentalHealthReportView5.aspx.cs" Inherits="Chm.Web.MentalHealthReportView5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Styles/d2.css" type="text/css" rel="Stylesheet" />
    <link href="../../Styles/d.css" rel="stylesheet" type="text/css" />
    <link href="../../Styles/tmmon.css" type="text/css" rel="Stylesheet" />


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
    <table id="subject" align="center">
        <tr>
            <td>
                <div class="chunk">
                    <!--头部-->
                    <%--<div class="chunk_head">
                <div class="chunk_head_one">
                    <img src="~/image/jiankang_07.gif" /></div>
                <div class="title_text">
                    <span id="Sleep">匹兹堡睡眠质量指数</span></div>
                <div class="chunk_head_two">
                    <img src="~/image/jiankang_10.gif" /></div>
                <div style="clear: both">
                </div>
            </div>--%>
                    <!--头部结束class="chunk_matter"-->
                    <div class="chunk_matter">
                        <div class="t_space">
                        </div>
                        <table width="470" border="0" cellspacing="0" cellpadding="0" align="center" class="sm_tab">
                            <tr>
                                <td class="sm_left">
                                    &nbsp;
                                </td>
                                <td style="padding-left: 15px; padding-right: 15px;">
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td colspan="5" class="tit_line">
                                                您本次睡眠质量指数为 <span class="orange">
                                                    <asp:Literal ID="ltScore" runat="server"></asp:Literal></span> 分，您的睡眠质量 <span class="orange">
                                                        <asp:Literal ID="ltResult" runat="server"></asp:Literal></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" width="24%" class="sm_space">
                                                0
                                            </td>
                                            <td align="left" width="24%" class="sm_space">
                                                5
                                            </td>
                                            <td align="left" width="24%" class="sm_space">
                                                10
                                            </td>
                                            <td align="left" width="20%" class="sm_space">
                                                15
                                            </td>
                                            <td align="right">
                                                20
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="5">
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="sm_zl" align="center">
                                                    <tr>
                                                        <td width="25%">
                                                            好
                                                        </td>
                                                        <td class="c2" width="25%">
                                                            还行
                                                        </td>
                                                        <td class="c3" width="25%">
                                                            一般
                                                        </td>
                                                        <td class="c4">
                                                            差
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td class="sm_right">
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                        <h4>
                            结论：</h4>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="sm_text">
                            <tr>
                                <td valign="top">
                                    <span style="padding-left: 2em;"></span>您的睡眠质量 &nbsp;<asp:Literal ID="ltResult2"
                                        runat="server"></asp:Literal><br />
                                    <br />
                                    <span style="padding-left: 2em;"></span>
                                    <asp:Literal ID="ltDesc" runat="server"></asp:Literal>
                                </td>
                                <td>
                                    <img src="../../image/sm_1.jpg" />
                                </td>
                            </tr>
                        </table>
                        <h4>
                            建议：</h4>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="sm_text">
                            <tr>
                                <td valign="top">
                                    足够的睡眠是每个人健康的基本保障，每天7-8个小时是正常的睡眠时间，不管晚上你的精神是多么的高亢，但是到了时间点就要睡觉哦!养成良好的睡眠习惯是关键。您的睡眠质量还行，以下方法可助您提高睡眠质量：
                                    <br />
                                    <br />
                                    1. 睡前开窗通风，大概15-30分钟即可。
                                    <br />
                                    2. 保持良好的睡眠姿势，选择侧卧位睡姿优于仰卧。
                                    <br />
                                    3. 选择干燥、轻薄但保暖性较好的被子。
                                    <br />
                                    4. 睡前少食或不食用夜宵。
                                    <br />
                                    5. 睡前泡澡。
                                    <br />
                                    <br />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="distance">
                    </div>
                    <div align="center">
                        <%--                  <a class="button" id="btnExport" href="javascript:void(0);" style="text-decoration:none; vertical-align:middle" runat="server">
                  <font color="black"><%=Chy.Web.Resource.GetString("HM5_0988")%></font>
                </a> 
                &nbsp;&nbsp;&nbsp;   --%>
                        <Chy:XButton ID="btnAudit" runat="server" CssClass="button" onclick="btnAudit_Click" />
                        <Chy:XButton ID="btnCancel" runat="server" CssClass="button" OnClick="btnCancel_Click" />
                    </div>
                    <div class="distance">
                    </div>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
