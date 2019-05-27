using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if(Request.Cookies["email"] != null && Request.Cookies["password"] != null)
            {
                tbemail.Text = Request.Cookies["email"].Value;
                tbpassword.Attributes["value"] = Request.Cookies["password"].Value;
                remembercheck.Checked = true;
            }
        }
    }

    protected void Login_btn(object sender, EventArgs e)
    {
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM [User] WHERE email = '" + tbemail.Text + "' and password = '" + tbpassword.Text + "'", con);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            SqlCommand cmd1 = new SqlCommand("SELECT * FROM [Admin] WHERE admin_email = '" + tbemail.Text + "' and admin_password = '" + tbpassword.Text + "'", con);
            SqlDataAdapter sda1 = new SqlDataAdapter(cmd1);
            DataTable dt1 = new DataTable();
            sda1.Fill(dt1);

            if (dt.Rows.Count != 0) //For user login
            {
                if(remembercheck.Checked)
                    {
                        Response.Cookies["email"].Value = tbemail.Text;
                        Response.Cookies["password"].Value = tbpassword.Text;

                        Response.Cookies["email"].Expires = DateTime.Now.AddDays(15);
                        Response.Cookies["password"].Expires = DateTime.Now.AddDays(15);
                    }
                else
                    {
                        Response.Cookies["email"].Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies["email"].Expires = DateTime.Now.AddDays(-1);   
                    }

                SqlCommand cmd2 = new SqlCommand("SELECT user_type_id FROM [User] WHERE email = '" + tbemail.Text + "' and password = '" + tbpassword.Text + "'", con);
                int usertypeid = (int)cmd2.ExecuteScalar();
                cmd2.ExecuteNonQuery();

                SqlCommand cmd3 = new SqlCommand("SELECT agent_id FROM [User_Type] WHERE agent_id = '" + usertypeid + "'", con);
                SqlDataAdapter sda2 = new SqlDataAdapter(cmd3);
                DataTable dt2 = new DataTable();
                sda2.Fill(dt2);

                SqlCommand com = new SqlCommand("SELECT user_id FROM [User] WHERE email = '" + tbemail.Text + "' and password = '" + tbpassword.Text + "'", con);
                int user_id = (int)com.ExecuteScalar();
                com.ExecuteNonQuery();
                Session["user_id"] = user_id;

                if (dt2.Rows.Count == 0) //Normal user
                {
                    Response.Redirect("~/Default.aspx");
                }
                else if(dt2.Rows.Count != 0)//Agent
                {
                    Response.Redirect("~/FAQ.aspx");//redirection page to be decided for agent
                }
            }

            else if(dt1.Rows.Count != 0) //For admin login
            {
                if (remembercheck.Checked)
                {
                    Response.Cookies["admin_email"].Value = tbemail.Text;
                    Response.Cookies["admin_password"].Value = tbpassword.Text;

                    Response.Cookies["admin_email"].Expires = DateTime.Now.AddDays(15);
                    Response.Cookies["admin_password"].Expires = DateTime.Now.AddDays(15);
                }
                else
                {
                    Response.Cookies["admin_email"].Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies["admin_email"].Expires = DateTime.Now.AddDays(-1);
                }

                SqlCommand com1 = new SqlCommand("SELECT admin_id FROM [Admin] WHERE admin_email = '" + tbemail.Text + "' and admin_password = '" + tbpassword.Text + "'", con);
                int admin_id = (int)com1.ExecuteScalar();
                com1.ExecuteNonQuery();

                Session["admin_id"] = admin_id;
                Response.Redirect("~/AddArea.aspx");
            }

            else
            {
                lblError.Text = "Email or Password is incorrect!";
            }
        }
    }
}