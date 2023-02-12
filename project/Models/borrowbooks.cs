using System;
using System.ComponentModel.DataAnnotations;

namespace project.Models
{
    public class borrowbooks
    {
        [Key]
        public int ID { get; set; }
        public int Book_ID { get; set; }
        public string Book_Name { get; set; }
        public int Customer_ID { get; set; }
        public string Customer_Name { get; set; }
        public Nullable<System.DateTime> Borrow_Date { get; set; }
        public Nullable<System.DateTime> Return_Date { get; set; }
    }
}