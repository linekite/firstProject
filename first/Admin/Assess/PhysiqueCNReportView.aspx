<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PhysiqueCNReportView.aspx.cs" Inherits="Chm.Web.Admin.Assess.PhysiqueCNReportView" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="../../Styles/physiqueRPT.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="top_bj">
 <div class="top_name namea">中医体质辨识报告</div>
 </div>
 <div class="persona">
   <table width="830" border="0" align="center" cellpadding="0" cellspacing="0" class="dust_bold12 blue">
     <tr>
       <td height="29" valign="middle" class="rightat">姓名：</td>
       <td valign="middle" class="leftat"><asp:Literal ID="userName" runat="server" Text="郭建华"></asp:Literal></td>
       <td valign="middle" class="rightat">性别：</td>
       <td valign="middle"  class="leftat"><asp:Literal ID="userSex" runat="server" Text="男"></asp:Literal></td>
       <td valign="middle" class="rightat">年龄：</td>
       <td valign="middle"  class="leftat"><asp:Literal ID="userAge" runat="server" Text="45岁"></asp:Literal><%=Chy.Web.Resource.GetString("HM_0368")%></td>
       <td valign="middle" class="rightat">评估时间：</td>
       <td valign="middle"  class="leftat"><asp:Literal ID="examTime" runat="server" Text="2011-3-23"></asp:Literal></td>
      <%-- <td valign="middle" class="rightat"> 编号：</td>
       <td valign="middle"  class="leftat"><asp:Literal ID="examNo" runat="server" Text="HM20110323102008595"></asp:Literal></td>--%>
     </tr>
   </table>
