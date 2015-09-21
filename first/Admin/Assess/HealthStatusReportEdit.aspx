<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HealthStatusReportEdit.aspx.cs" Inherits="Chm.Web.Admin.Assess.HealthStatusReportEdit" EnableViewState="true"%>
<%@ Register TagPrefix="Chy" Namespace="Chy.UI.Controls" Assembly="Chy.UI.Controls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head  id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
    <link href="../../Styles/d.css" rel="stylesheet" type="text/css" />
    <link href="../../Styles/adminwordbreak.css" rel="stylesheet" type="text/css" />
</head> 
<body>
 <form id="form1" runat="server">
 <div class="top_bj">
 <div class="top_name namea"><%=Chy.Web.Resource.GetString("HM5_0766")%></div>
 </div>
 <div class="persona">
   <table width="830" border="0" align="center" cellpadding="0" cellspacing="0" class="dust_bold12">
     <tr>
       <td height="29" valign="middle" class="rightat">姓名<%=Chy.Web.Resource.GetString("Remp_Colon")%></td>
       <td valign="middle" class="leftat"><asp:Literal ID="userName" runat="server" Text=""></asp:Literal></td>
       <td valign="middle" class="rightat">性别<%=Chy.Web.Resource.GetString("Remp_Colon")%></td>
       <td valign="middle"  class="leftat"><asp:Literal ID="userSex" runat="server" Text=""></asp:Literal></td>
       <td valign="middle" class="rightat">年龄<%=Chy.Web.Resource.GetString("Remp_Colon")%></td>
       <td valign="middle"  class="leftat"><asp:Literal ID="userAge" runat="server" Text=""></asp:Literal><%=Chy.Web.Resource.GetString("HM_0368")%></td>
       <td valign="middle" class="rightat"><%=Chy.Web.Resource.GetString("HM5_0688")%><%=Chy.Web.Resource.GetString("Remp_Colon")%></td>
       <td valign="middle"  class="leftat"><asp:Literal ID="examTime" runat="server" Text=""></asp:Literal></td>
      <%-- <td valign="middle" class="rightat"> 编号：</td>
       <td valign="middle"  class="leftat"><asp:Literal ID="examNo" runat="server" Text="HM20110323102008595"></asp:Literal></td>--%>
     </tr>
   </table>
