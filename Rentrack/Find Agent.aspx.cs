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
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            //con.Open();

            /*using (SqlCommand cmd = new SqlCommand("SELECT A.*, B.*,C.agency_name FROM User A JOIN Agent B on A.user_type_id = B.agent_id INNER JOIN Agency C ON C.agency_id = B.agency_id WHERE Agent_City.city_id ='" + city + "'", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtBuyPropsUnder = new DataTable();
                    sda.Fill(dtBuyPropsUnder);
                    rptragent.DataSource = dtBuyPropsUnder;
                    rptragent.DataBind();
                }
            }*/
        }
    }


    protected void Searchbtn_Click(object sender, EventArgs e)
    {
        BindAgentList();
    }
}