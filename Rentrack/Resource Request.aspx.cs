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
                        SqlCommand cmd2 = new SqlCommand("INSERT INTO [Request_Resource](res_sender_id, date, res_recipient_id, service, description, request_accepted, request_fulfilled) VALUES ('" + userid + "','" + tbdate.Text + "','" + recipientid + "','" + serv.SelectedItem.Value + "','" + tbdes.Text + "','" + 0 + "', '" + 0 + "')", con);
                        cmd2.ExecuteNonQuery();

                        //Get Resource ID
                        int resid;
                        SqlCommand getrid = new SqlCommand("SELECT TOP 1 * FROM dbo.[Request_Resource] ORDER BY request_id DESC", con);
                        getrid.ExecuteNonQuery();
                        resid = (int)getrid.ExecuteScalar();

                        SendResReqNotif(userid, recipientid, resid);
                    }
                    
                }
                
            }
            
        }
    }

    private void SendResReqNotif(string userid, string recipid, int resid)
    {
        string service = "", resdate = "", fname = "", lname = "";

        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();

            //Get Resource ID, Service
            SqlCommand cmdd = new SqlCommand("SELECT service, date FROM dbo.[Request_Resource] WHERE request_id ='" + resid + "'", con);
            SqlDataReader reader = cmdd.ExecuteReader();
            while (reader.Read())
            {
                service = reader[0].ToString();
                resdate = reader[1].ToString();
            }
            reader.Close();

            //Get Sender's Name
            SqlCommand getname = new SqlCommand("SELECT l_name, f_name FROM dbo.[USER] WHERE user_id ='" + userid + "'", con);
            SqlDataReader nreader = getname.ExecuteReader();
            while (nreader.Read())
            {
                fname = nreader[1].ToString();
                lname = nreader[0].ToString();
            }
            nreader.Close();

            //Notification Text
            string notiftext = fname + " " + lname + " has requested a resource, " + service + " on " + resdate + ".";

            //Store in Notification Table
            DateTime today = DateTime.Today;
            SqlCommand createnotif = new SqlCommand("INSERT INTO dbo.[Notification] (notif_type, creation_date, is_viewed, sender_id, receiver_id, notification_text, resource_id, btn_text) VALUES ('" + "Resource Request" + "','" + today + "','" + 0 + "','" + userid + "','" + recipid + "','" + notiftext + "','" + resid + "','" + "View Resource" + "')", con);
            createnotif.ExecuteNonQuery();

            //Get Notif ID
            SqlCommand getrdid = new SqlCommand("SELECT TOP 1 * FROM dbo.[Notification] ORDER BY notif_id DESC", con);
            getrdid.ExecuteNonQuery();
            int notifidtab;
            notifidtab = (int)getrdid.ExecuteScalar();

            //Create link
            string btnlink = "ResourceDisplay.aspx";

            //Add Button Link
            SqlCommand updatenotif = new SqlCommand("UPDATE dbo.[Notification] SET btn_link = '" + btnlink + "' WHERE notif_id = '" + notifidtab + "'", con);
            updatenotif.ExecuteNonQuery();
        }
    }

    protected void Cancel_btn(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }

}