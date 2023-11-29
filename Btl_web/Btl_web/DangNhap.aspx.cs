using Btl_web.Object;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Btl_web
{
    public partial class DangNhap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string memberName = Request.Form["username"];
            string memberPass = Request.Form["password"];
            bool loginSuccess = false;



            if (!string.IsNullOrEmpty(memberName) && !string.IsNullOrEmpty(memberPass))
            {

                /// xử lý login
                List<Member> glstMembers = Application[Global.MEMBER_LIST] as List<Member>;
                Member member = glstMembers.Find(m => m.MemberName.Equals(memberName,
                    StringComparison.CurrentCultureIgnoreCase));
                if (member != null)
                {
                    loginSuccess = member.Password.Equals(memberPass);
                }

                if (loginSuccess)
                {
                    Session[Global.MEMBER_NAME] = memberName;
                    Response.Redirect("TrangChu.aspx?user=" + Session[Global.MEMBER_NAME]);
                }

                else
                {
                    Response.Write("Đăng nhập không thành công");
                }
            }

            if (Request.UrlReferrer != null)
            {
                Session[Global.MEMBER_NAME] = "guest";

            }
        }
    }
}