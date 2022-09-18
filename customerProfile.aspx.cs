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
    public partial class customerProfile : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["homeServices"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Master.FindControl("linkAboutUs").Visible = false;
            this.Master.FindControl("linkServices").Visible = false;
            this.Master.FindControl("linkPortfolio").Visible = false;
            this.Master.FindControl("linkTeam").Visible = false;
            this.Master.FindControl("linkContactUs").Visible = false;
            //
            try
            {
                if (Session["email"].ToString() == "" || Session["email"] == null)
                {
                    Response.Write("<script>alert('Session Expired Login Again!');</script>");
                    Response.Redirect("~/loginPage.aspx");
                }
                else
                {
                    if (!Page.IsPostBack)
                    {
                        getUserPersonalDetails();
                    }
                    else
                    {
                        //
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Session Expired Login Again!');</script>");
                Response.Redirect("~/loginPage.aspx");
            }

        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (ValidateEmpty(txtFName.Text) || ValidateEmpty(txtLName.Text) || ValidateEmpty(txtEmail.Text) || ValidateEmpty(txtPhone.Text))
            {
                lblOutput.Text = "Please fill  all the fields correctly!";
                lblOutput.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                int PK = int.Parse(txtCustomerId.Text);
                CRUD myCrud = new CRUD();
                string mySql = @"update customer set fName= @fName, @lName=@lName,email=@email,
                                phone=@phone where customerId=@customerId";
                Dictionary<string, object> myPara = new Dictionary<string, object>();
                myPara.Add("@customerId", PK);
                myPara.Add("@fName", txtFName.Text);
                myPara.Add("@lName", txtLName.Text);
                myPara.Add("@email", txtEmail.Text);
                myPara.Add("@phone", txtPhone.Text);
                int rtn = myCrud.InsertUpdateDeleteViaSqlDic(mySql, myPara);
                if (rtn >= 1)
                {
                   lblOutput.Text = "Success operation! Your password has been updated.";
                   lblOutput.ForeColor = System.Drawing.Color.Green;
                   sendEmail();
                }
                else
                {
                   lblOutput.Text = "Failed operation! Please Try Again.";
                   lblOutput.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
        private bool ValidateEmpty(string empty)
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
        protected void sendEmail()
        {
            try
            {
                MailMessage ms = new MailMessage();
                ms.From = new MailAddress("internkfmc2021@gmail.com");
                ms.To.Add(txtEmail.Text);
                ms.Subject = "Home Services!";
                ms.Body = "Thank you for updating your profile with Home Services family!";
                //
                SmtpClient sc = new SmtpClient("smtp.gmail.com", 587);
                sc.Port = 587;
                sc.Credentials = new NetworkCredential("internkfmc2021@gmail.com", "123456KFMC");
                sc.EnableSsl = true;
                sc.Send(ms);
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }
        void getUserPersonalDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                else
                { 
                    //
                }
                SqlCommand cmd = new SqlCommand(@"select customerId,fName,lName,password,email,phone
                                                        from customer where email= '" + Session["email"] + "'", con);
                SqlDataAdapter sqlDa = new SqlDataAdapter(cmd);
                DataTable dtbl = new DataTable();
                sqlDa.Fill(dtbl);
                if (dtbl.Rows.Count > 0)
                {
                    txtCustomerId.Text = dtbl.Rows[0]["customerId"].ToString();
                    txtFName.Text = dtbl.Rows[0]["fName"].ToString();
                    txtLName.Text = dtbl.Rows[0]["lName"].ToString();
                    txtOldPassword.Text = dtbl.Rows[0]["password"].ToString();
                    txtEmail.Text = dtbl.Rows[0]["email"].ToString();
                    txtPhone.Text = dtbl.Rows[0]["phone"].ToString();
                 
                }
                else
                {
                    //
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        protected void btnUpdatePassword_Click(object sender, EventArgs e)
        {
            if (ValidateEmpty(txtNewPassword.Text))
            {
                lblAjax.Text = "Please fill the new password field correctly!";
                lblAjax.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                string mySql = @"update customer set password = @password
                                       where customerId = @customerId";
                Dictionary<string, object> myPara = new Dictionary<string, object>();
                myPara.Add("@customerId", txtCustomerId.Text);
                myPara.Add("@password", txtNewPassword.Text);
                CRUD myCrud = new CRUD();
                int rtn = myCrud.InsertUpdateDeleteViaSqlDic(mySql, myPara);
                if (rtn >= 1)
                {
                    lblAjax.Text = "Success operation! Your profile has been updated.";
                    lblAjax.ForeColor = System.Drawing.Color.Green;
                    sendEmail();
                }
                else
                {
                    lblAjax.Text = "Failed operation! Please Try Again.";
                    lblAjax.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (ChBoxDelete.Checked == true)
            {
                CRUD myCrud = new CRUD();
                string mySql = @"delete customer where customerId = @customerId";
                Dictionary<string, object> myPara = new Dictionary<string, object>();
                myPara.Add("@customerId", int.Parse(txtCustomerId.Text));
                int rtn = myCrud.InsertUpdateDeleteViaSqlDic(mySql, myPara);
                if (rtn >= 1)
                {
                    lblOutput.Text = "Success operation! Your account has been deleted.";
                    lblOutput.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    lblOutput.Text = "Failed operation! Please Try Again.";
                    lblOutput.ForeColor = System.Drawing.Color.Red;
                }
                Session["role"] = null;
                Response.Redirect("~/Home.aspx");
            }
            else
            {
                lblOutput.Text = "Checkbox to approve account removal!";
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