</div>
 <div class="distance"></div>
 <div id="subject">
   <div class="chunk">
     <!--头部-->
     <div class="chunk_head">
       
       <div class="title_text">中医体质测试结果</div>
       
       <div style="clear:both"></div>
     </div>
     <!--头部结束-->
     <div class="chunk_matter">
       <div class="distance"></div>
       <div class="jiantoua_tishi">
         <div class="xingge_tishia"><img src="../../image/jiankang_42.gif" /></div>
         <div class="xingge_tishi_wenzi">您的体质<span runat="server" id="irregularStatus1">是：</span><span class="red"  runat="server" id="irregular1">气虚质</span></div>
         <div class="xingge_tishib"><img src="../../image/jiankang_46.gif" /></div>
         <div style="clear:both"></div>
       </div>
       <div class="distance"></div>
       <div class="distance"></div>
       <!--偏颇体质-->
       <table width="100%" border="0" cellspacing="0" cellpadding="0" class="content_form" runat="server" id="tbIrr1"  visible="false">
         <tr>
           <td height="33" colspan="2" valign="middle" class="form_top dust_bold12 gray"><span  runat="server" id="irregularTitle1">气虚质</span></td>
         </tr>
         <tr>
           <td valign="middle" class="dust_bold12 right_stroke bottom_stroke">特征</td>
           <td valign="middle" class="box_bottom_one"><span  runat="server" id="irrFeature1">呼吸浅短，声音低微，慵懒少言，或精神疲惫，四肢倦怠,或腰腿酸软，头昏心悸，心慌气短、心神不宁，动则汗出，食欲减少，脉沉缓或迟而无力，舌质淡，苔薄白等。</span></td>
         </tr>
         <tr>
           <td valign="middle" class="dust_bold12 right_stroke bottom_stroke">心理</td>
           <td valign="middle" class="box_bottom_one"><span  runat="server" id="irrMind1">性格内向或偏软弱，情绪不稳定，胆小，不喜欢冒险。</span></td>
         </tr>
         <tr>
           <td valign="middle" class="dust_bold12 right_stroke bottom_stroke">机理</td>
           <td valign="middle" class="box_bottom_one"><span  runat="server" id="irrMechanism1">即元气不足，气虚质的成因和先天禀赋不足、后天失养等有关，如孕育时父母体弱、早产、人工喂养不当、偏食、厌食，或因病后气亏、年老气弱、劳倦内伤或重病、久病后元气不足等。这类人群脏腑组织功能低下，抗病力减弱，在寒冷、多风、暑热季节，容易患感冒等疾病。没有工作的人、学生和长期从事脑力劳动的人，久坐或久卧，也容易导致气虚。<br />
             气虚体质包括肺气虚、心气虚、脾气虚和肾气虚等。　 <br />
             肺气虚。肺主气，司呼吸，外合皮毛，通调水道。肺气虚，则其主宣降、司呼吸、调节水液代谢、抵御外邪的作用就会减弱，出现短气自汗，声音低怯，咳嗽气喘，胸闷，易于感冒，甚至水肿，小便不利等病证。 <br />
             心气虚。心主血脉，藏神明。心气亏虚，不能鼓动血脉，亦不能养神，故见心悸，气短，多汗，劳则加重，神疲体倦，舌淡，脉虚无力。 <br />
             脾气虚。脾居中焦，主运化，司升清，统血行。脾气虚弱，不能运化水谷精微，气血生化乏源，症见饮食减少，食后胃脘不舒，倦怠乏力，形体消瘦，大便溏薄，面色萎黄，舌淡苔薄，脉弱。 <br />
           肾气虚。肾气亏虚，失于荣养，见神疲乏力，眩晕健忘，腰膝酸软乏力，小便频数而清，白带清稀，舌质淡，脉弱。肾不纳气，则呼吸浅促，呼多吸少。</span></td>
         </tr>
         <tr>
           <td valign="middle" class="dust_bold12 right_stroke bottom_stroke">发病倾向</td>
           <td valign="middle" class="box_bottom_one"><span  runat="server" id="irrTrend1">体质虚弱，易患感冒；或发病后因抗病力弱难以痊愈；易患内脏下垂、眼睑或肢体浮肿、黄褐斑等。
             <br />
             环境适应能力：寒热耐受力差，尤其不耐风寒，不耐劳累。</span></td>
         </tr>
         <tr>
           <td valign="middle" class="dust_bold12 right_stroke">养生</td>
           <td valign="middle"  class="snap_fine12"><table width="100%" border="0" cellspacing="0" cellpadding="0">
             <tr>
               <td  class="dust_bold12 gray">（1）起居调摄</td>
             </tr>
             <tr>
               <td class="range_fine12"><span  runat="server" id="irrSitg1">气虚质者平时适宜食用具有益气健脾作用的食物，少食具有耗气作用的食物。夏季应适当午睡，平时要注意保暖，不要过于劳作。平时可自行按摩足三里穴，忌用猛力和做长久憋气的运动。</span></td>
             </tr>
             <tr>
               <td class="dust_bold12 gray">（2）食物补气</td>
             </tr>
             <tr>
               <td class="range_fine12"><span  runat="server" id="irrFood1">常用于补气的食物有白萝卜、红薯、土豆、山药、洋芋、香菇、红枣、鸡肉、牛肉、猪肚、牛肚、羊肚、泥鳅、鲢鱼、青鱼、墨鱼、粳米、蜂蜜、扁豆等食物。</span></td>
             </tr>
             <tr>
               <td class="dust_bold12 gray">（3）药物保健</td>
             </tr>
             <tr>
               <td class="range_fine12"><span  runat="server" id="irrMaterial1">山药：为补气食品，凡气虚体质或久病气虚者，宜常食之，最为有益。山药可以补肺气，补脾气，补肾气。
燕窝：性平，味甘，有益气补虚、养阴补肺的作用，对气虚又兼肺虚者尤宜。
 
人参：性平、味甘、微苦，微温，有大补元气，复脉固脱，补脾益肺，生津止渴，安神益智的作用，可用于一切气血津液不足之证。但实证、热证而正气不虚者忌服，且常用或多用容易上火。。反藜芦、畏五灵脂、恶皂荚，应忌同用。
黄芪：性味甘，微温。具有补中益气，固表止汗，升阳举陷之功效。适应于所有气虚者，可经常使用。
</span></td>
             </tr>
             <tr>
               <td class="dust_bold12 gray">（4）药膳指导</td>
             </tr>
             <tr >
               <td class="range_fine12"><span  runat="server" id="irrDiet1">黄芪童子鸡：童子鸡一只，生黄芪9克用纱布袋包扎好，置于锅内。在锅中加葱、姜及适量水煮汤，待童子鸡煮熟后，拿出黄芪包。加入盐、黄酒调味，即可食用。
