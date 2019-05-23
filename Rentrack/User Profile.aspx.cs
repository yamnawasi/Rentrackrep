using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;

public partial class User_Profile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        msg.Visible = false;
        userprofdiv.Visible = false;
        favpropdiv.Visible = false;
        rentresdiv.Visible = true;
        rentresbtn.Attributes.Add("class", "sidebarbtns activebtn");

        if (!IsPostBack)
        {
            BindAreas();

            if (Session["user_id"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else if (Session["user_id"] != null)
            {
                string fname = "";
                string lname = "";

                string userid = Session["user_id"].ToString();
                string usertypeid = "";

                String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;

                using (SqlConnection con = new SqlConnection(CS))
                {
                    con.Open();
                    //Get First and Last Name
                    SqlCommand getfname = new SqlCommand("SELECT f_name, l_name FROM [User] WHERE user_id = '" + userid + "'", con);
                    SqlDataReader freader = getfname.ExecuteReader();
                    while (freader.Read())
                    {
                        fname = freader[0].ToString();
                        lname = freader[1].ToString();
                    }
                    freader.Close();

                    userfullname.Text = "Hi, " + fname + " " + lname + ".";


                    //Prefill Resume Form
                    SqlCommand getusertypeid = new SqlCommand("SELECT user_type_id FROM [USER] WHERE user_id = '" + userid + "'", con);
                    SqlDataReader reader = getusertypeid.ExecuteReader();
                    while (reader.Read())
                    {
                        usertypeid = reader[0].ToString();
                    }
                    reader.Close();

                    //Check if Resume exists
                    SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM [TENANT_RESUME] WHERE tenant_id = '" + usertypeid + "'", con);
                    int temp = Convert.ToInt32(cmd.ExecuteScalar().ToString());

                    if (temp > 0) //Resume Exists
                    {
                        string employer = "", job_title = "", moveindate = "", moveinfrom = "", tenants = "", pets = "", smoking = "";
                        SqlCommand getemployerandjob = new SqlCommand("SELECT move_in_date, employer, job_title, number_of_tenants, move_in_from, pets, smoking FROM [TENANT_RESUME] WHERE tenant_id = '" + usertypeid + "'", con);
                        SqlDataReader ejreader = getemployerandjob.ExecuteReader();
                        while (ejreader.Read())
                        {
                            moveindate = ejreader[0].ToString();
                            employer = ejreader[1].ToString();
                            job_title = ejreader[2].ToString();
                            tenants = ejreader[3].ToString();
                            moveinfrom = ejreader[4].ToString();
                            pets = ejreader[5].ToString();
                            smoking = ejreader[6].ToString();
                        }
                        ejreader.Close();
                        tbemployer.Text = employer;
                        tbjob.Text = job_title;

                        //Move in date
                        ListItem selectedmoveindate = ddlmoveindate.Items.FindByValue(moveindate);
                        //Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('"+ moveindate + "');", true);
                        if (selectedmoveindate != null)
                        {
                            ddlmoveindate.SelectedItem.Selected = false;
                            selectedmoveindate.Selected = true;                           
                        }

                        //Moving from
                        ListItem selectedmovingfrom = areaddl.Items.FindByValue(moveinfrom);
                        if (selectedmovingfrom != null)
                        {
                            areaddl.SelectedItem.Selected = false;
                            selectedmovingfrom.Selected = true;
                        }

                        //No. of Tenants
                        ListItem selectedtenants = ddltenants.Items.FindByValue(tenants);
                        if (selectedtenants != null)
                        {
                            ddltenants.SelectedItem.Selected = false;
                            selectedtenants.Selected = true;
                        }

                        //Pets
                        if (pets == "True")
                            pets = "1";
                        else
                            pets = "0";

                        ListItem selectedpet = rblpets.Items.FindByValue(pets);
                        if (selectedpet != null)
                        {
                            rblpets.SelectedItem.Selected = false;
                            selectedpet.Selected = true;
                        }

                        //Smoking
                        if (smoking == "True")
                            smoking = "1";
                        else
                            smoking = "0";

                        ListItem selectedsmoke = rblsmoke.Items.FindByValue(smoking);
                        if (selectedsmoke != null)
                        {
                            rblsmoke.SelectedItem.Selected = false;
                            selectedsmoke.Selected = true;
                        }
                    }
                }



                //Write your page load .cs code here
                //The CS connection string has been setup just start by making your SQLConnection
                //Start


                //End
            }
        }
        
 
        
    }

    private void BindAreas()
    {
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM Area", con);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count != 0)
            {
                areaddl.DataSource = dt;
                areaddl.DataTextField = "area";
                areaddl.DataValueField = "area";
                areaddl.DataBind();
            }
        }

    }

    //Rental Resume
    protected void ShowRentalResume(object sender, EventArgs e)
    {
        userprofdiv.Visible = false;
        favpropdiv.Visible = false;
        rentresdiv.Visible = true;

        userprofbtn.Attributes.Add("class", "sidebarbtns inactivebtn");
        favpropbtn.Attributes.Add("class", "sidebarbtns inactivebtn");
        rentresbtn.Attributes.Add("class", "sidebarbtns activebtn");
    }

    protected void SaveResume(object sender, EventArgs e)
    {
        string userid = Session["user_id"].ToString();
        string usertypeid = "";

        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            //Get UserTypeID
            con.Open();
            SqlCommand getusertypeid = new SqlCommand("SELECT user_type_id FROM [USER] WHERE user_id = '" + userid + "'", con);
            SqlDataReader reader = getusertypeid.ExecuteReader();
            while (reader.Read())
            {
                usertypeid = reader[0].ToString();
            }
            reader.Close();

            //Check if Resume exists
            SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM [TENANT_RESUME] WHERE tenant_id = '" + usertypeid + "'", con);
            int temp = Convert.ToInt32(cmd.ExecuteScalar().ToString());

            if (temp > 0) //Resume Exists
            {
                //Modify Existing Resume
                SqlCommand updateRes = new SqlCommand("UPDATE [Tenant_Resume] SET move_in_date = '" + ddlmoveindate.SelectedItem.Value + "', move_in_from = '" + areaddl.SelectedItem.Value + "', number_of_tenants = '" + ddltenants.SelectedItem.Value + "', pets = '" + rblpets.SelectedItem.Value + "', smoking = '" + rblsmoke.SelectedItem.Value + "', employer = '" + tbemployer.Text + "', job_title = '" + tbjob.Text + "' WHERE tenant_id ='" + usertypeid + "'", con);
                updateRes.ExecuteNonQuery();
                rentresmsg.Text = "Your rental resume has been updated.";
                msg.Visible = true;
            }
            else //Resume doesn't exist
            {
                //Create a new Resume
                SqlCommand saveRes = new SqlCommand("INSERT INTO [Tenant_Resume](tenant_id, move_in_date, move_in_from, number_of_tenants, pets, smoking, employer, job_title) VALUES ('" + usertypeid + "','" + ddlmoveindate.SelectedItem.Value + "','" + areaddl.SelectedItem.Value + "','" + ddltenants.SelectedItem.Value + "','" + rblpets.SelectedItem.Value + "','" + rblsmoke.SelectedItem.Value + "','" + tbemployer.Text + "','" + tbjob.Text + "')", con);
                saveRes.ExecuteNonQuery();
                rentresmsg.Text = "Your rental resume has been created.";
                rentresmsg.Visible = true;
                msg.Visible = true;
            }
        }
    }

    //User Profile
    protected void ShowUserProfile(object sender, EventArgs e)
    {
        userprofdiv.Visible = true;
        favpropdiv.Visible = false;
        rentresdiv.Visible = false;

        userprofbtn.Attributes.Add("class", "sidebarbtns activebtn");
        favpropbtn.Attributes.Add("class", "sidebarbtns inactivebtn");
        rentresbtn.Attributes.Add("class", "sidebarbtns inactivebtn");
    }

    //Favourites
    protected void ShowFavourites(object sender, EventArgs e)
    {
        userprofdiv.Visible = false;
        favpropdiv.Visible = true;
        rentresdiv.Visible = false;

        userprofbtn.Attributes.Add("class", "sidebarbtns inactivebtn");
        favpropbtn.Attributes.Add("class", "sidebarbtns activebtn");
        rentresbtn.Attributes.Add("class", "sidebarbtns inactivebtn");
    }
}