</div>
 <div id="subject">
    <div class="chunk">
    <!--头部-->
    <div class="chunk_head">
    
   <div class="title_text"><%=Chy.Web.Resource.GetString("HM5_0714")%></div>
    
    <div style="clear:both"></div>
    </div>
    <!--头部结束-->
    <div class="chunk_matter">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="content_form">
        <tr>
          <td height="33" colspan="2" valign="middle" class="form_top dust_bold12 gray"><%=Chy.Web.Resource.GetString("HM5_0715")%><%=Chy.Web.Resource.GetString("Remp_Colon")%></td>
        </tr>
        <tr>
          <td valign="middle" class="dust_bold12 right_stroke bottom_stroke"><%=Chy.Web.Resource.GetString("HM5_0716")%><%=Chy.Web.Resource.GetString("Remp_Colon")%></td>
          <td valign="middle" class="text_fine12 gray bottom_stroke" runat="server" id="tdMajorIssue"></td>
        </tr>
        <tr>
          <td valign="middle" class="dust_bold12 right_stroke bottom_stroke"><%=Chy.Web.Resource.GetString("HM5_0717")%><%=Chy.Web.Resource.GetString("Remp_Colon")%></td>
          <td valign="middle" class="text_fine12 gray bottom_stroke"  runat="server" id="tdMinorIssue"></td>
        </tr>
        <tr>
          <td valign="middle" class="dust_bold12 right_stroke"><%=Chy.Web.Resource.GetString("HM5_0718")%><%=Chy.Web.Resource.GetString("Remp_Colon")%></td>
          <td valign="middle" class="text_fine12 gray"  runat="server" id="tdOtherIssue">&nbsp;</td>
        </tr>
      </table>
      
    <div class="distance"></div>   <!--健康状态评估报告汇总结束-->
   <div class="chunk">
      <!--头部-->
     <div class="chunk_head">
       
        <div class="title_text"><%=Chy.Web.Resource.GetString("HM5_0719")%></div>
       
        <div style="clear:both"></div>
     </div>
      <!--头部结束-->
     <div class="chunk_matter">
       <table width="100%" border="0" cellspacing="0" cellpadding="0"  class="content_form">
         <tr>
           <td>
               <asp:GridView ID="majorList" AutoGenerateColumns="false" CssClass="content_form" runat="server"
                    Width="100%" DataKeyNames="MajorIndexRptID">
                    <Columns>
                        <asp:BoundField DataField="MajorName" ItemStyle-CssClass="bottom_stroke center_bold12 right_stroke  tata" HeaderStyle-CssClass="form_top  gray right_stroke tata"
                            HeaderText="检测指标"></asp:BoundField>
                        <asp:BoundField DataField="ResultValue" ItemStyle-CssClass="box_fine12 tbtb" HeaderStyle-CssClass="form_top gray right_stroke"
                            HeaderText="本次结果"></asp:BoundField>
                       
                        <%--<asp:BoundField DataField="TargetValue" ItemStyle-CssClass="box_fine12 tbtb" HeaderStyle-CssClass="form_top  gray right_stroke"
                            HeaderText="年度目标"></asp:BoundField>--%>
                         <asp:TemplateField>
                            <HeaderTemplate>
                                年度目标
                            </HeaderTemplate>
                            <ItemTemplate>
                                <Chy:XTextBox ID="txtAim" onkeyup="clearNoNum(this)" runat="server" Text='<%# Eval("TargetValue") %>'></Chy:XTextBox>
                            </ItemTemplate>
                            <ItemStyle CssClass="box_fine12 tbtb" />
                            <HeaderStyle CssClass="form_top gray right_stroke"/>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                参考值
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("ReLower") %>'></asp:Label>
                                <asp:Label ID="Label3" runat="server" Text="~"></asp:Label>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("ReUpper") %>'></asp:Label>
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("Unit") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle CssClass="box_fine12 tbtb" />
                            <HeaderStyle CssClass="form_top gray right_stroke"/>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
           </td>
          
         </tr>
       </table>
       <div class="distance"></div>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td>
               <asp:DataList ID="dlist" Width="100%" runat="server" DataKeyField="FromItemID" OnItemDataBound="dlist_ItemDataBound">
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td align="left" valign="middle" class="dust_bold12 blue">
                                    <span><%=Chy.Web.Resource.GetString("HM5_0720")%>(<%# Eval("MajorName").ToString()%>)</span>
                                   
                                </td>
                            </tr>
                        </table>
                         <asp:Label runat="server" Visible="false" id="itemID" Text='<%# Eval("FromItemID").ToString()%>'></asp:Label>
                         <asp:Label runat="server" Visible="false" id="majorIndexID" Text='<%# Eval("ItemID").ToString()%>' ></asp:Label>
                         <asp:Label ID="Label1" Visible="false" runat="server" Text='<%# Eval("ReLower") %>'></asp:Label>
                                            
                        <asp:Label ID="Label2" Visible="false" runat="server" Text='<%# Eval("ReUpper") %>'></asp:Label>
                        <asp:Label ID="Label3" Visible="false" runat="server" Text='<%# Eval("Unit") %>'></asp:Label>
                        <asp:GridView ID="cmpItems" AutoGenerateColumns="false" CssClass="content_form" runat="server"
                            Width="100%">
                            <Columns>
                               <%-- <asp:BoundField DataField="CheckTime" ItemStyle-CssClass="center_fine12 right_stroke" HeaderStyle-CssClass="form_top gray right_stroke"
                                    HeaderText="体检日期"></asp:BoundField>--%>
                                <asp:TemplateField HeaderText='体检日期'>
                                   <ItemTemplate>
                                     <%# Convert.ToDateTime(Eval("CheckTime")).ToString("yyyy-MM-dd")%>
                                   </ItemTemplate>
                                    <ItemStyle CssClass="center_fine12 right_stroke tata" />
                                    <HeaderStyle CssClass="form_top gray right_stroke tata"/>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Doctor" ItemStyle-CssClass="center_fine12 right_stroke tata" HeaderStyle-CssClass="form_top  gray right_stroke tata"
                                    HeaderText="体检医生"></asp:BoundField>
                               <asp:BoundField DataField="Result" ItemStyle-CssClass="center_fine12 right_stroke tbtb" HeaderStyle-CssClass="form_top gray right_stroke"
                                    HeaderText="体检结果"></asp:BoundField>
                                <%--<asp:BoundField DataField="range" ItemStyle-CssClass="center_fine12 right_stroke" HeaderStyle-CssClass="form_top gray right_stroke"
                                    HeaderText="参考值"></asp:BoundField>--%>
                                <asp:TemplateField HeaderText='参考值'>
                                  <ItemTemplate>
                                    <%#(Eval("ReLower") == null || Eval("ReUpper") == null) ? "--" : Eval("ReLower") + "~" + Eval("ReUpper") + Eval("Unit")%>
                                 </ItemTemplate>
                                  <ItemStyle CssClass="center_fine12 right_stroke tbtb" />
                                  <HeaderStyle CssClass="form_top gray right_stroke"/>
                              </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <br />
                        <asp:Panel ID="SwfReportPanel" runat="server">
                          <asp:Chart ID="Chart1" runat="server" Height="400px" Width="780px" ImageLocation="~/hc/TempImages/ChartPic_#SEQ(300,3)" Palette="BrightPastel"
                                ImageType="Png" BorderlineDashStyle="Solid" BackSecondaryColor="White" BackGradientStyle="TopBottom" BorderWidth="2"
                                BackColor="#D3DFF0" BorderColor="26, 59, 105">
                                <Legends>
                                    <asp:Legend IsTextAutoFit="False" Name="Default" BackColor="Transparent" Font="Trebuchet MS, 8.25pt, style=Bold">
                                    </asp:Legend>
                                </Legends>
                                <BorderSkin SkinStyle="Emboss"></BorderSkin>
                                <Series>
                                </Series>
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1" BorderColor="64, 64, 64, 64" BorderDashStyle="Solid" BackSecondaryColor="White" BackColor="64, 165, 191, 228"
                                        ShadowColor="Transparent" BackGradientStyle="TopBottom">
                                        <Area3DStyle Rotation="10" Perspective="10" Inclination="15" IsRightAngleAxes="False" WallWidth="0" IsClustered="False">
                                        </Area3DStyle>
                                        <AxisY LineColor="64, 64, 64, 64">
                                            <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" />
                                            <MajorGrid LineColor="64, 64, 64, 64" />
                                        </AxisY>
                                        <AxisX LineColor="64, 64, 64, 64">
                                            <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" />
                                            <MajorGrid LineColor="64, 64, 64, 64" />
                                        </AxisX>
                                    </asp:ChartArea>
                                </ChartAreas>
                            </asp:Chart>
                        </asp:Panel>
                    </ItemTemplate>
                </asp:DataList>
            </td>
          </tr>
         
        </table>
      
       <div class="distance"></div>  
       <table width="100%" border="0" cellpadding="0" cellspacing="0" runat="server" id="tbAbnormalIndex">
         <tr>
           <td class="dust_bold12 blue"><%=Chy.Web.Resource.GetString("HM5_0721")%></td>
         </tr>
         <tr>
           <td align="left" valign="top">
           <asp:Repeater ID="rptAbnormalIndex" runat="server">
                <ItemTemplate>
                   <table width="100%" border="0" cellspacing="0" cellpadding="0" class="content_form">
                     <tr>
                       <td height="33" colspan="2" valign="middle" class="form_top dust_bold12 gray"><%# Eval("AnomalyName")%></td>
                     </tr>
                     <tr>
                       <td valign="middle" class="dust_bold12 right_stroke bottom_stroke"><%=Chy.Web.Resource.GetString("HM_0469")%></td>
                       <td valign="middle" class="text_fine12 gray bottom_stroke"><%# Eval("MedicalDesc")%> </td>
                     </tr>
                     <tr>
                       <td valign="middle" class="dust_bold12 right_stroke bottom_stroke"><%=Chy.Web.Resource.GetString("HM5_0722")%> </td>
                       <td valign="middle" class="text_fine12 gray bottom_stroke"><%# Eval("Result") %></td>
                     </tr>
                     <tr>
                       <td valign="middle" class="dust_bold12 right_stroke"><%=Chy.Web.Resource.GetString("HM5_0723")%></td>
                       <td valign="middle" class="snap_fine12"><%# Eval("Advice")%></td>
                     </tr>
                      <tr>

                     </tr>
                    </table>
                    </div><div class="distance"></div> 
                 </ItemTemplate>
              </asp:Repeater>
           </td>
         </tr>
       </table>
     </div>
   </div>
   <!--重要指标情况-->
   <div class="chunk" runat="server" id="WeightCenter" visible="false">
     <!--头部-->
     <div class="chunk_head">
       
       <div class="title_text"><%=Chy.Web.Resource.GetString("HM5_0744")%></div>
       
       <div style="clear:both"></div>
     </div>
     <!--头部结束-->
     <div class="chunk_matter">
     <div class="jiantoua_tishi">
    <div class="xingge_tishia"><img src="../../image/jiankang_42.gif" /></div>
    <div class="xingge_tishi_wenzi"><%=Chy.Web.Resource.GetString("HM5_0745")%><%=Chy.Web.Resource.GetString("Remp_Colon")%><span class="red" runat="server" id="allFat"></span></div>
   <div class="xingge_tishib"><img src="../../image/jiankang_46.gif" /></div>
   <div style="clear:both"></div>
  </div>
       <div class="distance"></div>
       <table width="70%" border="0" align="center" cellpadding="0" cellspacing="0"  class="jiantoua_text">
         <tr>
           <td align="center" valign="middle"><img src="../../image/jiankang_52.gif" width="29" height="44" runat="server" visible="false" id="weight1"/></td>
           <td align="center" valign="middle"><img src="../../image/jiankang_52.gif" width="29" height="44" runat="server" visible="false" id="weight2"/></td>
           <td align="center" valign="middle"><img src="../../image/jiankang_52.gif" width="29" height="44" runat="server" visible="false" id="weight3"/></td>
           <td align="center" valign="middle"><img src="../../image/jiankang_52.gif" width="29" height="44" runat="server" visible="false" id="weight4"/></td>
         </tr>
         <tr>
           <td align="center" valign="middle" bgcolor="#00c0e4" class="white"><%=Chy.Web.Resource.GetString("HM5_0736")%></td>
           <td width="24%" height="30" align="center" valign="middle" bgcolor="#5bd999" class="white"><%=Chy.Web.Resource.GetString("HM5_0737")%></td>
           <td width="24%" align="center" valign="middle" bgcolor="#eac14d" class="white"><%=Chy.Web.Resource.GetString("HM5_0738")%></td>
           <td width="24%" align="center" valign="middle" bgcolor="#e6567a" class="white"><%=Chy.Web.Resource.GetString("HM5_0739")%></td>
         </tr>
       </table>
       <div class="distance"></div>
        <div class="jiantoua_tishi">
    <div class="xingge_tishia"><img src="../../image/jiankang_42.gif" /></div>
    <div class="xingge_tishi_wenzi"><%=Chy.Web.Resource.GetString("HM5_0746")%><%=Chy.Web.Resource.GetString("Remp_Colon")%><span class="red"  runat="server" id="centerFat"></span> </div>
   <div class="xingge_tishib"><img src="../../image/jiankang_46.gif" /></div>
   <div style="clear:both"></div>
  </div>
       <div class="distance"></div>
       <table width="70%" border="0" align="center" cellpadding="0" cellspacing="0"  class="jiantoua_text">
         <tr>
           <td align="center" valign="middle"><img src="../../image/jiankang_52.gif" width="29" height="44" runat="server" visible="false" id="centerweight1"/></td>
           <td align="center" valign="middle"><img src="../../image/jiankang_52.gif" width="29" height="44" runat="server" visible="false"  id="centerweight2"/></td>
           <td align="center" valign="middle"><img src="../../image/jiankang_52.gif" width="29" height="44" runat="server" visible="false"  id="centerweight3"/></td>
         </tr>
         <tr>
           <td width="24%" height="30" align="center" valign="middle" bgcolor="#5bd999" class="white"><%=Chy.Web.Resource.GetString("HM5_0737")%></td>
           <td width="24%" align="center" valign="middle" bgcolor="#eac14d" class="white"><%=Chy.Web.Resource.GetString("HM5_0747")%></td>
           <td width="24%" align="center" valign="middle" bgcolor="#e6567a" class="white"><%=Chy.Web.Resource.GetString("HM5_0748")%></td>
         </tr>
       </table>
       <div class="string"></div>
       
       <table width="100%" border="0" cellpadding="0" cellspacing="0">
         <tr>
           <td class="dust_bold12 blue"><%=Chy.Web.Resource.GetString("HM5_0749")%><%=Chy.Web.Resource.GetString("Remp_Colon")%></td>
         </tr>
         <tr>
           <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0"  class="content_form">
             <tr class="form_top dust_bold12 gray">
               <td height="33" align="center"  class="right_stroke" ><%=Chy.Web.Resource.GetString("HM5_0750")%></td>
               <td align="center" class="right_stroke"><%=Chy.Web.Resource.GetString("HM5_0751")%></td>
               <td align="center"><%=Chy.Web.Resource.GetString("HM5_0752")%></td>
             </tr>
             <tr>
               <td valign="top" class="center_fine12 right_stroke"><%=Chy.Web.Resource.GetString("HM5_0806")%><br />
                 <%=Chy.Web.Resource.GetString("HM5_0807")%> <br />
                 <%=Chy.Web.Resource.GetString("HM_0399")%> <br />
                 <%=Chy.Web.Resource.GetString("HM5_0808")%> <br />
                 <%=Chy.Web.Resource.GetString("HM5_0809")%> <br />
                <%=Chy.Web.Resource.GetString("HM5_0810")%> </td>
               <td valign="top" class="center_fine12 right_stroke"><%=Chy.Web.Resource.GetString("HM_0391")%> <br />
                 <%=Chy.Web.Resource.GetString("HM_0389")%> <br />
                 <%=Chy.Web.Resource.GetString("HM5_0811")%> <br />
                 <%=Chy.Web.Resource.GetString("HM5_0812")%> <br />
                <%=Chy.Web.Resource.GetString("HM5_0813")%> </td>
               <td valign="top" class="center_fine12"><%=Chy.Web.Resource.GetString("HM5_0814")%><br />
                 <%=Chy.Web.Resource.GetString("HM5_0815")%><br />
                 <%=Chy.Web.Resource.GetString("HM5_0816")%><br />
                 <%=Chy.Web.Resource.GetString("HM5_0817")%><br />
                 <%=Chy.Web.Resource.GetString("HM5_0818")%><br />
                <%=Chy.Web.Resource.GetString("HM5_0819")%></td>
             </tr>
           </table></td>
         </tr>
       </table>
     </div>
   </div>
    <!--肥胖症评估结束-->
   <div class="chunk" runat="server" id="Metabolic">
         <!--头部-->
         <div class="chunk_head">
           
           <div class="title_text"><%=Chy.Web.Resource.GetString("HM5_0753")%></div>
           
           <div style="clear:both"></div>
         </div>
         <!--头部结束-->
         <div class="chunk_matter">
           <div class="jiantoua_tishi">
             <div class="xingge_tishia"><img src="../../image/jiankang_42.gif" /></div>
             <div class="xingge_tishi_wenzi"><%=Chy.Web.Resource.GetString("HM5_0754")%><%=Chy.Web.Resource.GetString("Remp_Colon")%><Chy:XDropDownList ID="MetabolicLevel" runat="server" class="red" AutoPostBack="false"></Chy:XDropDownList></div>
             <div class="xingge_tishib"><img src="../../image/jiankang_46.gif" /></div>
             <div style="clear:both"></div>
           </div>
           <div class="distance"></div>
           <table width="100%" border="0" cellpadding="0" cellspacing="0">
             <tr>
               <td class="dust_bold12 blue"><%=Chy.Web.Resource.GetString("HM5_0755")%><%=Chy.Web.Resource.GetString("Remp_Colon")%></td>
             </tr>
             <tr>
               <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0"  class="content_form">
                 <tr class="form_top dust_bold12 gray">
                   <td align="center"  class="right_stroke tata" ><%=Chy.Web.Resource.GetString("HM5_0756")%> </td>
                   <td align="center" class="right_stroke"><%=Chy.Web.Resource.GetString("HM_0468")%></td>
                   <td height="33" align="center" class="right_stroke"><%=Chy.Web.Resource.GetString("HM_0467")%></td>
                   <td align="center"> <%=Chy.Web.Resource.GetString("HM5_0757")%></td>
                 </tr>
                 <tr class="">
                   <td class="box_fine12 tata"><%=Chy.Web.Resource.GetString("HM5_0820")%></td>
                   <td class="box_fine12 tbtb" runat="server" id="MetabolicWIndex1">----</td>
                   <td class="box_fine12 tbtb"  runat="server" id="MetabolicWIndex2">----</td>
                   <td class="box_bottom tata">&lt;24 Kg/(m*m) </td>
                 </tr>
                 <tr>
                   <td class="box_fine12 tata"><%=Chy.Web.Resource.GetString("HM5_0821")%> </td>
                   <td class="box_fine12 tbtb"  runat="server" id="MetabolicSugar1">----</td>
                   <td class="box_fine12 tbtb"  runat="server" id="MetabolicSugar2">----</td>
                   <td class="box_bottom tata">&lt;5.6mmol/L </td>
                 </tr>
                 <tr>
                   <td class="box_fine12 tata"><%=Chy.Web.Resource.GetString("HM_0347")%> </td>
                   <td class="box_fine12 tbtb" runat="server" id="MetabolicPress1">----</td>
                   <td class="box_fine12 tbtb" runat="server" id="MetabolicPress2">----</td>
                   <td class="box_bottom tata">&lt;140/90 </td>
                 </tr>
                 <tr>
                   <td class="box_fine12 tata"><%=Chy.Web.Resource.GetString("HM5_0822")%></td>
                   <td class="box_fine12 tbtb" runat="server" id="MetabolicTG1">----</td>
                   <td class="box_fine12 tbtb" runat="server" id="MetabolicTG2">----</td>
                   <td class="box_bottom tata">&lt;1．70mmol/L </td>
                 </tr>
                 <tr>
                   <td class="center_fine12 right_stroke tata"><%=Chy.Web.Resource.GetString("HM5_0823")%></td>
                   <td class="center_fine12 right_stroke tbtb" runat="server" id="MetabolicHDLC1">----</td>
                   <td  class="center_fine12 right_stroke tbtb" runat="server" id="MetabolicHDLC2">----</td>
                   <td class="center_fine12 tata">≥1.04mmol/L </td>
                 </tr>
               </table></td>
             </tr>
           </table>
           <div class="distance"></div>
           <table width="100%" border="0" cellpadding="0" cellspacing="0">
             <tr>
               <td colspan="2" class="dust_bold12 blue"><%=Chy.Web.Resource.GetString("HM5_0824")%><%=Chy.Web.Resource.GetString("Remp_Colon")%></td>
             </tr>
             <tr>
               <td width="66%" align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                 <tr>
                   <td height="32" valign="bottom" class="dust_bold12 gray"><%=Chy.Web.Resource.GetString("HM5_0825")%></td>
                 </tr>
                 <tr>
                   <td valign="top" class="range_fine12"><%=Chy.Web.Resource.GetString("HM5_0826")%></td>
                 </tr>
                 <tr>
                   <td class="dust_bold12 gray"><%=Chy.Web.Resource.GetString("HM5_0827")%></td>
                 </tr>
                 <tr>
                   <td valign="top" class="range_fine12"><%=Chy.Web.Resource.GetString("HM5_0828")%></td>
                 </tr>
                 <tr>
                   <td class="dust_bold12 gray"><%=Chy.Web.Resource.GetString("HM5_0829")%></td>
                 </tr>
                 <tr>
                   <td valign="top" class="range_fine12"><%=Chy.Web.Resource.GetString("HM5_0830")%></td>
                 </tr>
               </table></td>
               <td width="34%" align="center" valign="top"><img src="../../image/jiankang_56.png" width="220" height="220" /></td>
             </tr>
           </table>
         </div>
       </div>
        <div class="distance"></div>
       <div style="text-align:center">
        <Chy:XButton ID="btnSave" runat="server" Text='保存' OnClick="btnSave_Click" ValidationGroup="EditVal"/>
        &nbsp;&nbsp;<input type="hidden" runat="server" id="hidenID" />
<%--        <Chy:XButton ID="btnAudit" runat="server" Text='审核' OnClick="btnAudit_Click" OnClientClick="return comfirmAudit();"/>
        &nbsp;&nbsp;--%>
       <Chy:XButton ID="btnCancel" runat="server" ValidationGroup="EditVal" Text="返回" CssClass="button" OnClientClick="window.close();" />
     </div>
      <!--代谢综合症评估结束-->
       <input runat="server" id="hideCheckID" type="hidden" />
       <input runat="server" id="hideCheckTime" type="hidden" />
       <input runat="server" id="hideExamineTime" type="hidden" />
        </div>
    </div>
    </div>
    </form>
  </body>
 
</html>
<script language="javascript" type="text/javascript" src="../../Scripts/jquery-1.4.1.min.js"></script>
<script language="javascript" type="text/javascript">
    //审核提示
    function comfirmAudit() {
        if (confirm('<%=Chy.Web.Resource.GetString("HM_ConfirmAudit")%>')) {
            //if (confirmMsg(name, '<%=Chy.Web.Resource.GetString("HM_ConfirmAudit")%>', '<%=Chy.Web.Resource.GetString("HM_AlertTilte")%>', 400, 200)) {
            //$("#q_Msgbox").removeClass("hide").addClass("MsgboxShow");
            return true;
        }
        else {
            return false;
        }
    }

    function clearNoNum(obj) {
        obj.value = obj.value.replace(/[^\d.]/g, "");  //清除“数字”和“.”以外的字符
        obj.value = obj.value.replace(/^\./g, "");  //验证第一个字符是数字而不是.
        obj.value = obj.value.replace(/\.{2,}/g, "."); //只保留第一个. 清除多余的
        obj.value = obj.value.replace(".", "$#$").replace(/\./g, "").replace("$#$", ".");
        obj.value = obj.value.replace(/^(\-)*(\d+)\.(\d\d).*$/, '$1$2.$3'); //只能输入两个小数
    }

</script>
