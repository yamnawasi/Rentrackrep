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

public partial class Find_Agent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindCities();
        }
    }

    private void BindCities()
    {
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM City", con);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count != 0)
            {
                cityddl.DataSource = dt;
                cityddl.DataTextField = "city_name";
                cityddl.DataValueField = "city_id";
                cityddl.DataBind();
                //cityddl.Items.Insert(0, new ListItem("- SELECT -", "0"));
            }
        }
    }

    private void BindAgentList()
    {
        string city = cityddl.SelectedValue;
        //Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('"+ city +"');", true);

        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            using (SqlCommand cmd = new SqlCommand("SELECT A.agency_name, B.*, C.*, D.f_name, D.l_name, E.city_name FROM dbo.[Agency] A JOIN dbo.[Agent] B ON (A.agency_id = B.agency_id) JOIN dbo.[Agent_city] C ON (C.agent_id = B.agent_id) JOIN dbo.[User] D ON (D.user_type_id = B.agent_id) JOIN dbo.[City] E ON (C.city_id = E.city_id) WHERE C.city_id ='" + city + "'", con))
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


    protected void Searchbtn_Click(object sender, EventArgs e)
    {
        if (Session["user_id"] == null)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Kindly log in to search for agents');", true);
        }
        else if (Session["user_id"] != null)
        {
            BindAgentList();
        }
    }
    
}