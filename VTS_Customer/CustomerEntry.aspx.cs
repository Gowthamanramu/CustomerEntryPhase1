using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using VTS.Customer.IL;
using System.Drawing;


namespace VTS.Customer.PL
{
    public partial class CustomerEntry : System.Web.UI.Page
    {
        
        VTS.Customer.IL.Customer objCus = new VTS.Customer.IL.Customer();
        CustomerDataAccess objCad = new CustomerDataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetData();
                Reset();
                string cusId = objCad.AutoIncrement();
                lblAutoCusId.Text = cusId.ToString();

            }
           
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {

            GetDetails();
            objCus.QueueStatus = "S";
            objCad.InsertCustomer(objCus);
            string script = @"<script language=""javascript""> alert('Customer Details Added Successfully.'); </script>;";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "myJScript1", script);
            GetData();
           // Reset();
            btnSubmit.Visible = true;

        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            GetDetails();
            objCus.QueueStatus = "A";
            objCad.InsertCustomer(objCus);

        }
        protected void grdCustomerDetails_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdCustomerDetails.PageIndex = e.NewPageIndex;
            GetData();
        }

        public void GetDetails()
        {
            
            objCus.CustomerId = lblAutoCusId.Text;
            objCus.FirstName = txtFirstName.Text;
            objCus.MiddleName = txtMidName.Text;
            objCus.LastName = txtLastName.Text;
            objCus.Dob = Convert.ToDateTime(txtDob.Text);
            objCus.Gender = (rdomale.Checked) ? "Male" : "Female";
            objCus.Address1 = txtAddress1.Text;
            objCus.Address2 = txtAddress2.Text;
            objCus.City = txtCity.Text;
            objCus.State = txtState.Text;
            objCus.Zipcode = txtZipcode.Text;
            objCus.SameAs = Convert.ToChar((chkSameasAddress.Checked) ? "Y" : "N");
            objCus.PrAddress1 = txtPrAddress1.Text;
            objCus.PrAddress2 = txtPrAddress2.Text;
            objCus.PrCity = txtPrCity.Text;
            objCus.PrState = txtPrState.Text;
            objCus.PrZipcode = txtPrZipcode.Text;
            //objCus.HomeNumber = Convert.ToInt64(txtHomeNumber.Text);
            objCus.Mobile = txtMobileNo.Text;
            //objCus.Fax = Convert.ToInt32(txtFax.Text);
            objCus.EmailId = txtEmail.Text;
            objCus.Website = txtWebsite.Text;
            objCus.CreatedOn = DateTime.Now;
            objCus.CreatedBy = "Admin";
            //objCus.QueueId = null;

            if (string.IsNullOrEmpty(hdnResultValue.Value))

                objCus.QueueId = RandomStringValue();
            else
                objCus.QueueId = hdnResultValue.Value;

            if (string.IsNullOrEmpty(txtHomeNumber.Text))
            {

                objCus.HomeNumber = "";
            }
            else
            {
                objCus.HomeNumber = txtHomeNumber.Text;
            }
            if (string.IsNullOrEmpty(txtFax.Text))
            {
                objCus.Fax = "";
            }
            else
            {
                objCus.Fax = txtFax.Text;
            }
        }

        public void GetData()
        {
            DataTable dt = new DataTable();
            dt = objCad.GetData();
            grdCustomerDetails.DataSource = dt;
            grdCustomerDetails.DataBind();
        }

        protected void chkSameasAddress_CheckedChanged(object sender, EventArgs e)
        {
            if (chkSameasAddress.Checked)
            {
                txtPrAddress1.Text = txtAddress1.Text;
                txtPrAddress2.Text = txtAddress2.Text;
                txtPrCity.Text = txtCity.Text;
                txtPrState.Text = txtState.Text;
                txtPrZipcode.Text = txtZipcode.Text;
            }
            else
            {
                txtPrAddress1.Text = "";
                txtPrAddress2.Text = "";
                txtPrCity.Text = "";
                txtPrState.Text = "";
                txtPrZipcode.Text = "";
            }
        }

        public string RandomStringValue()
        {
            char[] a = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890".ToCharArray();
            string randomString = string.Empty;
            Random random = new Random();
            for (int i = 1; i <= 16; i++)
            {
                int x = random.Next(1, a.Length);
                if (!randomString.Contains(a.GetValue(x).ToString()))
                {
                    randomString += a.GetValue(x).ToString();
                }
                else
                {
                    i--;
                }
            }
            return randomString;
        }

        public void Reset()
        {

            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtMidName.Text = "";
            txtDob.Text = "";
            txtAddress1.Text = "";
            txtAddress2.Text = "";
            txtCity.Text = "";
            txtState.Text = "";
            txtPrZipcode.Text = "";
            txtPrAddress1.Text = "";
            txtPrAddress2.Text = "";
            txtPrCity.Text = "";
            txtPrState.Text = "";
            txtPrZipcode.Text = "";
            txtHomeNumber.Text = "";
            txtMobileNo.Text = "";
            txtEmail.Text = "";
            txtFax.Text = "";
            txtZipcode.Text = "";
            txtWebsite.Text = "";
            chkSameasAddress.Checked = false;
            txtFirstName.Focus();
            //rdoGender.SelectedValue = "";
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            //if(txtFirstName.Text = ""||txtLastName.Text = ""||txtMidName.Text = ""||txtDob.Text = ""||txtAddress1.Text = ""||txtAddress2.Text = ""||txtCity.Text = ""
            //txtState.Text = "";
            //txtPrZipcode.Text = "";
            //txtPrAddress1.Text = "";
            //txtPrAddress2.Text = "";
            //txtPrCity.Text = "";
            //txtPrState.Text = "";
            //txtPrZipcode.Text = "";
            //txtHomeNumber.Text = "";
            //txtMobileNo.Text = "";
            //txtEmail.Text = "";
            //txtFax.Text = "";
            //txtZipcode.Text = "";
            //txtWebsite.Text = "";)
            Reset();
        }

        public static object ToDBNull(object value)
        {
            if (null != value)
                return value;
            return DBNull.Value;
        }

        protected void grdCustomerDetails_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            int cusid;
            string cid;
            GridViewRow row1 = grdCustomerDetails.SelectedRow;
            cusid = int.Parse(e.NewSelectedIndex.ToString());



            foreach (GridViewRow row in grdCustomerDetails.Rows)
            {
                if (row.RowIndex == grdCustomerDetails.SelectedIndex)
                {

                    row.BackColor = ColorTranslator.FromHtml("#A1DCF2");
                    row.ToolTip = string.Empty;

                    cid =((grdCustomerDetails.SelectedRow.FindControl("grdlblCusId") as Label).Text);
                    FetchData(cid);
                    btnSubmit.Visible = true;
                }
                else
                {
                    row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
                    row.ToolTip = "Click to select this row.";
                }

            }
            // cusid =Convert.ToInt32(

        }

        protected void OnRowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(grdCustomerDetails, "Select$" + e.Row.RowIndex);
                e.Row.ToolTip = "Click to select this row.";


            }
        }

        public void FetchData(string cusid)
        {


            DataTable dt = new DataTable();
            dt = objCad.GetData(cusid);
                       
                lblAutoCusId.Text = dt.Rows[0]["CustId"].ToString();
                txtFirstName.Text = dt.Rows[0]["CustFstName"].ToString();
                txtLastName.Text = dt.Rows[0]["CustLstName"].ToString();
                txtMidName.Text = dt.Rows[0]["CustMidName"].ToString();
                txtDob.Text = dt.Rows[0]["DOB"].ToString();
                txtAddress1.Text = dt.Rows[0]["Address1"].ToString();
                txtAddress2.Text = dt.Rows[0]["Address2"].ToString();
                txtCity.Text = dt.Rows[0]["City"].ToString();
                txtState.Text = dt.Rows[0]["States"].ToString();
                txtZipcode.Text = dt.Rows[0]["Zipcode"].ToString();
                txtPrAddress1.Text = dt.Rows[0]["Pr_Address1"].ToString();
                txtPrAddress2.Text = dt.Rows[0]["Pr_Address2"].ToString();
                txtPrCity.Text = dt.Rows[0]["Pr_City"].ToString();
                txtPrState.Text = dt.Rows[0]["Pr_States"].ToString();
                txtPrZipcode.Text = dt.Rows[0]["Pr_Zipcode"].ToString();
                txtEmail.Text = dt.Rows[0]["EmailID"].ToString();
                txtHomeNumber.Text = dt.Rows[0]["HomeNumber"].ToString();
                txtMobileNo.Text = dt.Rows[0]["Mobile"].ToString();
                txtFax.Text = dt.Rows[0]["Fax"].ToString();
                hdnResultValue.Value= dt.Rows[0]["Flow_ID"].ToString();
        }



    }
}