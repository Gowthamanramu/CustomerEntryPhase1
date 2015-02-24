using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using VTS;

namespace VTS.Customer.IL
{
    public class CustomerDataAccess
    {
        #region Declarations
        
        //Declarations
        DBConnection objDBConnection = new DBConnection();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DbConnection"].ConnectionString);
        SqlCommand objCmd = new SqlCommand();
        StringBuilder strQuery = new StringBuilder();
        #endregion

        #region Methods

        //Add customer Informations
        public void InsertCustomer(Customer objCustomer)
        {
            try
            {
                con.Open();
                objCmd.Connection = con;
                //objCmd.CommandText = "SP_CustomerEn";
                //objCmd.CommandType = CommandType.StoredProcedure;
                //objCmd.Parameters.AddWithValue(@"CustId", 2);
                //objCmd.Parameters.AddWithValue(@"CustFstName", objCustomer.FirstName);
                //objCmd.Parameters.AddWithValue(@"CustMidName", objCustomer.MiddleName);
                //objCmd.Parameters.AddWithValue(@"CustLstName", objCustomer.LastName);
                //objCmd.Parameters.AddWithValue(@"DOB", objCustomer.Dob);
                //objCmd.Parameters.AddWithValue(@"Gender", objCustomer.Gender);
                //objCmd.Parameters.AddWithValue(@"Address1", objCustomer.Address1);
                //objCmd.Parameters.AddWithValue(@"Address2", objCustomer.Address2);
                //objCmd.Parameters.AddWithValue(@"City", objCustomer.City);
                //objCmd.Parameters.AddWithValue(@"States", objCustomer.State);
                //objCmd.Parameters.AddWithValue(@"Zipcode", objCustomer.Zipcode);
                //objCmd.Parameters.AddWithValue(@"Pr_Address1", objCustomer.PrAddress1);
                //objCmd.Parameters.AddWithValue(@"Pr_Address2", objCustomer.PrAddress2);
                //objCmd.Parameters.AddWithValue(@"Pr_City", objCustomer.PrCity);
                //objCmd.Parameters.AddWithValue(@"Pr_States", objCustomer.PrState);
                //objCmd.Parameters.AddWithValue(@"Pr_Zipcode", objCustomer.PrZipcode);
                //objCmd.Parameters.AddWithValue(@"Mobile", objCustomer.Mobile);
                //objCmd.Parameters.AddWithValue(@"HomeNumber", objCustomer.HomeNumber);
                //objCmd.Parameters.AddWithValue(@"Fax", objCustomer.Fax);
                //objCmd.Parameters.AddWithValue(@"EmailID", objCustomer.EmailId);
                //objCmd.Parameters.AddWithValue(@"Website", objCustomer.Website);
                //objCmd.Parameters.AddWithValue(@"Queue_Status", objCustomer.QueueStatus);
                //objCmd.Parameters.AddWithValue(@"Queue_ID", objCustomer.QueueId);
                //objCmd.Parameters.AddWithValue(@"Created_On", objCustomer.CreatedOn);
                //objCmd.Parameters.AddWithValue(@"Created_By", objCustomer.CreatedBy);
                              strQuery.Append("INSERT INTO WFS_CustomerEntry(CustId,CustFstName,CustMidName,CustLstName,DOB,Gender,Address1,") ;
               strQuery.Append("Address2,City,States,Zipcode,Pr_Address1,Pr_Address2,Pr_City,Pr_States,Pr_Zipcode,address_sameas,");
		       strQuery.Append("HomeNumber,Mobile,Fax,EmailID,Website,Queue_Status,Queue_ID,Created_On,Created_By)");
               strQuery.Append("VALUES('" + objCustomer.CustomerId + "','" + objCustomer.FirstName + "','" + objCustomer.MiddleName + "','" + objCustomer.LastName + "',");
               strQuery.Append("'"+objCustomer.Dob+"','"+objCustomer.Gender+"','"+objCustomer.Address1+"','"+objCustomer.Address2+"','"+objCustomer.City+"',"); 
               strQuery.Append("'"+objCustomer.State+"','"+objCustomer.Zipcode+"','"+objCustomer.PrAddress1+"','"+objCustomer.PrAddress2+"','"+objCustomer.PrCity+"',");
		       strQuery.Append("'"+objCustomer.PrState+"','"+objCustomer.PrZipcode+"','"+objCustomer.SameAs+"','"+objCustomer.HomeNumber+"','"+objCustomer.Mobile+"',");
               strQuery.Append("'"+objCustomer.Fax+"','"+objCustomer.EmailId+"','"+objCustomer.Website+"','"+objCustomer.QueueStatus+"','"+objCustomer.QueueId+"',");
               strQuery.Append("'"+objCustomer.CreatedOn+"','"+objCustomer.CreatedBy+"')");
              
               objCmd.CommandText = strQuery.ToString();
               objCmd.ExecuteNonQuery();
               objCmd.Dispose();
               objCmd.CommandText = "Cust_Entry";
               objCmd.CommandType = CommandType.StoredProcedure;
               objCmd.Parameters.AddWithValue(@"Q_Status", objCustomer.QueueStatus);
               objCmd.Parameters.AddWithValue(@"Queue_ID", objCustomer.QueueId);
               objCmd.ExecuteNonQuery();

            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                con.Close();
            }
        }

        public DataTable GetData()
        {
            try
            {
                DataTable dt = new DataTable();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "CustDetails";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Action", "A");

                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                return dt;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
            }
        }

        public string AutoIncrement()
        {
            try
            {
                int id;
                string cusno;
                DataTable dt = new DataTable();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "AutoIncrement";
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                if (dt.Rows.Count==0)
                {
                    return "CUS0001";
                }
                else
                {
                   // cusno = dt.Rows[0][0].ToString();
                    cusno = (from r in dt.AsEnumerable().Reverse()
                             select r.Field<string>("CustId")).First<string>();


                    id = Convert.ToInt32(cusno.Substring(3,4));
                    if ((id >= 1) && (id < 9))
                    {
                        
                        id = id + 1;
                        cusno =  "CUS000" + id;
                    }
                    else if ((id >= 9) && (id < 99))
                    {
                       
                        id = id + 1;
                        cusno = "CUS00" + id;
                    }
                    else if ((id >= 99) && (id < 999))
                    {
                        
                        id = id + 1;
                        cusno = "CUS0" + id;
                    }
                    else if (id >= 999)
                    {
                        
                        id = id + 1;
                        cusno = "CUS" + id;
                    }
                    return cusno;
                }
               
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
            }
        }

        public DataTable GetData(string cusid)
        {
            try
            {
               // flowId = "kfyRi1b3UBTVJ9EM";
                DataTable dt = new DataTable();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "CustDetails";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue(@"cusid", cusid);
                cmd.Parameters.AddWithValue("@Action", "S");

                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                return dt;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
            }
        }
        #endregion
    }
}
