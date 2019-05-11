using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;
using System.IO;
using System.Windows.Forms;


public partial class Sign_Up : System.Web.UI.Page
{
    Int32 temp = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        DateRangeValidator.MinimumValue = DateTime.Today.AddYears(-80).ToShortDateString();
        DateRangeValidator.MaximumValue = DateTime.Today.AddYears(-18).ToShortDateString();

        if (IsPostBack)
        {

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString);
            conn.Open();
            string checkuser = "select count(*) from [User] where email='" + tbemail.Text + "'";

            SqlCommand com = new SqlCommand(checkuser, conn);
            int temp = Convert.ToInt32(com.ExecuteScalar().ToString());

            if (temp > 0)
            {
                DialogResult dialogResult = MessageBox.Show("An account with this email address already exists. Would you like to log in?", "Account already exists", MessageBoxButtons.YesNo);
                if (dialogResult == DialogResult.Yes)
                {
                    Response.Redirect("Login.aspx");
                }
                else if (dialogResult == DialogResult.No)
                {
                    Response.Redirect("Sign Up.aspx");
                }
            }

            conn.Close();

        }
    }

    protected void signup_btn(object sender, EventArgs e)
    {
        if (tbfname.Text != "" & tblname.Text != "" && tbaddress.Text != "" && tbdcity.Text != "" && tbdob.Text != "" && tbphone.Text != "" && tbpassword.Text != "" && tbemail.Text != "")
        {
            if (tbpassword.Text == tbrepassword.Text)
            {

                String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    //storing city in city table and assigning it's id
                    SqlCommand com = new SqlCommand("SELECT city_id FROM [City] WHERE city_name = '" + tbdcity.SelectedValue + "'", con);
                    con.Open();
                    int tbcity = (int)com.ExecuteScalar();
                    com.ExecuteNonQuery();
                    com.Parameters.Clear();

                    //assigning usertypeid to other user ids
                    SqlCommand cmd1 = new SqlCommand("SELECT user_type_id FROM [User_Type] ORDER BY[user_type_id] DESC ", con);
                    cmd1.ExecuteNonQuery();

                    
                    if (cmd1.ExecuteScalar() != null) //if user_type_id is not null
                    {
                        int usertypeid = (int)cmd1.ExecuteScalar();
                        usertypeid += 1;
                        SqlCommand cmd2 = new SqlCommand("INSERT INTO [Seller](seller_id) VALUES ('" + usertypeid + "')", con);
                        SqlCommand cmd3 = new SqlCommand("INSERT INTO[Buyer](buyer_id)VALUES('" + usertypeid + "')", con);
                        SqlCommand cmd4 = new SqlCommand("INSERT INTO[Landlord](landlord_id)VALUES('" + usertypeid + "')" , con);
                        SqlCommand cmd5 = new SqlCommand("INSERT INTO[Tenant](tenant_id)VALUES('" + usertypeid + "')", con);
                        cmd2.ExecuteNonQuery();
                        cmd3.ExecuteNonQuery();
                        cmd4.ExecuteNonQuery();
                        cmd5.ExecuteNonQuery();
                        SqlCommand cmd6 = new SqlCommand("INSERT INTO [User_Type](user_type_id, landlord_id, tenant_id, buyer_id, seller_id) VALUES ('" + usertypeid + "','" + usertypeid + "','" + usertypeid + "','" + usertypeid + "','" + usertypeid + "')", con);
                        cmd6.ExecuteNonQuery();
                        
                        //storing in user table
                        SqlCommand cmd = new SqlCommand("INSERT INTO [User](user_type_id, f_name, l_name, address, dob, phone_no, password, email, city_id) VALUES ('" + usertypeid + "','" + tbfname.Text + "','" + tblname.Text + "','" + tbaddress.Text + "','" + tbdob.Text + "','" + tbphone.Text + "','" + tbpassword.Text + "','" + tbemail.Text + "','" + tbcity + "')", con);
                        cmd.ExecuteNonQuery();

                    }
                    else if(cmd1.ExecuteScalar() == null) //if user_type_id is null
                    {
                        int usertypeid = 0;
                        usertypeid += 1;
                        SqlCommand cmd2 = new SqlCommand("INSERT INTO [Seller](seller_id) VALUES ('" + usertypeid + "')", con);
                        SqlCommand cmd3 = new SqlCommand("INSERT INTO[Buyer](buyer_id)VALUES('" + usertypeid + "')", con);
                        SqlCommand cmd4 = new SqlCommand("INSERT INTO[Landlord](landlord_id)VALUES('" + usertypeid + "')", con);
                        SqlCommand cmd5 = new SqlCommand("INSERT INTO[Tenant](tenant_id)VALUES('" + usertypeid + "')", con);
                        cmd2.ExecuteNonQuery();
                        cmd3.ExecuteNonQuery();
                        cmd4.ExecuteNonQuery();
                        cmd5.ExecuteNonQuery();
                        SqlCommand cmd6 = new SqlCommand("INSERT INTO [User_Type](user_type_id, landlord_id, tenant_id, buyer_id, seller_id) VALUES ('" + usertypeid + "','" + usertypeid + "','" + usertypeid + "','" + usertypeid + "','" + usertypeid + "')", con);
                        cmd6.ExecuteNonQuery();

                        //storing in user table
                        SqlCommand cmd = new SqlCommand("INSERT INTO [User](user_type_id, f_name, l_name, address, dob, phone_no, password, email, city_id) VALUES ('" + usertypeid + "','" + tbfname.Text + "','" + tblname.Text + "','" + tbaddress.Text + "','" + tbdob.Text + "','" + tbphone.Text + "','" + tbpassword.Text + "','" + tbemail.Text + "','" + tbcity + "')", con);
                        cmd.ExecuteNonQuery();
                    }

                    Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Your account has been created successfully');", true);
                }

            }
            else
            {
                lblMsg.ForeColor = Color.Red;
                lblMsg.Text = "Passwords do not match";
            }
        }
        else
        {
            lblMsg.ForeColor = Color.Red;
            lblMsg.Text = "All Fields Are Mandatory";

        }
    }
}