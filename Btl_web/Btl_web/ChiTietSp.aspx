﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChiTietSp.aspx.cs" Inherits="Btl_web.ChiTietSp" %>
<%@ Import namespace="Btl_web" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="Style/TrangChu.css" />
    <link rel="stylesheet" href="font/fontawesome-free-6.4.2-web/css/all.min.css" />
    <title>Trang Chi Tiết</title>
</head>
<body>
    <%
        var glstProduct = Application[Btl_web.Global.PRODUCT_LIST] as List<Btl_web.Object.Products>;
        var glstSave = Application[Btl_web.Global.SAVE_LIST] as List<Btl_web.Object.Products>;
        var ten = "";
        var chuThich = "";
        var video ="";
        var id = 0;
        foreach( var x in glstProduct)
        {
            if(x.Id == Convert.ToInt32(Request.QueryString["id"]))
            {
                id = x.Id;
                ten = x.Name;
                chuThich = x.Detail;
                video = x.VideoUrl;
            }
        }

     %>
     <header>
        <div class="logo">
            <img src="Recourses/Img/logo.png" />
        </div>
        <div class="para">
            <div class="Sign-up">
                <a href="DangNhap.aspx">Sign Up </a>
            </div>
        
            <div class="logout">
             <a href="DangNhap.aspx?do=out"> Logout </a>
            </div>
            <div class="user">
                <a href="#"> Xin chào <%=Session[Global.MEMBER_NAME]  %></a>
            </div>
        </div>
        
        
    </header>

        <div class="content">

            <div class="side-bar">
                <ul class="list">
                    <li><a href="TrangChu.aspx" >Trang Chủ</a></li>
                    <li><a href="TrangLuuTru.aspx" >Video đã lưu</a></li>
                </ul>
            </div>

        <div id ="main-content"> 
             <div class ="products" >
                   <div class="videoss">
                        <video controls >
                         <source src="Recourses/video/<% =video %>" 
                           title ="<%=ten %>"
                           alt="<%= ten %>" 
                           type="audio/mp4"/>
                        </video>
                            
                           <h1><% = ten %></h1> 
                           <h4> <%= chuThich %></h4>
             </div>

              <div class="ics" >
                     <button class="hoverss" onclick="toggleOptions('product_<%= id%>')">
                         <i class="fa-solid fa-ellipsis-vertical"></i>
                     </button>

                     <ul class="sub-menu" id="product_<%= id%>">
                           <li><a href="XuLyVideoLuuTru.aspx?oe=<%= id %>">Lưu video</a></li>
                           <li><a href="#">Sửa video</a></li>
                           <li><a href="XuLyXoaVideo.aspx?id=<%= id %>">Xóa video</a></li>
                     </ul>
              </div>
        </div>
 </div>
</div>

    <footer>
        <p>Duoc Vu</p>
    </footer>
        
        <script >
            function toggleOptions(menuId) {
                var optionsMenu = document.getElementById(menuId);
                optionsMenu.style.display = (optionsMenu.style.display === 'block') ? 'none' : 'block';
            }
        </script>
</body>
</html>
