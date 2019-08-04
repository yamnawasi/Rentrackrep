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

public partial class AddProperty : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user_id"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        else if (Session["user_id"] != null)
        {
            if (!IsPostBack)
            {
                BindCities();
                areaddl.Items.Insert(0, new ListItem("- UNAVAILABLE -", "0"));
                areaddl.Attributes.Add("disabled", "disabled");
                subareaddl.Items.Insert(0, new ListItem("- UNAVAILABLE -", "0"));
                subareaddl.Attributes.Add("disabled", "disabled");
                ownerdiv.Visible = false;
            }

            dot1.Attributes.Add("class", "activedot");
            prog1.Attributes.Add("style", "width: 100%");
            propdetaildiv.Visible = false;
            propimgdiv.Visible = false;
            successdiv.Visible = false;

            Page.ClientScript.RegisterOnSubmitStatement(this.GetType(), "val", "fnOnUpdateValidators();");
        }
    }



    private void BindCities()
    {
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM City", con);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if(dt.Rows.Count != 0)
            {
                cityddl.DataSource = dt;
                cityddl.DataTextField = "city_name";
                cityddl.DataValueField = "city_id";
                cityddl.DataBind();
                cityddl.Items.Insert(0, new ListItem("- SELECT CITY -", "0"));
            }
        }
        
    }

    protected void proptypenextbtn_Click(object sender, EventArgs e)
    {
        proptypediv.Visible = false;
        propdetaildiv.Visible = true;
        dot1.Attributes.Add("class", "completedot");
        dot2.Attributes.Add("class", "activedot");
        prog2.Attributes.Add("style", "width: 100%");

        int userid = Convert.ToInt32(Session["user_id"].ToString());
        int ownerid;
        string usertypeid = "";
        string agentid = "";

        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            //Get User Type ID
            SqlCommand getusertypeid = new SqlCommand("SELECT user_type_id FROM [USER] WHERE user_id = '" + userid + "'", con);
            SqlDataReader reader = getusertypeid.ExecuteReader();
            while (reader.Read())
            {
                usertypeid = reader[0].ToString();
            }
            reader.Close();

            //Get Agent ID
            SqlCommand getagentid = new SqlCommand("SELECT agent_id FROM [USER_TYPE] WHERE user_type_id = '" + usertypeid + "'", con);
            SqlDataReader aireader = getagentid.ExecuteReader();
            while (aireader.Read())
            {
                agentid = aireader[0].ToString();
            }
            aireader.Close();
            
            if(agentid == null || agentid == "")
            {
                ownerid = Convert.ToInt32(Session["user_id"].ToString());
            }
            else
            {
                ownerdiv.Visible = true;
            }
        }
    }


    protected void propdetprevbtn_Click(object sender, EventArgs e)
    {
        proptypediv.Visible = true;
        propdetaildiv.Visible = false;
        dot2.Attributes.Add("class", "inactivedot");
        prog2.Attributes.Add("style", "width: 0%");
    }

    protected void propdetnextbtn_Click(object sender, EventArgs e)
    {
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            string owneremail = tboemail.Text;
            if (owneremail != null || owneremail != "")
            {
                //Check if email exists
                SqlCommand checkomail = new SqlCommand("SELECT COUNT(*) FROM [USER] WHERE email = '" + owneremail + "'", con);
                int tempy = Convert.ToInt32(checkomail.ExecuteScalar().ToString());
                if (tempy <= 0) //Email doesn't exist
                {
                    oemailmsg.Text = "This email address is not registered with Rentrack.";
                    propdetaildiv.Visible = true;
                    //Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('"+ tempy +"');", true);

                }
                else if(tempy > 0)
                {
                    propdetaildiv.Visible = false;
                    propimgdiv.Visible = true;
                    dot1.Attributes.Add("class", "completedot");
                    dot2.Attributes.Add("class", "completedot");
                    dot3.Attributes.Add("class", "activedot");
                    prog3.Attributes.Add("style", "width: 100%");
                }
            }
        }


    }

    //Generate Property Code
    public string GenerateNumber()
    {
        Random random = new Random();
        string propcode = "";
        int i;
        for (i = 1; i < 11; i++)
        {
            propcode += random.Next(0, 9).ToString();
        }
        return propcode;
    }

    protected void propimgnextbtn_Click(object sender, EventArgs e)
    {
        dot1.Attributes.Add("class", "completedot");
        dot2.Attributes.Add("class", "completedot");
        dot3.Attributes.Add("class", "completedot");
        prog4.Attributes.Add("style", "width: 100%");
        propimgdiv.Visible = false;
        successdiv.Visible = true;
        
        //Property Code
        string propcode = GenerateNumber();
        string cityselected = cityddl.SelectedItem.Value;
        int userid = Convert.ToInt32(Session["user_id"].ToString());
        int ownerid = 0;
        int agencyid = 0;
        string usertypeid = "";
        string agentid = "";

        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            //Get User Type ID
            con.Open();
            SqlCommand getusertypeid = new SqlCommand("SELECT user_type_id FROM [USER] WHERE user_id = '" + userid + "'", con);
            SqlDataReader reader = getusertypeid.ExecuteReader();
            while (reader.Read())
            {
                usertypeid = reader[0].ToString();
            }
            reader.Close();

            //Get Agent ID
            SqlCommand getagentid = new SqlCommand("SELECT agent_id FROM [USER_TYPE] WHERE user_type_id = '" + usertypeid + "'", con);
            SqlDataReader aireader = getagentid.ExecuteReader();
            while (aireader.Read())
            {
                agentid = aireader[0].ToString();
            }
            aireader.Close();

            if (agentid == null || agentid == "")
            {
                ownerid = Convert.ToInt32(Session["user_id"].ToString());
                //Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('" + ownerid + "');", true);
            }
            else
            {
                //Get ID from Email
                SqlCommand ugh = new SqlCommand("SELECT user_id FROM [USER] WHERE email = '" + tboemail.Text + "'", con);
                SqlDataReader uireader = ugh.ExecuteReader();
                while (uireader.Read())
                {
                    ownerid = Convert.ToInt32(uireader[0].ToString());
                }
                uireader.Close();

                //Get Agency ID
                SqlCommand ugh2 = new SqlCommand("SELECT agency_id FROM [AGENT] where agent_id ='" + agentid + "'", con);
                SqlDataReader eader = ugh2.ExecuteReader();
                while (eader.Read())
                {
                    agencyid = Convert.ToInt32(eader[0].ToString());
                }
                eader.Close();
            }


            //Add to Room Desc table
            SqlCommand addroomdesc = new SqlCommand("INSERT INTO [Room_Description](no_of_bedrooms, no_of_bathrooms, no_of_kitchen, no_of_hall, no_of_floors) VALUES ('" + tbbed.Text + "','" + tbbath.Text + "','" + tbkitchen.Text + "','" + tbhall.Text + "','" + tbfloor.Text + "')", con);
            addroomdesc.ExecuteNonQuery();

            //Get Room Desc Id
            SqlCommand getrdid = new SqlCommand("SELECT TOP 1 * FROM Room_Description ORDER BY room_desc_id DESC", con);
            getrdid.ExecuteNonQuery();
            int roomdescid;
            roomdescid = (int)getrdid.ExecuteScalar();

            //Get UserID
            string userID = Session["user_id"].ToString();

            int selsubarea = Convert.ToInt32(subareaddl.SelectedItem.Value);
            if(agencyid == 0)
            {
                if (selsubarea == 0)
                {
                    SqlCommand comm = new SqlCommand("INSERT INTO [Property](property_title, property_type, property_purpose, property_desc, property_price, property_code, is_sold, is_rented, area_id, room_desc_id, expires_after, user_id, property_area, owner_id, subarea_id) VALUES ('" + tbproptitle.Text + "','" + propertytypedropdown.SelectedItem.Value + "','" + rentsellrb.SelectedItem.Value + "','" + tbpropdesc.Text + "','" + tbprice.Text + "','" + propcode + "','" + 0 + "','" + 0 + "','" + areaddl.SelectedItem.Value + "','" + roomdescid + "','" + expafterdropdown.SelectedItem.Value + "','" + userID + "','" + tblandarea.Text + "','" + ownerid + "','" + 97 + "')", con);
                    comm.ExecuteNonQuery();
                }
                else
                {
                    //Add values to Property Table
                    SqlCommand cmd1 = new SqlCommand("INSERT INTO [Property](property_title, property_type, property_purpose, property_desc, property_price, property_code, is_sold, is_rented, area_id, subarea_id, room_desc_id, expires_after, user_id, property_area, owner_id) VALUES ('" + tbproptitle.Text + "','" + propertytypedropdown.SelectedItem.Value + "','" + rentsellrb.SelectedItem.Value + "','" + tbpropdesc.Text + "','" + tbprice.Text + "','" + propcode + "','" + 0 + "','" + 0 + "','" + areaddl.SelectedItem.Value + "','" + selsubarea + "','" + roomdescid + "','" + expafterdropdown.SelectedItem.Value + "','" + userID + "','" + tblandarea.Text + "','" + ownerid + "')", con);
                    cmd1.ExecuteNonQuery();
                }
            }
            else
            {
                if (selsubarea == 0)
                {
                    SqlCommand comm = new SqlCommand("INSERT INTO [Property](property_title, property_type, property_purpose, property_desc, property_price, property_code, is_sold, is_rented, area_id, room_desc_id, expires_after, user_id, property_area, agency_id, owner_id, subarea_id) VALUES ('" + tbproptitle.Text + "','" + propertytypedropdown.SelectedItem.Value + "','" + rentsellrb.SelectedItem.Value + "','" + tbpropdesc.Text + "','" + tbprice.Text + "','" + propcode + "','" + 0 + "','" + 0 + "','" + areaddl.SelectedItem.Value + "','" + roomdescid + "','" + expafterdropdown.SelectedItem.Value + "','" + userID + "','" + tblandarea.Text + "','" + agencyid + "','" + ownerid + "','" + 97 + "')", con);
                    comm.ExecuteNonQuery();
                }
                else
                {
                    //Add values to Property Table
                    SqlCommand cmd1 = new SqlCommand("INSERT INTO [Property](property_title, property_type, property_purpose, property_desc, property_price, property_code, is_sold, is_rented, area_id, subarea_id, room_desc_id, expires_after, user_id, property_area, agency_id, owner_id) VALUES ('" + tbproptitle.Text + "','" + propertytypedropdown.SelectedItem.Value + "','" + rentsellrb.SelectedItem.Value + "','" + tbpropdesc.Text + "','" + tbprice.Text + "','" + propcode + "','" + 0 + "','" + 0 + "','" + areaddl.SelectedItem.Value + "','" + selsubarea + "','" + roomdescid + "','" + expafterdropdown.SelectedItem.Value + "','" + userID + "','" + tblandarea.Text + "','" + agencyid + "','" + ownerid + "')", con);
                    cmd1.ExecuteNonQuery();
                }
            }
            

            //Get Property ID
            SqlCommand getpropid = new SqlCommand("SELECT * FROM [Property] WHERE property_code='" + propcode + "'", con);
            getpropid.ExecuteNonQuery();
            int PropID;
            PropID = (int)getpropid.ExecuteScalar();

            //Upload and Insert Main Image
            if (fumainimg.HasFile)
            {
                string SavePath = Server.MapPath("~/Images/PropertyImages/") + PropID;
                if (!Directory.Exists(SavePath))
                {
                    Directory.CreateDirectory(SavePath);
                }
                string Extention = Path.GetExtension(fumainimg.PostedFile.FileName);
                fumainimg.SaveAs(SavePath + "\\" + tbproptitle.Text.ToString().Trim() + "-" + PropID + Extention);

                SqlCommand addimg = new SqlCommand("insert into [Property_Image](property_id, image_name, extension, main)  values('" + PropID + "','" + tbproptitle.Text.ToString().Trim() + "-" + PropID + "','" + Extention + "','" + 1 + "')", con);
                addimg.ExecuteNonQuery();
            }

            //Upload and Insert Multiple Images
            if (fuimgs.HasFile)
            {
                int imgNo = 1;
                string SavePath = Server.MapPath("~/Images/PropertyImages/") + PropID;
                foreach (HttpPostedFile postedFile in fuimgs.PostedFiles)
                {
                    string exs = Path.GetExtension(postedFile.FileName);
                    postedFile.SaveAs(SavePath + "\\" + tbproptitle.Text.ToString().Trim() + "-" + PropID + "-" + imgNo.ToString() + exs);
                    using (Stream fs = postedFile.InputStream)
                    {
                        using (BinaryReader br = new BinaryReader(fs))
                        {
                            string constr = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
                            string query = "insert into Property_Image values (@property_id, @image_name, @extension, @main)";
                            using (SqlCommand cmd = new SqlCommand(query))
                            {
                                cmd.Connection = con;
                                cmd.Parameters.AddWithValue("@image_name", tbproptitle.Text.ToString().Trim() + "-" + PropID + "-" + imgNo.ToString());
                                cmd.Parameters.AddWithValue("@property_id", PropID);
                                cmd.Parameters.AddWithValue("@extension", exs);
                                cmd.Parameters.AddWithValue("@main", 0);
                                cmd.ExecuteNonQuery();
                                imgNo++;
                            }
                        }
                    }
                }
            }
        }
        
    }


    protected void propimgprevbtn_Click(object sender, EventArgs e)
    {
        propdetaildiv.Visible = true;
        propimgdiv.Visible = false;
        dot1.Attributes.Add("class", "completedot");
        dot2.Attributes.Add("class", "activedot");
        dot3.Attributes.Add("class", "inactivedot");
        prog3.Attributes.Add("style", "width: 0%");
    }

    protected void areaddl_SelectedIndexChanged(object sender, EventArgs e)
    {
        int areaID = Convert.ToInt32(areaddl.SelectedItem.Value);
        int test = 0;

        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd1 = new SqlCommand("SELECT COUNT(*) FROM Subarea where area_id = '" + areaID + "'", con);
            con.Open();
            cmd1.ExecuteNonQuery();
            test = (int)cmd1.ExecuteScalar();

            if ((Convert.ToInt32(cityddl.SelectedItem.Value) != 0) && (test != 0))
            {
                subareaddl.Attributes.Remove("disabled");
                SqlCommand cmd = new SqlCommand("SELECT * FROM Subarea where area_id = '" + areaID + "'", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count != 0)
                {
                    subareaddl.DataSource = dt;
                    subareaddl.DataTextField = "subarea";
                    subareaddl.DataValueField = "subarea_id";
                    subareaddl.DataBind();
                    subareaddl.Items.Insert(0, new ListItem("- SELECT SUBAREA -", "0"));
                }
            }
            else
            {
                subareaddl.Attributes.Add("disabled", "disabled");
                subareaddl.SelectedIndex = 0;
            }
        }
    }

    protected void cityddl_SelectedIndexChanged(object sender, EventArgs e)
    {
        int cityID = Convert.ToInt32(cityddl.SelectedItem.Value);
        int test = 0;

        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd1 = new SqlCommand("SELECT COUNT(*) FROM Area where city_id = '" + cityID + "'", con);
            con.Open();
            cmd1.ExecuteNonQuery();
            test = (int)cmd1.ExecuteScalar();

            if ((Convert.ToInt32(cityddl.SelectedItem.Value) != 0) && (test != 0))
            {
                areaddl.Attributes.Remove("disabled");
                SqlCommand cmd = new SqlCommand("SELECT * FROM Area where city_id = '" + cityID + "'", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count != 0)
                {
                    areaddl.DataSource = dt;
                    areaddl.DataTextField = "area";
                    areaddl.DataValueField = "area_id";
                    areaddl.DataBind();
                    areaddl.Items.Insert(0, new ListItem("- SELECT AREA -", "0"));
                }
            }
            else
            {
                areaddl.Attributes.Add("disabled", "disabled");
                areaddl.SelectedIndex = 0;
                subareaddl.Attributes.Add("disabled", "disabled");
                subareaddl.SelectedIndex = 0;
            }
        }
        
    }
}