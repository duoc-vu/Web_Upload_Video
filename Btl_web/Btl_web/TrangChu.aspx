<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TrangChu.aspx.cs" Inherits="Btl_web.TrangChu" %>
<%@ import namespace ="Btl_web"  %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head >   
    <link rel="stylesheet" href="font/fontawesome-free-6.4.2-web/css/all.min.css" />
    <link rel="stylesheet" href="Style/TrangChu.css" />

    <title>Home</title>
</head>
<body>
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
        <form class="form-Search" method="post" action="TrangChu.aspx" >
            <b><label for="txtTenHang">Ten Hang</label></b>
            
            <input type="text" id="txtTenHang" name="txtTenHang" value="<% =Server.HtmlEncode(Request.Form["txtTenHang"]) %>"/>
            <input type="submit" value="Tim" />
        </form>

<div class="content">

     <div class="side-bar">
          <ul class="list">
              <li><a href="TrangChu.aspx" >Trang Chủ</a></li>
               <li><a href="TrangLuuTru.aspx" >Video đã lưu</a></li>
           </ul>
      </div>

       <div id ="main-content"> 
                
<% 
           var glstProduct = Application[Btl_web.Global.PRODUCT_LIST] as List<Btl_web.Object.Products>;
           if (Request.Form["txtTenHang"] != null && !string.IsNullOrWhiteSpace(Request.Form["txtTenHang"]))
           {
                glstProduct = glstProduct.FindAll(p => p.Name.IndexOf(Request.Form["txtTenHang"], StringComparison.CurrentCultureIgnoreCase) >= 0);
           }
           foreach (var p in glstProduct)
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
              <%--<div class="ics" >
                  <button class="hoverss" onclick="toggleOptions('product_<%=p.Id%>')">
                       <i class="fa-solid fa-ellipsis-vertical"></i>
                   </button>

                   <ul class="sub-menu" id="product_<%=p.Id%>">
                        <li><a href="TrangLuuTru.aspx?id<%=p.Id %>">Lưu video</a></li>
                        <li><a href="#">Sửa video</a></li>
                         <li><a href="XuLyXoaVideo.aspx?id=<%= p.Id %>">Xóa video</a></li>
                    </ul>
               </div>--%>
            </div>
<%};%>
    </div>
    
</div>

        <form class="form-Up" method="post" action="TrangChu.aspx" enctype="multipart/form-data">
            <div class="up">
                 <input type="file" name="file" id="file"/>
                 <label id="upload" name="upload" for="file">Upload Video</label>
                 <input type="submit" />
            </div>
        </form>

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
