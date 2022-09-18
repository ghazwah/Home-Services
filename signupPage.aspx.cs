using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeService
{
    public partial class signupPage : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["homeServices"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Master.FindControl("linkAboutUs").Visible = false;
            this.Master.FindControl("linkServices").Visible = false;
            this.Master.FindControl("linkPortfolio").Visible = false;
            this.Master.FindControl("linkTeam").Visible = false;
            this.Master.FindControl("linkContactUs").Visible = false;

            if (!Page.IsPostBack)
            {
              
            }
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            if (checkMemberExists())
            {
                Response.Write("<script>alert('This account already exists!');</script>");
            }
            else if (!confirmPassword())
            {
                Response.Write("<script>alert('Those passwords did not match! Try again.');</script>");
            }
            else
            {
                try
                {
                    if (ValidateEmpty(txtFName.Text) || ValidateEmpty(txtLName.Text) || ValidateEmpty(txtEmail.Text) || ValidateEmpty(txtPhone.Text) || ValidateEmpty(txtPassword.Text) || ValidateEmpty(txtConfirmPassword.Text))
                    {
                        Response.Write("<script>alert('Please fill all the fields correctly!');</script>");
                    }
                    MailMessage ms = new MailMessage();
                    ms.From = new MailAddress("internkfmc2021@gmail.com");
                    ms.To.Add(txtEmail.Text);
                    ms.Subject = "Welcome to Home Services!";
                    ms.Body = "Welcome, We are excites you have joined Home Services!";
                    SmtpClient sc = new SmtpClient("smtp.gmail.com", 587);
                    sc.Port = 587;
                    sc.Credentials = new NetworkCredential("internkfmc2021@gmail.com", "123456KFMC");
                    sc.EnableSsl = true;
                    sc.Send(ms);
                    signUpNewMember();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

            }
        }
        //Check if Those passwords did not match
        public bool confirmPassword()
        {
            string password = txtPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();

            if (password.Equals(confirmPassword))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        //Check This account already exists
        bool checkMemberExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from customer where email='" + txtEmail.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        bool ValidateEmpty(string empty)
        {
            if (empty == "")
            {
                return true;
            }
            else
            {
                return false;

            }
        }

        void signUpNewMember()
        {
            CRUD myCrud = new CRUD();
            string mySql = @"insert into customer(fName,lName,password,email,phone)
                    values(@fName,@lName,@password,@email,@phone)";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@fName", txtFName.Text);
            myPara.Add("@lName", txtLName.Text);
            myPara.Add("@password", txtPassword.Text);
            myPara.Add("@email", txtEmail.Text);
            myPara.Add("@phone", txtPhone.Text);
            int rtn = myCrud.InsertUpdateDeleteViaSqlDic(mySql, myPara);
            if (rtn >= 1)
            {
                Response.Write("<script>alert('Thank you for Signing Up with Home Services family!');</script>");
            }
            else
            {
                Response.Write("<script>alert('Pleas try again!');</script>");
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


