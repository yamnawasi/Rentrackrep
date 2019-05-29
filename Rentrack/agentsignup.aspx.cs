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
        if (!this.IsPostBack)
        {
            String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand com = new SqlCommand("SELECT * FROM [DBO].[City] ORDER BY city_name ASC", con);
                con.Open();
                com.ExecuteNonQuery();
                SqlDataReader sdr = com.ExecuteReader();
                if (sdr.HasRows)
                {
                    //for agent's cities listbox
                    agentcitylist.DataSource = sdr;
                    agentcitylist.DataTextField = "city_name";
                    agentcitylist.DataValueField = "city_id";
                    agentcitylist.DataBind();

                }
                con.Close();
            }

            String CS1 = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS1))
            {
                SqlCommand com = new SqlCommand("SELECT * FROM [DBO].[City] ORDER BY city_name ASC", con);
                con.Open();
                com.ExecuteNonQuery();
                SqlDataReader sdr = com.ExecuteReader();
                if (sdr.HasRows)
                {
                    //for agency's cities listbox
                    agencycitylist.DataSource = sdr;
                    agencycitylist.DataTextField = "city_name";
                    agencycitylist.DataValueField = "city_id";
                    agencycitylist.DataBind();
                }
                con.Close();
            }
        }   
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

            if (inputIsValid && lblcode.Text == "Verified")
            {
                //checking if the agency already exists in db
                SqlCommand com1 = new SqlCommand("SELECT agency_id FROM [Agency] WHERE agency_email = '" + agencyemail.Text + "' AND agency_name = '" + agencyname.Text + "'", con);
                con.Open();
                SqlDataAdapter sda1 = new SqlDataAdapter(com1);
                DataTable dt1 = new DataTable();
                sda1.Fill(dt1);

                if(dt1.Rows.Count == 0) //if agency is not registered
                {
                    //inserting in agency table
                    SqlCommand com2 = new SqlCommand("INSERT INTO [Agency](agency_name, agency_phone, agency_email, status, activationcode) VALUES ('" + agencyname.Text + "','" + agencyphone.Text + "','" + agencyemail.Text + "','verified','" + activationcode + "')", con);
                    com2.ExecuteNonQuery();

                    //getting agency_id recently inserted
                    SqlCommand com3 = new SqlCommand("SELECT agency_id FROM [Agency] ORDER BY[agency_id] DESC ", con);
                    int agency_id = (int)com3.ExecuteScalar();
                    com3.ExecuteNonQuery();

                    //inserting in agency_branch table
                    SqlCommand com4 = new SqlCommand("INSERT INTO [Agency_Branch](agency_id, agency_address) VALUES ('" + agency_id + "','" + agencyaddress.Text + "')", con);
                    com4.ExecuteNonQuery();
                }

                //getting agency_id recently inserted
                SqlCommand cmd = new SqlCommand("SELECT agency_id FROM [Agency] ORDER BY[agency_id] DESC ", con);
                int agencyid = (int)cmd.ExecuteScalar();
                cmd.ExecuteNonQuery();

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

                    //getting the recently inserted agent_id
                    SqlCommand cmd3 = new SqlCommand("SELECT agent_id FROM [Agent] ORDER BY[agent_id] DESC ", con);
                    int agentid = (int)cmd3.ExecuteScalar();
                    cmd3.ExecuteNonQuery();

                    foreach (ListItem item in agentcitylist.Items)
                    {
                        if (item.Selected)
                        {
                            //inserting in agent_city table
                            SqlCommand cmd4 = new SqlCommand("INSERT INTO [Agent_city](agent_id, city_id) VALUES ('" + agentid + "','" + item.Value + "')", con);
                            cmd4.ExecuteNonQuery();
                        }
                    }

                    foreach (ListItem item in agencycitylist.Items)
                    {
                        if (item.Selected)
                        {
                            //inserting in agency_city table
                            SqlCommand cmd5 = new SqlCommand("INSERT INTO [Agency_city](agency_id, city_id) VALUES ('" + agencyid + "','" + item.Value + "')", con);
                            cmd5.ExecuteNonQuery();
                        }
                    }

                    //storing in usertype table
                    SqlCommand cmd6 = new SqlCommand("INSERT INTO [User_Type](user_type_id, agent_id) VALUES ('" + usertypeid + "','" + usertypeid + "')", con);
                    cmd6.ExecuteNonQuery();

                    //storing in user table
                    SqlCommand cmd7 = new SqlCommand("INSERT INTO [User](user_type_id, f_name, l_name, phone_no, password, email) VALUES ('" + usertypeid + "','" + fname.Text + "','" + lname.Text + "','" + agentphone.Text + "','" + agentpass.Text + "','" + agentemail.Text + "')", con);
                    cmd7.ExecuteNonQuery();

                }
                else if (cmd1.ExecuteScalar() == null) //if usertype table is empty and user_type id is null
                {
                    int usertypeid = 0;
                    usertypeid += 1;

                    //storing in agent table
                    SqlCommand cmd2 = new SqlCommand("INSERT INTO [Agent](agent_id, agency_id, cnic) VALUES ('" + usertypeid + "', '" + agencyid + "', '" + cnicnum.Text + "')", con);
                    cmd2.ExecuteNonQuery();

                    //getting the recently inserted agent_id
                    SqlCommand cmd3 = new SqlCommand("SELECT agent_id FROM [Agent] ORDER BY[agent_id] DESC ", con);
                    int agentid = (int)cmd3.ExecuteScalar();
                    cmd3.ExecuteNonQuery();

                    foreach (ListItem item in agentcitylist.Items)
                    {
                        if (item.Selected)
                        {
                            //inserting in agent_city table
                            SqlCommand cmd4 = new SqlCommand("INSERT INTO [Agent_city](agent_id, city_id) VALUES ('" + agentid + "','" + item.Value + "')", con);
                            cmd4.ExecuteNonQuery();
                        }
                    }

                    foreach (ListItem item in agencycitylist.Items)
                    {
                        if (item.Selected)
                        {
                            //inserting in agency_city table
                            SqlCommand cmd5 = new SqlCommand("INSERT INTO [Agency_city](agency_id, city_id) VALUES ('" + agencyid + "','" + item.Value + "')", con);
                            cmd5.ExecuteNonQuery();
                        }
                    }

                    //storing in usertype table
                    SqlCommand cmd6 = new SqlCommand("INSERT INTO [User_Type](user_type_id, agent_id) VALUES ('" + usertypeid + "','" + usertypeid + "')", con);
                    cmd6.ExecuteNonQuery();

                    //storing in user table
                    SqlCommand cmd7 = new SqlCommand("INSERT INTO [User](user_type_id, f_name, l_name, phone_no, password, email) VALUES ('" + usertypeid + "','" + fname.Text + "','" + lname.Text + "','" + agentphone.Text + "','" + agentpass.Text + "','" + agentemail.Text + "')", con);
                    cmd7.ExecuteNonQuery();
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
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            //checking if the agency already exists in db
            SqlCommand com1 = new SqlCommand("SELECT * FROM [Agency] WHERE agency_email = '" + agencyemail.Text + "' AND agency_name = '" + agencyname.Text + "'", con);
            con.Open();
            SqlDataAdapter sda1 = new SqlDataAdapter(com1);
            DataTable dt1 = new DataTable();
            sda1.Fill(dt1);

            if (dt1.Rows.Count == 0) //if agency is not registered
            {
                Random random = new Random();
                activationcode = random.Next(1001, 9999).ToString();              
            }
            else if (dt1.Rows.Count != 0)
            {
                activationcode = Convert.ToString(dt1.Rows[0][4]);
            }
        }

        return activationcode;

    }

    //sending the activation code to agency's email address for verification
    private void sendcode()
    {
        if(agencyemail.Text == "")
        {
            lblagencyemail.Text = "Please enter Company Email to send the activation code";
        }
        else if(agencyemail.Text != "")
        {
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("Rentrackfyp@gmail.com", "contract123");
            smtp.EnableSsl = true;
            MailMessage msg = new MailMessage();
            msg.Subject = "Activation code to verify email address";
            msg.Body = "An agent from your agency wants to register with our website. The agent must enter the activation code below to successfuly register. \n\n The activation code is " + activationcode + "\n\n\nTeam Rentrack";
            string toAddress = agencyemail.Text;
            msg.To.Add(toAddress);
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