using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using VTS.Customer.IL;
using System.Drawing;
using System.Text.RegularExpressions;

namespace VTS_Customer
{
    public partial class VTS_CustomerEntry_New : System.Web.UI.Page
    {
        string str_Flg = "Y";
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
                hdnResultValue.Value = "";

            }
          
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {

            GetDetails("S");
            if (str_Flg == "N")
                return;
            objCus.QueueStatus = "S";
            objCad.InsertCustomer(objCus);

            //string script = @"<script language=""javascript""> alert('Customer Details Added Successfully.'); </script>;";
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "myJScript1", script);
            GetData();
            // Reset();
            btnSubmit.Visible = true;
            lblErrMsg.Text = "";
            lblSucessMsg.Text = "";
            SucessMsg("-- Saved Successfully ");

        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            if (Validation_submit() && IsMobileNumberValid() && ValidatePostcode() && IsValidEmailAddress())
            {

                GetDetails("A");
                objCus.QueueStatus = "A";
                objCad.InsertCustomer(objCus);
                GetData();
                Reset();
                string cusId = objCad.AutoIncrement();
                lblAutoCusId.Text = cusId.ToString();
                btnSubmit.Visible = false;
                //lblErrMsg.Text = "";
                lblSucessMsg.Text = "";
                SucessMsg("-- Submitted Successfully ");
            }
        }
        public Boolean Validation_submit()
        {
            lblErrMsg.Text = "";
            lblSucessMsg.Text = "";
            Boolean flg = true;
            if (string.IsNullOrEmpty(txtLastName.Text))
            {
                RaiseError("* Last Name cannot be empty");
                flg = false;
            }
            if (string.IsNullOrEmpty(txtAddress1.Text))
            {
                RaiseError("* Address cannot be empty");
                flg = false;
            }
            if (string.IsNullOrEmpty(txtFirstName.Text))
            {
                RaiseError("* FirstName cannot be empty");
                flg = false;
            }
            if (string.IsNullOrEmpty(txtCity.Text))
            {
                RaiseError("* City cannot be empty");
                flg = false;
            }
            if (string.IsNullOrEmpty(txtState.Text))
            {
                RaiseError("* State cannot be empty");
                flg = false;
            }
            if (string.IsNullOrEmpty(txtZipcode.Text))
            {
                RaiseError("* Zipcode cannot be empty");
                flg = false;
            }

            if (string.IsNullOrEmpty(txtMobileNo.Text))
            {
                RaiseError("* Mobile No cannot be empty");
                flg = false;
            }
            if (string.IsNullOrEmpty(txtEmail.Text))
            {
                RaiseError("* Email cannot be empty");
                flg = false;
            }
            if (string.IsNullOrEmpty(txtDob.Text))
            {
                RaiseError("* DOB cannot be empty");
                flg = false;
            }
            if (txtHomeNumber.Text == string.Empty)
            {
                objCus.HomeNumber = "";

            }
            else if (txtHomeNumber.Text.Length != 12)
            {
                RaiseError("* Invalid Home Number(EX:44XXXXXXXXXX) ");
                flg = false;
            }
            if (txtFax.Text == string.Empty)
            {
                objCus.Fax = "";

            }
            else if (txtFax.Text.Length != 12)
            {
                RaiseError("* Invalid FAX Number(EX:44XXXXXXXXXX) ");
                flg = false;
            }
            return flg;

        }

        protected void grdCustomerDetails_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdCustomerDetails.PageIndex = e.NewPageIndex;
            GetData();
        }

        public void RaiseError(string message)
        {
            lblErrMsg.Text = lblErrMsg.Text + message + " <br> ";
            return;
        }

        public void SucessMsg(string Message)
        {
            lblSucessMsg.Text = lblSucessMsg.Text + Message + "<br>";
            return;
        }

        public void GetDetails(String frm)
        {

            objCus.CustomerId = lblAutoCusId.Text;
            if (txtFirstName.Text.Length == 0)
            {
                str_Flg = "N";
                return;
            }

            if (txtFirstName.Text.Length == 0)

                objCus.FirstName = "";

            else
                objCus.FirstName = txtFirstName.Text;

            if (txtMidName.Text.Length == 0)

                objCus.MiddleName = "";

            else
                objCus.MiddleName = txtMidName.Text;

            if (txtLastName.Text.Length == 0)

                objCus.LastName = "";

            else
                objCus.LastName = txtLastName.Text;

            if (txtDob.Text.Length == 0)

                objCus.Dob = Convert.ToDateTime("1/1/1900");

            else
                objCus.Dob = Convert.ToDateTime(txtDob.Text);

            objCus.Gender = (rdomale.Checked) ? "Male" : "Female";
            objCus.Address1 = txtAddress1.Text;
            objCus.Address2 = txtAddress2.Text;
            objCus.City = txtCity.Text;
            objCus.State = txtState.Text;
            if (txtZipcode.Text.Length == 0)

                objCus.Zipcode = "";

            else
                objCus.Zipcode = txtZipcode.Text;


            objCus.SameAs = Convert.ToChar((chkSameasAddress.Checked) ? "Y" : "N");
            objCus.PrAddress1 = txtPrAddress1.Text;
            objCus.PrAddress2 = txtPrAddress2.Text;
            objCus.PrCity = txtPrCity.Text;
            objCus.PrState = txtPrState.Text;
            if (txtPrZipcode.Text.Length == 0)

                objCus.PrZipcode = "";

            else
                objCus.PrZipcode = txtPrZipcode.Text;


            //objCus.HomeNumber = Convert.ToInt64(txtHomeNumber.Text);
            if (txtMobileNo.Text.Length == 0)

                objCus.Mobile = "";

            else
                objCus.Mobile = txtMobileNo.Text;


            //objCus.Fax = Convert.ToInt32(txtFax.Text);
            objCus.EmailId = txtEmail.Text;
            objCus.Website = txtWebsite.Text;
            objCus.CreatedOn = DateTime.Now;
            objCus.CreatedBy = "Admin";
            //objCus.QueueId = null;

            if (string.IsNullOrEmpty(hdnResultValue.Value))
            {
                objCus.QueueId = RandomStringValue();
                hdnResultValue.Value = objCus.QueueId;
            }
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
                objCus.Fax =txtFax.Text;
            }
        }

        public void GetData()
        {
            DataTable dt = new DataTable();
            dt = objCad.GetData();
            string mno;
            string chk;
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (Convert.ToChar(dt.Rows[i]["wfs_Status"].ToString()) == 'A')
                    dt.Rows[i]["wfs_Status"] = "Approved";
                else
                    dt.Rows[i]["wfs_Status"] = "Save";
                //if (dt.Rows[i]["Mobile"].ToString() == "0")
                //    dt.Rows[i]["Mobile"] = DBNull.Value;
                //mno = dt.Rows[i]["Mobile"].ToString();
                //mno = mno.Substring(0, 2);
                
                
               
            }

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
                txtMobileNo.Focus();
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

        public void Isvalidform()
        {

        }

        public void Reset()
        {
            lblErrMsg.Text = "";
            lblSucessMsg.Text = "";
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
            hdnResultValue.Value = "";
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
            string cusId = objCad.AutoIncrement();
            lblAutoCusId.Text = cusId.ToString();
            btnSubmit.Visible = false;
            Reset();
            Response.Redirect("VTS_CustomerEntry_New.aspx");
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
            cusid = int.Parse(e.NewSelectedIndex.ToString());
          
            foreach (GridViewRow row in grdCustomerDetails.Rows)
            {
                if (row.RowIndex == grdCustomerDetails.SelectedIndex)
                {

                    row.BackColor = ColorTranslator.FromHtml("#FFBD94");
                    row.ToolTip = string.Empty;
                    cid = ((grdCustomerDetails.SelectedRow.FindControl("grdlblCusId") as Label).Text);
                    FetchData(cid);
                    btnSubmit.Visible = true;
                   
                }
                else
                {
                    grdCustomerDetails.AlternatingRowStyle.BackColor = ColorTranslator.FromHtml("#FFE0A3");
                    if (row.RowIndex % 2 == 0)
                    {
                        row.BackColor = ColorTranslator.FromHtml("#FFEBC2");
                    }
                    else
                    {
                        row.BackColor = ColorTranslator.FromHtml("#FFE0A3");
                    }
                    row.ToolTip = "Click to select this row.";
                }

            }
            


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
            txtDob.Text = (dt.Rows[0]["DOB"].ToString() == "1/1/1900 12:00:00 AM" ? "" : dt.Rows[0]["DOB"].ToString());
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
            txtHomeNumber.Text = (dt.Rows[0]["HomeNumber"].ToString() == "0" ? "" : dt.Rows[0]["HomeNumber"].ToString());
            txtMobileNo.Text = (dt.Rows[0]["Mobile"].ToString() == "0" ? "" : dt.Rows[0]["Mobile"].ToString());
            txtFax.Text = (dt.Rows[0]["Fax"].ToString() == "0" ? "" : dt.Rows[0]["Fax"].ToString());
            txtWebsite.Text = dt.Rows[0]["Website"].ToString();
            hdnResultValue.Value = dt.Rows[0]["Flow_ID"].ToString();
        }

        private bool IsMobileNumberValid()
        {
            // remove all non-numeric characters
            txtMobileNo.Text = CleanNumber(txtMobileNo.Text);

            // trim any leading zeros
            txtMobileNo.Text = txtMobileNo.Text.TrimStart(new char[] { '0' });

            // check for this in case they've entered 44 (0)xxxxxxxxx or similar
            if (txtMobileNo.Text.StartsWith("(44)"))
            {
                txtMobileNo.Text = txtMobileNo.Text.Remove(0, 4);
            }
            else if((txtMobileNo.Text.StartsWith("44")))
            {
txtMobileNo.Text = txtMobileNo.Text.Remove(0, 2);
            }


            // add country code if they haven't entered it
            if (!txtMobileNo.Text.StartsWith("44"))
            {
                txtMobileNo.Text = "(44)" + txtMobileNo.Text;

            }
            
            if (txtMobileNo.Text.Length != 14)
            {
                RaiseError("* Mobile No Invalid(EX:44XXXXXXXXXX)");
                return false;
            }
            // check if it's the right length


            return true;
        }

        private string CleanNumber(string phone)
        {
            Regex digitsOnly = new Regex(@"[^\d]");
            return digitsOnly.Replace(phone, "");
        }

        private bool ValidatePostcode()
        {
            Regex regex = new Regex("^(GIR 0AA|[A-PR-UWYZ]([0-9]{1,2}|([A-HK-Y][0-9]|[A-HK-Y][0-9]([0-9]|[ABEHMNPRV-Y]))|[0-9][A-HJKPS-UW]) {0,1}[0-9][ABD-HJLNP-UW-Z]{2})$");

            if (!regex.IsMatch(txtZipcode.Text.ToUpper().Trim()))
            {
                RaiseError("* zipcode invalid");
                return false;
            }
            return true;
        }
        public  bool ValidatePhoneNumber()
        {
            Regex regex = new Regex(@"^(\+44\s?7\d{3}|\(?07\d{3}\)?)\s?\d{3}\s?\d{3}$");
            if (!regex.IsMatch(txtMobileNo.Text))
            {
                RaiseError("* invalid Mobile no(EX:+44XXXXXXXXXX)");
                return false;
            }
            return true;
        }


        public bool IsValidEmailAddress()
        {
            if (string.IsNullOrEmpty(txtEmail.Text))
                return false;
            else
            {
                string s = txtEmail.Text;
                var regex = new Regex(@"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*");
                if (!regex.IsMatch(s) && !s.EndsWith("."))
                {
                    RaiseError("*invalid Email(Ex:abc@xxx.com)");
                    return false;
                }
                return true;
            }
        }



    }
}