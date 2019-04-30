using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class HeaderandFooter : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user_id"] != null)
        {
            loginlink.Text = "Logout";
        }

        if (Session["user_id"] == null)
        {
            signuplink.Visible = true;
        }
        else if (Session["user_id"] != null)
        {
            signuplink.Visible = false;
        }

    }
        protected void Loginlinkbutton(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
            else if (Session["user_id"] != null)
                {
                    Session["user_id"] = null;                    
                    Response.Redirect("~/Default.aspx");
                }
        }

        protected void Signuplinkbutton(object sender, EventArgs e)
        {

            Response.Redirect("~/Sign Up.aspx");
            
        }
}
