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

    public partial class baby : System.Web.UI.Page
    {

        string strcon = ConfigurationManager.ConnectionStrings["homeServices"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                populateddlDuration();
                populateddlBabySitter();
                populateRepeater();
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
            string mySql = @"SELECT babySitter.babySitterName,babySitter.babySitterId, babySitter.babySitterAge,
             babySitter.experienceYears, babySitter.note, religion.religion, nationality.nationality, maritalStatus.maritalStatus
           FROM  babySitter INNER JOIN
         maritalStatus ON babySitter.maritalStatusId = maritalStatus.maritalStatusId INNER JOIN
         nationality ON babySitter.nationalityId = nationality.nationalityId INNER JOIN
         religion ON babySitter.religionId = religion.religionId";
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
        protected void populateddlBabySitter()
        {
            CRUD myCrud = new CRUD();
            string mySql = @" select babySitterId, babySitterName from babySitter";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            ddlBabySitter.DataValueField = ("babySitterId");
            ddlBabySitter.DataTextField = ("babySitterName");
            ddlBabySitter.DataSource = dr;
            ddlBabySitter.DataBind();
        }
        protected void btnSend_Click(object sender, EventArgs e)
        {
            if (ValidateEmpty(txtEmail.Text) || ValidateEmpty(ddlDuration.SelectedValue) || ValidateEmpty(cbAgree.SelectedValue) || ValidateEmpty(ddlBabySitter.SelectedValue))
            {
                Response.Write("<script>alert('Please fill all the fields correctly!');</script>");
            }
            else
            {
                CRUD myCrud = new CRUD();
                string mySql = @"insert into contract (email , durationId,services,babySitterId )
                values (@email , @durationId, @services, @babySitterId)";
                Dictionary<string, object> myPara = new Dictionary<string, object>();
                myPara.Add("@email", txtEmail.Text);
                myPara.Add("@services", txtServices.Text);
                myPara.Add("@durationId", ddlDuration.SelectedValue);
                myPara.Add("@babySitterId", ddlBabySitter.SelectedValue);
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
                catch (Exception ex)
                {
                    return ex.Message.ToString();
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

