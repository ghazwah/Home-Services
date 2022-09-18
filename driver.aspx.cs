using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Net.Mail;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeService
{
    public partial class driver : System.Web.UI.Page
    {

        string strcon = ConfigurationManager.ConnectionStrings["homeServices"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                populateddlDuration();
                populateRepeater();
                populateddlDriver();

            }
            this.Master.FindControl("linkAboutUs").Visible = false;
            this.Master.FindControl("linkServices").Visible = false;
            this.Master.FindControl("linkPortfolio").Visible = false;
            this.Master.FindControl("linkTeam").Visible = false;
            this.Master.FindControl("linkContactUs").Visible = false;

        }
        private void populateRepeater()
        {

            CRUD myCrud = new CRUD();
            string mySql = @"SELECT driver.driverName,driver.driverId, driver.driverAge,
               driver.experienceYears, driver.note, religion.religion, nationality.nationality, maritalStatus.maritalStatus
           FROM  driver INNER JOIN
         maritalStatus ON driver.maritalStatusId = maritalStatus.maritalStatusId INNER JOIN
         nationality ON driver.nationalityId = nationality.nationalityId INNER JOIN
         religion ON driver.religionId = religion.religionId";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            Repeater1.DataSource = dr;
            Repeater1.DataBind();
        }
        protected void populateddlDuration()
        {
            CRUD myCrud = new CRUD();
            string mySql = @" select * from duration";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            ddlDuration.DataValueField = ("durationId");
            ddlDuration.DataTextField = ("duration");
            ddlDuration.DataSource = dr;
            ddlDuration.DataBind();
        }

        protected void populateddlDriver()
        {
            CRUD myCrud = new CRUD();
            string mySql = @" select driverId, driverName from driver";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            ddlDriver.DataValueField = ("driverId");
            ddlDriver.DataTextField = ("driverName");
            ddlDriver.DataSource = dr;
            ddlDriver.DataBind();
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            if (ValidateEmpty(txtEmail.Text) || ValidateEmpty(ddlDuration.SelectedValue) || ValidateEmpty(cbAgree.SelectedValue) || ValidateEmpty(ddlDriver.SelectedValue))
            {
                Response.Write("<script>alert('Please fill all the fields correctly!');</script>");
            }
            else
            {
                CRUD myCrud = new CRUD();
                string mySql = @"insert into contract (email , durationId,services, driverId)
                values (@email , @durationId, @services,@driverId)";
                Dictionary<string, object> myPara = new Dictionary<string, object>();
                myPara.Add("@email", txtEmail.Text);
                myPara.Add("@services", txtServices.Text);
                myPara.Add("@driverId", ddlDriver.SelectedValue);
                myPara.Add("@durationId", ddlDuration.SelectedValue);
                int rtn = myCrud.InsertUpdateDeleteViaSqlDic(mySql, myPara);
                if (rtn >= 1)
                {
                    sendEmailViaGmail();
                }
                else
                {
                    //
                }

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

        public string sendEmailViaGmail() // worked 100%, this is a nice one use it with  properties
        {

            string myFrom = "internkfmc2021@gmail.com"; // put your email account (from )
            string myTo = txtEmail.Text; // put your email account (to )
            string mySubject = "Welcome!";
            string myBody = "<body><div style = 'margin:auto;width: 100%;text-align:center' >" +
                            "<img src ='https://l.top4top.io/p_21524xmni1.png' style = 'width: 100%;' >" +
                            "</body> ";

            string myHostsmtpAddress = "smtp.gmail.com";//"smtp.mail.yahoo.com";  //mail.wdbcs.com 
            int myPortNumber = 587;
            bool myEnableSSL = true;
            string myUserName = "internkfmc2021@gmail.com";//;
            string myPassword = "123456KFMC";//;


            //string visitorUserName = Page.User.Identity.Name;
            using (MailMessage m = new MailMessage(myFrom, myTo, mySubject, myBody)) // .............................1
            {

                m.IsBodyHtml = true;
                SmtpClient sc = new SmtpClient(myHostsmtpAddress, myPortNumber); //..................................2
                try
                {
                    sc.Credentials = new System.Net.NetworkCredential(myUserName, myPassword);  //.................3
                    sc.EnableSsl = true;
                    sc.Send(m);
                    return lblMsg.Text = ("The confirmation message sent successfully!");

                    //lblMsg.ForeColor = Color.Green; // using System.Drawing above 2/2018
                }
                catch (SmtpFailedRecipientException ex)
                {
                    SmtpStatusCode statusCode = ex.StatusCode;
                    if (statusCode == SmtpStatusCode.MailboxBusy || statusCode == SmtpStatusCode.MailboxUnavailable || statusCode == SmtpStatusCode.TransactionFailed)
                    {   // wait 5 seconds, try a second time
                        Thread.Sleep(5000);
                        sc.Send(m);
                        return ex.Message.ToString();
                    }
                    else
                    {
                        throw;
                    }
                }
                catch (Exception ex)
                {
                    return ex.Message.ToString();
                }
                finally
                {
                    m.Dispose();
                }

            }// end using 
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