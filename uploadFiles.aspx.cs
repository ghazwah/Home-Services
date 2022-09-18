using Google.Apis.Auth.OAuth2;
using Google.Apis.Drive.v3;
using Google.Apis.Services;
using Google.Apis.Util.Store;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI.WebControls;

namespace HomeService
{
    public partial class uploadFiles : System.Web.UI.Page
    {
        public String AppName = "My Project";
        private DriveService Service = new DriveService();
        public static string[] Scopes = { DriveService.Scope.Drive };
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Master.FindControl("linkAboutUs").Visible = false;
            this.Master.FindControl("linkServices").Visible = false;
            this.Master.FindControl("linkPortfolio").Visible = false;
            this.Master.FindControl("linkTeam").Visible = false;
            this.Master.FindControl("linkContactUs").Visible = false;
            if (!Page.IsPostBack)
            {
                populateddlServices();
            }
        }

        protected void populateddlServices()
        {
            CRUD myCrud = new CRUD();
           string mySql = @"select servicesId, services from services";
           SqlDataReader dr = myCrud.getDrPassSql(mySql);
           ddlServices.DataValueField = "servicesId";
           ddlServices.DataTextField = "services";
            ddlServices.DataSource = dr;
           ddlServices.DataBind();
        }

        protected void btnSubmitMultiFiles_Click(object sender, EventArgs e)
        {
            clearMsg();
            ProcessMultiUploads();
        }

        protected void btnSubmitMultiFilesToDb_Click(object sender, EventArgs e)
        {
            if (ValidateEmpty(txtServiceId.Text) || ValidateEmpty(ddlServices.SelectedValue))
            {
                lblOutput.Text = "Please fill  all the fields correctly!";
                lblOutput.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                clearMsg();
                try
                {
                    //capture inserted values from the input form
                    string strService = "";
                    int ddlServicesId = 0;
                    int intServiceId = 0;
                    strService = txtServiceId.Text;
                    ddlServicesId = int.Parse(ddlServices.SelectedItem.Value);
                    lblOutput.Text = strService + " " + ddlServicesId;
                    // connect to the db and insert the captured vlaues
                    CRUD myCrud = new CRUD();
                    string mySql = @"insert into servicesID (serviceId ,servicesId)
                                 values  (@serviceId ,@servicesId)" +
                                    "SELECT CAST(scope_identity() AS int)";
                    Dictionary<string, object> myPara = new Dictionary<string, object>();
                    myPara.Add("@serviceId", strService);
                    myPara.Add("@servicesId", ddlServicesId);
                    intServiceId = myCrud.InsertUpdateDeleteViaSqlDicRtnIdentity(mySql, myPara);
                    int rtn = InsertDocuments(intServiceId);
                    if (rtn >= 1)
                    {
                        lblOutput.Text = "You successfully uploaded " + rtn + " Files ";
                        lblOutput.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        lblOutput.Text = "Failed to upload!";
                        lblOutput.ForeColor = System.Drawing.Color.Red;
                    }
                }

                catch (Exception ex)
                {
                    lblOutput.Text = ex.Message.ToString();
                }
            }

        }

        protected int InsertDocuments(int myServiceId)  // upload doc to db
        {
                int intFilesUploaded = 0;
                foreach (HttpPostedFile postedFile in FileUpload.PostedFiles)
                {
                    string filename = Path.GetFileName(postedFile.FileName);
                    string contentType = postedFile.ContentType;
                    using (Stream fs = postedFile.InputStream)
                    {
                        using (BinaryReader br = new BinaryReader(fs))
                        {
                            byte[] bytes = br.ReadBytes((Int32)fs.Length);
                            CRUD DocInsert = new CRUD();
                            string mySql = @"insert into document(serviceId,servicesId,documentName,contentType,documentData)
                                    values (@serviceId,@servicesId,@documentName,@contentType,@documentData)";
                            Dictionary<string, Object> myPara = new Dictionary<string, object>();
                            myPara.Add("@serviceId", txtServiceId.Text);
                            myPara.Add("@servicesId", ddlServices.SelectedValue);
                            myPara.Add("@documentName", filename);
                            myPara.Add("@contentType", contentType);
                            myPara.Add("@documentData", bytes);
                            DocInsert.InsertUpdateDeleteViaSqlDic(mySql, myPara);
                            intFilesUploaded += 1;
                        }
                    }
                }
                return intFilesUploaded;  // return number of files uploaded
        }

