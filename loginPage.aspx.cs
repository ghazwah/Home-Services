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
    public partial class loginPage : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["homeServices"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
                this.Master.FindControl("linkAboutUs").Visible = false;
                this.Master.FindControl("linkServices").Visible = false;
                this.Master.FindControl("linkPortfolio").Visible = false;
                this.Master.FindControl("linkTeam").Visible = false;
                this.Master.FindControl("linkContactUs").Visible = false;

        }

        protected void btnLogIn_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from admin where adminEmail='" + txtEmail.Text.Trim() + "' AND adminPassword='" + txtPassword.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Session["adminEmail"] = dr.GetValue(1).ToString();
                        Session["adminPassword"] = dr.GetValue(2).ToString();
                        Session["role"] = "admin";
                    }
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid Email or Password');</script>");
                }
            }
            catch (Exception ex)
            {
                //
            }
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from customer where email='" + txtEmail.Text.Trim() + "' AND password='" + txtPassword.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Session["email"] = dr.GetValue(4).ToString();
                        Session["fName"] = dr.GetValue(1).ToString();
                        Session["password"] = dr.GetValue(3).ToString();
                        Session["role"] = "customer";
                    }
                    Response.Redirect("Home.aspx");
                }
                else
                {
                   //
                }
            }
            catch (Exception ex)
            {
                //
            }
           
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("signupPage.aspx");
        }

        protected void lbtnForgotPass_Click(object sender, EventArgs e)
        {
            Response.Redirect("forgotPassPage.aspx");
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