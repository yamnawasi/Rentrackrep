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
        BindBuyRecentCarousel();
        BindBuyUnderCarousel();
        BindRentCarousel();
    }


    private void BindBuyRecentCarousel()
    {
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("procBindAllBuy", con))
            {
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

    private void BindBuyUnderCarousel()
    {
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT top 5 A.*, B.*, C.area, D.no_of_bedrooms, D.no_of_bathrooms FROM Property A join Room_Description D on D.room_desc_id = A.room_desc_id inner join Area C on C.area_id = A.area_id cross apply(select top 1 * from Property_Image B where B.property_id = A.property_id AND B.main = 1 order by B.property_id desc) B where A.property_purpose = 'Sell' AND A.property_price < 50000000 AND A.property_type = 'House' order by A.property_price desc", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtBuyPropsUnder = new DataTable();
                    sda.Fill(dtBuyPropsUnder);
                    rptrbuyunder.DataSource = dtBuyPropsUnder;
                    rptrbuyunder.DataBind();
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