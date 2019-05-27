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
using System.Net.Mail;
using System.Net;

public partial class ForgotPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void BtPassRec_Click(object sender, EventArgs e)
    {
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM [User] WHERE email='" + tbemail.Text + "'", con);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count != 0)
            {
                String myGUID = Guid.NewGuid().ToString();
                int user_id = Convert.ToInt32(dt.Rows[0][0]);
                SqlCommand cmd1 = new SqlCommand("INSERT INTO [ForgotPassword_Requests] VALUES('" + myGUID + "','" + user_id + "',getdate())", con);
                cmd1.ExecuteNonQuery();

                //send email
                String ToEmailAddress = dt.Rows[0][9].ToString();
                String Username = dt.Rows[0][2].ToString();
                String EmailBody = "Hi " + Username + ",<br/><br/> Click the link below to reset your password <br/><br/> http://localhost:51175/RecoverPassword.aspx?user_id=" + myGUID + "<br/><br/><br/>Team Rentrack";
                MailMessage PassRecMail = new MailMessage("Rentrackfyp@gmail.com", ToEmailAddress);
                PassRecMail.Body = EmailBody;
                PassRecMail.IsBodyHtml = true;
                PassRecMail.Subject = "Reset Password";

                //SmtpClient SMTP = new SmtpClient("smtp-mail.outlook.com", 587);
                SmtpClient SMTP = new SmtpClient("smtp.gmail.com", 587);
                SMTP.Credentials = new NetworkCredential()
                {
                    UserName = "Rentrackfyp@gmail.com",
                    Password = "contract123"
                };
                SMTP.EnableSsl = true;
                SMTP.Send(PassRecMail);

                lblPassRec.Text = "Check your email to reset your password.";
                lblPassRec.ForeColor = Color.Green;

            }
            else
            {
                lblPassRec.Text = "This email is not registered with this website";
                lblPassRec.ForeColor = Color.Red;
            }
        }
    }
}