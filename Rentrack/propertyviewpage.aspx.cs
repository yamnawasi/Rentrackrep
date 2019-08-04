using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.Drawing;
using System.IO;


public partial class propertyviewpage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           
        }
    }
    protected void email_Click(object sender, EventArgs e)
    {
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("Rentrackfyp@gmail.com", "contract123");
            smtp.EnableSsl = true;
            MailMessage msg = new MailMessage();
            msg.Subject = "You have a potential buyer";
            msg.Body = "Buyer Details\n\n\nTeam Rentrack";
            string toAddress = buyemail.Text;
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