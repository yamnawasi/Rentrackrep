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

public partial class propertylist : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindBuyCarousel();
        BindRentCarousel();
    }


    private void BindBuyCarousel()
    {
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("procBindAllBuy", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtBuyProps = new DataTable();
                    sda.Fill(dtBuyProps);
                    rptrbuy.DataSource = dtBuyProps;
                    rptrbuy.DataBind();
                }
            }
        }
    }

    private void BindRentCarousel()
    {
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("procBindAllRent", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtRentProps = new DataTable();
                    sda.Fill(dtRentProps);
                    rptrrent.DataSource = dtRentProps;
                    rptrrent.DataBind();
                }
            }
        }
    }
}