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

public partial class SellingStatus : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user_id"] != null)
        {
            BindQuestion();
            detailsdiv.Visible = false;
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }

    private void BindQuestion()
    {
        string propid = Request.QueryString["propid"];
        string buyerusrid = Request.QueryString["buyerusrid"];
        string sellerusrid = Request.QueryString["buyerusrid"];
        string proptitle = "", bfname = "", blname = "";

        //Get Property Title
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            SqlCommand cmdd = new SqlCommand("SELECT property_title FROM dbo.[Property] WHERE property_id ='" + propid + "'", con);
            SqlDataReader reader = cmdd.ExecuteReader();
            while (reader.Read())
            {
                proptitle = reader[0].ToString();
            }
            reader.Close();

            //Get Buyer fname/lname
            SqlCommand cmd2 = new SqlCommand("SELECT f_name, l_name FROM dbo.[User] WHERE user_id ='" + buyerusrid + "'", con);
            SqlDataReader nreader = cmd2.ExecuteReader();
            while (nreader.Read())
            {
                bfname = nreader[0].ToString();
                blname = nreader[1].ToString();
            }
            nreader.Close();
        }
        proptitlelbl.Text = proptitle;
        buyernamelbl.Text = bfname + " " + blname;

    }

    protected void Reject_click(object sender, EventArgs e)
    {
        string notifiid = Request.QueryString["notifid"];
        HideNotifi(notifiid);
    }

    //Hide Notification
    protected void HideNotifi(string notifi_id)
    {
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand hidenotifx = new SqlCommand("UPDATE dbo.[Notification] SET is_viewed = '" + 1 + "' WHERE notif_id = '" + notifi_id + "'", con);
            con.Open();
            hidenotifx.ExecuteNonQuery();
        }
    }

    protected void submit_click(object sender, EventArgs e)
    {
        string propid = Request.QueryString["propid"];
        string buyerusrid = Request.QueryString["buyerusrid"];
        string sellerusrid = Request.QueryString["sellerusrid"];

        string byrid = "", sellid = "";

        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            //Update is_sold in Property Table
            SqlCommand updateproptable = new SqlCommand("UPDATE dbo.[Property] SET is_sold = '" + 1 + "' WHERE property_id = '" + propid + "'", con);
            updateproptable.ExecuteNonQuery();

            //Get buyerid from User type
            SqlCommand getbuyerid = new SqlCommand("SELECT B.buyer_id FROM dbo.[USER] A JOIN dbo.[USER_TYPE] B ON (A.user_type_id = B.user_type_id) WHERE A.user_id ='" + buyerusrid + "'", con);
            SqlDataReader breader = getbuyerid.ExecuteReader();
            while (breader.Read())
            {
                byrid = breader[0].ToString();
            }
            breader.Close();

            //Get sellerid from User type
            SqlCommand getsellerid = new SqlCommand("SELECT B.seller_id FROM dbo.[USER] A JOIN dbo.[USER_TYPE] B ON (A.user_type_id = B.user_type_id) WHERE A.user_id ='" + sellerusrid + "'", con);
            SqlDataReader sreader = getsellerid.ExecuteReader();
            while (sreader.Read())
            {
                sellid = sreader[0].ToString();
            }
            sreader.Close();

            //Add to Sold_Property
            SqlCommand addtosoldprop = new SqlCommand("INSERT INTO dbo.[Sold_Property] (property_id, seller_id, buyer_id, date_sold, cost) VALUES ('" + propid + "','" + sellid + "','" + byrid + "','" + tbdate.Text + "','" + tbprice.Text + "')", con);
            addtosoldprop.ExecuteNonQuery();
        }

        string notifiid = Request.QueryString["notifid"];
        HideNotifi(notifiid);

        Response.Redirect("Dashboard.aspx");
    }

    protected void Accept_click(object sender, EventArgs e)
    {       
        accbtn.Visible = false;
        rejbtn.Visible = false;

        detailsdiv.Visible = true;
    }
}