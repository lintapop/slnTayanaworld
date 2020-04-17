﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="prjTayanaworld.Front_End.index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>TtayanaWorld (DEMO)</title>
    <script type="text/javascript" src="Scripts/jquery.min.js"></script>
    <script type="text/javascript" src="Scripts/jquery.cycle.all.2.74.js"></script>
    <script type="text/javascript">


        $(function () {

            // 先取得 #abgne-block-20110111 , 必要參數及輪播間隔
            var $block = $('#abgne-block-20110111'),
                timrt, speed = 4000;


            // 幫 #abgne-block-20110111 .title ul li 加上 hover() 事件
            var $li = $('.title ul li', $block).hover(function () {
                // 當滑鼠移上時加上 .over 樣式
                $(this).addClass('over').siblings('.over').removeClass('over');
            }, function () {
                // 當滑鼠移出時移除 .over 樣式
                $(this).removeClass('over');
            }).click(function () {
                // 當滑鼠點擊時, 顯示相對應的 div.info
                // 並加上 .on 樣式

                $(this).addClass('on').siblings('.on').removeClass('on');
                var thisLi = $('#abgne-block-20110111 .bd .banner ul:eq(0)').children().eq($(this).index());
                $('#abgne-block-20110111 .bd .banner ul:eq(0)').children().hide().eq($(this).index()).fadeIn(1000);
                if (thisLi.children('input[type=hidden]').val() == 1) {
                    thisLi.children('.new').show();
                }

            });

            // 幫 $block 加上 hover() 事件
            $block.hover(function () {
                // 當滑鼠移上時停止計時器
                clearTimeout(timer);
            }, function () {
                // 當滑鼠移出時啟動計時器
                timer = setTimeout(move, speed);
            });

            // 控制輪播
            function move() {
                var _index = $('.title ul li.on', $block).index();
                _index = (_index + 1) % $li.length;
                $li.eq(_index).click();

                timer = setTimeout(move, speed);
            }

            // 啟動計時器
            timer = setTimeout(move, speed);

            //相簿輪撥初始值設定
            $('.title ul li:eq(0)').addClass('on');
            var thisLi = $('#abgne-block-20110111 .bd .banner ul:eq(0) li:eq(0)');
            thisLi.addClass('on');
            if (thisLi.children('input[type=hidden]').val() == 1) {
                thisLi.children('.new').show();
            }

            //最新消息TOP
            $('.newstop').each(function () {
                if ($(this).nextAll('input[type=hidden]').val() == 1) {
                    $(this).show();
                }
            });
        });


    </script>
    <!--[if lt IE 7]>
        <script type="text/javascript" src="javascript/iepngfix_tilebg.js"></script>
    <![endif]-->
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/reset.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="contain">
            <div class="sub">
                <p><a href="index.aspx">Home</a></p>
            </div>
            <div id="logol">
                <a href="index.aspx">
                    <img src="images/logo001.gif" alt="Tayana"></a>
            </div>

            <!--------------------------------選單開始---------------------------------------------------->
            <div class="menu">
                <ul>
                    <li class="menuli01"><a href="Yachts_OverView.aspx">Yachts</a></li>
                    <li class="menuli02"><a href="new_list.aspx">NEWS</a></li>
                    <li class="menuli03"><a href="compan.aspx">COMPANY</a></li>
                    <li class="menuli04"><a href="dealers.aspx">DEALERS</a></li>
                    <li class="menuli05"><a href="contact.aspx">CONTACT</a></li>
                </ul>
            </div>
            <!--------------------------------選單開始結束---------------------------------------------------->


            <!--遮罩-->
            <div class="bannermasks">
                <img src="images/banner00_masks.png" alt="&quot;&quot;" />
            </div>
            <!--遮罩結束-->

            <!--------------------------------換圖開始---------------------------------------------------->
            <div id="abgne-block-20110111">
                <div class="bd">
                    <div class="banner">
                        <ul>
                            <asp:Repeater ID="Repeater1" runat="server">
                                <ItemTemplate>
                                    <li class="info"><a href="#">
                                        <img src='<%#"/Back_End/YachtsImg/"+Eval("FileName") %>' /></a>
                                        <!--文字開始-->
                                        <div class="wordtitle">
                                            <asp:Literal ID="litTayanaName" runat="server" Text='<%#Eval("YachtsName")%>'></asp:Literal>
                                            <span>
                                                <asp:Literal ID="litModel" runat="server" Text='<%#Eval("Model")%>'></asp:Literal></span>
                                            <br>
                                            <p>SPECIFICATION SHEET</p>
                                        </div>
                                        <!--文字結束-->
                                        <div class="new" style='<%#Eval("NewTypeMark").ToString()=="0" ? "display:none" : " " %>'>
                                            <img src="images/new01.png" alt="new"/>
                                        </div>
                                    </li>

                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>


                        <!--小圖開始-->
                        <div class="bannerimg title">
                            <ul>
                                <asp:Repeater ID="Repeater2" runat="server">
                                    <ItemTemplate>
                                        <li>
                                            <div>
                                                <p class="bannerimg_p">
                                                    <img src='<%#"/Back_End/YachtsImg/"+"mini"+Eval("FileName") %>' alt="&quot;&quot;" />
                                                </p>
                                            </div>
                                        </li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                        </div>
                        <!--小圖結束-->
                    </div>
                </div>
            </div>

            <!--------------------------------換圖結束---------------------------------------------------->

            <!--------------------------------最新消息---------------------------------------------------->
            <div class="news">
                <div class="newstitle">
                    <p class="newstitlep1">
                        <img src="images/news.gif" alt="news" />
                    </p>
                    <p class="newstitlep2"><a href="new_list.aspx">More>></a></p>
                </div>
                <ul>
                    <asp:Repeater ID="NewsRepeater" runat="server">
                        <ItemTemplate>
                            <!--TOP第一則最新消息-->
                            <li>
                                <div class="news01">
                                    <!--TOP標籤-->
                                    <div class="newstop">
                                        <img src="images/new_top01.png" alt="&quot;&quot;" />
                                    </div>
                                    <!--TOP標籤結束-->
                                    <div class="news02p1">
                                        <p class="news02p1img">
                                            <img src='<%#"/Back_End/NewsImg/"+ Eval("PrePhotoName") %>' alt="&quot;&quot;" />
                                        </p>
                                    </div>
                                    <p class="news02p2">
                                        <span>
                                            <font color="#02a5b8">
                                                <asp:Literal ID="Literal1" runat="server" Text='<%# Eval("NewsDate") %>'></asp:Literal></font></span> <a href='<%#"new_view.aspx?id="+ Eval("id") %>'>
                                                    <asp:Literal ID="Literal2" runat="server" Text='<%# Eval("Introduction") %>'></asp:Literal></a>
                                    </p>
                                </div>
                            </li>
                            <!--TOP第一則最新消息結束-->
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>
            <!--------------------------------最新消息結束---------------------------------------------------->

            <!--------------------------------落款開始---------------------------------------------------->
            <div class="footer">
                <div class="footerp00">
                    <a href="#">
                        <img src="images/tog.jpg" alt="&quot;&quot;" /></a>
                    <p class="footerp001">© 1973-2011 Tayana Yachts, Inc. All Rights Reserved</p>
                </div>
                <div class="footer01">
                    <span>No. 60, Hai Chien Road, Chung Men Li, Lin Yuan District, Kaohsiung City, Taiwan, R.O.C.</span><br />
                    <span>TEL：+886(7)641-2721</span> <span>FAX：+886(7)642-3193</span><span><a href="mailto:tayangco@ms15.hinet.net">E-mail：tayangco@ms15.hinet.net</a>.</span>
                </div>
            </div>
            <!--------------------------------落款結束---------------------------------------------------->
        </div>
    </form>
</body>
</html>
