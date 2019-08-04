 using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class propertylist : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindPropertyRepeater();
            BindCities();
            BindAreas();
            
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

            if (dt.Rows.Count != 0)
            {
                cityddl.DataSource = dt;
                cityddl.DataTextField = "city_name";
                cityddl.DataValueField = "city_id";
                cityddl.DataBind();
               
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
                areadd.DataSource = dt;
                areadd.DataTextField = "area";
                areadd.DataValueField = "area_id";
                areadd.DataBind();

            }
        }
    }

  


    private void BindpropcityList()
    {
        string city = cityddl.SelectedValue;
        string area = areadd.SelectedValue;
        //Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('"+ city +"');", true);

        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            using (SqlCommand cmd = new SqlCommand("SELECT A.*,B.*,C.area,D.no_of_bedrooms,D.no_of_bathrooms,E.city_name From dbo.[Property] A JOIN dbo.[Room_Description] D ON (D.room_desc_id = A.room_desc_id) INNER JOIN dbo.[Area] C ON (C.area_id = A.area_id) JOIN dbo.[City] E ON (C.city_id=E.city_id)CROSS APPLY(SELECT TOP 1 * FROM dbo.[Property_Image] B WHERE (B.property_id = A.property_id) ORDER BY B.property_id desc)B  WHERE A.is_sold = 'false' AND  E.city_id ="+ city + " AND  C.area_id =" + area + "   order by A.property_id desc", con))

              {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable Property = new DataTable();
                    sda.Fill(Property);
                    rptrProperty.DataSource = Property;
                    rptrProperty.DataBind();
                    if (Property.Rows.Count == 0)
                    {
                        propemptymsg.Text = "No properties found.";
                    }
                }
                
            }
        }
    }

   
    protected void CitySearchbtn_Click(object sender, EventArgs e)
    {
       
            BindpropcityList();
        


    }


    private void BindPropertyRepeater()
    {
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("procBindAllProperty", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable Property = new DataTable();
                    sda.Fill(Property);
                    rptrProperty.DataSource = Property;
                    rptrProperty.DataBind();
                }

            }

        }

    }
    protected void AllButton_Click(object sender, EventArgs e)
    {
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {

            using (SqlCommand cmd = new SqlCommand("procBindAllProperty", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable Property = new DataTable();
                    sda.Fill(Property);
                    rptrProperty.DataSource = Property;
                    rptrProperty.DataBind();
                }

            }
        }
     }

    protected void RentButton_Click(object sender, EventArgs e)
    {
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();

            using (SqlCommand cmd = new SqlCommand("SELECT A.*,B.*,C.area,D.no_of_bedrooms,D.no_of_bathrooms From dbo.[Property] A JOIN dbo.[Room_Description] D ON (D.room_desc_id = A.room_desc_id) INNER JOIN dbo.[Area] C ON (C.area_id = A.area_id) CROSS APPLY(SELECT TOP 1 * FROM dbo.[Property_Image] B WHERE (B.property_id = A.property_id) ORDER BY B.property_id desc)B WHERE A.is_sold = 'false' AND A.property_purpose = 'Rent' order by A.property_id desc", con))
            {

                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable Property = new DataTable();
                    sda.Fill(Property);
                    rptrProperty.DataSource = Property;
                    rptrProperty.DataBind();
                }
            }
        }
    }

    protected void BuyButton_Click(object sender, EventArgs e)
    {
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();

            using (SqlCommand cmd = new SqlCommand("SELECT A.*,B.*,C.area,D.no_of_bedrooms,D.no_of_bathrooms From dbo.[Property] A JOIN dbo.[Room_Description] D ON (D.room_desc_id = A.room_desc_id) INNER JOIN dbo.[Area] C ON (C.area_id = A.area_id) CROSS APPLY(SELECT TOP 1 * FROM dbo.[Property_Image] B WHERE (B.property_id = A.property_id) ORDER BY B.property_id desc)B WHERE A.is_sold = 'false' AND A.property_purpose = 'Sell' order by A.property_id desc", con))
            {
               
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable Property = new DataTable();
                    sda.Fill(Property);
                    rptrProperty.DataSource = Property;
                    rptrProperty.DataBind();
                }
            }
        }
    }
    protected void HouseButton_Click(object sender, EventArgs e)
    {
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();

            using (SqlCommand cmd = new SqlCommand("SELECT A.*,B.*,C.area,D.no_of_bedrooms,D.no_of_bathrooms From dbo.[Property] A JOIN dbo.[Room_Description] D ON (D.room_desc_id = A.room_desc_id) INNER JOIN dbo.[Area] C ON (C.area_id = A.area_id) CROSS APPLY(SELECT TOP 1 * FROM dbo.[Property_Image] B WHERE (B.property_id = A.property_id) ORDER BY B.property_id desc)B WHERE A.is_sold = 'false' AND A.property_type = 'House' order by A.property_id desc", con))
            {

                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable Property = new DataTable();
                    sda.Fill(Property);
                    rptrProperty.DataSource = Property;
                    rptrProperty.DataBind();
                }
            }
        }
    }
    protected void AppartmentButton_Click(object sender, EventArgs e)
    {
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();

            using (SqlCommand cmd = new SqlCommand("SELECT A.*,B.*,C.area,D.no_of_bedrooms,D.no_of_bathrooms From dbo.[Property] A JOIN dbo.[Room_Description] D ON (D.room_desc_id = A.room_desc_id) INNER JOIN dbo.[Area] C ON (C.area_id = A.area_id) CROSS APPLY(SELECT TOP 1 * FROM dbo.[Property_Image] B WHERE (B.property_id = A.property_id) ORDER BY B.property_id desc)B WHERE A.is_sold = 'false' AND A.property_type = 'Apartment' order by A.property_id desc", con))
            {

                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable Property = new DataTable();
                    sda.Fill(Property);
                    rptrProperty.DataSource = Property;
                    rptrProperty.DataBind();
<<<<<<< HEAD
                    
=======
                    if (Property.Rows.Count == 0)
                    {
                        propemptymsg.Text = "No properties found.";
                    }
>>>>>>> upstream/master
                }
            }
        }
    }
    protected void LowerPortionButton_Click(object sender, EventArgs e)
    {
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();

            using (SqlCommand cmd = new SqlCommand("SELECT A.*,B.*,C.area,D.no_of_bedrooms,D.no_of_bathrooms From dbo.[Property] A JOIN dbo.[Room_Description] D ON (D.room_desc_id = A.room_desc_id) INNER JOIN dbo.[Area] C ON (C.area_id = A.area_id) CROSS APPLY(SELECT TOP 1 * FROM dbo.[Property_Image] B WHERE (B.property_id = A.property_id) ORDER BY B.property_id desc)B WHERE A.is_sold = 'false' AND A.property_type = 'Lower Portion' order by A.property_id desc", con))
            {

                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable Property = new DataTable();
                    sda.Fill(Property);
                    rptrProperty.DataSource = Property;
                    rptrProperty.DataBind();
<<<<<<< HEAD
                    
=======
                    if (Property.Rows.Count == 0)
                    {
                        propemptymsg.Text = "No properties found.";
                    }
>>>>>>> upstream/master
                }
            }
        }
    }

    protected void UpperPortionButton_Click(object sender, EventArgs e)
    {
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();

            using (SqlCommand cmd = new SqlCommand("SELECT A.*,B.*,C.area,D.no_of_bedrooms,D.no_of_bathrooms From dbo.[Property] A JOIN dbo.[Room_Description] D ON (D.room_desc_id = A.room_desc_id) INNER JOIN dbo.[Area] C ON (C.area_id = A.area_id) CROSS APPLY(SELECT TOP 1 * FROM dbo.[Property_Image] B WHERE (B.property_id = A.property_id) ORDER BY B.property_id desc)B WHERE A.is_sold = 'false' AND A.property_type = 'Upper Portion' order by A.property_id desc", con))
            {

                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable Property = new DataTable();
                    sda.Fill(Property);
                    rptrProperty.DataSource = Property;
                    rptrProperty.DataBind();
<<<<<<< HEAD
                    
=======
                    if (Property.Rows.Count == 0)
                    {
                        propemptymsg.Text = "No properties found.";
                    }
>>>>>>> upstream/master
                }
            }
        }
    }

}