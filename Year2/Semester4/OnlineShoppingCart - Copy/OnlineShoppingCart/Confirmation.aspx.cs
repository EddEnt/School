using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineShoppingCart
{
    public partial class Confirmation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Random RandomClass = new Random();
            lblConfirmNum.Text = RandomClass.Next(00001, 99999).ToString();
            lblEmail.Text = Session["username"].ToString();
            lblPrice.Text = Session["quantity"].ToString();
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/login.aspx");
        }
    }
}