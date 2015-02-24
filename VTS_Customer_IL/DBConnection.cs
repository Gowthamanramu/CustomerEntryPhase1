using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace VTS.Customer.IL
{
   public  class DBConnection
    {
       SqlConnection con = new SqlConnection();
       public void Connection()
       {
           con = new SqlConnection(ConfigurationManager.ConnectionStrings["DbConnection"].ConnectionString);
           con.Open();
       }
    }
}
