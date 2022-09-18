using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeService
{
    public partial class resetPassword : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["homeServices"].ConnectionString;
        string guideValue;
        DataTable dt = new DataTable();
        int customerId;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Master.FindControl("linkAboutUs").Visible = false;
            this.Master.FindControl("linkServices").Visible = false;
            this.Master.FindControl("linkPortfolio").Visible = false;
            this.Master.FindControl("linkTeam").Visible = false;
            this.Master.FindControl("linkContactUs").Visible = false;
            //
            using (SqlConnection con = new SqlConnection(strcon))
            {
                guideValue = Request.QueryString["customerId"];
                if (guideValue != null)
                {
                    SqlCommand cmd = new SqlCommand("select * from forgotPassword where guide='" + guideValue + "'", con);
                    con.Open();
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        customerId = Convert.ToInt32(dt.Rows[0][2]);
                    }
                    else
                    {
                        Response.Write("<script>alert('Your password reset link is expired or invalid! Try Again.');</script>");
                    }
                }
                else
                {
                    Response.Redirect("~/forgotPassPage.aspx");
                }
            }
            if (!IsPostBack)
            {
                if (dt.Rows.Count != 0)
                {
                    txtNewPassword.Visible = true;
                    txtConfirmPassword.Visible = true;
                    btnSubmit.Visible = true;
                }
                else
                {
                    Response.Write("<script>alert('Your password reset link is expired or invalid! Try Again.');</script>");
                }
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (txtNewPassword.Text != "" && txtConfirmPassword.Text != "" && txtNewPassword.Text == txtConfirmPassword.Text)
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    SqlCommand cmd = new SqlCommand("update customer set password='" + txtNewPassword.Text + "' where customerId='" + customerId + "'", con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    SqlCommand cmd2 = new SqlCommand("delete from forgotPassword where customerId='" + customerId + "'", con);
                    cmd2.ExecuteNonQuery();
                    lblOutput.Text = "Succeed Operation! Password Successfully Changed.";
                    lblOutput.ForeColor = System.Drawing.Color.Green;
                }
            }
            else
            {
                lblOutput.Text = "Failed Operation! An entry is required or has an invalid value. Please correct and try again.";
                lblOutput.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected override void InitializeCulture()
        {
            base.InitializeCulture();
            if (Session["culture"] != null)
            {
                CultureInfo ci = new CultureInfo(Session["culture"].ToString());
                Thread.CurrentThread.CurrentCulture = ci;
                Thread.CurrentThread.CurrentUICulture = ci;
            }
        }
        protected void lbtn_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            switch (btn.ID)
            {
                case ("lbtnEnglish"):
                    Session["culture"] = "en-US";
                    Server.Transfer(Request.Url.PathAndQuery, false);
                    break;
                case ("lbtnArabic"):
                    Session["culture"] = "ar-SA";
                    Server.Transfer(Request.Url.PathAndQuery, false);
                    break;
            }
        }
    }
}
