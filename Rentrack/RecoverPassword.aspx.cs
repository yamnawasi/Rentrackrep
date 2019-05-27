using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;

public partial class RecoverPassword : System.Web.UI.Page
{
    String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
    String GUIDvalue;
    DataTable dt = new DataTable();
    int user_id;

    protected void Page_Load(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            GUIDvalue = Request.QueryString["user_id"];
            if (GUIDvalue != null)
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM ForgotPassword_Requests where Id='" + GUIDvalue + "'", con);
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    user_id = Convert.ToInt32(dt.Rows[0][1]);
                }
                else
                {
                    lblMsg.Text = "Your Password Reset Link has Expired or is Invalid";
                    lblMsg.ForeColor = Color.Red;
                }

            }
            else
            {
                Response.Redirect("~/FAQ.aspx");
            }
        }

        if (!IsPostBack)
        {
            if (dt.Rows.Count != 0)
            {
                tbNewPass.Visible = true;
                tbConfirmPass.Visible = true;
                lblPassword.Visible = true;
                lblRetypePass.Visible = true;
                btRecPass.Visible = true;
            }
            else
            {
                lblMsg.Text = "Your Password Reset Link has Expired";
                lblMsg.ForeColor = Color.Red;
            }
        }

    }

    protected void btRecPass_Click(object sender, EventArgs e)
    {
        if (tbNewPass.Text != "" && tbConfirmPass.Text != "" && tbNewPass.Text == tbConfirmPass.Text)
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("UPDATE [User] SET password='" + tbNewPass.Text + "' WHERE user_id='" + user_id + "'", con);
                con.Open();
                cmd.ExecuteNonQuery();
                SqlCommand cmd2 = new SqlCommand("DELETE FROM [ForgotPassword_Requests] WHERE user_id='" + user_id + "'", con);
                cmd2.ExecuteNonQuery();
                Response.Redirect("~/Login.aspx");
            }
        }
    }
}