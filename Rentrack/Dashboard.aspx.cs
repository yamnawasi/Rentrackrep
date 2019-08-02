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

public partial class Dashboard : System.Web.UI.Page
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
                        agsellinghistory.Visible = false;
                        aglistings.Visible = false;

                        BindSoldPropRptr();
                        BindBoughtPropRptr();
                        BindLandlordPropRptr();
                        BindTenantPropRptr();
                        BindForSaleRptr();
                        BindForRentRptr();
                    }
                    else
                    {
                        sellinghistory.Visible = false;
                        rentinghistory.Visible = false;
                        currentlylisted.Visible = false;
                        btndiv.Visible = false;

                        BindAgentSoldPropRptr();
                        BindAgentRentedPropRptr();
                        BindAgentListingsRptr();
                    }
                }
                
            }
        }
    }

    private void BindAgentListingsRptr()
    {
        int userid = Convert.ToInt32(Session["user_id"].ToString());
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("Select A.*, B.* FROM [Property] A JOIN dbo.[USER] B ON (A.owner_id = B.user_id) WHERE A.user_id ='" + userid + "'", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtaglisting = new DataTable();
                    sda.Fill(dtaglisting);
                    rptraglistings.DataSource = dtaglisting;
                    rptraglistings.DataBind();
                    if (dtaglisting.Rows.Count == 0)
                    {
                        forsalemsg.Text = "You do not have any properties currently up for sale or rent.";
                    }
                }
            }
        }
    }

    private void BindAgentSoldPropRptr()
    {
        int userid = Convert.ToInt32(Session["user_id"].ToString());
        string usertypeid = "";
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            //Get User Type ID
            con.Open();
            SqlCommand getusertypeid = new SqlCommand("SELECT user_type_id FROM [USER] WHERE user_id = '" + userid + "'", con);
            SqlDataReader reader = getusertypeid.ExecuteReader();
            while (reader.Read())
            {
                usertypeid = reader[0].ToString();
            }

            reader.Close();
            using (SqlCommand cmd = new SqlCommand("Select A.*, B.*, C.f_name, C.l_name FROM Sold_Property A JOIN Property B ON (A.property_id = B.property_id) JOIN dbo.[User] C ON (A.seller_id = C.user_type_id) WHERE A.agent_id ='" + Convert.ToInt32(usertypeid) + "'", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtagsoldprop = new DataTable();
                    sda.Fill(dtagsoldprop);
                    rptragsold.DataSource = dtagsoldprop;
                    rptragsold.DataBind();
                    if (dtagsoldprop.Rows.Count == 0)
                    {
                        agsoldmsg.Text = "You have not sold any properties yet.";
                    }
                }
            }
        }

    }

    private void BindAgentRentedPropRptr()
    {
        int userid = Convert.ToInt32(Session["user_id"].ToString());
        string usertypeid = "";
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            //Get User Type ID
            con.Open();
            SqlCommand getusertypeid = new SqlCommand("SELECT user_type_id FROM [USER] WHERE user_id = '" + userid + "'", con);
            SqlDataReader reader = getusertypeid.ExecuteReader();
            while (reader.Read())
            {
                usertypeid = reader[0].ToString();
            }

            reader.Close();
            using (SqlCommand cmd = new SqlCommand("Select A.*, B.*, C.f_name, C.l_name FROM Rented_Property A JOIN Property B ON (A.property_id = B.property_id) JOIN dbo.[User] C ON (A.landlord_id = C.user_type_id) WHERE A.agent_id ='" + Convert.ToInt32(usertypeid) + "'", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtagrentprop = new DataTable();
                    sda.Fill(dtagrentprop);
                    rptragrented.DataSource = dtagrentprop;
                    rptragrented.DataBind();
                    if (dtagrentprop.Rows.Count == 0)
                    {
                        agsoldmsg.Text = "You have not rented any properties yet.";
                    }
                }
            }
        }

    }

    private void BindSoldPropRptr()
    {
        int userid = Convert.ToInt32(Session["user_id"].ToString());
        string usertypeid = "";
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            //Get User Type ID
            con.Open();
            SqlCommand getusertypeid = new SqlCommand("SELECT user_type_id FROM [USER] WHERE user_id = '" + userid + "'", con);
            SqlDataReader reader = getusertypeid.ExecuteReader();
            while (reader.Read())
            {
                usertypeid = reader[0].ToString();
            }

            reader.Close();
            using (SqlCommand cmd = new SqlCommand("Select A.*, B.*, C.f_name, C.l_name FROM Sold_Property A JOIN Property B ON (A.property_id = B.property_id) JOIN dbo.[User] C ON (A.buyer_id = C.user_type_id) WHERE A.seller_id ='" + Convert.ToInt32(usertypeid) + "'", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtsoldprop = new DataTable();
                    sda.Fill(dtsoldprop);
                    rptrsoldprop.DataSource = dtsoldprop;
                    rptrsoldprop.DataBind();
                    if (dtsoldprop.Rows.Count == 0)
                    {
                        soldpropmsg.Text = "You have not sold any properties yet.";
                    }
                }
            }
        }

    }

    private void BindBoughtPropRptr()
    {
        int userid = Convert.ToInt32(Session["user_id"].ToString());
        string usertypeid = "";
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            //Get User Type ID
            con.Open();
            SqlCommand getusertypeid = new SqlCommand("SELECT user_type_id FROM [USER] WHERE user_id = '" + userid + "'", con);
            SqlDataReader reader = getusertypeid.ExecuteReader();
            while (reader.Read())
            {
                usertypeid = reader[0].ToString();
            }

            reader.Close();
            using (SqlCommand cmd = new SqlCommand("Select A.*, B.*, C.f_name, C.l_name FROM Sold_Property A JOIN Property B ON (A.property_id = B.property_id) JOIN dbo.[User] C ON (A.seller_id = C.user_type_id) WHERE A.buyer_id ='" + Convert.ToInt32(usertypeid) + "'", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtboughtprop = new DataTable();
                    sda.Fill(dtboughtprop);
                    rptrboughtprop.DataSource = dtboughtprop;
                    rptrboughtprop.DataBind();
                    if (dtboughtprop.Rows.Count == 0)
                    {
                        boughtproptext.Text = "You have not bought any properties yet.";
                    }
                }
            }
        }
    }

    private void BindLandlordPropRptr()
    {
        int userid = Convert.ToInt32(Session["user_id"].ToString());
        string usertypeid = "";
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            //Get User Type ID
            con.Open();
            SqlCommand getusertypeid = new SqlCommand("SELECT user_type_id FROM [USER] WHERE user_id = '" + userid + "'", con);
            SqlDataReader reader = getusertypeid.ExecuteReader();
            while (reader.Read())
            {
                usertypeid = reader[0].ToString();
            }

            reader.Close();
            using (SqlCommand cmd = new SqlCommand("Select A.*, B.*, C.f_name, C.l_name FROM Rented_Property A JOIN Property B ON (A.property_id = B.property_id) JOIN dbo.[User] C ON (A.tenant_id = C.user_type_id) WHERE A.landlord_id ='" + Convert.ToInt32(usertypeid) + "'", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtllprop = new DataTable();
                    sda.Fill(dtllprop);
                    rptrlandlord.DataSource = dtllprop;
                    rptrlandlord.DataBind();
                    if (dtllprop.Rows.Count == 0)
                    {
                        llpropmsg.Text = "You have not rented any properties to anyone.";
                    }
                }
            }
        }
    }

    private void BindTenantPropRptr()
    {
        int userid = Convert.ToInt32(Session["user_id"].ToString());
        string usertypeid = "";
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            //Get User Type ID
            con.Open();
            SqlCommand getusertypeid = new SqlCommand("SELECT user_type_id FROM [USER] WHERE user_id = '" + userid + "'", con);
            SqlDataReader reader = getusertypeid.ExecuteReader();
            while (reader.Read())
            {
                usertypeid = reader[0].ToString();
            }

            reader.Close();
            using (SqlCommand cmd = new SqlCommand("Select A.*, B.*, C.f_name, C.l_name FROM Rented_Property A JOIN Property B ON (A.property_id = B.property_id) JOIN dbo.[User] C ON (A.landlord_id = C.user_type_id) WHERE A.tenant_id ='" + Convert.ToInt32(usertypeid) + "'", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dttprop = new DataTable();
                    sda.Fill(dttprop);
                    rptrtenant.DataSource = dttprop;
                    rptrtenant.DataBind();
                    if (dttprop.Rows.Count == 0)
                    {
                        tenpropmsg.Text = "You have not rented any properties from anyone.";
                    }
                }
            }
        }
    }

    private void BindForSaleRptr()
    {
        int userid = Convert.ToInt32(Session["user_id"].ToString());
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("Select A.*, B.* FROM [Property] A FULL JOIN [AGENCY] B ON (A.agency_id = B.agency_id) WHERE property_purpose = 'Sell' and owner_id ='" + userid + "'", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtforsale = new DataTable();
                    sda.Fill(dtforsale);
                    rptrforsale.DataSource = dtforsale;
                    rptrforsale.DataBind();
                    if (dtforsale.Rows.Count == 0)
                    {
                        forsalemsg.Text = "You do not have any properties for sale.";
                    }
                }
            }
        }
    }

    private void BindForRentRptr()
    {
        int userid = Convert.ToInt32(Session["user_id"].ToString());
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("Select A.*, B.* FROM [Property] A FULL JOIN [AGENCY] B ON (A.agency_id = B.agency_id) WHERE property_purpose = 'Rent' and owner_id ='" + userid + "'", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtforrent = new DataTable();
                    sda.Fill(dtforrent);
                    rptrforrent.DataSource = dtforrent;
                    rptrforrent.DataBind();
                    if (dtforrent.Rows.Count == 0)
                    {
                        forrentmsg.Text = "You do not have any properties for rent.";
                    }
                }
            }
        }
    }


}