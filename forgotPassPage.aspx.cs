using System;
using System.Collections.Generic;
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
    public partial class forgotPassPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Master.FindControl("linkAboutUs").Visible = false;
            this.Master.FindControl("linkServices").Visible = false;
            this.Master.FindControl("linkPortfolio").Visible = false;
            this.Master.FindControl("linkTeam").Visible = false;
            this.Master.FindControl("linkContactUs").Visible = false;
        }
        protected void btnSendEmail_Click(object sender, EventArgs e)
        {
            try
            {
                String guide = Guid.NewGuid().ToString();
                int Pk = 0;
                string Email = "";
                CRUD myCrud = new CRUD();
                string mySql = @"select * from customer where email =@email";
                Dictionary<string, object> myPara = new Dictionary<string, object>();
                myPara.Add("@email", txtEmail.Text);

                SqlDataReader dr = myCrud.getDrPassSqlDic(mySql, myPara);
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Pk = int.Parse(dr["customerId"].ToString());
                        Email = dr["email"].ToString();
                        // send email 
                        sendEmail(Pk, Email, guide);
                        insertEmailGuide(Pk, Email, guide);
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        protected void insertEmailGuide(int Id, string Email, string Guide)
        {
            CRUD myCrud = new CRUD();
            string mySql = @"insert into forgotPassword(guide, customerId) values (@guide, @customerId)";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@guide", Guide);
            myPara.Add("@customerId", Id);
            int rtn = myCrud.InsertUpdateDeleteViaSqlDic(mySql, myPara);
            if (rtn >= 1)
            {
                lblOutput.Text = "Password reset instructions have been sent.";
                lblOutput.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                lblOutput.Text = "Failed Operation! Please Try Again";
                lblOutput.ForeColor = System.Drawing.Color.Red;
            }
        }
        protected void sendEmail(int intId, string strEmail, string strGuide)
        {
            try
            {
                String EmailBody = "Hello " + strEmail + ",<br/><br/> Click on the provided link to reset your password. <br/><br/>  http://localhost:55537//resetPassword.aspx?customerId=" + strGuide;
                MailMessage PassRecMail = new MailMessage("internkfmc2021@gmail.com", strEmail);
                PassRecMail.Body = EmailBody;
                PassRecMail.IsBodyHtml = true;
                PassRecMail.Subject = "Reset Password";
                PassRecMail.Priority = MailPriority.High;
                SmtpClient SMTP = new SmtpClient("smtp.gmail.com", 587);
                SMTP.DeliveryMethod = SmtpDeliveryMethod.Network;
                SMTP.UseDefaultCredentials = false;
                SMTP.Credentials = new NetworkCredential()
                {
                    UserName = "internkfmc2021@gmail.com",
                    Password = "123456KFMC"
                };
                SMTP.EnableSsl = true;
                SMTP.Send(PassRecMail);
                lblOutput.Text = "Password reset instructions have been sent, Check your email to reset your password.";
                lblOutput.ForeColor = System.Drawing.Color.Green;
                txtEmail.Text = "";
            }
            catch (Exception)
            {
                lblOutput.Text = "Failed Operation! Please Try Again";
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


