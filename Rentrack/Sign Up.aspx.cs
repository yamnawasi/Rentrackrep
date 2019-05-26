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
    protected void Page_Load(object sender, EventArgs e)
    {
        DateRangeValidator.MinimumValue = DateTime.Today.AddYears(-90).ToShortDateString();
        DateRangeValidator.MaximumValue = DateTime.Today.AddYears(-18).ToShortDateString();
    }

    protected void Signup_btn(object sender, EventArgs e)
    {

        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            bool inputIsValid = true;

            //checking if email already exists
            var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString);
            var emailCmd = new SqlCommand("SELECT 1 FROM [User] WHERE email = @UserEmail", conn);

            conn.Open();
            emailCmd.Parameters.AddWithValue("@UserEmail", tbemail.Text);

            using (var emailReader = emailCmd.ExecuteReader())
            {
                if (emailReader.HasRows)
                {
                    inputIsValid = false;
                    lblemail.Text = "Email address already exists";
                }
            }
            conn.Close();

            if (inputIsValid)
            {
                //storing city in city table and assigning its id
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
                    SqlCommand cmd4 = new SqlCommand("INSERT INTO[Landlord](landlord_id)VALUES('" + usertypeid + "')", con);
                    SqlCommand cmd5 = new SqlCommand("INSERT INTO[Tenant](tenant_id)VALUES('" + usertypeid + "')", con);
                    cmd2.ExecuteNonQuery();
                    cmd3.ExecuteNonQuery();
                    cmd4.ExecuteNonQuery();
                    cmd5.ExecuteNonQuery();

                    //storing in usertype table
                    SqlCommand cmd6 = new SqlCommand("INSERT INTO [User_Type](user_type_id, landlord_id, tenant_id, buyer_id, seller_id) VALUES ('" + usertypeid + "','" + usertypeid + "','" + usertypeid + "','" + usertypeid + "','" + usertypeid + "')", con);
                    cmd6.ExecuteNonQuery();

                    //storing in user table
                    SqlCommand cmd = new SqlCommand("INSERT INTO [User](user_type_id, f_name, l_name, address, dob, phone_no, password, email, city_id) VALUES ('" + usertypeid + "','" + tbfname.Text + "','" + tblname.Text + "','" + tbaddress.Text + "','" + tbdob.Text + "','" + tbphone.Text + "','" + tbpassword.Text + "','" + tbemail.Text + "','" + tbcity + "')", con);
                    cmd.ExecuteNonQuery();

                }
                else if (cmd1.ExecuteScalar() == null) //if usertype table is empty and user_type id is null
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

                    //storing in usertype table
                    SqlCommand cmd6 = new SqlCommand("INSERT INTO [User_Type](user_type_id, landlord_id, tenant_id, buyer_id, seller_id) VALUES ('" + usertypeid + "','" + usertypeid + "','" + usertypeid + "','" + usertypeid + "','" + usertypeid + "')", con);
                    cmd6.ExecuteNonQuery();

                    //storing in user table
                    SqlCommand cmd = new SqlCommand("INSERT INTO [User](user_type_id, f_name, l_name, address, dob, phone_no, password, email, city_id) VALUES ('" + usertypeid + "','" + tbfname.Text + "','" + tblname.Text + "','" + tbaddress.Text + "','" + tbdob.Text + "','" + tbphone.Text + "','" + tbpassword.Text + "','" + tbemail.Text + "','" + tbcity + "')", con);
                    cmd.ExecuteNonQuery();
                }

                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Your account has been created successfully');", true);

            }
            con.Close();
        }
    }

}