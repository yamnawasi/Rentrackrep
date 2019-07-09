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


                    //Write your page load .cs code here
                    //The CS connection string has been setup just start by making your SQLConnection
                    //Start
                    //checking if the user id agent or normal user
                    SqlCommand acmd = new SqlCommand("SELECT agent_id FROM [User_Type] WHERE agent_id = '" + usertypeid + "'", con);
                    SqlDataAdapter asda = new SqlDataAdapter(acmd);
                    DataTable adt = new DataTable();
                    asda.Fill(adt);

                    if (adt.Rows.Count != 0)//Agent
                    {
                        rentresbtn.Visible = false;
                        rentresdiv.Visible = false;
                        dobdiv.Visible = false;
                        phonediv.Visible = false;
                        addressdiv.Visible = false;
                        citydiv.Visible = false;
                        agencyinfo.Visible = true;
                        cnicdiv.Visible = true;
                        areadealdiv.Visible = true;
                    }

                    //User Profile
                    DateRangeValidator.MinimumValue = DateTime.Today.AddYears(-90).ToShortDateString();
                    DateRangeValidator.MaximumValue = DateTime.Today.AddYears(-18).ToShortDateString();

                    BindUserdata();

                    SqlCommand mcom = new SqlCommand("SELECT * FROM [DBO].[City] ORDER BY city_name ASC", con);
                    mcom.ExecuteNonQuery();
                    SqlDataReader msdr = mcom.ExecuteReader();
                    if (msdr.HasRows)
                    {
                        //for agent's cities listbox
                        agentcitylist.DataSource = msdr;
                        agentcitylist.DataTextField = "city_name";
                        agentcitylist.DataValueField = "city_id";
                        agentcitylist.DataBind();

                    }
                    con.Close();

                    SqlCommand mcom1 = new SqlCommand("SELECT * FROM [DBO].[City] ORDER BY city_name ASC", con);
                    con.Open();
                    mcom1.ExecuteNonQuery();
                    SqlDataReader msdr1 = mcom1.ExecuteReader();
                    if (msdr1.HasRows)
                    {
                        //for agency's cities listbox
                        agencycitylist.DataSource = msdr1;
                        agencycitylist.DataTextField = "city_name";
                        agencycitylist.DataValueField = "city_id";
                        agencycitylist.DataBind();
                    }
                    con.Close();

                    //Favourites
                    //checking if fav props exists for the user
                    SqlCommand fcmd = new SqlCommand("SELECT * FROM [Favourite_Property] WHERE user_id = '" + userid + "'", con);
                    con.Open();
                    SqlDataAdapter fsda = new SqlDataAdapter(fcmd);
                    DataTable fdt = new DataTable();
                    fsda.Fill(fdt);

                    if (fdt.Rows.Count == 0) //user has no favourites
                    {
                        lblfavid.Text = "You have no Favourites yet";
                    }
                    else if(fdt.Rows.Count != 0)//user has favourites
                    {
                        BindFavProps();
                    }

                    //End
                }
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

    private void BindUserdata()
    {
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            string userid = Session["user_id"].ToString();

            SqlCommand userdata = new SqlCommand("SELECT * FROM [User] WHERE user_id = '" + userid + "'", con);
            SqlDataAdapter usersda = new SqlDataAdapter(userdata);
            DataTable userdt = new DataTable();
            usersda.Fill(userdt);

            
            lblusrpassword.Text = "";
            foreach (char c in userdt.Rows[0][8].ToString())
            {
                lblusrpassword.Text += "*";
            }
            
            lblusremail.Text = userdt.Rows[0][9].ToString();
            tbfname.Text = userdt.Rows[0][2].ToString();
            tblname.Text = userdt.Rows[0][3].ToString();         
            tbphone.Text = userdt.Rows[0][7].ToString();
           

            SqlCommand cmd2 = new SqlCommand("SELECT agent_id FROM [User_Type] WHERE agent_id = '" + userdt.Rows[0][1].ToString() + "'", con);
            SqlDataAdapter sda2 = new SqlDataAdapter(cmd2);
            DataTable dt2 = new DataTable();
            sda2.Fill(dt2);

            if (dt2.Rows.Count == 0) //Normal user
            {
                SqlCommand com = new SqlCommand("SELECT city_name FROM [City] WHERE city_id = '" + userdt.Rows[0][5].ToString() + "'", con);
                con.Open();
                string cityname = (string)com.ExecuteScalar();
                com.ExecuteNonQuery();

                tbdob.Text = userdt.Rows[0][6].ToString();
                tbaddress.Text = userdt.Rows[0][4].ToString();
                tbdcity.SelectedValue = cityname;
            }
            else if (dt2.Rows.Count != 0)//Agent
            {
                SqlCommand agentdata = new SqlCommand("SELECT * FROM [Agent] WHERE agent_id = '" + userdt.Rows[0][1].ToString() + "'", con);
                SqlDataAdapter agentsda = new SqlDataAdapter(agentdata);
                DataTable agentdt = new DataTable();
                agentsda.Fill(agentdt);

                SqlCommand agencydata = new SqlCommand("SELECT * FROM [Agency] WHERE agency_id = '" + agentdt.Rows[0][1].ToString() + "'", con);
                SqlDataAdapter agencysda = new SqlDataAdapter(agencydata);
                DataTable agencydt = new DataTable();
                agencysda.Fill(agencydt);

                SqlCommand agencybrdata = new SqlCommand("SELECT * FROM [Agency_Branch] WHERE agency_id = '" + agentdt.Rows[0][1].ToString() + "'", con);
                SqlDataAdapter agencybrsda = new SqlDataAdapter(agencybrdata);
                DataTable agencybrdt = new DataTable();
                agencybrsda.Fill(agencybrdt);

                cnicnum.Text = agentdt.Rows[0][2].ToString();
                //agentcitylist.Text = agentdt.Rows[0][2].ToString();
                agencyname.Text = agencydt.Rows[0][1].ToString();
                agencyemail.Text = agencydt.Rows[0][3].ToString();
                agencyphone.Text = agencydt.Rows[0][2].ToString();
                agencyaddress.Text = agencybrdt.Rows[0][3].ToString();
                //agencycitylist.Text = agencydt.Rows[0][3].ToString();

                SqlCommand agentcitydata = new SqlCommand("SELECT * FROM [Agent_city] WHERE agent_id = '" + userdt.Rows[0][1].ToString() + "'", con);
                SqlDataAdapter agentcitydatasda = new SqlDataAdapter(agentcitydata);
                DataTable agentcitydatadt = new DataTable();
                agentcitydatasda.Fill(agentcitydatadt);

                SqlCommand agencycitydata = new SqlCommand("SELECT * FROM [Agency_city] WHERE agency_id = '" + agentdt.Rows[0][1].ToString() + "'", con);
                SqlDataAdapter agencycitydatasda = new SqlDataAdapter(agencycitydata);
                DataTable agencycitydatadt = new DataTable();
                agencycitydatasda.Fill(agencycitydatadt);

                for (int i = 0; i <= agentcitydatadt.Rows.Count; i++)
                {
                    foreach (ListItem item in agentcitylist.Items)
                    {
                        if (item.Text == agentcitydatadt.Rows[0][i].ToString())
                        {
                            item.Selected = true;
                        }
                    }
                }

                for (int i = 0; i <= agencycitydatadt.Rows.Count; i++)
                {
                    foreach (ListItem item in agencycitylist.Items)
                    {
                        if (item.Text == agencycitydatadt.Rows[0][i].ToString())
                        {
                            item.Selected = true;
                        }
                    }
                }
            }

           
        }
    }

    protected void EmailEdit_Click(object sender, EventArgs e)
    {
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            changeEmail.Visible = true;
            lblusremail.Visible = false;
            emaileditbtn.Visible = false;
            emaillabel.Text = "New Email";
        }
    }

    protected void PassEdit_Click(object sender, EventArgs e)
    {
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            changePass.Visible = true;
            passwordlabel.Visible = false;
            lblusrpassword.Visible = false;
            passeditbtn.Visible = false;      
        }
    }

    protected void SaveUserInfo(object sender, EventArgs e)
    {
        string userid = Session["user_id"].ToString();

        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand com = new SqlCommand("SELECT password FROM [User] WHERE user_id = '" + userid + "'", con);
            con.Open();
            string password = (string)com.ExecuteScalar();
            com.ExecuteNonQuery();
            com.Parameters.Clear();

            if (currentpass.Text != password)
            {
                lblError.Visible = true;
            }

            if (oldpass.Text != password)
            {
                oldpasserror.Visible = true;
            }

            SqlCommand cmd1 = new SqlCommand("SELECT user_type_id FROM [User] WHERE user_id = '" + userid + "'", con);
            int usertypeid = (int)cmd1.ExecuteScalar();
            cmd1.ExecuteNonQuery();

            SqlCommand cmd2 = new SqlCommand("SELECT agent_id FROM [User_Type] WHERE agent_id = '" + usertypeid + "'", con);
            SqlDataAdapter sda2 = new SqlDataAdapter(cmd2);
            DataTable dt2 = new DataTable();
            sda2.Fill(dt2);

            if(tbemail.Text != "" && currentpass.Text != "")
            {
                SqlCommand com2 = new SqlCommand("UPDATE [User] SET email='" + tbemail.Text + "' WHERE user_id = '" + userid + "'", con);
            }

            if (oldpass.Text != "" && tbConfirmPass.Text != "")
            {
                SqlCommand com2 = new SqlCommand("UPDATE [User] SET password='" + tbConfirmPass.Text + "' WHERE user_id = '" + userid + "'", con);
            }

            if (dt2.Rows.Count == 0) //Normal user
            {
                //storing city in city table and assigning its id
                SqlCommand com1 = new SqlCommand("SELECT city_id FROM [City] WHERE city_name = '" + tbdcity.SelectedValue + "'", con);
                int tbcity = (int)com1.ExecuteScalar();
                com1.ExecuteNonQuery();
                com1.Parameters.Clear();

                SqlCommand com2 = new SqlCommand("UPDATE [User] SET f_name='" + tbfname.Text + "', l_name='" + tblname.Text + "', address='" + tbaddress.Text + "', city_id='" + tbcity + "', dob='" + tbdob.Text + "', phone_no='" + tbphone.Text + "' WHERE user_id = '" + userid + "'", con);
                com2.ExecuteNonQuery();
            }
            else if (dt2.Rows.Count != 0)//Agent
            {
                //getting agency_id recently inserted
                SqlCommand com1 = new SqlCommand("SELECT agency_id FROM [Agency] ORDER BY[agency_id] DESC ", con);
                int agency_id = (int)com1.ExecuteScalar();
                

                SqlCommand com2 = new SqlCommand("UPDATE [User] SET f_name='" + tbfname.Text + "', l_name='" + tblname.Text + "', phone_no='" + tbphone.Text + "' WHERE user_id = '" + userid + "'", con);              
                SqlCommand com3 = new SqlCommand("UPDATE [Agency] SET agency_name='" + tbfname.Text + "', agency_phone='" + tblname.Text + "', agency_email='" + tbphone.Text + "' WHERE agency_id = '" + agency_id + "'", con);
                SqlCommand com4 = new SqlCommand("UPDATE [Agency_Branch] SET agency_address='" + tblname.Text + "' WHERE agency_id = '" + agency_id + "'", con);
                //SqlCommand com5 = new SqlCommand("UPDATE [Agency_city] SET agency_address='" + tblname.Text + "' WHERE agency_id = '" + agency_id + "'", con);

                com1.ExecuteNonQuery();
                com2.ExecuteNonQuery();
                com3.ExecuteNonQuery();
                com4.ExecuteNonQuery();
            }
            
        }

        BindUserdata();
    }

    protected void Cancel(object sender, EventArgs e)
    {
        changeEmail.Visible = false;
        lblusremail.Visible = true;
        emaileditbtn.Visible = true;
        emaillabel.Text = "Email:";
        changePass.Visible = false;
        passwordlabel.Visible = true;
        lblusrpassword.Visible = true;
        passeditbtn.Visible = true;
        BindUserdata();
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

    private void BindFavProps()
    {
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            string ID = Session["user_id"].ToString();

            using (SqlCommand cmd = new SqlCommand("procBindfav", con))
            {
                SqlDataAdapter adapter = new SqlDataAdapter();
                DataSet dsfav = new DataSet();
                con.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@uid", ID);
                adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dsfav);
                con.Close();
                rptrfav.DataSource = dsfav;
                rptrfav.DataBind();

            }
        }
    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        string fid = Convert.ToString(e.CommandArgument);
        if(e.CommandName == "Delete")
        {
            DeleteRepeaterData(fid);
        }
    }

    private void DeleteRepeaterData(string fid)
    {
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            try
            {

                SqlCommand cmd = new SqlCommand("DELETE FROM [Favourite_Property] WHERE fav_prop_id = '" + fid + "'", con);
                con.Open();
                cmd.ExecuteNonQuery();
                //lblresult.Text = "Record Deleted Successfully";
                //lblresult.ForeColor = System.Drawing.Color.Green;
            }
            catch (Exception ex)
            {
                //lblresult.Text = ex.Message.ToString();
                //lblresult.ForeColor = System.Drawing.Color.Red;
            }
            finally
            {
                BindFavProps();
                con.Close();
            }
        }
    }



    

}