using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineShoppingCart
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btnLogin_Click(object sender, EventArgs e){
        
            if(Page.IsValid){
            Session["username"] = txtUsername.Text;
            Session["password"] = txtPassword.Text;

            Server.Transfer("~/OrderPage.aspx");
            
            }
        }
    }
}