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

public partial class Tenant_Resume_Public : System.Web.UI.Page
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
                string ID = Request.QueryString["userid"];

                String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    //getting usertypeid for tenantid
                    SqlCommand com = new SqlCommand("SELECT user_type_id FROM [User] WHERE user_id = '" + ID + "'", con);
                    con.Open();
                    string usertypeid = com.ExecuteScalar().ToString();
                    com.ExecuteNonQuery();

                    //checking if tenant resume of the user exists
                    SqlCommand fcmd = new SqlCommand("SELECT * FROM [Tenant_Resume] WHERE tenant_id = '" + usertypeid + "'", con);
                    SqlDataAdapter fsda = new SqlDataAdapter(fcmd);
                    DataTable fdt = new DataTable();
                    fsda.Fill(fdt);

                    if (fdt.Rows.Count == 0) //user has no tenant resume
                    {
                        lbltntid.Text = "This user does not have a Tenant Resume";
                    }
                    else if (fdt.Rows.Count != 0)//user has tenant resume
                    {
                        BindUserProf(ID);
                    }
                }
            }
        }
    }

    private void BindUserProf(string ID)
    {
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("procBindTenantRes", con))
            {
                SqlDataAdapter adapter = new SqlDataAdapter();
                DataSet dsusr = new DataSet();
                con.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@uid", ID);
                adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dsusr);
                con.Close();
                rptrusr.DataSource = dsusr;
                rptrusr.DataBind();

            }
        }
    }

    protected void Accept_click(object sender, EventArgs e)
    {
        string tentusrid = Request.QueryString["userid"];
        string landusrid = Session["user_id"].ToString();

        string notifid = Request.QueryString["notifid"];

        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand gettntid = new SqlCommand("SELECT user_type_id FROM [User] WHERE user_id = '" + tentusrid + "'", con);
            con.Open();
            string tenantid = gettntid.ExecuteScalar().ToString();
            gettntid.ExecuteNonQuery();

            SqlCommand getlndid = new SqlCommand("SELECT user_type_id FROM [User] WHERE user_id = '" + landusrid + "'", con);
            string landlordid = getlndid.ExecuteScalar().ToString();
            getlndid.ExecuteNonQuery();

            //Hide Interested Buyer/Tenant Notifcation
            HideNotification();

            //Generate Create Contract Notification
            SendContractNotification(tenantid, landlordid);

            Response.Redirect("contract.aspx?tenantid=" + tenantid + "&landlordid=" + landlordid);           
        }

        
    }

    protected void Reject_click(object sender, EventArgs e)
    {       
        string delmessage = "This user's request has been removed from your notifications.";
        Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('" + delmessage + "');", true);
        HideNotification();
    }

    protected void HideNotification()
    {
        string notifid = Request.QueryString["notifid"];
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand hidenotif = new SqlCommand("UPDATE dbo.[Notification] SET is_viewed = '" + 1 + "' WHERE notif_id = '" + notifid + "'", con);
            con.Open();
            hidenotif.ExecuteNonQuery();
        }
    }

    private void SendContractNotification(string tenantid, string landlordid)
    {
        string propid = "", propertytitle = "", fname = "", lname = "";
        string notifid = Request.QueryString["notifid"];

        string tentusrid = Request.QueryString["userid"];
        string landusrid = Session["user_id"].ToString();

        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();

            //Get Property ID and Property Title
            SqlCommand cmdd = new SqlCommand("SELECT A.property_id, A.property_title FROM dbo.[Property] A JOIN dbo.[Notification] B ON (A.property_id = B.property_id) WHERE B.notif_id ='" + Convert.ToInt32(notifid) + "'", con);
            SqlDataReader reader = cmdd.ExecuteReader();
            while (reader.Read())
            {
                propid = reader[0].ToString();
                propertytitle = reader[1].ToString();
            }
            reader.Close();

            //Get Tenant's Name
            SqlCommand getname = new SqlCommand("SELECT l_name, f_name FROM dbo.[USER] A JOIN dbo.[USER_TYPE] B ON (A.user_type_id = B.user_type_id) WHERE B.tenant_id ='" + tenantid + "'", con);
            SqlDataReader nreader = getname.ExecuteReader();
            while (nreader.Read())
            {
                fname = nreader[1].ToString();
                lname = nreader[0].ToString();
            }
            nreader.Close();

            //Notification Text
            string notiftext = "Would you like to send a Tenancy Agreement to " + fname + " " + lname + " for property, " + propertytitle + "?";

            //Store in Notification Table
            DateTime today = DateTime.Today;
            SqlCommand createnotif = new SqlCommand("INSERT INTO dbo.[Notification] (notif_type, creation_date, is_viewed, sender_id, receiver_id, notification_text, property_id, btn_text) VALUES ('" + "Create Contract" + "','" + today + "','" + 0 + "','" + tentusrid + "','" + landusrid + "','" + notiftext + "','" + propid + "','" + "Create Contract" + "')", con);
            createnotif.ExecuteNonQuery();

            //Get Notif ID
            SqlCommand getrdid = new SqlCommand("SELECT TOP 1 * FROM dbo.[Notification] ORDER BY notif_id DESC", con);
            getrdid.ExecuteNonQuery();
            int notifidtab;
            notifidtab = (int)getrdid.ExecuteScalar();

            //Create link
            string btnlink = "contract.aspx?tenantid=" + tenantid + "&landlordid=" + landlordid + "&notifid=" + notifidtab;

            //Add Button Link
            SqlCommand updatenotif = new SqlCommand("UPDATE dbo.[Notification] SET btn_link = '" + btnlink + "' WHERE notif_id = '" + notifidtab + "'", con);
            updatenotif.ExecuteNonQuery();
        }
    }
}