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
        if (Session["user_id"] != null)
        {
            BindContactForm();
        }
        if (Request.QueryString["property_id"] !=null)
        {
            if (!IsPostBack)
            {
                BindProductImages();
                BindPropDetails();
            }
        }
        else
        {
            Response.Redirect("~/propertylist.aspx");
        }
    }

    private void BindContactForm()
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

    private void BindPropDetails()
    {
        Int64 propertyid = Convert.ToInt64(Request.QueryString["property_id"]);

        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            using (SqlCommand cmd = new SqlCommand("SELECT A.*, B.*, C.area, D.subarea, E.* FROM dbo.[Property] A JOIN dbo.[Room_Description] B ON (A.room_desc_id = B.room_desc_id) JOIN dbo.[Area] C ON (A.area_id = C.area_id) JOIN dbo.[Subarea] D ON (A.subarea_id = D.subarea_id) JOIN dbo.[City] E ON (E.city_id = C.city_id) WHERE A.property_id='" + propertyid + "'", con))
            {             
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtpropdet = new DataTable();
                    sda.Fill(dtpropdet);
                    rptr.DataSource = dtpropdet;
                    rptr.DataBind();

                }
            }

        }
    }


    private void BindProductImages()
    {
        Int64 propertyid = Convert.ToInt64(Request.QueryString["property_id"]);


        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            using (SqlCommand cmd = new SqlCommand("SELECT * FROM Property_Image WHERE property_id='"+ propertyid +"'", con))
            {
                cmd.CommandType = CommandType.Text;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtpropimage = new DataTable();
                    sda.Fill(dtpropimage);
                    imagerepeater.DataSource = dtpropimage;
                    imagerepeater.DataBind();

                }
            }

        }
    }
     protected string GetActiveClass(int ItemIndex)
    {
        if(ItemIndex==0)
        {
            return "active";
        }
        else
        {
            return "";
        }
    }

    protected void Sendbtn_Click(object sender, EventArgs e)
    {
        if (Session["user_id"] == null)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('You must log in to contact the owner.');", true);
        }
        else if (Session["user_id"] != null)
        {
            SendEmail();
        }
        
    }
    private void SendEmail()
    {
        //Get Owner Email
        string owneremail = "";
        int userid = Convert.ToInt32(Session["user_id"].ToString());

        Int64 propid = Convert.ToInt64(Request.QueryString["property_id"]);

        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            SqlCommand cmdd = new SqlCommand("SELECT B.email FROM dbo.[Property] A JOIN dbo.[User] B ON (A.user_id = B.user_id) WHERE property_id ='" + propid + "'", con);
            SqlDataReader reader = cmdd.ExecuteReader();
            while (reader.Read())
            {
                owneremail = reader[0].ToString();
            }
            reader.Close();
        }
        Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('" + owneremail + "');", true);


        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        smtp.Port = 587;
        smtp.Credentials = new System.Net.NetworkCredential("Rentrackfyp@gmail.com", "contract123");
        smtp.EnableSsl = true;
        MailMessage msg = new MailMessage();
        msg.Subject = tbname.Text + " is Interested in your Propety";
        msg.Body = tbname.Text + " is interested in your property. Kindly get back to them at the earliest convenience. \n\nName: " + tbname.Text + "\nEmail Address: " + tbemail.Text + "\nPhone Number: " + tbphone.Text + "\nMessage: " + tbmsg.Text + "\n\nRegards,\nTeam Rentrack";
        msg.To.Add(owneremail);
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


    
