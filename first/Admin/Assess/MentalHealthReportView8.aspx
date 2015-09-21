<%@ Page Language="C#" MasterPageFile="~/MainContent.Master" AutoEventWireup="true" CodeBehind="MentalHealthReportView8.aspx.cs"
    Inherits="Chm.Web.MentalHealthReportView8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Styles/d.css" rel="stylesheet" type="text/css" />

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
            <!--头部结束 class="chunk_matter"-->
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
                                                    您本次测量分数为 <span class="orange"> <asp:Literal ID="ltScore" runat="server"></asp:Literal></span> 分，您的属于 <span class="orange"><asp:Literal ID="ltResult" runat="server"></asp:Literal></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left" width="24%" class="sm_space">
                                                    0
                                                </td>
                                                <td align="left" width="24%" class="sm_space">
                                                    16
                                                </td>
                                                <td align="left" width="24%" class="sm_space">
                                                    26
                                                </td>
                                                <td align="left" width="20%" class="sm_space">
                                                    28
                                                </td>
                                                <td align="right">
                                                    35
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="5">
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="sm_ax" align="center">
                                                        <tr>
                                                            <td width="25%" class="a1">
                                                                B型性格
                                                            </td>
                                                            <td class="a2" width="25%">
                                                                亚B型性格
                                                            </td>
                                                            <td class="a3" width="25%">
                                                                中间型
                                                            </td>
                                                            <td class="a4">
                                                                亚A型性格
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
                                        <span style="padding-left: 2em;"></span>有此性格特征的人的行为特征是： <asp:Literal ID="ltResult2" runat="server"></asp:Literal>
                                        <br />
                                        <br />
                                        <span style="padding-left: 2em;"></span><asp:Literal ID="ltDesc" runat="server"></asp:Literal>
                                    </td>
                                </tr>
                            </table>
                            <h4>
                                说明：</h4>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="sm_text">
                                <tr>
                                    <td valign="top">
                                        <span style="padding-left: 2em;"></span>医学界把易患冠心病的性格特征定名为Ａ型性格，这类人的行为模式称为Ａ型行为模式。其行为特征是：（１）争强好胜，热衷于竞争，追求成就，有较强的事业心，凡事不居于人后，即使在做游戏时，也力图要超过别人；（２）性格急躁，时间紧迫感强，指望充分利用每一分钟时间，把工作以外的事情都视为浪费时间，做事很快，工作效率较高；（３）对人存有戒心，容易产生对别人的敌意，在受到挫折时更是如此，情绪很容易波动，经常处于愤怒和焦虑的情绪状态中。<br />
                                        <br />
                                        <span style="padding-left: 2em;"></span>与上述Ａ型性格相反的性格被称为Ｂ型性格。有Ｂ型性格特征的人的行为特征是轻松自在，不求名利，不在乎能否做出成就，得过且过，缺乏时间观念，对人随和，不爱与人竞争，但心情不开朗，对自己过于克制，常把怨恨情绪压在心里，情绪状态偏于抑郁，低沉和内蕴。<br />
                                        <br />
                                        <span style="padding-left: 2em;"></span>Ａ型性格人冠心病的发病率比Ｂ型性格人高二倍，心肌梗塞的复发率则比Ｂ型性格人高６倍。
                                    </td>
                                </tr>
                            </table>
                            <h4>
                                建议：</h4>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="sm_text">
                                <tr>
                                    <td valign="top">
                                        怎样才能解除A型人在心理上和生理上的过度紧张和压力呢？<br />
                                        <br />
                                        一， 制定一个符合自己实际能力的目标；
                                        <br />
                                        二， 在时间安排上要预留回旋的余地；
                                        <br />
                                        三， 严格划清工作与休息的界线；
                                        <br />
                                        四， 培养业余爱好，增加生活情趣；
                                        <br />
                                        五， 经常参加体育活动，提高机体承受能力。
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                            </table>
                        </div>
            <div class="distance">
            </div>
            <div align="center">
                <%--<input type="button" class="button" id="btnCancel" runat="server" onclick="window.close();" />--%>
<%--                 <a class="button" id="btnExport" href="javascript:void(0);" style="text-decoration:none; vertical-align:middle" runat="server">
                  <font color="black"><%=Chy.Web.Resource.GetString("HM5_0988")%></font>
                </a> 
                &nbsp;&nbsp;&nbsp;  --%>                         
                  <Chy:XButton ID="btnAudit" runat="server"  CssClass="button" onclick="btnAudit_Click"/>     
                <Chy:XButton ID="btnCancel" runat="server" CssClass="button"  OnClick="btnCancel_Click" />
            </div>
            <div class="distance">
            </div>
        </div>
            </td>
        </tr>
        
    </table>
</asp:Content>
