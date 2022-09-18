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
    public partial class maidManagement : System.Web.UI.Page
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
        protected void populategvMaid()
        {
            CRUD myCrud = new CRUD();
            string mySql = @"SELECT maid.maidId, maid.maidName, maid.maidAge, maid.experienceYears, maid.note, religion.religion, nationality.nationality, services.services, maritalStatus.maritalStatus
                         FROM maid INNER JOIN
                         religion ON maid.religionId = religion.religionId INNER JOIN
                         nationality ON maid.nationalityId = nationality.nationalityId INNER JOIN
                         maritalStatus ON maid.maritalStatusId = maritalStatus.maritalStatusId INNER JOIN
                         services ON maid.servicesId = services.servicesId";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            gvMaid.DataSource = dr;
            gvMaid.DataBind();

        }
        protected void btnGridView_Click(object sender, EventArgs e)
        {
            populategvMaid();
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {


            CRUD myCrud = new CRUD();
            string mySql = @" insert into maid (maidName , maidAge , experienceYears , note , religionId ,nationalityId , servicesId , maritalStatusId)
                values (@maidName , @maidAge , @experienceYears , @note , @religionId , @nationalityId , @servicesId, @maritalStatusId)";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@maidName ", txtMaidName.Text);
            myPara.Add("@maidAge", txtMaidAge.Text);
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
            populategvMaid();

        }
        protected void GetMaidData(object sender, EventArgs e)
        {
            LinkButton mySender = sender as LinkButton;
            int intMaidId = int.Parse(mySender.Text);
            lblOutput.Text = intMaidId.ToString();

            CRUD myCrud = new CRUD();
            string mySql = @" select maidId, maidName, maidAge, experienceYears ,note, religionId , nationalityId, maritalStatusId 
                                        from maid 
                                        where maidId = @maidId";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@maidId ", intMaidId);
            myPara.Add("@maidName", txtMaidName.Text);
            myPara.Add("@maidAge", txtMaidAge.Text);
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
                    Session["maidId"] = int.Parse(dr["maidId"].ToString());
                    txtMaidName.Text = dr["maidName"].ToString();
                    txtMaidAge.Text = dr["maidAge"].ToString();
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
            string mySql = @" update maid set maidName=@maidName , maidAge=@maidAge , experienceYears=@experienceYears , note=@note, religionId=@religionId, 
                        nationalityId=@nationalityId , maritalStatusId=@maritalStatusId
                            where maidId = @maidId";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@maidId ", Session["maidId"]);
            myPara.Add("@maidName", txtMaidName.Text);
            myPara.Add("@maidAge", txtMaidAge.Text);
            myPara.Add("@experienceYears", txtExperienceYears.Text);
            myPara.Add("@note", txtNote.Text);
            myPara.Add("@religionId", ddlReligion.SelectedItem.Value);
            myPara.Add("@nationalityId", ddlNationality.SelectedItem.Value);
            myPara.Add("@maritalStatusId ", ddlMaritalStatus.SelectedItem.Value);           
            int rtn = myCrud.InsertUpdateDeleteViaSqlDic(mySql, myPara);
            if (rtn >= 1)
            {
                lblOutput.Text = " ops seccesful ";
                populategvMaid();

            }
            else
            { lblOutput.Text = " ops feild ! "; }

        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {

            CRUD myCrud = new CRUD();
            string mySql = @" delete from maid 
                            where maidId = @maidId ";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@maidId ", Session["maidId"]);

            int rtn = myCrud.InsertUpdateDeleteViaSqlDic(mySql, myPara);
            if (rtn >= 1)
            {
                lblOutput.Text = " ops seccesful ";
                populategvMaid();

            }
        }
        protected void btnClear_Click(object sender, EventArgs e)
        {
            lblOutput.Text = "";
            txtMaidName.Text = "";
            txtMaidAge.Text = "";
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
            exportManager.ExportToPdf(gvMaid);
        }
        protected void btnExportToExcel_Click(object sender, EventArgs e)
        {
            exportManager.ExportGridToExcel(gvMaid, "export to Excel");
        }
        protected void btnExportToWord_Click(object sender, EventArgs e)
        {
            exportManager.ExportGridToWord(gvMaid, "export to word");
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