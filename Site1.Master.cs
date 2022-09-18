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
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

            try
            {
                if (Session["role"] == null)
                {
                    linkLogIn.Visible = true; // user login link button
                    linkSignup.Visible = true; // sign up link button

                    linkLogout.Visible = false; // logout link button
                    linkMsg.Visible = false; // hello user link button


                    //lbtnAdminLogin.Visible = true; // admin login link button
                }
                else if (Session["role"].Equals("customer"))
                {
                    linkLogIn.Visible = false; // user login link button
                    linkSignup.Visible = false; // sign up link button

                    linkServices.Visible = false;
                    linkServicesddl.Visible = true;

                    linkLogout.Visible = true; // logout link button
                    linkMsg.Visible = true; // hello user link button
                    linkMsg.Text = "Hello, &nbsp;" + Session["fName"].ToString();
                    //lbtnAdminLogin.Visible = true; // admin login link button
                }
                
                else if (Session["role"].Equals("admin"))
                {
                    linkLogIn.Visible = false; // user login link button
                    linkSignup.Visible = false; // sign up link button

                    linkServices.Visible = false;
                    linkServicesddl.Visible = true;

                    linkLogout.Visible = true; // logout link button
                    linkMsg.Visible = true; // hello user link button
                    linkMsg.Text = "Hello, Admin";

                    linkManage.Visible = true; // admin management link button
                    linkMaidManagement.Visible = true; // manage instructors link button
                    linkBabysitterManagement.Visible = true; // manage courses link button
                    linkDriverManagement.Visible = true; // manage trainees link button
                    linkFilesManagement.Visible = true;
                }
            }
            catch (Exception ex)
            {
                //
            }
        }
       
        protected void linkMaidManagement_Click(object sender, EventArgs e)
        {
            Response.Redirect("maidManagement.aspx");
        }

        protected void linkBabysitterManagement_Click(object sender, EventArgs e)
        {
            Response.Redirect("babySitterManagement.aspx");
        }

        protected void linkDriverManagement_Click(object sender, EventArgs e)
        {
            Response.Redirect("driverManagement.aspx");
        }

        protected void linkLogIn_Click(object sender, EventArgs e)
        {
            Response.Redirect("loginPage.aspx");
        }

        protected void linkSignup_Click(object sender, EventArgs e)
        {
            Response.Redirect("signupPage.aspx");
        }

        protected void linkLogout_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["fullname"] = "";
            //Session["role"] = "";
            Session["role"] = null;
            Session["status"] = "";

            linkManage.Visible = false; // manage link button
            linkLogIn.Visible = true; // user login link button
            linkSignup.Visible = true; // sign up link button

            linkLogout.Visible = false; // logout link button
            linkMsg.Visible = false; // hello user link button

            linkMaidManagement.Visible = false; // manage instructors link button
            linkBabysitterManagement.Visible = false; // manage courses link button
            linkDriverManagement.Visible = false; // manage trainees link button

            Response.Redirect("Home.aspx");

        }

        protected void linkMsg_Click(object sender, EventArgs e)
        {
            if (Session["role"].Equals("customer"))
            {
                Response.Redirect("customerProfile.aspx");
            }
            else
            {
                //
            }
        }

        protected void linkManage_Click(object sender, EventArgs e)
        {
            linkMaidManagement.Focus();
        }

        protected void linkFilesManagement_Click(object sender, EventArgs e)
        {
            Response.Redirect("uploadFiles.aspx");
        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
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