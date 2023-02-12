using project.Models;
using System.Linq;
using System.Web.Mvc;

namespace project.Controllers
{
    public class CustomerController : Controller
    {
        libraryprojectEntities db = new libraryprojectEntities();
        // GET: Customer
        //public ActionResult Index()
        //{
        //    string d = Convert.ToString(Session["UserName"]);
        //    ViewBag.Message = d + " ,Welcome Back";
        //    var result = db.Customer.ToList();

        //    return View(result);
        //}
        //public ActionResult BookView()
        //{
        //    var result = db.Book.ToList();
        //    string d = Convert.ToString(Session["UserName"]);
        //    ViewBag.Message = d + " ,Welcome";
        //    return View(result);
        //}
        // GET: Customer/Create
        public ActionResult Create(int id = 0)
        {
            Customer c1 = new Customer();
            return View(c1);
        }

        // POST: Customer/Create
        [HttpPost]
        public ActionResult Create(Customer c1)
        {
            var result = db.Customer.Where(test => test.UserName == c1.UserName || test.Email == c1.Email).FirstOrDefault();
            if (result != null)
            {
                ViewBag.Message = "Username/Email already exists";
            }
            else
            {
                db.Customer.Add(c1);
                db.SaveChanges();
                Session["UserName"] = c1.UserName;
                return RedirectToAction("BookView", "Borrow");
            }
            return View();
        }

        public ActionResult Login(int id = 0)
        {
            Customer c1 = new Customer();
            return View(c1);
        }
        [HttpPost]
        public ActionResult Login(Customer c1)
        {
            var result = db.Customer.Where(test => test.Email == c1.Email && test.UserName == c1.UserName).FirstOrDefault();
            if (result != null)
            {

                if (result.Admin == true)
                {
                    //string d = Convert.ToString(c1.Admin);
                    Session["Admin"] = "Admin";
                    Session["UserName"] = c1.UserName;
                    //   ViewBag.Message("Admin Login Successfully");
                    return RedirectToAction("BookView", "Borrow");
                    //return RedirectToAction("Index", "Admin");

                }
                else
                {
                    Session["Admin"] = c1.Admin;
                    Session["UserName"] = c1.UserName;
                    // ViewBag.Message = "Logged In";
                    return RedirectToAction("BookView", "Borrow");
                }
            }
            ViewBag.Message = "Email/Username Not Found";
            return View();

        }
        public ActionResult Logout()
        {
            Session["UserName"] = null;
            return RedirectToAction("Login");
        }


    }
}
