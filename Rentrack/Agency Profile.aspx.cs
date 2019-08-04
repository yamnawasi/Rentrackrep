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

public partial class Agency_Profile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["agency_id"] != null)
        {
            BindAgencyInfo();
            BindAgents();
            BindProperties();
        }
        else
        {
            Response.Redirect("~/Find Agent.aspx");
        }
    }

    private void BindAgencyInfo()
    {
        Int64 agencyid = Convert.ToInt64(Request.QueryString["agency_id"]);

        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            using (SqlCommand cmd = new SqlCommand("SELECT A.*, B.* FROM [Agency] A JOIN [Agency_Branch] B ON (A.agency_id = B.agency_id) WHERE A.agency_id ='" + agencyid + "'", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtagencyinfo = new DataTable();
                    sda.Fill(dtagencyinfo);
                    rptragencyinfo.DataSource = dtagencyinfo;
                    rptragencyinfo.DataBind();
                }
            }
        }
    }

    private void BindProperties()
    {
        Int64 agencyid = Convert.ToInt64(Request.QueryString["agency_id"]);

        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            using (SqlCommand cmd = new SqlCommand("SELECT A.*, B.*, C.* FROM [Property] A JOIN [Property_Image] B On (A.property_id = B.property_id) JOIN [Room_Description] C ON (A.room_desc_id = C.room_desc_id) WHERE B.main = 1 and A.agency_id ='" + agencyid + "'", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtprops = new DataTable();
                    sda.Fill(dtprops);
                    rptrprop.DataSource = dtprops;
                    rptrprop.DataBind();
                }
            }
        }
    }

    private void BindAgents()
    {
        Int64 agencyid = Convert.ToInt64(Request.QueryString["agency_id"]);

        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            using (SqlCommand cmd = new SqlCommand("SELECT A.agency_name, B.*, C.*, D.f_name, D.l_name, E.city_name FROM dbo.[Agency] A JOIN dbo.[Agent] B ON (A.agency_id = B.agency_id) JOIN dbo.[Agent_city] C ON (C.agent_id = B.agent_id) JOIN dbo.[User] D ON (D.user_type_id = B.agent_id) JOIN dbo.[City] E ON (C.city_id = E.city_id) WHERE B.agency_id ='" + agencyid + "'", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtagentlist = new DataTable();
                    sda.Fill(dtagentlist);
                    rptragent.DataSource = dtagentlist;
                    rptragent.DataBind();
                }
            }
        }
    }
}