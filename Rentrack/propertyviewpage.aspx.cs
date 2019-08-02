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
            BindProductImages();
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

}


    
