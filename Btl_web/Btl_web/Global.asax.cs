using Btl_web.Object;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace Btl_web
{
    public class Global : System.Web.HttpApplication
    {

        public const string MEMBER_LIST = "MenberList";
        public const string MEMBER_NAME = "MemberName";
        public const string PRODUCT_LIST = "DSSP";
        public const string SAVE_LIST = "DSSV";
  
        protected void Application_Start(object sender, EventArgs e)
        {
            Application[MEMBER_LIST] = createAListOfMember();
            Application[PRODUCT_LIST] = createProductList();
            Application[SAVE_LIST] = createSaveList();
        }

        private List<Products> createSaveList()
        {
            return new List<Products>()
            {

            };
        }

        private List<Products> createProductList()
        {
            return new List<Products>()
            {
                new Products { Id = 0, Name = "Giay", Detail = "bla bla bla", VideoUrl = "video1.mp4" }
                ,new Products { Id = 1, Name = "Giay", Detail = "bla bla bla", VideoUrl = "video2.mp4" }
                ,new Products { Id = 2, Name = "Ao", Detail = "bla bla bla", VideoUrl = "video1.mp4" }
                ,new Products { Id = 3, Name = "Dep", Detail = "bla bla bla", VideoUrl = "video2.mp4" }
                ,new Products { Id = 4, Name = "Khuyen Tai", Detail = "bla bla bla", VideoUrl = "video2.mp4" }
                ,new Products { Id = 5, Name = "Tat", Detail = "bla bla bla", VideoUrl = "video1.mp4" }
                ,new Products { Id = 6, Name = "Ao Coc", Detail = "bla bla bla", VideoUrl = "video2.mp4" }
            };

        }

        private List<Member> createAListOfMember()
        {
            return new List<Member>
            {
                new Member{MemberName="1" , Password = "1"}
            };

        }

        protected void Session_Start(object sender, EventArgs e)
        {
            Session[MEMBER_NAME] = "guest";
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}