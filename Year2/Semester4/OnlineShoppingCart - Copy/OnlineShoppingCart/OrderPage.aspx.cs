using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineShoppingCart
{
    public partial class OrderPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["productName"] = txtProductName.Text;
            Session["quantity"] = txtQuantity.Text;
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            Server.Transfer("~/Confirmation.aspx");
        }
    }
}