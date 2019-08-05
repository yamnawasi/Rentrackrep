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

public partial class contract : System.Web.UI.Page
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
                string tenantid = Request.QueryString["tenantid"];
                string landlordid = Request.QueryString["landlordid"];

                if (tenantid == null && landlordid == null)
                {
                    Response.Redirect("Dashboard.aspx");
                }

                RangeValidator1.MinimumValue = DateTime.Today.ToShortDateString();
                RangeValidator1.MaximumValue = DateTime.Today.AddMonths(11).ToShortDateString();

                DateRangeValidator.MinimumValue = DateTime.Today.AddMonths(11).ToShortDateString();
                DateRangeValidator.MaximumValue = DateTime.Today.AddYears(1).ToShortDateString();

                String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {

                    SqlCommand getusrtypeid = new SqlCommand("SELECT user_type_id FROM [User] WHERE user_id = '" + Session["user_id"].ToString() + "'", con);
                    con.Open();
                    string usrtypeid = getusrtypeid.ExecuteScalar().ToString();
                    getusrtypeid.ExecuteNonQuery();

                    if (usrtypeid == landlordid)
                    {
                        sndlnd.Visible = false;
                        tbtntfname.Attributes.Add("readonly", "readonly");
                        tbtntlname.Attributes.Add("readonly", "readonly");
                        tntparent.Attributes.Add("readonly", "readonly");
                        tntcnicnum.Attributes.Add("readonly", "readonly");
                        tntaddress.Attributes.Add("readonly", "readonly");

                        //getting tenant's details tenant
                        SqlCommand contcmd = new SqlCommand("SELECT * FROM [Contract_Form] WHERE landlord_id = '" + landlordid + "' AND tenant_id = '" + tenantid + "'", con);
                        SqlDataAdapter contsda = new SqlDataAdapter(contcmd);
                        DataTable contdt = new DataTable();
                        contsda.Fill(contdt);
                        if (contdt.Rows.Count != 0)
                        {
                            if(contdt.Rows[0][7] != null)
                            {
                                string tfname = "";
                                string tlname = "";
                                SqlCommand getfname = new SqlCommand("SELECT f_name, l_name FROM [User] WHERE user_type_id = '" + tenantid + "'", con);
                                SqlDataReader freader = getfname.ExecuteReader();
                                while (freader.Read())
                                {
                                    tfname = freader[0].ToString();
                                    tlname = freader[1].ToString();
                                }
                                freader.Close();

                                tbtntfname.Text = tfname;
                                tbtntlname.Text = tlname;
                                tntparent.Text = contdt.Rows[0][7].ToString();
                                tntcnicnum.Text = contdt.Rows[0][8].ToString();
                                tntaddress.Text = contdt.Rows[0][9].ToString();

                                sndtnt.Visible = true;
                                sndlnd.Visible = false;
                                submitbtn.Visible = false;
                            }
                            if(contdt.Rows[0][10] != null && contdt.Rows[0][12] != null && contdt.Rows[0][13] != null)
                            {
                                tbstart.Visible = false;
                                tbend.Visible = false;
                                txttbstart.Visible = true;
                                tbendtxt.Visible = true;

                                sndtnt.Visible = false;
                                sndlnd.Visible = false;
                                submitbtn.Visible = true;

                                tblndfname.Attributes.Add("readonly", "readonly");
                                tblndlname.Attributes.Add("readonly", "readonly");
                                lndlrdparent.Attributes.Add("readonly", "readonly");
                                lndlrdcnicnum.Attributes.Add("readonly", "readonly");
                                tblndaddress.Attributes.Add("readonly", "readonly");
                                tbrntaddress.Attributes.Add("readonly", "readonly");
                                tbrent.Attributes.Add("readonly", "readonly");
                                tbfxd.Attributes.Add("readonly", "readonly");
                                Cntrctlife.Attributes.Add("disabled", "disabled");
                                //dates
                                rntpay.Attributes.Add("readonly", "readonly");
                                tbstart.Attributes.Add("readonly", "readonly");
                                tbend.Attributes.Add("readonly", "readonly");
                                txttbstart.Attributes.Add("readonly", "readonly");
                                tbendtxt.Attributes.Add("readonly", "readonly");

                            }
                            
                        }
                    }

                    if (usrtypeid == tenantid)
                    {
                        sndtnt.Visible = false;
                        sndlnd.Visible = true;
                        submitbtn.Visible = false;

                        tblndfname.Attributes.Add("readonly", "readonly");
                        tblndlname.Attributes.Add("readonly", "readonly");
                        lndlrdparent.Attributes.Add("readonly", "readonly");
                        lndlrdcnicnum.Attributes.Add("readonly", "readonly");
                        tblndaddress.Attributes.Add("readonly", "readonly");
                        tbrntaddress.Attributes.Add("readonly", "readonly");
                        tbrent.Attributes.Add("readonly", "readonly");
                        tbfxd.Attributes.Add("readonly", "readonly");
                        Cntrctlife.Attributes.Add("disabled", "disabled");
                        //dates
                        rntpay.Attributes.Add("readonly", "readonly");
                        tbstart.Attributes.Add("readonly", "readonly");
                        tbend.Attributes.Add("readonly", "readonly");
                        txttbstart.Attributes.Add("readonly", "readonly");
                        tbendtxt.Attributes.Add("readonly", "readonly");

                    }

                    //checking if any contracts exist of the landlord and tenant
                    SqlCommand concmd = new SqlCommand("SELECT * FROM [Contract_Form] WHERE landlord_id = '" + landlordid + "' AND tenant_id = '" + tenantid + "'", con);
                    SqlDataAdapter consda = new SqlDataAdapter(concmd);
                    DataTable condt = new DataTable();
                    consda.Fill(condt);
                    if (condt.Rows.Count != 0)
                    {
                        string lfname = "";
                        string llname = "";
                        string contractilfe = "";
                        SqlCommand getfname = new SqlCommand("SELECT f_name, l_name FROM [User] WHERE user_type_id = '" + landlordid + "'", con);
                        SqlDataReader freader = getfname.ExecuteReader();
                        while (freader.Read())
                        {
                            lfname = freader[0].ToString();
                            llname = freader[1].ToString();
                        }
                        freader.Close();
                        var sdate = (DateTime)condt.Rows[0][13];
                        var edate = (DateTime)condt.Rows[0][12];


                        tblndfname.Text = lfname;
                        tblndlname.Text = llname;
                        lndlrdparent.Text = condt.Rows[0][2].ToString();
                        lndlrdcnicnum.Text = condt.Rows[0][3].ToString();
                        tblndaddress.Text = condt.Rows[0][4].ToString();
                        tbrntaddress.Text = condt.Rows[0][5].ToString();
                        tbrent.Text = condt.Rows[0][10].ToString();
                        tbfxd.Text = condt.Rows[0][11].ToString();
                        contractilfe = condt.Rows[0][14].ToString();
                        rntpay.Text = condt.Rows[0][10].ToString();
                        txttbstart.Text = sdate.ToShortDateString();
                        tbendtxt.Text = edate.ToShortDateString();

                        //Contract life
                        ListItem selectedcontractlife = Cntrctlife.Items.FindByValue(contractilfe);
                        if (selectedcontractlife != null)
                        {
                            Cntrctlife.SelectedItem.Selected = false;
                            selectedcontractlife.Selected = true;
                        }
                    }
                }
            }
        }
   
    }

    //Send the Tenant Notification
    private void SendContractToTenantNotif()
    {
        string propid = "", lfname = "", llname = "", tenantuserid = "", landlorduserid = "";
        string notifid = Request.QueryString["notifid"];

        string tenantid = Request.QueryString["tenantid"];
        string landlordid = Request.QueryString["landlordid"];

        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();

            //Get Property ID
            SqlCommand cmdd = new SqlCommand("SELECT A.property_id FROM dbo.[Property] A JOIN dbo.[Notification] B ON (A.property_id = B.property_id) WHERE B.notif_id ='" + Convert.ToInt32(notifid) + "'", con);
            SqlDataReader reader = cmdd.ExecuteReader();
            while (reader.Read())
            {
                propid = reader[0].ToString();;
            }
            reader.Close();

            //Get Tenant's User ID
            SqlCommand gettenuserid = new SqlCommand("SELECT A.user_id FROM dbo.[USER] A JOIN dbo.[USER_TYPE] B ON (A.user_type_id = B.user_type_id) WHERE B.tenant_id ='" + tenantid + "'", con);
            SqlDataReader nreader = gettenuserid.ExecuteReader();
            while (nreader.Read())
            {
                tenantuserid = nreader[0].ToString();
            }
            nreader.Close();

            //Get Landlord's User ID, Fname and Lname
            SqlCommand getllstuff = new SqlCommand("SELECT A.l_name, A.f_name, A.user_id FROM dbo.[USER] A JOIN dbo.[USER_TYPE] B ON (A.user_type_id = B.user_type_id) WHERE B.landlord_id ='" + landlordid + "'", con);
            SqlDataReader lreader = getllstuff.ExecuteReader();
            while (lreader.Read())
            {
                llname = lreader[0].ToString();
                lfname = lreader[1].ToString();
                landlorduserid = lreader[2].ToString();
            }
            lreader.Close();

            //Notification Text
            string notiftext = lfname + " " + llname + " has sent you a Tenancy Agreement (incomplete). Kindly fill in your information.";

            //Store in Notification Table
            DateTime today = DateTime.Today;
            SqlCommand createnotif = new SqlCommand("INSERT INTO dbo.[Notification] (notif_type, creation_date, is_viewed, sender_id, receiver_id, notification_text, property_id, btn_text) VALUES ('" + "Send Contract (Tenant)" + "','" + today + "','" + 0 + "','" + landlorduserid + "','" + tenantuserid + "','" + notiftext + "','" + propid + "','" + "View Contract Form" + "')", con);
            createnotif.ExecuteNonQuery();

            //Get Notif ID
            SqlCommand getrdid = new SqlCommand("SELECT TOP 1 * FROM dbo.[Notification] ORDER BY notif_id DESC", con);
            getrdid.ExecuteNonQuery();
            int notifidtab;
            notifidtab = (int)getrdid.ExecuteScalar();

            //Create link
            string btnlink = "contract.aspx?tenantid=" + tenantid + "&landlordid=" + landlordid + "&notifid=" + notifidtab;

            //Add Button Link
            SqlCommand updatenotif = new SqlCommand("UPDATE dbo.[Notification] SET btn_link = '" + btnlink + "' WHERE notif_id = '" + notifidtab + "'", con);
            updatenotif.ExecuteNonQuery();
        }

        //Hide Landlord's Create Contract Notif
        HideNotifi(notifid);
    }

    //Hide Notification
    protected void HideNotifi(string notifi_id)
    {
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand hidenotifx = new SqlCommand("UPDATE dbo.[Notification] SET is_viewed = '" + 1 + "' WHERE notif_id = '" + notifi_id + "'", con);
            con.Open();
            hidenotifx.ExecuteNonQuery();
        }
    }

    //Send the Landlord Notification
    private void SendLandlordNotif()
    {
        string propid = "", tfname = "", tlname = "", tenantuserid = "", landlorduserid = "";
        string notifid = Request.QueryString["notifid"];

        string tenantid = Request.QueryString["tenantid"];
        string landlordid = Request.QueryString["landlordid"];

        //Hide Tenant's Create Contract Notif
        HideNotifi(notifid);

        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();

            //Get Property ID
            SqlCommand cmdd = new SqlCommand("SELECT A.property_id FROM dbo.[Property] A JOIN dbo.[Notification] B ON (A.property_id = B.property_id) WHERE B.notif_id ='" + Convert.ToInt32(notifid) + "'", con);
            SqlDataReader reader = cmdd.ExecuteReader();
            while (reader.Read())
            {
                propid = reader[0].ToString(); ;
            }
            reader.Close();

            //Get Landlord's User ID
            SqlCommand gettenuserid = new SqlCommand("SELECT A.user_id FROM dbo.[USER] A JOIN dbo.[USER_TYPE] B ON (A.user_type_id = B.user_type_id) WHERE B.landlord_id ='" + landlordid + "'", con);
            SqlDataReader nreader = gettenuserid.ExecuteReader();
            while (nreader.Read())
            {
                landlorduserid = nreader[0].ToString();
            }
            nreader.Close();

            //Get Tenant's User ID, Fname and Lname
            SqlCommand getllstuff = new SqlCommand("SELECT A.l_name, A.f_name, A.user_id FROM dbo.[USER] A JOIN dbo.[USER_TYPE] B ON (A.user_type_id = B.user_type_id) WHERE B.tenant_id ='" + tenantid + "'", con);
            SqlDataReader lreader = getllstuff.ExecuteReader();
            while (lreader.Read())
            {
                tlname = lreader[0].ToString();
                tfname = lreader[1].ToString();
                tenantuserid = lreader[2].ToString();
            }
            lreader.Close();

            //Notification Text
            string notiftext = tfname + " " + tlname + " has sent the Tenancy Agreement (complete) back to you. You can now generate a complete Tenancy Agreement.";

            //Store in Notification Table
            DateTime today = DateTime.Today;
            SqlCommand createnotif = new SqlCommand("INSERT INTO dbo.[Notification] (notif_type, creation_date, is_viewed, sender_id, receiver_id, notification_text, property_id, btn_text) VALUES ('" + "Send Contract (Landlord)" + "','" + today + "','" + 0 + "','" + tenantuserid + "','" + landlorduserid + "','" + notiftext + "','" + propid + "','" + "View Contract Form" + "')", con);
            createnotif.ExecuteNonQuery();

            //Get Notif ID
            SqlCommand getrdid = new SqlCommand("SELECT TOP 1 * FROM dbo.[Notification] ORDER BY notif_id DESC", con);
            getrdid.ExecuteNonQuery();
            int notifidtab;
            notifidtab = (int)getrdid.ExecuteScalar();

            //Create link
            string btnlink = "contract.aspx?tenantid=" + tenantid + "&landlordid=" + landlordid + "&notifid=" + notifidtab;

            //Add Button Link
            SqlCommand updatenotif = new SqlCommand("UPDATE dbo.[Notification] SET btn_link = '" + btnlink + "' WHERE notif_id = '" + notifidtab + "'", con);
            updatenotif.ExecuteNonQuery();
        }
    }

    //Sending Tenant (storing Landlord's details)
    protected void Sndtnt(object sender, EventArgs e)
    {
        string lndlrdid= Request.QueryString["landlordid"];
        string tenantid = Request.QueryString["tenantid"];
        string lname = tblndfname.Text + " " + tblndlname.Text;

        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd1 = new SqlCommand("INSERT INTO [Contract_Form](landlord_id, landlord_father, landlord_cnic, landlord_address, property_address, tenant_id, rent, fixed_deposit, end_date, start_date, contract_life, rent_payable_date, landlord_name) VALUES ('" + lndlrdid + "', '" + lndlrdparent.Text + "', '" + lndlrdcnicnum.Text + "','" + tblndaddress.Text + "','" + tbrntaddress.Text + "','" + tenantid + "', '" + tbrent.Text + "', '" + tbfxd.Text + "', '" + tbstart.Text + "', '" + tbend.Text + "', '" + Cntrctlife.SelectedValue + "', '" + rntpay.Text + "', '" + lname + "')", con);
            con.Open();
            cmd1.ExecuteNonQuery();
        }

        string msg = "Your data has been stored and sent to Tenant";
        Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('" + msg + "');", true);

        SendContractToTenantNotif();
    }

    //Sending Landlord (storing Tenant's details)
    protected void Sndlnd(object sender, EventArgs e)
    {
        string tenantid = Request.QueryString["tenantid"];
        string landlordid = Request.QueryString["landlordid"];
        string tname = tbtntfname.Text + " " + tbtntlname.Text;

        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd1 = new SqlCommand("UPDATE [Contract_Form] SET tenant_father='" + tntparent.Text + "', tenant_cnic='" + tntcnicnum.Text + "', tenant_address='" + tntaddress.Text + "', tenant_name ='" + tname + "' WHERE tenant_id = '" + tenantid + "' AND landlord_id = '" + landlordid + "'", con);
            con.Open();
            cmd1.ExecuteNonQuery();
        }

        string msg = "Your data has been stored and sent to Landlord";
        Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('" + msg + "');", true);

        SendLandlordNotif();
    }

    //Generating contract 
    protected void Generate_Click(object sender, EventArgs e)
    {
        string tenantid = Request.QueryString["tenantid"];
        string landlordid = Request.QueryString["landlordid"];

        Response.Redirect("Generated Contract.aspx?tenantid=" + tenantid + "&landlordid=" + landlordid);
    }
}