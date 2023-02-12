using project.Models;
using System.Web.Mvc;

namespace project.Controllers
{
    public class BorrowNewController : Controller
    {
        private libraryprojectEntities db = new libraryprojectEntities();

        public ActionResult Create()
        {
            ViewBag.Book_ID = new SelectList(db.Book, "Book_ID", "Book_Name");
            ViewBag.Customer_ID = new SelectList(db.Customer, "Customer_ID", "Customer_Name");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Book_Name,Book_ID,Customer_ID,Borrow_Date,Return_Date")] Borrow borrow)
        {
            if (ModelState.IsValid)
            {
                db.Borrow.Add(borrow);
                db.SaveChanges();
                return RedirectToAction("Index", "Borrow");
            }

            ViewBag.Book_ID = new SelectList(db.Book, "Book_ID", "Book_Name", borrow.Book_ID);
            ViewBag.Customer_ID = new SelectList(db.Customer, "Customer_ID", "Customer_Name", borrow.Customer_ID);
            return View(borrow);
        }


    }
}
