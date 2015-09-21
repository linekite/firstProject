<%@ Page Language="C#" MasterPageFile="~/MainContent.Master" AutoEventWireup="true"
    CodeBehind="MentalHealthReportView6.aspx.cs" Inherits="Chm.Web.MentalHealthReportView6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Styles/d.css" type="text/css" rel="Stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
    <div id="subject">
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
            <div  style="margin-left:50px;">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr><td>&nbsp;</td></tr>
                    <tr>
                        <td class="brown title_bold14">
                            <%= Chy.Web.Resource.GetString("HM5_0977")%>：<span class="red">
                                <asp:Literal ID="ltScoreE" runat="server" />
                            </span><%-- HM5_0975=分 --%> <%= Chy.Web.Resource.GetString("HM5_0975")%>
                        </td>
                    </tr>
                    <tr>
                        <td class="way_one">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td height="30" valign="middle" class="dust_bold12 blue">
                                        <%--典型内向--%><%= Chy.Web.Resource.GetString("HM_E1Result")%>( X &lt;= 38.5 )
                                    </td>
                                </tr>
                                <tr>
                                    <td class="range_fine12">
                                        <%= Chy.Web.Resource.GetString("HM_E1Desc")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="middle" class="dust_bold12 blue">
                                        <%--倾向内向--%><%= Chy.Web.Resource.GetString("HM_E2Result")%>（ 38.5 &lt; X &lt;
                                        43.3）
                                    </td>
                                </tr>
                                <tr>
                                    <td class="range_fine12">
                                        <%= Chy.Web.Resource.GetString("HM_E2Desc")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="dust_bold12 blue">
                                        <%--内外向居中--%><%= Chy.Web.Resource.GetString("HM_E3Result")%>( 43.3 &lt;= X
                                        &lt; =56.7 )
                                    </td>
                                </tr>
                                <tr>
                                    <td class="range_fine12">
                                        <%= Chy.Web.Resource.GetString("HM_E3Desc")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="dust_bold12 blue">
                                        <%--倾向外向--%><%= Chy.Web.Resource.GetString("HM_E4Result")%>（ 56.7 &lt; X &lt;
                                        =61.5 ）
                                    </td>
                                </tr>
                                <tr>
                                    <td class="range_fine12">
                                        <%= Chy.Web.Resource.GetString("HM_E4Desc")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="dust_bold12 blue">
                                        <%--典型外向--%><%= Chy.Web.Resource.GetString("HM_E5Result")%>（ 61.5 &lt;= X ）
                                    </td>
                                </tr>
                                <tr>
                                    <td class="range_fine12">
                                        <%= Chy.Web.Resource.GetString("HM_E5Desc")%>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <div class="distance">
                </div>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="brown title_bold14">
                            <%= Chy.Web.Resource.GetString("HM5_0978")%>：<span class="red">
                                <asp:Literal ID="ltScoreN" runat="server" />
                            </span><%-- HM5_0975=分 --%> <%= Chy.Web.Resource.GetString("HM5_0975")%>
                        </td>
                    </tr>
                    <tr>
                        <td class="way_one">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td height="30" valign="middle" class="dust_bold12 blue">
                                        <%--典型的情绪稳定--%><%= Chy.Web.Resource.GetString("HM_N1Result")%>
                                        ( X <= 38.5 )
                                    </td>
                                </tr>
                                <tr>
                                    <td class="range_fine12">
                                        <%= Chy.Web.Resource.GetString("HM_N1Desc")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="middle" class="dust_bold12 blue">
                                        <%--倾向情绪稳定--%><%= Chy.Web.Resource.GetString("HM_N2Result")%>（ 38.5 < X < 43.3）
                                    </td>
                                </tr>
                                <tr>
                                    <td class="range_fine12">
                                        <%= Chy.Web.Resource.GetString("HM_N2Desc")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="dust_bold12 blue">
                                        <%--情绪稳定性居中--%><%= Chy.Web.Resource.GetString("HM_N3Result")%>（ 43.3 <= X <=
                                        56.7）
                                    </td>
                                </tr>
                                <tr>
                                    <td class="range_fine12">
                                        <%= Chy.Web.Resource.GetString("HM_N3Desc")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="dust_bold12 blue">
                                        <%--倾向情绪不稳--%><%= Chy.Web.Resource.GetString("HM_N4Result")%>（ 56.7 < X <=
                                        61.5 ）
                                    </td>
                                </tr>
                                <tr>
                                    <td class="range_fine12">
                                        <%= Chy.Web.Resource.GetString("HM_N4Desc")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="dust_bold12 blue">
                                        <%--典型的情绪不稳--%><%= Chy.Web.Resource.GetString("HM_N5Result")%>（ 61.5 < X ）
                                    </td>
                                </tr>
                                <tr>
                                    <td class="range_fine12">
                                        <%= Chy.Web.Resource.GetString("HM_N5Desc")%>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <div class="distance">
                </div>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="blue title_bold14">
                            <%-- HM5_0976=P维度 --%><%= Chy.Web.Resource.GetString("HM5_0976")%>：<span class="red">
                                <asp:Literal ID="ltScoreP" runat="server" />
                            </span><%-- HM5_0975=分 --%> <%= Chy.Web.Resource.GetString("HM5_0975")%>
                        </td>
                    </tr>
                    <tr>
                        <td class="way_one">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td height="30" valign="middle" class="dust_bold12 gray">
                                        X > 60
                                    </td>
                                </tr>
                                <tr>
                                    <td class="range_fine12">
                                        <%--可能孤独--%><%= Chy.Web.Resource.GetString("HM_P2Desc")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="middle" class="dust_bold12 gray">
                                        X <= 60
                                    </td>
                                </tr>
                                <tr>
                                    <td class="range_fine12">
                                        <%--能与人相处--%><%= Chy.Web.Resource.GetString("HM_P1Desc")%>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <div class="distance">
                </div>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="blue title_bold14">
                            <%= Chy.Web.Resource.GetString("HM5_0979")%>：<span class="red">
                                <asp:Literal ID="ltScoreL" runat="server" />
                            </span><%-- HM5_0975=分 --%> <%= Chy.Web.Resource.GetString("HM5_0975")%>
                        </td>
                    </tr>
                    <tr>
                        <td class="way_one">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td height="30" valign="middle" class="dust_bold12 gray">
                                        70 < X
                                    </td>
                                </tr>
                                <tr>
                                    <td class="range_fine12">
                                        <%--本次测试无效--%><%= Chy.Web.Resource.GetString("HM_L3Desc")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="middle" class="dust_bold12 gray">
                                        40 < X < 70
                                    </td>
                                </tr>
                                <tr>
                                    <td class="range_fine12">
                                        <%--您的掩饰性较高--%><%= Chy.Web.Resource.GetString("HM_L2Desc")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="middle" class="dust_bold12 gray">
                                        X <= 40
                                    </td>
                                </tr>
                                <tr>
                                    <td class="range_fine12">
                                        <%--您对本测验回答可信度高--%><%= Chy.Web.Resource.GetString("HM_L1Desc")%>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <div class="distance">
                </div>
                <div class="assess" >
                    <div class="assess_one" style="height:250px;">
                        <div class="assess_title text_fine12 blue">
                            <%--胆汁质--%><%= Chy.Web.Resource.GetString("HM5_0980")%>：</div>
                        <div class="assess_content range_fine12" style="text-align: left; height: 100px;">
                            <%= Chy.Web.Resource.GetString("HM5_0981")%></div>
                    </div>
                    <div class="assess_two" style="height:250px;">
                        <div class="assess_title text_fine12 blue">
                            <%--抑郁质--%><%= Chy.Web.Resource.GetString("HM5_0982")%>：</div>
                        <div class="assess_content range_fine12" style="text-align: left; height: 100px;">
                            <%= Chy.Web.Resource.GetString("HM5_0983")%>
                        </div>
                    </div>
                    <div style="clear: both">
                    </div>
                </div>
                <div class="distance">
                </div>
                <div class="assess">
                    <div class="assess_one" style="height:270px;">
                        <div class="assess_title text_fine12 blue">
                            <%--多血质--%><%= Chy.Web.Resource.GetString("HM5_0986")%>：</div>
                        <div class="assess_content range_fine12" style="text-align: left; height: 170px;">
                            <%= Chy.Web.Resource.GetString("HM5_0987")%>
                        </div>
                    </div>
                    <div class="assess_two" style="height:270px;">
                        <div class="assess_title text_fine12 blue">
                            <%--粘液质--%><%= Chy.Web.Resource.GetString("HM5_0984")%>：</div>
                        <div class="assess_content range_fine12" style="text-align: left; height: 170px;">
                           <%= Chy.Web.Resource.GetString("HM5_0985")%></div>
                    </div>
                    <div style="clear: both">
                    </div>
                </div>
                <div class="distance">
                </div>
            </div>
            <div class="distance">
            </div>
            <div align="center">
<%--                                    <a class="button" id="btnExport" href="javascript:void(0);" style="text-decoration:none; vertical-align:middle" runat="server">
                  <font color="black"><%=Chy.Web.Resource.GetString("HM5_0988")%></font>
                </a> 
                &nbsp;&nbsp;&nbsp; --%>                          
                  <Chy:XButton ID="btnAudit" runat="server"  CssClass="button" onclick="btnAudit_Click"/>     
                <Chy:XButton ID="btnCancel" runat="server" CssClass="button" OnClick="btnCancel_Click" />
            </div>
            <div class="distance">
            </div>
        </div>
    </div>
</asp:Content>