山药粥：山药30克，粳米100克。山药削皮洗净切块，粳米淘洗干净，二者一起水锅煮熟即可食用，每天晚饭时食用。可以补中益气，益肺固精。
人参红枣粥：人参6克，红枣6枚，粳米80克。红枣洗净去核，人参用温水泡10分钟，粳米淘洗干净。将上述三者及泡人参的温水一同入锅煮熟即可。每天午饭或晚饭后食用。补中益气，强身健体。
黄芪粳米粥：生黄芪50克，粳米100克，碎陈皮1克。将生黄芪用水煎两次，取两次煎汁水。粳米淘洗干净。将黄芪药汁和粳米同煮，熟后加入陈皮末、红糖，煮沸即可。每周三次，健脾养胃，补益元气。
十宝粥：芡实、山药、茯苓、莲肉、薏米、白扁豆、党参、白术各6克，大米100克。做法：大米淘洗干净。将上述八位中药加水共煮半小时，捞出药渣，放入大米同煮，熟后加入少许白糖即可。每周两次。健脾益气，温阳利湿，适用于气虚体质者和痰湿体质者。
猪肚汤：大葱1棵，生姜适量，猪肚一副。做法：把猪肚清洗干净，塞入切碎的生姜，将猪肚放入锅内，加入清水，用小火煮至猪肚熟烂。熄火后加入葱花，调味料烹调入味即可。喝猪肚汤，不吃姜，每周吃两副猪肚。可营养补虚，适合于体质虚弱者，但热症及感染性疾病患者不适合。
牛奶羊肉汤：羊肉200克，牛奶200克，山药100克。做法：羊肉洗尽切块，山药洗尽切片，生姜洗尽切碎。将羊肉和生姜同入砂锅，小火炖两三小时，直至肉烂，然后加入山药同煮，直至山药熟烂，最后加入牛奶，煮沸即可。吃肉喝汤，每周一次。可温中补虚，益精补气。
</span></td>
             </tr>
           </table></td>
         </tr>
       </table>
       <!--平和体质-->
       <table width="100%" border="0" cellspacing="0" cellpadding="0" class="content_form"  runat="server" id="tbPlacid1"  visible="false">
         <tr>
           <td height="33" colspan="2" valign="middle" class="form_top dust_bold12 gray"><span runat="server" id="placidTitle1">平和质</span></td>
         </tr>
         <tr>
           <td valign="middle" class="dust_bold12 right_stroke bottom_stroke">特征</td>
           <td valign="middle" class="box_bottom_one"><span  runat="server" id="placidFeature1">体形匀称，面色红润，精力充沛，胃口好，大小便正常，适应能力强，患病少。</span></td>
         </tr>
         <tr>
           <td valign="middle" class="dust_bold12 right_stroke bottom_stroke">心理</td>
           <td valign="middle" class="box_bottom_one"><span runat="server" id="placidMind1">性格随和开朗。</span></td>
         </tr>
         <tr>
           <td valign="middle" class="dust_bold12 right_stroke bottom_stroke">机理</td>
           <td valign="middle" class="box_bottom_one"><span runat="server" id="placidMechanism1">该体质阴阳调和，身体比较健康和谐。</span></td>
         </tr>
         <tr>
           <td valign="middle" class="dust_bold12 right_stroke bottom_stroke">发病倾向</td>
           <td valign="middle" class="box_bottom_one"><span runat="server" id="placidTrend1">属正常体质，平素患病较少。</span></td>
         </tr>
         <tr>
           <td valign="middle" class="dust_bold12 right_stroke">养生</td>
           <td valign="middle"  class="snap_fine12"><span  runat="server" id="placidCare1">平和体质是一种健康体质，重在平时的维护。比如，在饮食上注意节制；粗细粮食要合理搭配。起居应有规律，劳逸结合，保持充足的睡眠时间。可根据年龄和性别，参加适度的运动，同时要保持乐观开朗的情绪，积极进取，节制偏激的情感，及时消除生活中不利的事件对情绪的负面影响。</span></td>
         </tr>
       </table>
     </div>
   </div>
    <!--结束1-->
   <div class="distance"></div>
   <div class="chunk" runat="server" id="divIrr2"  visible="false">
     <!--头部-->
     <div class="chunk_head">
       
       <div class="title_text">中医体质测试结果</div>
       
       <div style="clear:both"></div>
     </div>
     <!--头部结束-->
     <div class="chunk_matter">
       <div class="distance"></div>
       <div class="jiantoua_tishi">
         <div class="xingge_tishia"><img src="../../image/jiankang_42.gif" /></div>
         <div class="xingge_tishi_wenzi">您的体质<span runat="server" id="irregularStatus2">是：</span><span class="red"  runat="server" id="irregular2">气虚质</span></div>
         <div class="xingge_tishib"><img src="../../image/jiankang_46.gif" /></div>
         <div style="clear:both"></div>
       </div>
       <div class="distance"></div>
       <div class="distance"></div>
         <!--偏颇体质-->
       <table width="100%" border="0" cellspacing="0" cellpadding="0" class="content_form" runat="server" id="tbIrr2"  visible="false">
         <tr>
           <td height="33" colspan="2" valign="middle" class="form_top dust_bold12 gray"><span  runat="server" id="irregularTitle2">气虚质</span></td>
         </tr>
         <tr>
           <td valign="middle" class="dust_bold12 right_stroke bottom_stroke">特征</td>
           <td valign="middle" class="box_bottom_one"><span  runat="server" id="irrFeature2">呼吸浅短，声音低微，慵懒少言，或精神疲惫，四肢倦怠,或腰腿酸软，头昏心悸，心慌气短、心神不宁，动则汗出，食欲减少，脉沉缓或迟而无力，舌质淡，苔薄白等。</span></td>
         </tr>
         <tr>
           <td valign="middle" class="dust_bold12 right_stroke bottom_stroke">心理</td>
           <td valign="middle" class="box_bottom_one"><span  runat="server" id="irrMind2">性格内向或偏软弱，情绪不稳定，胆小，不喜欢冒险。</span></td>
         </tr>
         <tr>
           <td valign="middle" class="dust_bold12 right_stroke bottom_stroke">机理</td>
           <td valign="middle" class="box_bottom_one"><span  runat="server" id="irrMechanism2">即元气不足，气虚质的成因和先天禀赋不足、后天失养等有关，如孕育时父母体弱、早产、人工喂养不当、偏食、厌食，或因病后气亏、年老气弱、劳倦内伤或重病、久病后元气不足等。这类人群脏腑组织功能低下，抗病力减弱，在寒冷、多风、暑热季节，容易患感冒等疾病。没有工作的人、学生和长期从事脑力劳动的人，久坐或久卧，也容易导致气虚。<br />
             气虚体质包括肺气虚、心气虚、脾气虚和肾气虚等。　 <br />
             肺气虚。肺主气，司呼吸，外合皮毛，通调水道。肺气虚，则其主宣降、司呼吸、调节水液代谢、抵御外邪的作用就会减弱，出现短气自汗，声音低怯，咳嗽气喘，胸闷，易于感冒，甚至水肿，小便不利等病证。 <br />
             心气虚。心主血脉，藏神明。心气亏虚，不能鼓动血脉，亦不能养神，故见心悸，气短，多汗，劳则加重，神疲体倦，舌淡，脉虚无力。 <br />
             脾气虚。脾居中焦，主运化，司升清，统血行。脾气虚弱，不能运化水谷精微，气血生化乏源，症见饮食减少，食后胃脘不舒，倦怠乏力，形体消瘦，大便溏薄，面色萎黄，舌淡苔薄，脉弱。 <br />
           肾气虚。肾气亏虚，失于荣养，见神疲乏力，眩晕健忘，腰膝酸软乏力，小便频数而清，白带清稀，舌质淡，脉弱。肾不纳气，则呼吸浅促，呼多吸少。</span></td>
         </tr>
         <tr>
           <td valign="middle" class="dust_bold12 right_stroke bottom_stroke">发病倾向</td>
           <td valign="middle" class="box_bottom_one"><span  runat="server" id="irrTrend2">体质虚弱，易患感冒；或发病后因抗病力弱难以痊愈；易患内脏下垂、眼睑或肢体浮肿、黄褐斑等。
             <br />
             环境适应能力：寒热耐受力差，尤其不耐风寒，不耐劳累。</span></td>
         </tr>
         <tr>
           <td valign="middle" class="dust_bold12 right_stroke">养生</td>
           <td valign="middle"  class="snap_fine12"><table width="100%" border="0" cellspacing="0" cellpadding="0">
             <tr>
               <td  class="dust_bold12 gray">（1）起居调摄</td>
             </tr>
             <tr>
               <td class="range_fine12"><span  runat="server" id="irrSitg2">气虚质者平时适宜食用具有益气健脾作用的食物，少食具有耗气作用的食物。夏季应适当午睡，平时要注意保暖，不要过于劳作。平时可自行按摩足三里穴，忌用猛力和做长久憋气的运动。</span></td>
             </tr>
             <tr>
               <td class="dust_bold12 gray">（2）食物补气</td>
             </tr>
             <tr>
               <td class="range_fine12"><span  runat="server" id="irrFood2">常用于补气的食物有白萝卜、红薯、土豆、山药、洋芋、香菇、红枣、鸡肉、牛肉、猪肚、牛肚、羊肚、泥鳅、鲢鱼、青鱼、墨鱼、粳米、蜂蜜、扁豆等食物。</span></td>
             </tr>
             <tr>
               <td class="dust_bold12 gray">（3）药物保健</td>
             </tr>
             <tr>
               <td class="range_fine12"><span  runat="server" id="irrMaterial2">山药：为补气食品，凡气虚体质或久病气虚者，宜常食之，最为有益。山药可以补肺气，补脾气，补肾气。
