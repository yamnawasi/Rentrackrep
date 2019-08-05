using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ResourceDisplay : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user_id"] == null)
        {
            Response.Redirect("Login.aspx");
        }
    }

    protected void Accept_click(object sender, EventArgs e)
    {
        Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Thank you for confirming.');", true);
        Response.Redirect("Dashboard.aspx");

    }

    protected void Reject_click(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }
}