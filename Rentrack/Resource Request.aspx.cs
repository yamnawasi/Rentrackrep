using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;
using System.IO;
using System.Windows.Forms;

public partial class Resource_Request : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["user_id"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else if (Session["user_id"] != null)
            {
                DateRangeValidator.MinimumValue = DateTime.Today.ToShortDateString();
                DateRangeValidator.MaximumValue = DateTime.Today.AddMonths(11).ToShortDateString();
            }
        }
    }

    protected void Send_btn(object sender, EventArgs e)
    {
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))

        {
            //checking if email exists
            SqlCommand com1 = new SqlCommand("SELECT * FROM [User] WHERE email = '" + tbemail.Text + "'", con);
            con.Open();
            SqlDataAdapter sda1 = new SqlDataAdapter(com1);
            DataTable dt1 = new DataTable();
            sda1.Fill(dt1);

            string userid = Session["user_id"].ToString();

            if (dt1.Rows.Count == 0) //if email does not exist
            {
                lblemail.Visible = true;
                lblemail.Text = "Email is not registered with the website";
            }
            if (dt1.Rows.Count != 0)//if email exists
            {
                string recipientid = dt1.Rows[0][0].ToString();
                string usertypeid = dt1.Rows[0][1].ToString();

                //checking if agent is recipient
                SqlCommand com2 = new SqlCommand("SELECT * FROM [Agent] WHERE agent_id = '" + usertypeid + "'", con);
                SqlDataAdapter sda2 = new SqlDataAdapter(com2);
                DataTable dt2 = new DataTable();
                sda2.Fill(dt2);

                if(dt2.Rows.Count != 0)//if the email belongs to an agent
                {
                    lblemail.Visible = true;
                    lblemail.Text = "Please enter the tenant/landlord email address";
                }
                if(dt2.Rows.Count == 0)
                {
                    if (recipientid == userid)//if sender enters his own email
                    {
                        lblemail.Visible = true;
                        lblemail.Text = "Please enter the recipient's email address";
                    }
                    if(recipientid != userid)
                    {
                        //storing in Request_Resource table
                        SqlCommand cmd2 = new SqlCommand("INSERT INTO [Request_Resource](res_sender_id, date, res_recipient_id, service, description, negotiation_on_date, request_accepted, request_fulfilled) VALUES ('" + userid + "','" + tbdate.Text + "','" + recipientid + "','" + serv.SelectedItem.Value + "','" + tbdes.Text + "','" + nego.SelectedItem.Value + "', '" + 0 + "', '" + 0 + "')", con);
                        cmd2.ExecuteNonQuery();


                        Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message Box", "<script language = 'javascript'>alert('Your request has been submitted')</script>");
                    }
                    
                }
            }

        }
    }

    protected void Cancel_btn(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }

}