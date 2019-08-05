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
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.xml;
using iTextSharp.text.xml.simpleparser;
using iTextSharp.tool.xml;

public partial class Generated_Contract : System.Web.UI.Page
{
    protected string Day { get; set; }
    protected string Month { get; set; }
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
                String sDate = DateTime.Now.ToString();
                DateTime datevalue = (Convert.ToDateTime(sDate.ToString()));
                DateTime dt = DateTime.Now;
                Day = datevalue.Day.ToString();
                Month = dt.ToString("MMMM");

                BindContract();

            }
        }
    }

    private void BindContract()
    {
        String CS = ConfigurationManager.ConnectionStrings["RentrackdbConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            string tenantid = Request.QueryString["tenantid"];
            string landlordid = Request.QueryString["landlordid"];

            using (SqlCommand cmd = new SqlCommand("procBindContract", con))
            {
                SqlDataAdapter adapter = new SqlDataAdapter();
                DataSet dsusr = new DataSet();
                con.Open();
        
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@lndid", landlordid);
                cmd.Parameters.AddWithValue("@tntid", tenantid);
                adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dsusr);
                con.Close();
                gencntct.DataSource = dsusr;
                gencntct.DataBind();
            }
        }
    }

    protected void Save_Click(object sender, EventArgs e)
    {
        Response.ContentType = "application/pdf";
        Response.AddHeader("content-disposition", "attachment;filename=Tenant Agreement.pdf");
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        StringWriter sw = new StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(sw);
        Panel1.RenderControl(hw);
        StringReader sr = new StringReader(sw.ToString());
        Document pdfDoc = new Document(PageSize.A4, 60f, 60f, 50f, 60f);
        PdfWriter writer = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
        pdfDoc.Open();
        XMLWorkerHelper.GetInstance().ParseXHtml(writer, pdfDoc, sr);
        pdfDoc.Close();
        Response.Write(pdfDoc);
        Response.End();

    }
}