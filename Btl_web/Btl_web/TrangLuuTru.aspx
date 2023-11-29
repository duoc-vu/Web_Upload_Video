<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TrangLuuTru.aspx.cs" Inherits="Btl_web.TrangLuuTru" %>
<%@ Import namespace="Btl_web" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="Style/TrangChu.css" />
    <link rel="stylesheet" href="font/fontawesome-free-6.4.2-web/css/all.min.css" />
    <title>Lưu trữ video</title>
</head>
<body>
    <%
        var glstSave = Application[Btl_web.Global.SAVE_LIST] as List<Btl_web.Object.Products>;
        
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
                    <li><a href="#" >Video đã lưu</a></li>
                </ul>
            </div>

        <div id ="main-content"> 
<%
    foreach (var p in glstSave)
    {
%>
           <a href="ChiTietSp.aspx?id=<%=p.Id %>">
             <div class ="products" >
                            
              <div class="videoss">
                   <video controls >
                        <source src="Recourses/video/<% =p.VideoUrl %>" 
                         title ="<%=p.Name %>"
                         alt="<%=p.Name %>" 
                         type="audio/mp4"/>
                         </video>
               </div>
           </a>
              <div class="ics" >
                  <button class="hoverss" onclick="toggleOptions('product_<%=p.Id%>')">
                       <i class="fa-solid fa-ellipsis-vertical"></i>
                   </button>

                   <ul class="sub-menu" id="product_<%=p.Id%>">
                        <li><a href="TrangLuuTru.aspx?id<%=p.Id %>">Lưu video</a></li>
                        <li><a href="#">Sửa video</a></li>
                         <li><a href="XuLyXoaVideo.aspx?id=<%= p.Id %>">Xóa video</a></li>
                    </ul>
               </div>
            </div>
            <%}; %>
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
