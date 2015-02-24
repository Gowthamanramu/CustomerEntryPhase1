using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace VTS.Customer.IL
{
   public class Customer
    {
       public string CustomerId { get; set; }
       public string FirstName { get; set; }
       public string MiddleName { get; set; }
       public string LastName { get; set; }
       public DateTime Dob { get; set; }
       public string Gender { get; set; }
       public string Address1 { get; set; }
       public string Address2 { get; set; }
       public string City { get; set; }
       public string State { get; set; }
       public string Zipcode { get; set; }
       public char SameAs { get; set; }
       public string PrAddress1 { get; set; }
       public string PrAddress2 { get; set; }
       public string PrCity { get; set; }
       public string PrState { get; set; }
       public string PrZipcode { get; set; }
       public string Mobile { get; set; }
       public string HomeNumber { get; set; }
       public string Fax { get; set; }
       public string EmailId { get; set; }
       public string Website { get; set; }
       public string QueueStatus { get; set; }
       public string QueueId { get; set; }
       public DateTime CreatedOn { get; set; }
       public string CreatedBy { get ; set ; }
    }
}