        protected void ProcessUpload(FileUpload upload)
        {
            string getMyID = "";
            // capture id 
            string myContactId = txtServiceId.Text;
            myContactId = string.IsNullOrEmpty(myContactId) ? "000" : myContactId;
            if (upload.HasFile)
            {
                string fileName = Path.Combine(Server.MapPath("~/Uploads"), myContactId + "_" + upload.FileName);
                if (File.Exists(fileName))
                    File.Delete(fileName);
                upload.SaveAs(fileName);
                lblOutput.Text = "Uploaded to DB!";
                lblOutput.ForeColor = System.Drawing.Color.Blue;
            }

            else
            {
                lblOutput.Text = "Please upload the file!";
                lblOutput.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void ProcessUpload(FileUpload upload, int myServiceId)  // works 2021
        {
            myServiceId = string.IsNullOrEmpty(myServiceId.ToString()) ? 000 : myServiceId;
            if (upload.HasFile)
            {
                string fileName = Path.Combine(Server.MapPath("~/Uploads"), myServiceId + "_" + upload.FileName);
                if (File.Exists(fileName))
                    File.Delete(fileName);
                upload.SaveAs(fileName);
                lblOutput.Text = "Uploaded to Folder!";
                lblOutput.ForeColor = System.Drawing.Color.Green;
            }

            else
            {
                lblOutput.Text = "Please upload the file!";
                lblOutput.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void ProcessMultiUploads()
        {
            int rtn = 0;
            string myContactId = txtServiceId.Text;
            myContactId = string.IsNullOrEmpty(myContactId) ? "000" : myContactId;
            string myPath = Path.Combine(Server.MapPath("~/Uploads"));
            int uploadIndex = 0;
            string fileName = "";
            if (FileUpload.HasFiles)
            {
                foreach (HttpPostedFile postedFile in FileUpload.PostedFiles)
                {
                    fileName = Path.Combine(Server.MapPath("~/Uploads"), myContactId + "_" + postedFile.FileName);//postedFile.FileName;
                    // uploadIndex = fileName.IndexOf("Uploads");
                    if (File.Exists(fileName))
                        File.Delete(fileName);
                    FileUpload.SaveAs(fileName);
                }
                lblOutput.Text = "Your files has been uploaded Successfully!";
                lblOutput.ForeColor = System.Drawing.Color.Green;
            }

            else
            {
                lblOutput.Text = "Please upload the file!";
                lblOutput.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void ProcessMultiUploads(FileUpload upload, string myServiceId)
        {
            int rtn = 0;
            myServiceId = string.IsNullOrEmpty(myServiceId) ? "000" : myServiceId;
            string myPath = Path.Combine(Server.MapPath("~/Uploads"));
            int uploadIndex = 0;
            string fileName = "";
            if (FileUpload.HasFiles)
            {
                foreach (HttpPostedFile postedFile in FileUpload.PostedFiles)
                {
                    fileName = Path.Combine(Server.MapPath("~/Uploads"), myServiceId + "_" + postedFile.FileName);
                    if (File.Exists(fileName))
                        File.Delete(fileName);
                    FileUpload.SaveAs(fileName);
                }
                lblOutput.Text = "Service files has been uploaded Successfully!";
                lblOutput.ForeColor = System.Drawing.Color.Green;
            }

            else
            {
                lblOutput.Text = "Please upload the file!";
                lblOutput.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btnShowFiles_Click(object sender, EventArgs e)
        {
            clearMsg();
            gvServiceFiles.DataSource = GetUploadList();
            gvServiceFiles.DataBind();
        }

        protected IEnumerable GetUploadList()
        {
            string folder = Server.MapPath("~/Uploads");// get uploaded folder
            string[] files = Directory.GetFiles(folder); // get all files in folder 
            Array.Sort(files);
            foreach (string file in files)
            yield return Path.GetFileName(file);
        }

        protected IEnumerable GetUploadList(string serviceId)
        {
            string folder = Server.MapPath("~/Uploads");// get uploaded folder
            string[] files = Directory.GetFiles(folder); // get all files in folder 
            Array.Sort(files);
            int intFileCount = 0;
            foreach (string file in files)

            {
                if (file.Contains(serviceId)) // check if files contains a value
                {
                    intFileCount += 1;
                    yield return Path.GetFileName(file);
                }
            }
            if (intFileCount == 0)
            {
                lblOutput.Text = "No File Found!";
                lblOutput.ForeColor = System.Drawing.Color.Red;
            }
            //.. yield return Path.GetFileName(file);
        }

        protected void ShowServicefiles_Click(object sender, EventArgs e)
        {
            clearMsg();
            string myServiceId = txtServiceId.Text;
            hiddenServiceId.Value = myServiceId;
            if (string.IsNullOrEmpty(myServiceId))
            {
                gvServiceFiles.DataSource = null;
                gvServiceFiles.DataBind();
                lblOutput.Text = "Not Authorized!";
                lblOutput.ForeColor = System.Drawing.Color.Red;
                return;
            }
            else
            {
                gvServiceFiles.DataSource = GetUploadList(hiddenServiceId.Value); // new 
                gvServiceFiles.DataBind();
            }
        }

        protected void btnShowFilesInDb_Click(object sender, EventArgs e)
        {
            populateGvDocs();
        }

        protected void btnDeleteServiceDoc_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            try
            {
                Button btn = sender as Button;
                GridViewRow grow = btn.NamingContainer as GridViewRow;
                int documentId = int.Parse(btn.CommandArgument);// int.Parse((grow.FindControl("lblclientDocId") as Label).Text);  
                CRUD myCrud = new CRUD();
                string mySql = @"delete  document  where documentId=@documentId";
                Dictionary<string, object> myPara = new Dictionary<string, object>();
                myPara.Add("@documentId", documentId);
                int rtn = myCrud.InsertUpdateDeleteViaSqlDic(mySql, myPara);
                lblOutput.Text = "Service files has been deleted Successfully!";
                lblOutput.ForeColor = System.Drawing.Color.Green;
            }
            catch (Exception ex)
            {

                lblOutput.Text = "Failed to delete!";
                lblOutput.ForeColor = System.Drawing.Color.Red;
            }
            populateGvDocs(); 
        }

        protected void DownloadFile(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                int documentId = int.Parse((sender as LinkButton).CommandArgument);
                byte[] bytes;
                string fileName, contentType; 
                string constr = CRUD.conStr;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.CommandText = @"  select  documentName,documentData from document
                                              where documentId = @documentId";
                        cmd.Parameters.AddWithValue("@documentId", documentId);
                        cmd.Connection = con;
                        con.Open();
                        using (SqlDataReader sdr = cmd.ExecuteReader())
                        {
                            if (sdr.HasRows)
                            {
                                sdr.Read();
                                bytes = (byte[])sdr["documentData"];

                                fileName = sdr["documentName"].ToString();   //fileName changed to docName
                            }
                            else
                            {
                                lblOutput.Text = "File not found!";
                                lblOutput.ForeColor = System.Drawing.Color.Red;
                                return;
                            }
                        }
                        con.Close();
                    }
                }
                Response.Clear();
                Response.Buffer = true;
                Response.Charset = "";
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
                Response.BinaryWrite(bytes);
                Response.Flush();
                Response.End();
            }
        }

        protected void populateGvDocs()
        {
            CRUD myCrud = new CRUD();
            string mySql = @"select documentId,serviceId, servicesId, documentName, dateUploaded
                                     from document";
            using (SqlDataReader dr = myCrud.getDrPassSql(mySql))
            {
                if (dr.HasRows)
                {
                    gvDocs.DataSource = dr;
                    gvDocs.DataBind();
                }
            }
        }

        protected void btnDeleteAll_Click(object sender, EventArgs e)
        {
            string documentId = "";
            foreach (GridViewRow row in gvDocs.Rows)
            {
                if ((row.FindControl("chkSelect") as CheckBox).Checked)
                {
                    documentId += Convert.ToInt32(gvDocs.DataKeys[row.RowIndex].Value) + ",";
                }
                // need to remove last comma
            }

            if (documentId.Length >= 1) // to ensure we have a selected docs to be deleted
            {
                using (SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-45E338K\SQLEXP2017; Initial Catalog=homeServices; Uid=sa; pwd=54321;"))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("DELETE FROM document WHERE documentId in (" + removeLastChar(documentId) + ")", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                populateGvDocs();
            }
        }

        protected string removeLastChar(string myString)
        {
            int intCount = myString.Length;
            if (intCount >= 1)
            {
                myString = myString.Substring(0, intCount - 1);
                return myString;
            }
            else
            {
                return "";
            }
        }

        protected void cbSelectAll_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox cbSelectAll = sender as CheckBox;
            foreach (GridViewRow row in gvDocs.Rows)
            {
                CheckBox cb;
                cb = row.FindControl("chkSelect") as CheckBox;
                if (cbSelectAll.Checked == true)
                {
                    cb.Checked = true;
                }
                else
                if (cbSelectAll.Checked == false)
                {
                    cb.Checked = false;
                }
            }
        }

        string[] extnFiles = { ".pdf", ".doc", ".docx", ".xlsx" };

        protected void BtnAddToDrive_Click(object sender, EventArgs e)
        {
            try
            {
                if (FileUpload.HasFile)
                {
                    DriveService service = GetService();
                    //check file exten.
                    string fileExtension = System.IO.Path.GetExtension(FileUpload.FileName);
                    if (extnFiles.Contains(fileExtension.ToLower()) == false)
                    {
                        lblOutput.Text = "Extension file is not allowed please select file with extenstion:pdf,doc,docx,xlsx !";
                        lblOutput.ForeColor = System.Drawing.Color.Red;
                    }
                    else
                    {
                        //check file size.
                        int fileSize = FileUpload.PostedFile.ContentLength / 1024;
                        if (fileSize > 2048)//allowed only less than 2MG 
                        {
                            lblOutput.Text = "The Size is large please select file less than 2MG !";
                            lblOutput.ForeColor = System.Drawing.Color.Red;
                        }
                        else
                        {
                            var FileMetaData = new Google.Apis.Drive.v3.Data.File();
                            FileMetaData.Name = Path.GetFileName(FileUpload.FileName);
                            FilesResource.CreateMediaUpload request;
                            request = service.Files.Create(FileMetaData, FileUpload.FileContent, FileMetaData.MimeType);
                            request.Fields = "id";
                            request.Upload();
                            lblOutput.Text = "File " + Path.GetFileName(FileUpload.FileName) + " Uploaded Successfully.";
                            lblOutput.ForeColor = System.Drawing.Color.Green;
                        }
                    }
                }
                else
                {
                    //If User did not select file
                    lblOutput.Text = "Please upload the file!";
                    lblOutput.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch (Exception ex)
            {
                lblOutput.Text = "Somthing went wrong during upload file " + ex.Message;
                lblOutput.ForeColor = System.Drawing.Color.Red;
            }
        }
        //create Drive API service.
        public DriveService GetService()
        {
            //get Credentials from client_secret.json file 
            UserCredential credential;
            using (var stream = new FileStream(@"C:\JSON\client_secret.json", FileMode.Open, FileAccess.Read))
            {
                String FolderPath = @"C:\JSON\";
                String FilePath = Path.Combine(FolderPath, "DriveServiceCredentials.json");

                credential = GoogleWebAuthorizationBroker.AuthorizeAsync(
                    GoogleClientSecrets.Load(stream).Secrets,
                    Scopes,
                    "user",
                    CancellationToken.None,
                    new FileDataStore(FilePath, true)).Result;
            }

            //create Drive API service.
            Service = new DriveService(new BaseClientService.Initializer()
            {
                HttpClientInitializer = credential,
                ApplicationName = AppName,
            });
            return Service;
        }

        protected void clearMsg()
        {
            lblOutput.Text = "";
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