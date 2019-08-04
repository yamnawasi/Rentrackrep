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
}