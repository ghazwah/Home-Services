
using HomeService.App_Code;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeService
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void btnSendMailViaMailMgr_Click(object sender, EventArgs e)
        {
            sendEmail(); 
        }
        protected void sendEmail() 
        {
            string rtn = "";
            if (common.IsNullOrEmptyControlObj(txtSenderEmail, lblOutput, "Please fill  your email !") == true) return;
            if (common.IsNullOrEmptyControlObj(txtSubject, lblOutput, "Please fill the Subject !") == true) return;
            if (common.IsNullOrEmptyControlObj(Richtextbox, lblOutput, "Please fill email body !") == true) return;

            string myTo = "";
            if (!string.IsNullOrEmpty(Session["email"] as string))
            {
                myTo = (Session["email"].ToString());
            }
            else
            {
                myTo = "internkfmc2021@gmail.com";
            }
            string senderEmail = txtSenderEmail.Text;
            string subject = txtSubject.Text;
            string myBody = "";
            senderEmail = txtSenderEmail.Text;
            subject = txtSubject.Text;
            myBody = "";
            myBody += (string.IsNullOrEmpty(Session["email"] as string) ? senderEmail + "\n\n" : "");
            myBody += Richtextbox.Text;
            myBody += @"


        Regards,

        Home Services Family.
        Trainees at KFMC.
        Students at UHB.
        Web development Summer-Fall 2021.
        King Fahad Medical City.
        Riyadh.
        Kingdom Of Saudi Arabia.
        Supervisor: Eng.Ali H.
        Supervisor Email: ahameed@kfmc.med.sa";
            try
            {
                mailMgr myMailmgr = new mailMgr();
                rtn = myMailmgr.sendEmailViaGmail(myTo, senderEmail, subject, myBody, FileUpload);  
                common.PostMsg(lblOutput, rtn, "green");
            }
            catch (Exception ex)
            {
                lblOutput.Text = ex.Message.ToString();
            }
        }
        protected void btnClear_Click(object sender, EventArgs e)
        {
            common.clearControl(txtSenderEmail);
            common.clearControl(txtSubject);
            common.clearControl(Richtextbox);
            common.clearControl(lblOutput);
            Session["email"] = null;
        }

        protected void lnkmaid_Click(object sender, EventArgs e)
        {
            if(Session["role"] == null)
            {
                //Response.Write("<script>alert('You need to Sign up or Log In before getting benefits with our services!');</script>");
                //Response.Write("<script>window.open('" + "loginPage.aspx" + "','_blank');</script>"); //open a new tab
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                                        "alert", "alert('You need to Sign up or Log In before getting benefits with our services!');window.location ='loginPage.aspx';", true);
            }
            else 
            {
                Response.Redirect("maidService.aspx");
            }
        }

        protected void lnkBaby_Click(object sender, EventArgs e)
        {
            if (Session["role"] == null )
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                                        "alert", "alert('You need to Sign up or Log In before getting benefits with our services!');window.location ='loginPage.aspx';", true);
            }
            else
            {
                Response.Redirect("baby.aspx");
            }
        }

        protected void lnkDrivers_Click(object sender, EventArgs e)
        {
            if (Session["role"] == null)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                                        "alert", "alert('You need to Sign up or Log In before getting benefits with our services!');window.location ='loginPage.aspx';", true);
            }
            else
            {
                Response.Redirect("driver.aspx");
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