using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;
using System.Windows.Forms;
using System.Net;
using System.Net.Mail;

public partial class AgentProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null)
        {
            if (Session["user_id"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else if (Session["user_id"] != null)
            {
                int userid = Convert.ToInt32(Session["user_id"].ToString());
                string usertypeid = "";
                string agentid = "";

                String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    con.Open();
                    //Get User Type ID
                    SqlCommand getusertypeid = new SqlCommand("SELECT user_type_id FROM [USER] WHERE user_id = '" + userid + "'", con);
                    SqlDataReader reader = getusertypeid.ExecuteReader();
                    while (reader.Read())
                    {
                        usertypeid = reader[0].ToString();
                    }
                    reader.Close();

                    //Get Agent ID
                    SqlCommand getagentid = new SqlCommand("SELECT agent_id FROM [USER_TYPE] WHERE user_type_id = '" + usertypeid + "'", con);
                    SqlDataReader aireader = getagentid.ExecuteReader();
                    while (aireader.Read())
                    {
                        agentid = aireader[0].ToString();
                    }
                    aireader.Close();

                    if (agentid == null || agentid == "")
                    {
                        BindAgentInfo();
                        BindGitForm();
                        showgit.Visible = true;
                    }
                    else
                    {
                        BindAgentInfo();
                        showgit.Visible = false;
                    }
                }
            }
        }
        else
        {
            Response.Redirect("~/Find Agent.aspx");
        }
        
        
    }

    private void BindGitForm()
    {
        int userid = Convert.ToInt32(Session["user_id"].ToString());
        string fname = "", lname = "", email = "", phone = "";
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            SqlCommand getuserdata = new SqlCommand("SELECT f_name, l_name, email, phone_no FROM [USER] WHERE user_id = '" + userid + "'", con);
            SqlDataReader ejreader = getuserdata.ExecuteReader();
            while (ejreader.Read())
            {
                fname = ejreader[0].ToString();
                lname = ejreader[1].ToString();
                email = ejreader[2].ToString();
                phone = ejreader[3].ToString();
            }
            ejreader.Close();
            tbname.Text = fname + " " + lname;
            tbemail.Text = email;
            tbphone.Text = phone;
        }
    }

    private void BindAgentInfo()
    {
        Int64 agentid = Convert.ToInt64(Request.QueryString["id"]);

        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            using (SqlCommand cmd = new SqlCommand("SELECT A.agency_name, B.*, C.*, D.f_name, D.l_name, D.phone_no, D.email, E.city_name FROM dbo.[Agency] A JOIN dbo.[Agent] B ON (A.agency_id = B.agency_id) JOIN dbo.[Agent_city] C ON (C.agent_id = B.agent_id) JOIN dbo.[User] D ON (D.user_type_id = B.agent_id) JOIN dbo.[City] E ON (C.city_id = E.city_id) WHERE B.agent_id ='" + agentid + "'", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtagentinfo = new DataTable();
                    sda.Fill(dtagentinfo);
                    rptragentinfo.DataSource = dtagentinfo;
                    rptragentinfo.DataBind();
                }
            }
        }
    }
    protected void Sendbtn_Click(object sender, EventArgs e)
    {
        SendEmail();
    }
    private void SendEmail()
    {
        //Get Agent Email
        string agentemail = "";
        Int64 agentid = Convert.ToInt64(Request.QueryString["id"]);
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            SqlCommand cmdd = new SqlCommand("SELECT A.email FROM [USER] A JOIN [AGENT] B ON (A.user_type_id = B.agent_id) WHERE agent_id ='" + agentid + "'", con);
            SqlDataReader reader = cmdd.ExecuteReader();
            while (reader.Read())
            {
                agentemail = reader[0].ToString();
            }
            reader.Close();
        }

        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        smtp.Port = 587;
        smtp.Credentials = new System.Net.NetworkCredential("Rentrackfyp@gmail.com", "contract123");
        smtp.EnableSsl = true;
        MailMessage msg = new MailMessage();
        msg.Subject = "Property Owner, " + tbname.Text + " wishes to contact you";
        msg.Body = "A property owner is interested in discussing his property with you. Kindly get back to them at the earliest convenience. \n\nName: " + tbname.Text + "\nEmail Address: " + tbemail.Text +"\nPhone Number: " + tbphone.Text + "\nMessage: " + tbmsg.Text + "\n\nRegards,\nTeam Rentrack";
        msg.To.Add(agentemail);
        string fromaddress = "<Rentrackfyp@gmail.com>";
        msg.From = new MailAddress(fromaddress);
        try
        {
            smtp.Send(msg);
        }
        catch
        {
            throw;
        }
    }
}