燕窝：性平，味甘，有益气补虚、养阴补肺的作用，对气虚又兼肺虚者尤宜。
 
人参：性平、味甘、微苦，微温，有大补元气，复脉固脱，补脾益肺，生津止渴，安神益智的作用，可用于一切气血津液不足之证。但实证、热证而正气不虚者忌服，且常用或多用容易上火。。反藜芦、畏五灵脂、恶皂荚，应忌同用。
黄芪：性味甘，微温。具有补中益气，固表止汗，升阳举陷之功效。适应于所有气虚者，可经常使用。
</span></td>
             </tr>
             <tr>
               <td class="dust_bold12 gray">（4）药膳指导</td>
             </tr>
             <tr >
               <td class="range_fine12"><span  runat="server" id="irrDiet2">黄芪童子鸡：童子鸡一只，生黄芪9克用纱布袋包扎好，置于锅内。在锅中加葱、姜及适量水煮汤，待童子鸡煮熟后，拿出黄芪包。加入盐、黄酒调味，即可食用。
山药粥：山药30克，粳米100克。山药削皮洗净切块，粳米淘洗干净，二者一起水锅煮熟即可食用，每天晚饭时食用。可以补中益气，益肺固精。
人参红枣粥：人参6克，红枣6枚，粳米80克。红枣洗净去核，人参用温水泡10分钟，粳米淘洗干净。将上述三者及泡人参的温水一同入锅煮熟即可。每天午饭或晚饭后食用。补中益气，强身健体。
黄芪粳米粥：生黄芪50克，粳米100克，碎陈皮1克。将生黄芪用水煎两次，取两次煎汁水。粳米淘洗干净。将黄芪药汁和粳米同煮，熟后加入陈皮末、红糖，煮沸即可。每周三次，健脾养胃，补益元气。
十宝粥：芡实、山药、茯苓、莲肉、薏米、白扁豆、党参、白术各6克，大米100克。做法：大米淘洗干净。将上述八位中药加水共煮半小时，捞出药渣，放入大米同煮，熟后加入少许白糖即可。每周两次。健脾益气，温阳利湿，适用于气虚体质者和痰湿体质者。
猪肚汤：大葱1棵，生姜适量，猪肚一副。做法：把猪肚清洗干净，塞入切碎的生姜，将猪肚放入锅内，加入清水，用小火煮至猪肚熟烂。熄火后加入葱花，调味料烹调入味即可。喝猪肚汤，不吃姜，每周吃两副猪肚。可营养补虚，适合于体质虚弱者，但热症及感染性疾病患者不适合。
牛奶羊肉汤：羊肉200克，牛奶200克，山药100克。做法：羊肉洗尽切块，山药洗尽切片，生姜洗尽切碎。将羊肉和生姜同入砂锅，小火炖两三小时，直至肉烂，然后加入山药同煮，直至山药熟烂，最后加入牛奶，煮沸即可。吃肉喝汤，每周一次。可温中补虚，益精补气。
</span></td>
             </tr>
           </table></td>
         </tr>
       </table>
       <!--平和体质-->
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="content_form" runat="server" id="tbPlacid2" visible="false">
         <tr>
           <td height="33" colspan="2" valign="middle" class="form_top dust_bold12 gray"><span runat="server" id="placidTitle2">平和质</span></td>
         </tr>
         <tr>
           <td valign="middle" class="dust_bold12 right_stroke bottom_stroke">特征</td>
           <td valign="middle" class="box_bottom_one"><span  runat="server" id="placidFeature2">体形匀称，面色红润，精力充沛，胃口好，大小便正常，适应能力强，患病少。</span></td>
         </tr>
         <tr>
           <td valign="middle" class="dust_bold12 right_stroke bottom_stroke">心理</td>
           <td valign="middle" class="box_bottom_one"><span runat="server" id="placidMind2">性格随和开朗。</span></td>
         </tr>
         <tr>
           <td valign="middle" class="dust_bold12 right_stroke bottom_stroke">机理</td>
           <td valign="middle" class="box_bottom_one"><span runat="server" id="placidMechanism2">该体质阴阳调和，身体比较健康和谐。</span></td>
         </tr>
         <tr>
           <td valign="middle" class="dust_bold12 right_stroke bottom_stroke">发病倾向</td>
           <td valign="middle" class="box_bottom_one"><span runat="server" id="placidTrend2">属正常体质，平素患病较少。</span></td>
         </tr>
         <tr>
           <td valign="middle" class="dust_bold12 right_stroke">养生</td>
           <td valign="middle"  class="snap_fine12"><span  runat="server" id="placidCare2">平和体质是一种健康体质，重在平时的维护。比如，在饮食上注意节制；粗细粮食要合理搭配。起居应有规律，劳逸结合，保持充足的睡眠时间。可根据年龄和性别，参加适度的运动，同时要保持乐观开朗的情绪，积极进取，节制偏激的情感，及时消除生活中不利的事件对情绪的负面影响。</span></td>
         </tr>
       </table>
     </div>
   </div>
    <div class="distance"></div>
    <div style="text-align:center">
 <%--                <a class="button" id="btnExport" href="javascript:void(0);" 
                 style="text-decoration:none; vertical-align:middle; font-family:Arial,Helvetica,sans-serif,宋体;color:black; font-size:small" runat="server">
                  <%=Chy.Web.Resource.GetString("HM5_0988")%>
                </a> 
                &nbsp;&nbsp;&nbsp;    --%>                       
                  <Chy:XButton ID="btnAudit" runat="server"  CssClass="button" onclick="btnAudit_Click"/>     
       <Chy:XButton ID="btnCancel" runat="server"  ValidationGroup="EditVal" Text="返回" CssClass="button" OnClientClick="window.close();" /><input runat="server" id="hideExamineTime" type="hidden" />
     </div>
</div>
 </form>
</body>
</html>


