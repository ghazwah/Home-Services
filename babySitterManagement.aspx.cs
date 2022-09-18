using HomeService.App_Code;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeService
{
    public partial class babySitterManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Master.FindControl("linkAboutUs").Visible = false;
            this.Master.FindControl("linkServices").Visible = false;
            this.Master.FindControl("linkPortfolio").Visible = false;
            this.Master.FindControl("linkTeam").Visible = false;
            this.Master.FindControl("linkContactUs").Visible = false;

            if (!Page.IsPostBack)
            {
                populateddlNationality();
                populateddlReligion();
                populateddlMaritalStatus();
            }

        }
        protected void populateddlNationality()
        {
            CRUD myCrud = new CRUD();
            string mySql = @"select nationalityId , nationality from nationality";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            ddlNationality.DataValueField = "nationalityId";
            ddlNationality.DataTextField = "nationality";
            ddlNationality.DataSource = dr;
            ddlNationality.DataBind();

        }
        protected void populateddlReligion()
        {
            CRUD myCrud = new CRUD();
            string mySql = @"select religionId , religion from religion";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            ddlReligion.DataValueField = "religionId";
            ddlReligion.DataTextField = "religion";
            ddlReligion.DataSource = dr;
            ddlReligion.DataBind();

        }
        protected void populateddlMaritalStatus()
        {
            CRUD myCrud = new CRUD();
            string mySql = @"select maritalStatusId , maritalStatus from maritalStatus";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            ddlMaritalStatus.DataValueField = "maritalStatusId";
            ddlMaritalStatus.DataTextField = "maritalStatus";
            ddlMaritalStatus.DataSource = dr;
            ddlMaritalStatus.DataBind();

        }
        protected void populategvbabySitter()
        {
            CRUD myCrud = new CRUD();
            string mySql = @"SELECT babySitter.babySitterId, babySitter.babySitterName, babySitter.babySitterAge, babySitter.experienceYears, babySitter.note, religion.religion,nationality.nationality, services.services, maritalStatus.maritalStatus  
                             FROM babySitter INNER JOIN
						 religion ON babySitter.religionId = religion.religionId INNER JOIN
						 nationality ON babySitter.nationalityId = nationality.nationalityId INNER JOIN
                         maritalStatus ON babySitter.maritalStatusId = maritalStatus.maritalStatusId INNER JOIN 
                         services ON babySitter.servicesId = services.servicesId";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            gvbabySitter.DataSource = dr;
            gvbabySitter.DataBind();

        }
        protected void btnGridView_Click(object sender, EventArgs e)
        {
            populategvbabySitter();
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {

            CRUD myCrud = new CRUD();
            string mySql = @" insert into babySitter (babySitterName , babySitterAge , experienceYears , note , religionId ,nationalityId , servicesId , maritalStatusId)
                values (@babySitterName , @babySitterAge , @experienceYears , @note , @religionId , @nationalityId , @servicesId, @maritalStatusId)";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@babySitterName ", txtbabySitterName.Text);
            myPara.Add("@babySitterAge", txtbabySitterAge.Text);
            myPara.Add("@servicesId", txtServices.Text);
            myPara.Add("@religionId", ddlReligion.SelectedValue);
            myPara.Add("@nationalityId", ddlNationality.SelectedValue);
            myPara.Add("@maritalStatusId", ddlMaritalStatus.SelectedValue);
            myPara.Add("@experienceYears", txtExperienceYears.Text);
            myPara.Add("@note", txtNote.Text);

            int rtn = myCrud.InsertUpdateDeleteViaSqlDic(mySql, myPara);
            if (rtn >= 1)
            {
                lblOutput.Text = " ops seccesful ";

            }
            else
            { lblOutput.Text = " ops feild ! "; }
            populategvbabySitter();

        }
        protected void GetbabySitterData(object sender, EventArgs e)
        {
            LinkButton mySender = sender as LinkButton;
            int intbabySitterId = int.Parse(mySender.Text);
            lblOutput.Text = intbabySitterId.ToString();

            CRUD myCrud = new CRUD();
            string mySql = @" select babySitterId, babySitterName, babySitterAge, experienceYears ,note, religionId , nationalityId, maritalStatusId 
                                        from babySitter 
                                        where babySitterId = @babySitterId";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@babySitterId ", intbabySitterId);
            myPara.Add("@babySitterName", txtbabySitterName.Text);
            myPara.Add("@babySitterAge", txtbabySitterAge.Text);
            myPara.Add("@experienceYears", txtExperienceYears.Text);
            myPara.Add("@note", txtNote.Text);
            myPara.Add("@religionId", ddlReligion.SelectedItem.Value);
            myPara.Add("@nationalityId", ddlNationality.SelectedItem.Value);
            myPara.Add("@maritalStatusId ", ddlMaritalStatus.SelectedItem.Value);

            SqlDataReader dr = myCrud.getDrPassSqlDic(mySql, myPara);
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    Session["babySitterId"] = int.Parse(dr["babySitterId"].ToString());
                    txtbabySitterName.Text = dr["babySitterName"].ToString();
                    txtbabySitterAge.Text = dr["babySitterAge"].ToString();
                    txtExperienceYears.Text = dr["experienceYears"].ToString();
                    txtNote.Text = dr["note"].ToString();
                    ddlReligion.SelectedValue = dr["religionId"].ToString();
                    ddlNationality.SelectedValue = dr["nationalityId"].ToString();
                    ddlMaritalStatus.SelectedValue = dr["maritalStatusId"].ToString();
                }
            }



        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            CRUD myCrud = new CRUD();
            string mySql = @" update babySitter set babySitterName=@babySitterName , babySitterAge=@babySitterAge , experienceYears=@experienceYears , note=@note, religionId=@religionId, 
                        nationalityId=@nationalityId , maritalStatusId=@maritalStatusId
                            where babySitterId = @babySitterId";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@babySitterId ", Session["babySitterId"]);
            myPara.Add("@babySitterName", txtbabySitterName.Text);
            myPara.Add("@babySitterAge", txtbabySitterAge.Text);
            myPara.Add("@experienceYears", txtExperienceYears.Text);
            myPara.Add("@note", txtNote.Text);
            myPara.Add("@religionId", ddlReligion.SelectedItem.Value);
            myPara.Add("@nationalityId", ddlNationality.SelectedItem.Value);
            myPara.Add("@maritalStatusId ", ddlMaritalStatus.SelectedItem.Value);
            int rtn = myCrud.InsertUpdateDeleteViaSqlDic(mySql, myPara);
            if (rtn >= 1)
            {
                lblOutput.Text = " ops seccesful ";
                populategvbabySitter();

            }
            else
            { lblOutput.Text = " ops feild ! "; }

        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {

            CRUD myCrud = new CRUD();
            string mySql = @" delete from babySitter 
                            where babySitterId = @babySitterId ";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@babySitterId ", Session["babySitterId"]);

            int rtn = myCrud.InsertUpdateDeleteViaSqlDic(mySql, myPara);
            if (rtn >= 1)
            {
                lblOutput.Text = " ops seccesful ";
                populategvbabySitter();

            }
        }
        protected void btnClear_Click(object sender, EventArgs e)
        {
            lblOutput.Text = "";
            txtbabySitterName.Text = "";
            txtbabySitterAge.Text = "";
            txtExperienceYears.Text = "";
            txtNote.Text = "";
            ddlMaritalStatus.SelectedIndex = 0;
            ddlNationality.SelectedIndex = 0;
            ddlReligion.SelectedIndex = 0;
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }
        protected void btnExportToPdf_Click(object sender, EventArgs e)
        {
            exportManager.ExportToPdf(gvbabySitter);
        }
        protected void btnExportToExcel_Click(object sender, EventArgs e)
        {
            exportManager.ExportGridToExcel(gvbabySitter, "export to Excel");
        }
        protected void btnExportToWord_Click(object sender, EventArgs e)
        {
            exportManager.ExportGridToWord(gvbabySitter, "export to word");
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


    }//CLS
    
}//NS