using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;
using System.Net.Mail;
using System.Drawing;
using System.IO;

public partial class agentsignup : System.Web.UI.Page
{
    static String activationcode;
    protected void Page_Load(object sender, EventArgs e)
    {
        //Label1.Text = "your email is" + Request.QueryString["emailadd"].ToString() + ",check your email for code";
        DateRangeValidator.MinimumValue = DateTime.Today.AddYears(-90).ToShortDateString();
        DateRangeValidator.MaximumValue = DateTime.Today.AddYears(-18).ToShortDateString();
    }

    protected void agsignupbtn_Click(object sender, EventArgs e)
    {
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {

            bool inputIsValid = true;

            //checking if email already exists
            var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString);
            var emailCmd = new SqlCommand("SELECT 1 FROM [User] WHERE email = @UserEmail", conn);

            conn.Open();
            emailCmd.Parameters.AddWithValue("@UserEmail", agentemail.Text);

            using (var emailReader = emailCmd.ExecuteReader())
            {
                if (emailReader.HasRows)
                {
                    inputIsValid = false;
                    lblemail.Text = "Email address already exists";
                }
            }
            conn.Close();

            if (inputIsValid && lblcode.Text=="Verified")
            {
                //getting city_id of agent's city
                SqlCommand com = new SqlCommand("SELECT city_id FROM [City] WHERE city_name = '" + agentcity.SelectedValue + "'", con);
                con.Open();
                int tbcity = (int)com.ExecuteScalar();
                com.ExecuteNonQuery();
                com.Parameters.Clear();

                //getting city_id of agency's city
                SqlCommand com2 = new SqlCommand("SELECT city_id FROM [City] WHERE city_name = '" + agencycity.SelectedValue + "'", con);
                int agcity = (int)com2.ExecuteScalar();
                com2.ExecuteNonQuery();
                com2.Parameters.Clear();

                //inserting in agency table
                SqlCommand com3 = new SqlCommand("INSERT INTO [Agency](agency_name, agency_phone, agency_email, status, activationcode) VALUES ('" + agencyname.Text + "','" + agencyphone.Text + "','" + agencyemail.Text + "','verified','" + activationcode + "')", con);
                com3.ExecuteNonQuery();

                //getting agency_id recently inserted
                SqlCommand com4 = new SqlCommand("SELECT agency_id FROM [Agency] ORDER BY[agency_id] DESC ", con);
                int agencyid = (int)com4.ExecuteScalar();
                com4.ExecuteNonQuery();
                com4.Parameters.Clear();

                //inserting in agency_branch table
                SqlCommand com5 = new SqlCommand("INSERT INTO [Agency_Branch](agency_id, agency_address, city_id) VALUES ('" + agencyid + "','" + agencyaddress.Text + "','" + agcity + "')", con);
                com5.ExecuteNonQuery();

                //getting the last user_type_id
                SqlCommand cmd1 = new SqlCommand("SELECT user_type_id FROM [User_Type] ORDER BY[user_type_id] DESC ", con);
                cmd1.ExecuteNonQuery();

                if (cmd1.ExecuteScalar() != null) //if user_type_id is not null
                {
                    int usertypeid = (int)cmd1.ExecuteScalar();
                    usertypeid += 1;
                    
                    //storing in agent table
                    SqlCommand cmd2 = new SqlCommand("INSERT INTO [Agent](agent_id, agency_id, cnic) VALUES ('" + usertypeid + "', '" + agencyid + "', '" + cnicnum.Text + "')", con);
                    cmd2.ExecuteNonQuery();

                    //storing in usertype table
                    SqlCommand cmd3 = new SqlCommand("INSERT INTO [User_Type](user_type_id, agent_id) VALUES ('" + usertypeid + "','" + usertypeid + "')", con);
                    cmd3.ExecuteNonQuery();

                    //storing in user table
                    SqlCommand cmd4 = new SqlCommand("INSERT INTO [User](user_type_id, f_name, l_name, address, dob, phone_no, password, email, city_id) VALUES ('" + usertypeid + "','" + fname.Text + "','" + lname.Text + "','" + agentaddress.Text + "','" + agentdob.Text + "','" + agentphone.Text + "','" + agentpass.Text + "','" + agentemail.Text + "','" + tbcity + "')", con);
                    cmd4.ExecuteNonQuery();

                }
                else if (cmd1.ExecuteScalar() == null) //if usertype table is empty and user_type id is null
                {
                    int usertypeid = 0;
                    usertypeid += 1;

                    //storing in agent table
                    SqlCommand cmd2 = new SqlCommand("INSERT INTO [Agent](agent_id, agency_id, cnic) VALUES ('" + usertypeid + "', '" + agencyid + "', '" + cnicnum.Text + "')", con);
                    cmd2.ExecuteNonQuery();

                    //storing in usertype table
                    SqlCommand cmd3 = new SqlCommand("INSERT INTO [User_Type](user_type_id, agent_id) VALUES ('" + usertypeid + "','" + usertypeid + "')", con);
                    cmd3.ExecuteNonQuery();

                    //storing in user table
                    SqlCommand cmd4 = new SqlCommand("INSERT INTO [User](user_type_id, f_name, l_name, address, dob, phone_no, password, email, city_id) VALUES ('" + usertypeid + "','" + fname.Text + "','" + lname.Text + "','" + agentaddress.Text + "','" + agentdob.Text + "','" + agentphone.Text + "','" + agentpass.Text + "','" + agentemail.Text + "','" + tbcity + "')", con);
                    cmd4.ExecuteNonQuery();
                }

               //alert

            }
            con.Close();

        }

    }
  
    //calling activation code when clicked
    protected void codebtn_Click(object sender, EventArgs e)
    {
        activationcodefunc();
        sendcode();
    }

    //generating activation code
    private string activationcodefunc()
    {
        Random random = new Random();
        activationcode = random.Next(1001, 9999).ToString();
        return activationcode;
    }

    //sending the activation code to agency's email address for verification
    private void sendcode()
    { 
        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        smtp.Port = 587;
        smtp.Credentials = new System.Net.NetworkCredential("Rentrackfyp@gmail.com","contract123");
        smtp.EnableSsl = true;
        MailMessage msg = new MailMessage();
        msg.Subject = "Activation code to verify email address";
        msg.Body = "your activation code is " + activationcode + "\n\n\nTeam Rentrack";
        string toAddress = agencyemail.Text;
        msg.To.Add(toAddress);
        string fromaddress = "<Rentrackfyp@gmail.com>";
        msg.From = new MailAddress(fromaddress);
        try
        { smtp.Send(msg);
        }
        catch
        {
            throw;
        }
        
    }

    //Verifying the agent
    protected void verifybtn_Click(object sender, EventArgs e)
    {
                if (activationcode == code.Text)
                {
                    lblcode.Text = "Verified";                  
                }
                else
                { lblcode.Text = "Please enter a valid code"; }
    }
    
}