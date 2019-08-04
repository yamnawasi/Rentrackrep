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

public partial class contract : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
        }
   
    }

    protected void Generate_btn(object sender, EventArgs e)
    {
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            int userid = Convert.ToInt32(Session["user_id"].ToString());
            //into Contract_Formm table
            SqlCommand cmd1 = new SqlCommand("INSERT INTO [Contract_Form](landlord_fname, landlord_lname, landlord_father,landlord_cnic, landlord_phone,landlord_address,property_address) VALUES ('" + tblndfname + "','" + tblndlname + "','" + lndlrdparent + "','" + lndlrdcnicnum + "','" + tblndphone + "','" + tblndaddress + "','" + tbrntaddress + "')", con);
            cmd1.ExecuteNonQuery();

            SqlCommand cmd2 = new SqlCommand("INSERT INTO [Contract_Form](tenant_fname, tenant_lname, tenant_father,tenant_cnic, tenant_phone,tenant_address) VALUES ('" + tbtntfname + "','" + tbtntlname+ "','" + tntparent + "','" + tntcnicnum + "','" + tbtntphone + "','" + tntaddress + "','" + tbrntaddress + "')", con);
            cmd2.ExecuteNonQuery();

            SqlCommand cmd3 = new SqlCommand("INSERT INTO [Contract_Form](rent, fixed_deposit,start_date,end_date,contract_life) VALUES ('" + tbrent + "','" + tbfxd + "','" + tbstart + "','" + tbend + "','" + Cntrctlife + "')", con);
            cmd3.ExecuteNonQuery();



        }



    }

    


}