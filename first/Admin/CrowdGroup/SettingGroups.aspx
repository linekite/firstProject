<%@ Page Language="C#" MasterPageFile="~/MainContent.Master" AutoEventWireup="true"
    CodeBehind="SettingGroups.aspx.cs" Inherits="Chm.Web.Admin.CrowdGroup.SettingGroups" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="Expires" content="0">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Pragma" content="no-cache">
    <link href="../../Styles/Common.css" rel="stylesheet" type="text/css" />
    <link href="../../zTree-3.0/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        html { overflow-x:hidden;overflow-y:auto; }
        .addgroup
        {
            height:20px;
            margin: 5px 0 5px 0; 
            cursor: pointer;
            padding-left:20px;
            padding-right:10px;
        }
        
        .toptitle
        {
            font-size:12px; font-weight:bold; line-height:31px; text-indent:12px;
	        background: url(/hc/Images/fz_bt.jpg) top repeat-x; margin:0;
        }
        
         a:hover {color:red;}
         .ztree li button.add {margin-left:2px; margin-right: -1px; background-position:-112px 0; vertical-align:top; *vertical-align:middle}
    </style>
     <script src="../../zTree-3.0/js/jquery.ztree.all-3.0.js" type="text/javascript"></script>
    <script src="../../zTree-3.0/xys.crowgroup.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainlaceHolder" runat="server">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="main_tab">
            <tr>
                <td width="300px" valign="top">
                    <div style="width: 285px; height: 100%; float: left; background-color: #fff; border: #cecece 1px solid;
                        margin: 5px 0px 0 5px">
                        <div class="toptitle">
                            关注人群
                        </div>
                        <div class="searchPanel" style="width:280px; margin: 5px 2px 2px 2px; padding: 10px 10px 10px 10px;
                            position: relative; text-align: right;">
                            <input type="button" class="button" value="设置关注" onclick="setcrgroup(0)" onmouseover="this.className='hoverbutton'"
                                onmouseout="this.className='button'" />
                        </div>
                        <div style="width: 285px; height: 350px; overflow: auto;">
                            <ul id="treeDemo" class="ztree" style="height: 350px;">
                            </ul>
                        </div>
                    </div>
            </td>
            <td valign="top">
                <div id="showgrouplist" style="width: 99%; height: 100%; float: right; background-color: #fff;
                    border: #cecece 1px solid; margin: 5px 5px 0 0px">
                    <div class="toptitle">
                        分组人员
                    </div>
                    <div class="searchPanel" style="margin: 5px; padding: 10px 10px 10px 10px;">
                        <div style="text-align: left; font-weight: bold; font-size: 15px; float: left;">
                            姓名：<input type="text" name="txtsearchname" id="txtsearchname" /><input type="button"
                                name="btnSearch" class="button" value="查询" onmouseover="this.className='hoverbutton'"
                                onmouseout="this.className='button'" onclick="btnsearchbyname()" /></div>
                        <div style="text-align: right;">
                            <input type="button" name="btnSearch" class="button" value="刷新人员列表" onmouseover="this.className='hoverbutton'"
                                onmouseout="this.className='button'" onclick="refhuman()" />
                            <input type="button" name="btnSearch" class="button" value="保健计划制定" onmouseover="this.className='hoverbutton'"
                                onmouseout="this.className='button'" onclick="addnewplan()" />
                        </div>
                    </div>
                    <div style="margin: 5px; height: 100%">
                        <div id="showpart" style="width: 100%;">
                        </div>
                    </div>
                </div>
                <div id="showcreategroup" style="width: 99%; height: 100%; float: right; background-color: #fff;
                    border: #cecece 1px solid; margin: 5px 5px 0 0px; display: none;">
                    <div class="toptitle">
                        设置关注人员
                    </div>
                    <div class="searchPanel" style="margin: 5px; padding: 10px 10px 10px 10px;">
                        分组年份:
                        <select name="ddlType" id="ddlyear" class="secltwidth" style="width: 120px;">
                        </select>&nbsp;
                    </div>
                    <div style="margin: 5px; height: 350px; overflow: auto;">
                        <ul id="group" class="ztree" style="height: 260px;">
                        </ul>
                    </div>
                    <div style="text-align: center; padding: 10px 0 10px 0">
                        <input type="button" class="button" value="保  存" onclick="addgrouptodb()" />&nbsp;&nbsp;<input
                            type="button" class="button" value="取  消" onclick="setcrgroup(1)" /></div>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
