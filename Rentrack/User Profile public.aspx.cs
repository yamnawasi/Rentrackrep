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

public partial class User_Profile_public : System.Web.UI.Page
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
                string ID = Request.QueryString["userid"];
                BindUserProf(ID);

                String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    //checking if any reviews exist of this user
                    SqlCommand revcmd = new SqlCommand("SELECT * FROM [User_Review] WHERE reviewee_id = '" + ID + "'", con);
                    con.Open();
                    SqlDataAdapter revsda = new SqlDataAdapter(revcmd);
                    DataTable revdt = new DataTable();
                    revsda.Fill(revdt);

                    if (revdt.Rows.Count == 0)//no reviews
                    {
                        lblrevid.Text = "This user has no reviews";
                    }
                    if (revdt.Rows.Count != 0)//reviews exist
                    {
                        BindUserRev(ID);
                    }

                }
            } 
        }
    }

    private void BindUserProf(string ID)
    {
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("procBindUser", con))
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

    private void BindUserRev(string ID)
    {
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("procBindUserRev", con))
            {
                SqlDataAdapter adapter = new SqlDataAdapter();
                DataSet dsrv = new DataSet();
                con.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@uid", ID);
                adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dsrv);
                con.Close();
                revrptr.DataSource = dsrv;
                revrptr.DataBind();
            }
        }
    }

    protected void Revsave_click(object sender, EventArgs e)
    {
        string reverid = Session["user_id"].ToString();
        string reveeid = Request.QueryString["userid"];

        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            if (tbrev != null)
            {
                SqlCommand cmd2 = new SqlCommand("INSERT INTO [User_Review](reviewee_id, reviewer_id, reviewer_type, reviewee_type, user_review) VALUES ('" + reveeid + "', '" + reverid + "', '" + revr.SelectedValue + "','" + revee.SelectedValue + "','" + tbrev.Text + "')", con);
                con.Open();
                cmd2.ExecuteNonQuery();
            }

            tbrev.Text = "";
            BindUserRev(reveeid);
        }
    }
}